module marshalling;

import packets;



class MinecraftSocket
{
	abstract bool readBool();
	abstract byte readByte();
	abstract ubyte readUbyte();
	abstract short readShort();
	abstract ushort readUshort();
	abstract int readInt();
	abstract uint readUint();
	abstract long readLong();
	abstract ulong readUlong();
	abstract float readFloat();
	abstract double readDouble();

	abstract string readUSC();
	abstract void[] readSlot();
	abstract void[] readMeta();

	abstract byte[] readByteArray(uint);
	abstract int[] readIntArray(uint);
	abstract void[] readSlotArray(uint);
	abstract ChunkMeta[] readChunkMetaArray(uint);

	abstract void writeByte(byte);
	abstract void writeUbyte(ubyte);
	abstract void writeShort(short);
	abstract void writeUshort(ushort);
	abstract void writeInt(int);
	abstract void writeUint(uint);
	abstract void writeLong(long);
	abstract void writeUlong(ulong);
	abstract void writeFloat(float);
	abstract void writeDouble(double);
	abstract void writeBool(bool);

	abstract void writeUSC(string);
	abstract void writeSlot(void[]);
	abstract void writeMeta(void[]);

	abstract void writeByteArray(byte[]);
	abstract void writeIntArray(int[]);
	abstract void writeSlotArray(void[]);
	abstract void writeChunkMetaArray(ChunkMeta[]);
}

void readKeepAlivePacket(MinecraftSocket ms, ref KeepAlivePacket packet)
{
	packet.keepAliveId = ms.readInt();
}

void readLoginRequestPacket(MinecraftSocket ms, ref LoginRequestPacket packet)
{
	packet.entityId = ms.readInt();
	packet.levelType = ms.readUSC();
	packet.gameMode = ms.readByte();
	packet.dimension = ms.readByte();
	packet.difficulty = ms.readByte();
	ms.readByte();
	packet.maxPlayers = ms.readByte();
}

void readHandshakePacket(MinecraftSocket ms, ref HandshakePacket packet)
{
	packet.protocolVersion = ms.readByte();
	packet.username = ms.readUSC();
	packet.hostname = ms.readUSC();
	packet.port = ms.readUint();
}

void readChatMessagePacket(MinecraftSocket ms, ref ChatMessagePacket packet)
{
	packet.chatMessage = ms.readUSC();
}

void readTimeUpdatePacket(MinecraftSocket ms, ref TimeUpdatePacket packet)
{
	packet.ageOfWorld = ms.readLong();
	packet.time = ms.readLong();
}

void readEntityEquipmentPacket(MinecraftSocket ms, ref EntityEquipmentPacket packet)
{
	packet.entityId = ms.readInt();
	packet.slot = ms.readShort();
	packet.slotData = ms.readSlot();
}

void readUpdateCompassPacket(MinecraftSocket ms, ref UpdateCompassPacket packet)
{
	packet.positionX = ms.readInt();
	packet.positionY = ms.readInt();
	packet.positionZ = ms.readInt();
}

void readInteractwithEntityPacket(MinecraftSocket ms, ref InteractwithEntityPacket packet)
{
	ms.readInt();
	packet.entityId = ms.readInt();
	packet.leftClicked = ms.readBool();
}

void readUpdateHealthPacket(MinecraftSocket ms, ref UpdateHealthPacket packet)
{
	packet.health = ms.readShort();
	packet.food = ms.readShort();
	packet.foodSaturation = ms.readFloat();
}

void readRespawnPacket(MinecraftSocket ms, ref RespawnPacket packet)
{
	packet.dimension = ms.readInt();
	packet.difficulty = ms.readByte();
	packet.gameMode = ms.readByte();
	ms.readShort();
	packet.levelType = ms.readUSC();
}

void readPlayerFlyingPacket(MinecraftSocket ms, ref PlayerFlyingPacket packet)
{
	packet.onGround = ms.readBool();
}

void readPlayerPositionPacket(MinecraftSocket ms, ref PlayerPositionPacket packet)
{
	packet.positionX = ms.readDouble();
	packet.positionY = ms.readDouble();
	packet.stance = ms.readDouble();
	packet.positionZ = ms.readDouble();
	packet.onGround = ms.readBool();
}

void readPlayerLookPacket(MinecraftSocket ms, ref PlayerLookPacket packet)
{
	packet.yaw = ms.readFloat();
	packet.pitch = ms.readFloat();
	packet.onGround = ms.readBool();
}

void readClientPlayerPositionLookPacket(MinecraftSocket ms, ref ClientPlayerPositionLookPacket packet)
{
	packet.positionX = ms.readDouble();
	packet.positionY = ms.readDouble();
	packet.stance = ms.readDouble();
	packet.positionZ = ms.readDouble();
	packet.yaw = ms.readFloat();
	packet.pitch = ms.readFloat();
	packet.onGround = ms.readBool();
}

void readServerPlayerPositionLookPacket(MinecraftSocket ms, ref ServerPlayerPositionLookPacket packet)
{
	packet.positionX = ms.readDouble();
	packet.stance = ms.readDouble();
	packet.positionY = ms.readDouble();
	packet.positionZ = ms.readDouble();
	packet.yaw = ms.readFloat();
	packet.pitch = ms.readFloat();
	packet.onGround = ms.readBool();
}

void readPlayerDiggingPacket(MinecraftSocket ms, ref PlayerDiggingPacket packet)
{
	packet.status = ms.readByte();
	packet.positionX = ms.readInt();
	packet.positionY = ms.readByte();
	packet.positionZ = ms.readInt();
	packet.face = ms.readByte();
}

void readPlayerBlockPlacementPacket(MinecraftSocket ms, ref PlayerBlockPlacementPacket packet)
{
	packet.positionX = ms.readInt();
	packet.positionY = ms.readUbyte();
	packet.positionZ = ms.readInt();
	packet.direction = ms.readByte();
	packet.slot = ms.readSlot();
	packet.cursorX = ms.readByte();
	packet.cursorY = ms.readByte();
	packet.cursorZ = ms.readByte();
}

