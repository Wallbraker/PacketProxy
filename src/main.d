module main;

import core.thread;
import std.stdio : writef, writefln;
import std.utf : toUTF8, toUTF16;
import std.socket : Socket, TcpSocket, InternetAddress, SocketOption, SocketOptionLevel;
import std.stream : Stream, BufferedStream, MemoryStream, EndianStream, Endian;
import std.socketstream : SocketStream, FileMode;

import packets : Slot, Meta, ChunkMeta;
import marshalling : MinecraftSocket;
import proxy : clientProxy, serverProxy;


ushort listenPort = 25565;
string serverAddress = "localhost";
ushort serverPort = 25566;


int main(string[] args)
{
	auto listen = new TcpSocket();
	auto server = new TcpSocket();
	auto listenAddr = new InternetAddress(0, listenPort);
	auto serverAddr = new InternetAddress(serverAddress, serverPort);

	writefln("proxy -> starting", listen.localAddress);
	listen.setOption(SocketOptionLevel.SOCKET, SocketOption.REUSEADDR, 1);
	listen.bind(listenAddr);
	listen.listen(0);

	writefln("proxy -> listening (%s)", listen.localAddress);
	auto client = listen.accept();
	listen.close();
	writefln("client -> connected (%s)", client.remoteAddress);

	writefln("proxy -> connecting (%s)", serverAddr);
	server.connect(serverAddr);

	auto mcClient = new McImpl(client);
	auto mcServer = new McImpl(server);

	void runServer() {
		try {
			writefln("proxy -> server thread running");
			mcServer.serverProxy(mcClient);
		} catch (Exception e) {
			writefln("proxy -> server %s", e);
		}
		mcClient.s.close();
		writefln("proxy -> server thread exiting");
	}

	void runClient() {
		try {
			writefln("proxy -> client thread running");
			mcClient.clientProxy(mcServer);
		} catch (Exception e) {
			writefln("proxy -> client %s", e);
		}
		mcServer.s.close();
		writefln("proxy -> client thread exiting");
	}

	auto t1 = new Thread(&runServer);
	t1.start();
	auto t2 = new Thread(&runClient);
	t2.start();

	t1.join();
	t2.join();

	return 0;
}

class McImpl : MinecraftSocket
{
	Socket s;
	Stream strm;

	this(Socket s)
	{
		this.s = s;
		strm = new EndianStream(new SocketStream(s), Endian.bigEndian);
	}

	void clientProxy(McImpl server)
	{
		while(s.isAlive) {
			ubyte id;
			strm.read(id);
			.clientProxy(this, server, id);
		}
	}

	void serverProxy(McImpl client)
	{
		while(s.isAlive) {
			ubyte id;
			strm.read(id);
			.serverProxy(this, client, id);
		}
	}


	/*
	 *
	 * Primitive read.
	 *
	 */


	override bool readBool() { byte ret; strm.read(ret); return cast(bool)ret; }
	override byte readByte() { byte ret; strm.read(ret); return ret; }
	override ubyte readUbyte() { ubyte ret; strm.read(ret); return ret; }
	override short readShort() { short ret; strm.read(ret); return ret; }
	override ushort readUshort() { ushort ret; strm.read(ret); return ret; }
	override int readInt() { int ret; strm.read(ret); return ret; }
	override uint readUint() { uint ret; strm.read(ret); return ret; }
	override long readLong() { long ret; strm.read(ret); return ret; }
	override ulong readUlong() { ulong ret; strm.read(ret); return ret; }
	override float readFloat() { float ret; strm.read(ret); return ret; }
	override double readDouble() { double ret; strm.read(ret); return ret; }

	override string readUSC()
	{
		ushort len; wchar[] ret;
		strm.read(len); ret.length = len;
		foreach(ref r; ret)
			strm.read(r);
		return toUTF8(ret);
	}

	override void[] readMeta() { throw new Exception("not implemented readMeta"); }

	override void[] readSlot()
	{
		void[] data;

		short id;
		byte count;
		short damage;
		short len;

		strm.read(id);
		if (id < 0) {
			data.length = short.sizeof;
			*cast(short*)(&data[0]) = id;
			return data;
		}

		strm.read(count);
		strm.read(damage);
		strm.read(len);

		if (len != -1)
			throw new Exception("ARG");

		data.length = short.sizeof * 3 + byte.sizeof;
		*cast(short*)(&data[0]) = id;
		*cast(byte*)(&data[2]) = count;
		*cast(short*)(&data[3]) = damage;
		*cast(short*)(&data[5]) = len;

		return data;
	}


	/*
	 *
	 * Array read.
	 *
	 */


	override byte[] readByteArray(uint len)
	{
		byte[] ret;
		ret.length = len;
		strm.read(cast(ubyte[])ret);
		return ret;
	}

	override int[] readIntArray(uint len)
	{
		int[] ret;
		ret.length = len;
		foreach(ref r; ret)
			strm.read(r);
		return ret;
	}

	override void[] readSlotArray(uint len)
	{
		if (len == 0)
			return null;

		void[] data;
		for (int i; i < len; i++) {
			data ~= readSlot();
		}

		return data;
	}

	override ChunkMeta[] readChunkMetaArray(uint) { throw new Exception("not implemented readChunkMetaArray"); }


	/*
	 *
	 * Primitive write.
	 *
	 */


	override void writeBool(bool v) { strm.write(cast(byte)v); }
	override void writeByte(byte v) { strm.write(v); }
	override void writeUbyte(ubyte v) { strm.write(v); }
	override void writeShort(short v) { strm.write(v); }
	override void writeUshort(ushort v) { strm.write(v); }
	override void writeInt(int v) { strm.write(v); }
	override void writeUint(uint v) { strm.write(v); }
	override void writeLong(long v) { strm.write(v); }
	override void writeUlong(ulong v) { strm.write(v); }
	override void writeFloat(float v) { strm.write(v); }
	override void writeDouble(double v) { strm.write(v); }

	override void writeUSC(string v)
	{
		auto val = toUTF16(v);
		strm.write(cast(ushort)val.length);
		foreach(c; val)
			strm.write(c);
	}

	override void writeMeta(void[]) { throw new Exception("not implemented writeMeta"); }

	override void writeSlot(void[] data)
	{
		auto ms = new MemoryStream(cast(ubyte[])data);
		writeSlot(ms);
	}

	void writeSlot(MemoryStream data)
	{
		short id;
		byte count;
		short damage;
		short len;

		data.read(id);
		strm.write(id);
		if (id < 0)
			return;

		data.read(count);
		strm.write(count);
		data.read(damage);
		strm.write(damage);
		data.read(len);
		strm.write(len);
		if (len != -1)
			throw new Exception("AGH");
	}

	/*
	 *
	 * Array write.
	 *
	 */


	override void writeByteArray(byte[] v) { strm.write(cast(ubyte[])v); }
	override void writeIntArray(int[]) { throw new Exception("not implemented writeIntArray"); }

	override void writeSlotArray(void[] data)
	{
		auto ms = new MemoryStream(cast(ubyte[])data);
		while(ms.available > 0)
			writeSlot(ms);
	}

	override void writeChunkMetaArray(ChunkMeta[]) { throw new Exception("not implemented writeChunkMetaArray"); }
}
