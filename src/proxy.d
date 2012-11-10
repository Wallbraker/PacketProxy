module proxy;

import std.stdio : writefln;
import packets;
import marshalling;


void clientProxy(MinecraftSocket client, MinecraftSocket server, ubyte id)
{
	switch(id) {
	case 0x00:
		KeepAlivePacket packet;

		readKeepAlivePacket(client, packet);
		writefln("client -> %s", "KeepAlivePacket");
		writeKeepAlivePacket(server, packet);
		break;
	case 0x02:
		HandshakePacket packet;

		readHandshakePacket(client, packet);
		writefln("client -> %s", "HandshakePacket");
		writeHandshakePacket(server, packet);
		break;
	case 0x03:
		ChatMessagePacket packet;

		readChatMessagePacket(client, packet);
		writefln("client -> %s", "ChatMessagePacket");
		writeChatMessagePacket(server, packet);
		break;
	case 0x07:
		InteractwithEntityPacket packet;

		readInteractwithEntityPacket(client, packet);
		writefln("client -> %s", "InteractwithEntityPacket");
		writeInteractwithEntityPacket(server, packet);
		break;
	case 0x0A:
		PlayerFlyingPacket packet;

		readPlayerFlyingPacket(client, packet);
		writefln("client -> %s", "PlayerFlyingPacket");
		writePlayerFlyingPacket(server, packet);
		break;
	case 0x0B:
		PlayerPositionPacket packet;

		readPlayerPositionPacket(client, packet);
		writefln("client -> %s", "PlayerPositionPacket");
		writePlayerPositionPacket(server, packet);
		break;
	case 0x0C:
		PlayerLookPacket packet;

		readPlayerLookPacket(client, packet);
		writefln("client -> %s", "PlayerLookPacket");
		writePlayerLookPacket(server, packet);
		break;
	case 0x0D:
		ClientPlayerPositionLookPacket packet;

		readClientPlayerPositionLookPacket(client, packet);
		writefln("client -> %s", "ClientPlayerPositionLookPacket");
		writeClientPlayerPositionLookPacket(server, packet);
		break;
	case 0x0E:
		PlayerDiggingPacket packet;

		readPlayerDiggingPacket(client, packet);
		writefln("client -> %s", "PlayerDiggingPacket");
		writePlayerDiggingPacket(server, packet);
		break;
	case 0x0F:
		PlayerBlockPlacementPacket packet;

		readPlayerBlockPlacementPacket(client, packet);
		writefln("client -> %s", "PlayerBlockPlacementPacket");
		writePlayerBlockPlacementPacket(server, packet);
		break;
	case 0x10:
		HeldItemChangePacket packet;

		readHeldItemChangePacket(client, packet);
		writefln("client -> %s", "HeldItemChangePacket");
		writeHeldItemChangePacket(server, packet);
		break;
	case 0x12:
		EntityAnimationPacket packet;

		readEntityAnimationPacket(client, packet);
		writefln("client -> %s", "EntityAnimationPacket");
		writeEntityAnimationPacket(server, packet);
		break;
	case 0x13:
		EntityActionPacket packet;

		readEntityActionPacket(client, packet);
		writefln("client -> %s", "EntityActionPacket");
		writeEntityActionPacket(server, packet);
		break;
	case 0x65:
		CloseWindowPacket packet;

		readCloseWindowPacket(client, packet);
		writefln("client -> %s", "CloseWindowPacket");
		writeCloseWindowPacket(server, packet);
		break;
	case 0x66:
		ClickWindowPacket packet;

		readClickWindowPacket(client, packet);
		writefln("client -> %s", "ClickWindowPacket");
		writeClickWindowPacket(server, packet);
		break;
	case 0x6A:
		ConfirmTransactionPacket packet;

		readConfirmTransactionPacket(client, packet);
		writefln("client -> %s", "ConfirmTransactionPacket");
		writeConfirmTransactionPacket(server, packet);
		break;
	case 0x6B:
		CreativeInventoryActionPacket packet;

		readCreativeInventoryActionPacket(client, packet);
		writefln("client -> %s", "CreativeInventoryActionPacket");
		writeCreativeInventoryActionPacket(server, packet);
		break;
	case 0x6C:
		EnchantItemPacket packet;

		readEnchantItemPacket(client, packet);
		writefln("client -> %s", "EnchantItemPacket");
		writeEnchantItemPacket(server, packet);
		break;
	case 0x82:
		UpdateSignPacket packet;

		readUpdateSignPacket(client, packet);
		writefln("client -> %s", "UpdateSignPacket");
		writeUpdateSignPacket(server, packet);
		break;
	case 0xCA:
		PlayerAbilitiesPacket packet;

		readPlayerAbilitiesPacket(client, packet);
		writefln("client -> %s", "PlayerAbilitiesPacket");
		writePlayerAbilitiesPacket(server, packet);
		break;
	case 0xCB:
		TabCompletePacket packet;

		readTabCompletePacket(client, packet);
		writefln("client -> %s", "TabCompletePacket");
		writeTabCompletePacket(server, packet);
		break;
	case 0xCC:
		ClientSettingsPacket packet;

		readClientSettingsPacket(client, packet);
		writefln("client -> %s", "ClientSettingsPacket");
		writeClientSettingsPacket(server, packet);
		break;
	case 0xCD:
		ClientStatusPacket packet;

		readClientStatusPacket(client, packet);
		writefln("client -> %s", "ClientStatusPacket");
		writeClientStatusPacket(server, packet);
		break;
	case 0xFA:
		PluginMessagePacket packet;

		readPluginMessagePacket(client, packet);
		writefln("client -> %s", "PluginMessagePacket");
		writePluginMessagePacket(server, packet);
		break;
	case 0xFC:
		EncryptionKeyResponsePacket packet;

		readEncryptionKeyResponsePacket(client, packet);
		writefln("client -> %s", "EncryptionKeyResponsePacket");
		writeEncryptionKeyResponsePacket(server, packet);
		break;
	case 0xFE:
		ServerPingPacket packet;

		readServerPingPacket(client, packet);
		writefln("client -> %s", "ServerPingPacket");
		writeServerPingPacket(server, packet);
		break;
	case 0xFF:
		DisconnectKickPacket packet;

		readDisconnectKickPacket(client, packet);
		writefln("client -> %s", "DisconnectKickPacket");
		writeDisconnectKickPacket(server, packet);
		break;
	default:
		throw new Exception("invalid packet");
	}
}