void readHeldItemChangePacket(MinecraftSocket ms, ref HeldItemChangePacket packet)
{
	packet.slotId = ms.readShort();
}

void readUseBedPacket(MinecraftSocket ms, ref UseBedPacket packet)
{
	packet.entityId = ms.readInt();
	ms.readByte();
	packet.positionX = ms.readInt();
	packet.positionY = ms.readByte();
	packet.positionZ = ms.readInt();
}

void readEntityAnimationPacket(MinecraftSocket ms, ref EntityAnimationPacket packet)
{
	packet.entityId = ms.readInt();
	packet.animation = ms.readByte();
}

void readEntityActionPacket(MinecraftSocket ms, ref EntityActionPacket packet)
{
	packet.userId = ms.readInt();
	packet.action = ms.readByte();
}

void readSpawnPlayerEntityPacket(MinecraftSocket ms, ref SpawnPlayerEntityPacket packet)
{
	packet.entityId = ms.readInt();
	packet.name = ms.readUSC();
	packet.positionX = ms.readInt();
	packet.positionY = ms.readInt();
	packet.positionZ = ms.readInt();
	packet.yaw = ms.readByte();
	packet.pitch = ms.readByte();
	packet.heldItem = ms.readShort();
	packet.meta = ms.readMeta();
}

void readSpawnDropEntityPacket(MinecraftSocket ms, ref SpawnDropEntityPacket packet)
{
	packet.entityId = ms.readInt();
	packet.item = ms.readSlot();
	packet.positionX = ms.readInt();
	packet.positionY = ms.readInt();
	packet.positionZ = ms.readInt();
	packet.rotation = ms.readByte();
	packet.pitch = ms.readByte();
	packet.roll = ms.readByte();
}

void readEntityCollectDropPacket(MinecraftSocket ms, ref EntityCollectDropPacket packet)
{
	packet.collectedEntityId = ms.readInt();
	packet.collectorEntityId = ms.readInt();
}

void readSpawnVehicleEntityPacket(MinecraftSocket ms, ref SpawnVehicleEntityPacket packet)
{
	packet.entityId = ms.readInt();
	packet.type = ms.readByte();
	packet.positionX = ms.readInt();
	packet.positionY = ms.readInt();
	packet.positionZ = ms.readInt();
	packet.data = ms.readInt();
	if (packet.data > 0) {
		packet.velocityX = ms.readShort();
		packet.velocityY = ms.readShort();
		packet.velocityZ = ms.readShort();
	}
}

void readSpawnMobEntityPacket(MinecraftSocket ms, ref SpawnMobEntityPacket packet)
{
	packet.entityId = ms.readInt();
	packet.type = ms.readByte();
	packet.positionX = ms.readInt();
	packet.positionY = ms.readInt();
	packet.positionZ = ms.readInt();
	packet.yaw = ms.readByte();
	packet.pitch = ms.readByte();
	packet.headYaw = ms.readByte();
	packet.velocityZ = ms.readShort();
	packet.velocityX = ms.readShort();
	packet.velocityY = ms.readShort();
	packet.meta = ms.readMeta();
}

void readSpawnPaintingEntityPacket(MinecraftSocket ms, ref SpawnPaintingEntityPacket packet)
{
	packet.entityId = ms.readInt();
	packet.title = ms.readUSC();
	packet.positionX = ms.readInt();
	packet.positionY = ms.readInt();
	packet.positionZ = ms.readInt();
	packet.direction = ms.readInt();
}

void readSpawnOrbEntityPacket(MinecraftSocket ms, ref SpawnOrbEntityPacket packet)
{
	packet.entityId = ms.readInt();
	packet.positionX = ms.readInt();
	packet.positionY = ms.readInt();
	packet.positionZ = ms.readInt();
	packet.count = ms.readShort();
}

void readEntityVelocityPacket(MinecraftSocket ms, ref EntityVelocityPacket packet)
{
	packet.entityId = ms.readInt();
	packet.velocityX = ms.readShort();
	packet.velocityY = ms.readShort();
	packet.velocityZ = ms.readShort();
}

void readDestroyEntityPacket(MinecraftSocket ms, ref DestroyEntityPacket packet)
{
	uint entityIdsLength = ms.readByte();
	packet.entityIds = ms.readIntArray(entityIdsLength);
}

void readEntityPacket(MinecraftSocket ms, ref EntityPacket packet)
{
	packet.entityId = ms.readInt();
}

void readEntityRelativeMovePacket(MinecraftSocket ms, ref EntityRelativeMovePacket packet)
{
	packet.entityId = ms.readInt();
	packet.offsetX = ms.readByte();
	packet.offsetY = ms.readByte();
	packet.offsetZ = ms.readByte();
}

void readEntityLookPacket(MinecraftSocket ms, ref EntityLookPacket packet)
{
	packet.entityId = ms.readInt();
	packet.yaw = ms.readByte();
	packet.pitch = ms.readByte();
}

void readEntityRelativeMoveLookPacket(MinecraftSocket ms, ref EntityRelativeMoveLookPacket packet)
{
	packet.entityId = ms.readInt();
	packet.offsetX = ms.readByte();
	packet.offsetY = ms.readByte();
	packet.offsetZ = ms.readByte();
	packet.yaw = ms.readByte();
	packet.pitch = ms.readByte();
}

void readEntityTeleportPacket(MinecraftSocket ms, ref EntityTeleportPacket packet)
{
	packet.entityId = ms.readInt();
	packet.positionX = ms.readInt();
	packet.positionY = ms.readInt();
	packet.positionZ = ms.readInt();
	packet.yaw = ms.readByte();
	packet.pitch = ms.readByte();
}

void readEntityHeadLookPacket(MinecraftSocket ms, ref EntityHeadLookPacket packet)
{
	packet.entityId = ms.readInt();
	packet.headYaw = ms.readByte();
}

void readEntityStatusPacket(MinecraftSocket ms, ref EntityStatusPacket packet)
{
	packet.entityId = ms.readInt();
	packet.status = ms.readByte();
}

void readAttachEntityPacket(MinecraftSocket ms, ref AttachEntityPacket packet)
{
	packet.entityId = ms.readInt();
	packet.vehicleId = ms.readInt();
}

void readEntityMetadataPacket(MinecraftSocket ms, ref EntityMetadataPacket packet)
{
	packet.entityId = ms.readInt();
	packet.metaData = ms.readMeta();
}

void readEntityEffectPacket(MinecraftSocket ms, ref EntityEffectPacket packet)
{
	packet.entityId = ms.readInt();
	packet.effect = ms.readByte();
	packet.amplifier = ms.readByte();
	packet.duration = ms.readShort();
}

void readRemoveEntityEffectPacket(MinecraftSocket ms, ref RemoveEntityEffectPacket packet)
{
	packet.entityId = ms.readInt();
	packet.effect = ms.readByte();
}

void readUpdateExperiencePacket(MinecraftSocket ms, ref UpdateExperiencePacket packet)
{
	packet.levelExp = ms.readFloat();
	packet.level = ms.readShort();
	packet.total = ms.readShort();
}

void readChunkDataPacket(MinecraftSocket ms, ref ChunkDataPacket packet)
{
	packet.chunkX = ms.readInt();
	packet.chunkZ = ms.readInt();
	packet.groundUpContinuous = ms.readBool();
	packet.primaryBitmap = ms.readUshort();
	packet.addBitmap = ms.readUshort();
	uint chunkDataLength = ms.readInt();
	packet.chunkData = ms.readByteArray(chunkDataLength);
}

void readMultiBlockChangePacket(MinecraftSocket ms, ref MultiBlockChangePacket packet)
{
	packet.chunkX = ms.readInt();
	packet.chunkZ = ms.readInt();
	uint dataLength = ms.readInt();
	packet.data = ms.readByteArray(dataLength);
}

void readBlockChangePacket(MinecraftSocket ms, ref BlockChangePacket packet)
{
	packet.positionX = ms.readInt();
	packet.positionY = ms.readByte();
	packet.positionZ = ms.readInt();
	packet.blockType = ms.readShort();
	packet.blockMeta = ms.readByte();
}

void readBlockActionPacket(MinecraftSocket ms, ref BlockActionPacket packet)
{
	packet.positionX = ms.readInt();
	packet.positionY = ms.readShort();
	packet.positionZ = ms.readInt();
	packet.blockAction1 = ms.readByte();
	packet.blockAction2 = ms.readByte();
	packet.blockId = ms.readShort();
}

void readBlockBreakAnimationPacket(MinecraftSocket ms, ref BlockBreakAnimationPacket packet)
{
	packet.entityId = ms.readInt();
	packet.positionX = ms.readInt();
	packet.positionY = ms.readInt();
	packet.positionZ = ms.readInt();
	packet.stage = ms.readByte();
}

void readChunkDataBulkPacket(MinecraftSocket ms, ref ChunkDataBulkPacket packet)
{
	packet.chunkCount = ms.readShort();
	uint chunkDataLength = ms.readInt();
	packet.chunkData = ms.readByteArray(chunkDataLength);
	packet.chunkMeta = ms.readChunkMetaArray(packet.chunkCount);
}

void readExplosionPacket(MinecraftSocket ms, ref ExplosionPacket packet)
{
	packet.positionX = ms.readDouble();
	packet.positionY = ms.readDouble();
	packet.positionZ = ms.readDouble();
	packet.radius = ms.readFloat();
	uint explosionsLength = ms.readInt();
	packet.explosions = ms.readByteArray(explosionsLength);
	ms.readFloat();
	ms.readFloat();
	ms.readFloat();
}

void readWorldEffectPacket(MinecraftSocket ms, ref WorldEffectPacket packet)
{
	packet.effect = ms.readInt();
	packet.positionX = ms.readInt();
	packet.positionY = ms.readByte();
	packet.positionZ = ms.readInt();
	packet.data = ms.readInt();
	packet.valumeDecrease = ms.readBool();
}

void readNamedSoundEffectPacket(MinecraftSocket ms, ref NamedSoundEffectPacket packet)
{
	packet.name = ms.readUSC();
	packet.positionX = ms.readInt();
	packet.positionY = ms.readInt();
	packet.positionZ = ms.readInt();
	packet.volume = ms.readFloat();
	packet.pitch = ms.readByte();
}

void readUpdateGameStatePacket(MinecraftSocket ms, ref UpdateGameStatePacket packet)
{
	packet.reason = ms.readByte();
	if (packet.reason == 3) {
		packet.mode = ms.readByte();
	}
}

void readLightningPacket(MinecraftSocket ms, ref LightningPacket packet)
{
	packet.entityId = ms.readInt();
	ms.readBool();
	packet.positionX = ms.readInt();
	packet.positionY = ms.readInt();
	packet.positionZ = ms.readInt();
}

void readOpenWindowPacket(MinecraftSocket ms, ref OpenWindowPacket packet)
{
	packet.windowId = ms.readByte();
	packet.inventoryType = ms.readByte();
	packet.title = ms.readUSC();
	packet.slots = ms.readByte();
}

void readCloseWindowPacket(MinecraftSocket ms, ref CloseWindowPacket packet)
{
	packet.windowId = ms.readByte();
}

void readClickWindowPacket(MinecraftSocket ms, ref ClickWindowPacket packet)
{
	packet.windowId = ms.readByte();
	packet.slot = ms.readShort();
	packet.mouseButton = ms.readByte();
	packet.actionId = ms.readShort();
	packet.shift = ms.readBool();
	packet.target = ms.readSlot();
}

void readSetSlotPacket(MinecraftSocket ms, ref SetSlotPacket packet)
{
	packet.windowId = ms.readByte();
	packet.slotId = ms.readShort();
	packet.slotValue = ms.readSlot();
}

void readSetWindowItemsPacket(MinecraftSocket ms, ref SetWindowItemsPacket packet)
{
	packet.windowId = ms.readByte();
	packet.count = ms.readShort();
	packet.changes = ms.readSlotArray(packet.count);
}