void serverProxy(MinecraftSocket server, MinecraftSocket client, ubyte id)
{
	switch(id) {
	case 0x00:
		KeepAlivePacket packet;

		readKeepAlivePacket(server, packet);
		writefln("server -> %s", "KeepAlivePacket");
		writeKeepAlivePacket(client, packet);
		break;
	case 0x01:
		LoginRequestPacket packet;

		readLoginRequestPacket(server, packet);
		writefln("server -> %s", "LoginRequestPacket");
		writeLoginRequestPacket(client, packet);
		break;
	case 0x03:
		ChatMessagePacket packet;

		readChatMessagePacket(server, packet);
		writefln("server -> %s", "ChatMessagePacket");
		writeChatMessagePacket(client, packet);
		break;
	case 0x04:
		TimeUpdatePacket packet;

		readTimeUpdatePacket(server, packet);
		writefln("server -> %s", "TimeUpdatePacket");
		writeTimeUpdatePacket(client, packet);
		break;
	case 0x05:
		EntityEquipmentPacket packet;

		readEntityEquipmentPacket(server, packet);
		writefln("server -> %s", "EntityEquipmentPacket");
		writeEntityEquipmentPacket(client, packet);
		break;
	case 0x06:
		UpdateCompassPacket packet;

		readUpdateCompassPacket(server, packet);
		writefln("server -> %s", "UpdateCompassPacket");
		writeUpdateCompassPacket(client, packet);
		break;
	case 0x08:
		UpdateHealthPacket packet;

		readUpdateHealthPacket(server, packet);
		writefln("server -> %s", "UpdateHealthPacket");
		writeUpdateHealthPacket(client, packet);
		break;
	case 0x09:
		RespawnPacket packet;

		readRespawnPacket(server, packet);
		writefln("server -> %s", "RespawnPacket");
		writeRespawnPacket(client, packet);
		break;
	case 0x0D:
		ServerPlayerPositionLookPacket packet;

		readServerPlayerPositionLookPacket(server, packet);
		writefln("server -> %s", "ServerPlayerPositionLookPacket");
		writeServerPlayerPositionLookPacket(client, packet);
		break;
	case 0x11:
		UseBedPacket packet;

		readUseBedPacket(server, packet);
		writefln("server -> %s", "UseBedPacket");
		writeUseBedPacket(client, packet);
		break;
	case 0x12:
		EntityAnimationPacket packet;

		readEntityAnimationPacket(server, packet);
		writefln("server -> %s", "EntityAnimationPacket");
		writeEntityAnimationPacket(client, packet);
		break;
	case 0x14:
		SpawnPlayerEntityPacket packet;

		readSpawnPlayerEntityPacket(server, packet);
		writefln("server -> %s", "SpawnPlayerEntityPacket");
		writeSpawnPlayerEntityPacket(client, packet);
		break;
	case 0x15:
		SpawnDropEntityPacket packet;

		readSpawnDropEntityPacket(server, packet);
		writefln("server -> %s", "SpawnDropEntityPacket");
		writeSpawnDropEntityPacket(client, packet);
		break;
	case 0x16:
		EntityCollectDropPacket packet;

		readEntityCollectDropPacket(server, packet);
		writefln("server -> %s", "EntityCollectDropPacket");
		writeEntityCollectDropPacket(client, packet);
		break;
	case 0x17:
		SpawnVehicleEntityPacket packet;

		readSpawnVehicleEntityPacket(server, packet);
		writefln("server -> %s", "SpawnVehicleEntityPacket");
		writeSpawnVehicleEntityPacket(client, packet);
		break;
	case 0x18:
		SpawnMobEntityPacket packet;

		readSpawnMobEntityPacket(server, packet);
		writefln("server -> %s", "SpawnMobEntityPacket");
		writeSpawnMobEntityPacket(client, packet);
		break;
	case 0x19:
		SpawnPaintingEntityPacket packet;

		readSpawnPaintingEntityPacket(server, packet);
		writefln("server -> %s", "SpawnPaintingEntityPacket");
		writeSpawnPaintingEntityPacket(client, packet);
		break;
	case 0x1A:
		SpawnOrbEntityPacket packet;

		readSpawnOrbEntityPacket(server, packet);
		writefln("server -> %s", "SpawnOrbEntityPacket");
		writeSpawnOrbEntityPacket(client, packet);
		break;
	case 0x1C:
		EntityVelocityPacket packet;

		readEntityVelocityPacket(server, packet);
		writefln("server -> %s", "EntityVelocityPacket");
		writeEntityVelocityPacket(client, packet);
		break;
	case 0x1D:
		DestroyEntityPacket packet;

		readDestroyEntityPacket(server, packet);
		writefln("server -> %s", "DestroyEntityPacket");
		writeDestroyEntityPacket(client, packet);
		break;
	case 0x1E:
		EntityPacket packet;

		readEntityPacket(server, packet);
		writefln("server -> %s", "EntityPacket");
		writeEntityPacket(client, packet);
		break;
	case 0x1F:
		EntityRelativeMovePacket packet;

		readEntityRelativeMovePacket(server, packet);
		writefln("server -> %s", "EntityRelativeMovePacket");
		writeEntityRelativeMovePacket(client, packet);
		break;
	case 0x20:
		EntityLookPacket packet;

		readEntityLookPacket(server, packet);
		writefln("server -> %s", "EntityLookPacket");
		writeEntityLookPacket(client, packet);
		break;
	case 0x21:
		EntityRelativeMoveLookPacket packet;

		readEntityRelativeMoveLookPacket(server, packet);
		writefln("server -> %s", "EntityRelativeMoveLookPacket");
		writeEntityRelativeMoveLookPacket(client, packet);
		break;
	case 0x22:
		EntityTeleportPacket packet;

		readEntityTeleportPacket(server, packet);
		writefln("server -> %s", "EntityTeleportPacket");
		writeEntityTeleportPacket(client, packet);
		break;
	case 0x23:
		EntityHeadLookPacket packet;

		readEntityHeadLookPacket(server, packet);
		writefln("server -> %s", "EntityHeadLookPacket");
		writeEntityHeadLookPacket(client, packet);
		break;
	case 0x26:
		EntityStatusPacket packet;

		readEntityStatusPacket(server, packet);
		writefln("server -> %s", "EntityStatusPacket");
		writeEntityStatusPacket(client, packet);
		break;
	case 0x27:
		AttachEntityPacket packet;

		readAttachEntityPacket(server, packet);
		writefln("server -> %s", "AttachEntityPacket");
		writeAttachEntityPacket(client, packet);
		break;
	case 0x28:
		EntityMetadataPacket packet;

		readEntityMetadataPacket(server, packet);
		writefln("server -> %s", "EntityMetadataPacket");
		writeEntityMetadataPacket(client, packet);
		break;
	case 0x29:
		EntityEffectPacket packet;

		readEntityEffectPacket(server, packet);
		writefln("server -> %s", "EntityEffectPacket");
		writeEntityEffectPacket(client, packet);
		break;
	case 0x2A:
		RemoveEntityEffectPacket packet;

		readRemoveEntityEffectPacket(server, packet);
		writefln("server -> %s", "RemoveEntityEffectPacket");
		writeRemoveEntityEffectPacket(client, packet);
		break;
	case 0x2B:
		UpdateExperiencePacket packet;

		readUpdateExperiencePacket(server, packet);
		writefln("server -> %s", "UpdateExperiencePacket");
		writeUpdateExperiencePacket(client, packet);
		break;
	case 0x33:
		ChunkDataPacket packet;

		readChunkDataPacket(server, packet);
		writefln("server -> %s", "ChunkDataPacket");
		writeChunkDataPacket(client, packet);
		break;
	case 0x34:
		MultiBlockChangePacket packet;

		readMultiBlockChangePacket(server, packet);
		writefln("server -> %s", "MultiBlockChangePacket");
		writeMultiBlockChangePacket(client, packet);
		break;
	case 0x35:
		BlockChangePacket packet;

		readBlockChangePacket(server, packet);
		writefln("server -> %s", "BlockChangePacket");
		writeBlockChangePacket(client, packet);
		break;
	case 0x36:
		BlockActionPacket packet;

		readBlockActionPacket(server, packet);
		writefln("server -> %s", "BlockActionPacket");
		writeBlockActionPacket(client, packet);
		break;
	case 0x37:
		BlockBreakAnimationPacket packet;

		readBlockBreakAnimationPacket(server, packet);
		writefln("server -> %s", "BlockBreakAnimationPacket");
		writeBlockBreakAnimationPacket(client, packet);
		break;
	case 0x38:
		ChunkDataBulkPacket packet;

		readChunkDataBulkPacket(server, packet);
		writefln("server -> %s", "ChunkDataBulkPacket");
		writeChunkDataBulkPacket(client, packet);
		break;
	case 0x3C:
		ExplosionPacket packet;

		readExplosionPacket(server, packet);
		writefln("server -> %s", "ExplosionPacket");
		writeExplosionPacket(client, packet);
		break;
	case 0x3D:
		WorldEffectPacket packet;

		readWorldEffectPacket(server, packet);
		writefln("server -> %s", "WorldEffectPacket");
		writeWorldEffectPacket(client, packet);
		break;
	case 0x3E:
		NamedSoundEffectPacket packet;

		readNamedSoundEffectPacket(server, packet);
		writefln("server -> %s", "NamedSoundEffectPacket");
		writeNamedSoundEffectPacket(client, packet);
		break;
	case 0x46:
		UpdateGameStatePacket packet;

		readUpdateGameStatePacket(server, packet);
		writefln("server -> %s", "UpdateGameStatePacket");
		writeUpdateGameStatePacket(client, packet);
		break;
	case 0x47:
		LightningPacket packet;

		readLightningPacket(server, packet);
		writefln("server -> %s", "LightningPacket");
		writeLightningPacket(client, packet);
		break;
	case 0x64:
		OpenWindowPacket packet;

		readOpenWindowPacket(server, packet);
		writefln("server -> %s", "OpenWindowPacket");
		writeOpenWindowPacket(client, packet);
		break;
	case 0x65:
		CloseWindowPacket packet;

		readCloseWindowPacket(server, packet);
		writefln("server -> %s", "CloseWindowPacket");
		writeCloseWindowPacket(client, packet);
		break;
	case 0x67:
		SetSlotPacket packet;

		readSetSlotPacket(server, packet);
		writefln("server -> %s", "SetSlotPacket");
		writeSetSlotPacket(client, packet);
		break;
	case 0x68:
		SetWindowItemsPacket packet;

		readSetWindowItemsPacket(server, packet);
		writefln("server -> %s", "SetWindowItemsPacket");
		writeSetWindowItemsPacket(client, packet);
		break;
	case 0x69:
		UpdateWindowPropertyPacket packet;

		readUpdateWindowPropertyPacket(server, packet);
		writefln("server -> %s", "UpdateWindowPropertyPacket");
		writeUpdateWindowPropertyPacket(client, packet);
		break;
	case 0x6A:
		ConfirmTransactionPacket packet;

		readConfirmTransactionPacket(server, packet);
		writefln("server -> %s", "ConfirmTransactionPacket");
		writeConfirmTransactionPacket(client, packet);
		break;
	case 0x6B:
		CreativeInventoryActionPacket packet;

		readCreativeInventoryActionPacket(server, packet);
		writefln("server -> %s", "CreativeInventoryActionPacket");
		writeCreativeInventoryActionPacket(client, packet);
		break;
	case 0x82:
		UpdateSignPacket packet;

		readUpdateSignPacket(server, packet);
		writefln("server -> %s", "UpdateSignPacket");
		writeUpdateSignPacket(client, packet);
		break;
	case 0x83:
		ItemDataPacket packet;

		readItemDataPacket(server, packet);
		writefln("server -> %s", "ItemDataPacket");
		writeItemDataPacket(client, packet);
		break;
	case 0x84:
		UpdateTileEntityPacket packet;

		readUpdateTileEntityPacket(server, packet);
		writefln("server -> %s", "UpdateTileEntityPacket");
		writeUpdateTileEntityPacket(client, packet);
		break;
	case 0xC8:
		IncrementStatisticPacket packet;

		readIncrementStatisticPacket(server, packet);
		writefln("server -> %s", "IncrementStatisticPacket");
		writeIncrementStatisticPacket(client, packet);
		break;
	case 0xC9:
		PlayerListItemPacket packet;

		readPlayerListItemPacket(server, packet);
		writefln("server -> %s", "PlayerListItemPacket");
		writePlayerListItemPacket(client, packet);
		break;
	case 0xCA:
		PlayerAbilitiesPacket packet;

		readPlayerAbilitiesPacket(server, packet);
		writefln("server -> %s", "PlayerAbilitiesPacket");
		writePlayerAbilitiesPacket(client, packet);
		break;
	case 0xCB:
		TabCompletePacket packet;

		readTabCompletePacket(server, packet);
		writefln("server -> %s", "TabCompletePacket");
		writeTabCompletePacket(client, packet);
		break;
	case 0xFA:
		PluginMessagePacket packet;

		readPluginMessagePacket(server, packet);
		writefln("server -> %s", "PluginMessagePacket");
		writePluginMessagePacket(client, packet);
		break;
	case 0xFC:
		EncryptionKeyResponsePacket packet;

		readEncryptionKeyResponsePacket(server, packet);
		writefln("server -> %s", "EncryptionKeyResponsePacket");
		writeEncryptionKeyResponsePacket(client, packet);
		break;
	case 0xFD:
		EncryptionKeyRequestPacket packet;

		readEncryptionKeyRequestPacket(server, packet);
		writefln("server -> %s", "EncryptionKeyRequestPacket");
		writeEncryptionKeyRequestPacket(client, packet);
		break;
	case 0xFF:
		DisconnectKickPacket packet;

		readDisconnectKickPacket(server, packet);
		writefln("server -> %s", "DisconnectKickPacket");
		writeDisconnectKickPacket(client, packet);
		break;
	default:
		throw new Exception("invalid packet");
	}
}