void readUpdateWindowPropertyPacket(MinecraftSocket ms, ref UpdateWindowPropertyPacket packet)
{
	packet.windowId = ms.readByte();
	packet.property = ms.readShort();
	packet.value = ms.readShort();
}

void readConfirmTransactionPacket(MinecraftSocket ms, ref ConfirmTransactionPacket packet)
{
	packet.windowId = ms.readByte();
	packet.actionId = ms.readShort();
	packet.accepted = ms.readBool();
}

void readCreativeInventoryActionPacket(MinecraftSocket ms, ref CreativeInventoryActionPacket packet)
{
	packet.slotId = ms.readShort();
	packet.slotValue = ms.readSlot();
}

void readEnchantItemPacket(MinecraftSocket ms, ref EnchantItemPacket packet)
{
	packet.windowId = ms.readByte();
	packet.enchantment = ms.readByte();
}

void readUpdateSignPacket(MinecraftSocket ms, ref UpdateSignPacket packet)
{
	packet.positionX = ms.readInt();
	packet.positionY = ms.readShort();
	packet.positionZ = ms.readInt();
	packet.line1 = ms.readUSC();
	packet.line2 = ms.readUSC();
	packet.line3 = ms.readUSC();
	packet.line4 = ms.readUSC();
}

void readItemDataPacket(MinecraftSocket ms, ref ItemDataPacket packet)
{
	packet.itemType = ms.readShort();
	packet.itemId = ms.readShort();
	uint dataLength = ms.readByte();
	packet.data = ms.readByteArray(dataLength);
}

void readUpdateTileEntityPacket(MinecraftSocket ms, ref UpdateTileEntityPacket packet)
{
	packet.positionX = ms.readInt();
	packet.positionY = ms.readShort();
	packet.positionZ = ms.readInt();
	uint dataLength = ms.readShort();
	packet.data = ms.readByteArray(dataLength);
}

void readIncrementStatisticPacket(MinecraftSocket ms, ref IncrementStatisticPacket packet)
{
	packet.statisticId = ms.readInt();
	packet.amount = ms.readByte();
}

void readPlayerListItemPacket(MinecraftSocket ms, ref PlayerListItemPacket packet)
{
	packet.playerName = ms.readUSC();
	packet.online = ms.readBool();
	packet.ping = ms.readShort();
}

void readPlayerAbilitiesPacket(MinecraftSocket ms, ref PlayerAbilitiesPacket packet)
{
	packet.flags = ms.readByte();
	packet.flyingSpeed = ms.readByte();
	packet.runningSpeed = ms.readByte();
}

void readTabCompletePacket(MinecraftSocket ms, ref TabCompletePacket packet)
{
	packet.text = ms.readUSC();
}

void readClientSettingsPacket(MinecraftSocket ms, ref ClientSettingsPacket packet)
{
	packet.locale = ms.readUSC();
	packet.viewDistance = ms.readByte();
	packet.chatFlags = ms.readByte();
	packet.difficulty = ms.readByte();
	packet.showCape = ms.readBool();
}

void readClientStatusPacket(MinecraftSocket ms, ref ClientStatusPacket packet)
{
	packet.payload = ms.readByte();
}

void readPluginMessagePacket(MinecraftSocket ms, ref PluginMessagePacket packet)
{
	packet.channel = ms.readUSC();
	uint payloadLength = ms.readShort();
	packet.payload = ms.readByteArray(payloadLength);
}

void readEncryptionKeyResponsePacket(MinecraftSocket ms, ref EncryptionKeyResponsePacket packet)
{
	uint sharedSecretLength = ms.readShort();
	packet.sharedSecret = ms.readByteArray(sharedSecretLength);
	uint verifyKeyLength = ms.readShort();
	packet.verifyKey = ms.readByteArray(verifyKeyLength);
}

void readEncryptionKeyRequestPacket(MinecraftSocket ms, ref EncryptionKeyRequestPacket packet)
{
	packet.serverId = ms.readUSC();
	uint publicKeyLength = ms.readShort();
	packet.publicKey = ms.readByteArray(publicKeyLength);
	uint verifyKeyLength = ms.readShort();
	packet.verifyKey = ms.readByteArray(verifyKeyLength);
}

void readServerPingPacket(MinecraftSocket ms, ref ServerPingPacket packet)
{
	ms.readByte();
}

void readDisconnectKickPacket(MinecraftSocket ms, ref DisconnectKickPacket packet)
{
	packet.reason = ms.readUSC();
}

void writeKeepAlivePacket(MinecraftSocket ms, ref KeepAlivePacket packet)
{
	ms.writeUbyte(KeepAlivePacket.id);
	ms.writeInt(packet.keepAliveId);
}

void writeLoginRequestPacket(MinecraftSocket ms, ref LoginRequestPacket packet)
{
	ms.writeUbyte(LoginRequestPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeUSC(packet.levelType);
	ms.writeByte(packet.gameMode);
	ms.writeByte(packet.dimension);
	ms.writeByte(packet.difficulty);
	ms.writeByte(0);
	ms.writeByte(packet.maxPlayers);
}

void writeHandshakePacket(MinecraftSocket ms, ref HandshakePacket packet)
{
	ms.writeUbyte(HandshakePacket.id);
	ms.writeByte(packet.protocolVersion);
	ms.writeUSC(packet.username);
	ms.writeUSC(packet.hostname);
	ms.writeUint(packet.port);
}

void writeChatMessagePacket(MinecraftSocket ms, ref ChatMessagePacket packet)
{
	ms.writeUbyte(ChatMessagePacket.id);
	ms.writeUSC(packet.chatMessage);
}

void writeTimeUpdatePacket(MinecraftSocket ms, ref TimeUpdatePacket packet)
{
	ms.writeUbyte(TimeUpdatePacket.id);
	ms.writeLong(packet.ageOfWorld);
	ms.writeLong(packet.time);
}

void writeEntityEquipmentPacket(MinecraftSocket ms, ref EntityEquipmentPacket packet)
{
	ms.writeUbyte(EntityEquipmentPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeShort(packet.slot);
	ms.writeSlot(packet.slotData);
}

void writeUpdateCompassPacket(MinecraftSocket ms, ref UpdateCompassPacket packet)
{
	ms.writeUbyte(UpdateCompassPacket.id);
	ms.writeInt(packet.positionX);
	ms.writeInt(packet.positionY);
	ms.writeInt(packet.positionZ);
}

void writeInteractwithEntityPacket(MinecraftSocket ms, ref InteractwithEntityPacket packet)
{
	ms.writeUbyte(InteractwithEntityPacket.id);
	ms.writeInt(0);
	ms.writeInt(packet.entityId);
	ms.writeBool(packet.leftClicked);
}

void writeUpdateHealthPacket(MinecraftSocket ms, ref UpdateHealthPacket packet)
{
	ms.writeUbyte(UpdateHealthPacket.id);
	ms.writeShort(packet.health);
	ms.writeShort(packet.food);
	ms.writeFloat(packet.foodSaturation);
}

void writeRespawnPacket(MinecraftSocket ms, ref RespawnPacket packet)
{
	ms.writeUbyte(RespawnPacket.id);
	ms.writeInt(packet.dimension);
	ms.writeByte(packet.difficulty);
	ms.writeByte(packet.gameMode);
	ms.writeShort(256);
	ms.writeUSC(packet.levelType);
}

void writePlayerFlyingPacket(MinecraftSocket ms, ref PlayerFlyingPacket packet)
{
	ms.writeUbyte(PlayerFlyingPacket.id);
	ms.writeBool(packet.onGround);
}

void writePlayerPositionPacket(MinecraftSocket ms, ref PlayerPositionPacket packet)
{
	ms.writeUbyte(PlayerPositionPacket.id);
	ms.writeDouble(packet.positionX);
	ms.writeDouble(packet.positionY);
	ms.writeDouble(packet.stance);
	ms.writeDouble(packet.positionZ);
	ms.writeBool(packet.onGround);
}

void writePlayerLookPacket(MinecraftSocket ms, ref PlayerLookPacket packet)
{
	ms.writeUbyte(PlayerLookPacket.id);
	ms.writeFloat(packet.yaw);
	ms.writeFloat(packet.pitch);
	ms.writeBool(packet.onGround);
}

void writeClientPlayerPositionLookPacket(MinecraftSocket ms, ref ClientPlayerPositionLookPacket packet)
{
	ms.writeUbyte(ClientPlayerPositionLookPacket.id);
	ms.writeDouble(packet.positionX);
	ms.writeDouble(packet.positionY);
	ms.writeDouble(packet.stance);
	ms.writeDouble(packet.positionZ);
	ms.writeFloat(packet.yaw);
	ms.writeFloat(packet.pitch);
	ms.writeBool(packet.onGround);
}

void writeServerPlayerPositionLookPacket(MinecraftSocket ms, ref ServerPlayerPositionLookPacket packet)
{
	ms.writeUbyte(ServerPlayerPositionLookPacket.id);
	ms.writeDouble(packet.positionX);
	ms.writeDouble(packet.stance);
	ms.writeDouble(packet.positionY);
	ms.writeDouble(packet.positionZ);
	ms.writeFloat(packet.yaw);
	ms.writeFloat(packet.pitch);
	ms.writeBool(packet.onGround);
}

void writePlayerDiggingPacket(MinecraftSocket ms, ref PlayerDiggingPacket packet)
{
	ms.writeUbyte(PlayerDiggingPacket.id);
	ms.writeByte(packet.status);
	ms.writeInt(packet.positionX);
	ms.writeByte(packet.positionY);
	ms.writeInt(packet.positionZ);
	ms.writeByte(packet.face);
}

void writePlayerBlockPlacementPacket(MinecraftSocket ms, ref PlayerBlockPlacementPacket packet)
{
	ms.writeUbyte(PlayerBlockPlacementPacket.id);
	ms.writeInt(packet.positionX);
	ms.writeUbyte(packet.positionY);
	ms.writeInt(packet.positionZ);
	ms.writeByte(packet.direction);
	ms.writeSlot(packet.slot);
	ms.writeByte(packet.cursorX);
	ms.writeByte(packet.cursorY);
	ms.writeByte(packet.cursorZ);
}

void writeHeldItemChangePacket(MinecraftSocket ms, ref HeldItemChangePacket packet)
{
	ms.writeUbyte(HeldItemChangePacket.id);
	ms.writeShort(packet.slotId);
}

void writeUseBedPacket(MinecraftSocket ms, ref UseBedPacket packet)
{
	ms.writeUbyte(UseBedPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeByte(0);
	ms.writeInt(packet.positionX);
	ms.writeByte(packet.positionY);
	ms.writeInt(packet.positionZ);
}

void writeEntityAnimationPacket(MinecraftSocket ms, ref EntityAnimationPacket packet)
{
	ms.writeUbyte(EntityAnimationPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeByte(packet.animation);
}

void writeEntityActionPacket(MinecraftSocket ms, ref EntityActionPacket packet)
{
	ms.writeUbyte(EntityActionPacket.id);
	ms.writeInt(packet.userId);
	ms.writeByte(packet.action);
}

void writeSpawnPlayerEntityPacket(MinecraftSocket ms, ref SpawnPlayerEntityPacket packet)
{
	ms.writeUbyte(SpawnPlayerEntityPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeUSC(packet.name);
	ms.writeInt(packet.positionX);
	ms.writeInt(packet.positionY);
	ms.writeInt(packet.positionZ);
	ms.writeByte(packet.yaw);
	ms.writeByte(packet.pitch);
	ms.writeShort(packet.heldItem);
	ms.writeMeta(packet.meta);
}

void writeSpawnDropEntityPacket(MinecraftSocket ms, ref SpawnDropEntityPacket packet)
{
	ms.writeUbyte(SpawnDropEntityPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeSlot(packet.item);
	ms.writeInt(packet.positionX);
	ms.writeInt(packet.positionY);
	ms.writeInt(packet.positionZ);
	ms.writeByte(packet.rotation);
	ms.writeByte(packet.pitch);
	ms.writeByte(packet.roll);
}

void writeEntityCollectDropPacket(MinecraftSocket ms, ref EntityCollectDropPacket packet)
{
	ms.writeUbyte(EntityCollectDropPacket.id);
	ms.writeInt(packet.collectedEntityId);
	ms.writeInt(packet.collectorEntityId);
}

void writeSpawnVehicleEntityPacket(MinecraftSocket ms, ref SpawnVehicleEntityPacket packet)
{
	ms.writeUbyte(SpawnVehicleEntityPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeByte(packet.type);
	ms.writeInt(packet.positionX);
	ms.writeInt(packet.positionY);
	ms.writeInt(packet.positionZ);
	ms.writeInt(packet.data);
	if (packet.data > 0) {
		packet.velocityX = ms.readShort();
		packet.velocityY = ms.readShort();
		packet.velocityZ = ms.readShort();
	}
}

void writeSpawnMobEntityPacket(MinecraftSocket ms, ref SpawnMobEntityPacket packet)
{
	ms.writeUbyte(SpawnMobEntityPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeByte(packet.type);
	ms.writeInt(packet.positionX);
	ms.writeInt(packet.positionY);
	ms.writeInt(packet.positionZ);
	ms.writeByte(packet.yaw);
	ms.writeByte(packet.pitch);
	ms.writeByte(packet.headYaw);
	ms.writeShort(packet.velocityZ);
	ms.writeShort(packet.velocityX);
	ms.writeShort(packet.velocityY);
	ms.writeMeta(packet.meta);
}

void writeSpawnPaintingEntityPacket(MinecraftSocket ms, ref SpawnPaintingEntityPacket packet)
{
	ms.writeUbyte(SpawnPaintingEntityPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeUSC(packet.title);
	ms.writeInt(packet.positionX);
	ms.writeInt(packet.positionY);
	ms.writeInt(packet.positionZ);
	ms.writeInt(packet.direction);
}

void writeSpawnOrbEntityPacket(MinecraftSocket ms, ref SpawnOrbEntityPacket packet)
{
	ms.writeUbyte(SpawnOrbEntityPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeInt(packet.positionX);
	ms.writeInt(packet.positionY);
	ms.writeInt(packet.positionZ);
	ms.writeShort(packet.count);
}

void writeEntityVelocityPacket(MinecraftSocket ms, ref EntityVelocityPacket packet)
{
	ms.writeUbyte(EntityVelocityPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeShort(packet.velocityX);
	ms.writeShort(packet.velocityY);
	ms.writeShort(packet.velocityZ);
}

void writeDestroyEntityPacket(MinecraftSocket ms, ref DestroyEntityPacket packet)
{
	ms.writeUbyte(DestroyEntityPacket.id);
	ms.writeByte(cast(byte)(packet.entityIds.length));
	ms.writeIntArray(packet.entityIds);
}

void writeEntityPacket(MinecraftSocket ms, ref EntityPacket packet)
{
	ms.writeUbyte(EntityPacket.id);
	ms.writeInt(packet.entityId);
}

void writeEntityRelativeMovePacket(MinecraftSocket ms, ref EntityRelativeMovePacket packet)
{
	ms.writeUbyte(EntityRelativeMovePacket.id);
	ms.writeInt(packet.entityId);
	ms.writeByte(packet.offsetX);
	ms.writeByte(packet.offsetY);
	ms.writeByte(packet.offsetZ);
}

void writeEntityLookPacket(MinecraftSocket ms, ref EntityLookPacket packet)
{
	ms.writeUbyte(EntityLookPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeByte(packet.yaw);
	ms.writeByte(packet.pitch);
}

void writeEntityRelativeMoveLookPacket(MinecraftSocket ms, ref EntityRelativeMoveLookPacket packet)
{
	ms.writeUbyte(EntityRelativeMoveLookPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeByte(packet.offsetX);
	ms.writeByte(packet.offsetY);
	ms.writeByte(packet.offsetZ);
	ms.writeByte(packet.yaw);
	ms.writeByte(packet.pitch);
}

void writeEntityTeleportPacket(MinecraftSocket ms, ref EntityTeleportPacket packet)
{
	ms.writeUbyte(EntityTeleportPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeInt(packet.positionX);
	ms.writeInt(packet.positionY);
	ms.writeInt(packet.positionZ);
	ms.writeByte(packet.yaw);
	ms.writeByte(packet.pitch);
}

void writeEntityHeadLookPacket(MinecraftSocket ms, ref EntityHeadLookPacket packet)
{
	ms.writeUbyte(EntityHeadLookPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeByte(packet.headYaw);
}

void writeEntityStatusPacket(MinecraftSocket ms, ref EntityStatusPacket packet)
{
	ms.writeUbyte(EntityStatusPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeByte(packet.status);
}

void writeAttachEntityPacket(MinecraftSocket ms, ref AttachEntityPacket packet)
{
	ms.writeUbyte(AttachEntityPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeInt(packet.vehicleId);
}

void writeEntityMetadataPacket(MinecraftSocket ms, ref EntityMetadataPacket packet)
{
	ms.writeUbyte(EntityMetadataPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeMeta(packet.metaData);
}

void writeEntityEffectPacket(MinecraftSocket ms, ref EntityEffectPacket packet)
{
	ms.writeUbyte(EntityEffectPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeByte(packet.effect);
	ms.writeByte(packet.amplifier);
	ms.writeShort(packet.duration);
}

void writeRemoveEntityEffectPacket(MinecraftSocket ms, ref RemoveEntityEffectPacket packet)
{
	ms.writeUbyte(RemoveEntityEffectPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeByte(packet.effect);
}

void writeUpdateExperiencePacket(MinecraftSocket ms, ref UpdateExperiencePacket packet)
{
	ms.writeUbyte(UpdateExperiencePacket.id);
	ms.writeFloat(packet.levelExp);
	ms.writeShort(packet.level);
	ms.writeShort(packet.total);
}

void writeChunkDataPacket(MinecraftSocket ms, ref ChunkDataPacket packet)
{
	ms.writeUbyte(ChunkDataPacket.id);
	ms.writeInt(packet.chunkX);
	ms.writeInt(packet.chunkZ);
	ms.writeBool(packet.groundUpContinuous);
	ms.writeUshort(packet.primaryBitmap);
	ms.writeUshort(packet.addBitmap);
	ms.writeInt(cast(int)(packet.chunkData.length));
	ms.writeByteArray(packet.chunkData);
}

void writeMultiBlockChangePacket(MinecraftSocket ms, ref MultiBlockChangePacket packet)
{
	ms.writeUbyte(MultiBlockChangePacket.id);
	ms.writeInt(packet.chunkX);
	ms.writeInt(packet.chunkZ);
	ms.writeInt(cast(int)(packet.data.length));
	ms.writeByteArray(packet.data);
}

void writeBlockChangePacket(MinecraftSocket ms, ref BlockChangePacket packet)
{
	ms.writeUbyte(BlockChangePacket.id);
	ms.writeInt(packet.positionX);
	ms.writeByte(packet.positionY);
	ms.writeInt(packet.positionZ);
	ms.writeShort(packet.blockType);
	ms.writeByte(packet.blockMeta);
}

void writeBlockActionPacket(MinecraftSocket ms, ref BlockActionPacket packet)
{
	ms.writeUbyte(BlockActionPacket.id);
	ms.writeInt(packet.positionX);
	ms.writeShort(packet.positionY);
	ms.writeInt(packet.positionZ);
	ms.writeByte(packet.blockAction1);
	ms.writeByte(packet.blockAction2);
	ms.writeShort(packet.blockId);
}

void writeBlockBreakAnimationPacket(MinecraftSocket ms, ref BlockBreakAnimationPacket packet)
{
	ms.writeUbyte(BlockBreakAnimationPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeInt(packet.positionX);
	ms.writeInt(packet.positionY);
	ms.writeInt(packet.positionZ);
	ms.writeByte(packet.stage);
}

void writeChunkDataBulkPacket(MinecraftSocket ms, ref ChunkDataBulkPacket packet)
{
	ms.writeUbyte(ChunkDataBulkPacket.id);
	ms.writeShort(packet.chunkCount);
	ms.writeInt(cast(int)(packet.chunkData.length));
	ms.writeByteArray(packet.chunkData);
	ms.writeChunkMetaArray(packet.chunkMeta);
}

void writeExplosionPacket(MinecraftSocket ms, ref ExplosionPacket packet)
{
	ms.writeUbyte(ExplosionPacket.id);
	ms.writeDouble(packet.positionX);
	ms.writeDouble(packet.positionY);
	ms.writeDouble(packet.positionZ);
	ms.writeFloat(packet.radius);
	ms.writeInt(cast(int)(packet.explosions.length));
	ms.writeByteArray(packet.explosions);
	ms.writeFloat(0);
	ms.writeFloat(0);
	ms.writeFloat(0);
}

void writeWorldEffectPacket(MinecraftSocket ms, ref WorldEffectPacket packet)
{
	ms.writeUbyte(WorldEffectPacket.id);
	ms.writeInt(packet.effect);
	ms.writeInt(packet.positionX);
	ms.writeByte(packet.positionY);
	ms.writeInt(packet.positionZ);
	ms.writeInt(packet.data);
	ms.writeBool(packet.valumeDecrease);
}

void writeNamedSoundEffectPacket(MinecraftSocket ms, ref NamedSoundEffectPacket packet)
{
	ms.writeUbyte(NamedSoundEffectPacket.id);
	ms.writeUSC(packet.name);
	ms.writeInt(packet.positionX);
	ms.writeInt(packet.positionY);
	ms.writeInt(packet.positionZ);
	ms.writeFloat(packet.volume);
	ms.writeByte(packet.pitch);
}

void writeUpdateGameStatePacket(MinecraftSocket ms, ref UpdateGameStatePacket packet)
{
	ms.writeUbyte(UpdateGameStatePacket.id);
	ms.writeByte(packet.reason);
	if (packet.reason == 3) {
		packet.mode = ms.readByte();
	}
}

void writeLightningPacket(MinecraftSocket ms, ref LightningPacket packet)
{
	ms.writeUbyte(LightningPacket.id);
	ms.writeInt(packet.entityId);
	ms.writeBool(true);
	ms.writeInt(packet.positionX);
	ms.writeInt(packet.positionY);
	ms.writeInt(packet.positionZ);
}

void writeOpenWindowPacket(MinecraftSocket ms, ref OpenWindowPacket packet)
{
	ms.writeUbyte(OpenWindowPacket.id);
	ms.writeByte(packet.windowId);
	ms.writeByte(packet.inventoryType);
	ms.writeUSC(packet.title);
	ms.writeByte(packet.slots);
}

void writeCloseWindowPacket(MinecraftSocket ms, ref CloseWindowPacket packet)
{
	ms.writeUbyte(CloseWindowPacket.id);
	ms.writeByte(packet.windowId);
}

void writeClickWindowPacket(MinecraftSocket ms, ref ClickWindowPacket packet)
{
	ms.writeUbyte(ClickWindowPacket.id);
	ms.writeByte(packet.windowId);
	ms.writeShort(packet.slot);
	ms.writeByte(packet.mouseButton);
	ms.writeShort(packet.actionId);
	ms.writeBool(packet.shift);
	ms.writeSlot(packet.target);
}

void writeSetSlotPacket(MinecraftSocket ms, ref SetSlotPacket packet)
{
	ms.writeUbyte(SetSlotPacket.id);
	ms.writeByte(packet.windowId);
	ms.writeShort(packet.slotId);
	ms.writeSlot(packet.slotValue);
}

void writeSetWindowItemsPacket(MinecraftSocket ms, ref SetWindowItemsPacket packet)
{
	ms.writeUbyte(SetWindowItemsPacket.id);
	ms.writeByte(packet.windowId);
	ms.writeShort(packet.count);
	ms.writeSlotArray(packet.changes);
}

void writeUpdateWindowPropertyPacket(MinecraftSocket ms, ref UpdateWindowPropertyPacket packet)
{
	ms.writeUbyte(UpdateWindowPropertyPacket.id);
	ms.writeByte(packet.windowId);
	ms.writeShort(packet.property);
	ms.writeShort(packet.value);
}

void writeConfirmTransactionPacket(MinecraftSocket ms, ref ConfirmTransactionPacket packet)
{
	ms.writeUbyte(ConfirmTransactionPacket.id);
	ms.writeByte(packet.windowId);
	ms.writeShort(packet.actionId);
	ms.writeBool(packet.accepted);
}

void writeCreativeInventoryActionPacket(MinecraftSocket ms, ref CreativeInventoryActionPacket packet)
{
	ms.writeUbyte(CreativeInventoryActionPacket.id);
	ms.writeShort(packet.slotId);
	ms.writeSlot(packet.slotValue);
}

void writeEnchantItemPacket(MinecraftSocket ms, ref EnchantItemPacket packet)
{
	ms.writeUbyte(EnchantItemPacket.id);
	ms.writeByte(packet.windowId);
	ms.writeByte(packet.enchantment);
}

void writeUpdateSignPacket(MinecraftSocket ms, ref UpdateSignPacket packet)
{
	ms.writeUbyte(UpdateSignPacket.id);
	ms.writeInt(packet.positionX);
	ms.writeShort(packet.positionY);
	ms.writeInt(packet.positionZ);
	ms.writeUSC(packet.line1);
	ms.writeUSC(packet.line2);
	ms.writeUSC(packet.line3);
	ms.writeUSC(packet.line4);
}

void writeItemDataPacket(MinecraftSocket ms, ref ItemDataPacket packet)
{
	ms.writeUbyte(ItemDataPacket.id);
	ms.writeShort(packet.itemType);
	ms.writeShort(packet.itemId);
	ms.writeByte(cast(byte)(packet.data.length));
	ms.writeByteArray(packet.data);
}

void writeUpdateTileEntityPacket(MinecraftSocket ms, ref UpdateTileEntityPacket packet)
{
	ms.writeUbyte(UpdateTileEntityPacket.id);
	ms.writeInt(packet.positionX);
	ms.writeShort(packet.positionY);
	ms.writeInt(packet.positionZ);
	ms.writeShort(cast(short)(packet.data.length));
	ms.writeByteArray(packet.data);
}

void writeIncrementStatisticPacket(MinecraftSocket ms, ref IncrementStatisticPacket packet)
{
	ms.writeUbyte(IncrementStatisticPacket.id);
	ms.writeInt(packet.statisticId);
	ms.writeByte(packet.amount);
}

void writePlayerListItemPacket(MinecraftSocket ms, ref PlayerListItemPacket packet)
{
	ms.writeUbyte(PlayerListItemPacket.id);
	ms.writeUSC(packet.playerName);
	ms.writeBool(packet.online);
	ms.writeShort(packet.ping);
}

void writePlayerAbilitiesPacket(MinecraftSocket ms, ref PlayerAbilitiesPacket packet)
{
	ms.writeUbyte(PlayerAbilitiesPacket.id);
	ms.writeByte(packet.flags);
	ms.writeByte(packet.flyingSpeed);
	ms.writeByte(packet.runningSpeed);
}

void writeTabCompletePacket(MinecraftSocket ms, ref TabCompletePacket packet)
{
	ms.writeUbyte(TabCompletePacket.id);
	ms.writeUSC(packet.text);
}

void writeClientSettingsPacket(MinecraftSocket ms, ref ClientSettingsPacket packet)
{
	ms.writeUbyte(ClientSettingsPacket.id);
	ms.writeUSC(packet.locale);
	ms.writeByte(packet.viewDistance);
	ms.writeByte(packet.chatFlags);
	ms.writeByte(packet.difficulty);
	ms.writeBool(packet.showCape);
}

void writeClientStatusPacket(MinecraftSocket ms, ref ClientStatusPacket packet)
{
	ms.writeUbyte(ClientStatusPacket.id);
	ms.writeByte(packet.payload);
}

void writePluginMessagePacket(MinecraftSocket ms, ref PluginMessagePacket packet)
{
	ms.writeUbyte(PluginMessagePacket.id);
	ms.writeUSC(packet.channel);
	ms.writeShort(cast(short)(packet.payload.length));
	ms.writeByteArray(packet.payload);
}

void writeEncryptionKeyResponsePacket(MinecraftSocket ms, ref EncryptionKeyResponsePacket packet)
{
	ms.writeUbyte(EncryptionKeyResponsePacket.id);
	ms.writeShort(cast(short)(packet.sharedSecret.length));
	ms.writeByteArray(packet.sharedSecret);
	ms.writeShort(cast(short)(packet.verifyKey.length));
	ms.writeByteArray(packet.verifyKey);
}

void writeEncryptionKeyRequestPacket(MinecraftSocket ms, ref EncryptionKeyRequestPacket packet)
{
	ms.writeUbyte(EncryptionKeyRequestPacket.id);
	ms.writeUSC(packet.serverId);
	ms.writeShort(cast(short)(packet.publicKey.length));
	ms.writeByteArray(packet.publicKey);
	ms.writeShort(cast(short)(packet.verifyKey.length));
	ms.writeByteArray(packet.verifyKey);
}

void writeServerPingPacket(MinecraftSocket ms, ref ServerPingPacket packet)
{
	ms.writeUbyte(ServerPingPacket.id);
	ms.writeByte(1);
}

void writeDisconnectKickPacket(MinecraftSocket ms, ref DisconnectKickPacket packet)
{
	ms.writeUbyte(DisconnectKickPacket.id);
	ms.writeUSC(packet.reason);
}
