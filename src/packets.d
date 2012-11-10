module packets;




enum From {
	Client,
	Server,
	Both
}

struct Slot {}

struct Meta {}

struct ChunkMeta {}

struct KeepAlivePacket
{
	const ubyte id = 0x00;
	const From from = From.Both;

	int keepAliveId;
}

struct LoginRequestPacket
{
	const ubyte id = 0x01;
	const From from = From.Server;

	int entityId;
	string levelType;
	byte gameMode;
	byte dimension;
	byte difficulty;
	byte maxPlayers;
}

struct HandshakePacket
{
	const ubyte id = 0x02;
	const From from = From.Client;

	byte protocolVersion;
	string username;
	string hostname;
	uint port;
}

struct ChatMessagePacket
{
	const ubyte id = 0x03;
	const From from = From.Both;

	string chatMessage;
}

struct TimeUpdatePacket
{
	const ubyte id = 0x04;
	const From from = From.Server;

	long ageOfWorld;
	long time;
}

struct EntityEquipmentPacket
{
	const ubyte id = 0x05;
	const From from = From.Server;

	int entityId;
	short slot;
	void[] slotData;
}

struct UpdateCompassPacket
{
	const ubyte id = 0x06;
	const From from = From.Server;

	int positionX;
	int positionY;
	int positionZ;
}

struct InteractwithEntityPacket
{
	const ubyte id = 0x07;
	const From from = From.Client;

	int entityId;
	bool leftClicked;
}

struct UpdateHealthPacket
{
	const ubyte id = 0x08;
	const From from = From.Server;

	short health;
	short food;
	float foodSaturation;
}

struct RespawnPacket
{
	const ubyte id = 0x09;
	const From from = From.Server;

	int dimension;
	byte difficulty;
	byte gameMode;
	string levelType;
}

struct PlayerFlyingPacket
{
	const ubyte id = 0x0A;
	const From from = From.Client;

	bool onGround;
}

struct PlayerPositionPacket
{
	const ubyte id = 0x0B;
	const From from = From.Client;

	double positionX;
	double positionY;
	double stance;
	double positionZ;
	bool onGround;
}

struct PlayerLookPacket
{
	const ubyte id = 0x0C;
	const From from = From.Client;

	float yaw;
	float pitch;
	bool onGround;
}

struct ClientPlayerPositionLookPacket
{
	const ubyte id = 0x0D;
	const From from = From.Client;

	double positionX;
	double positionY;
	double stance;
	double positionZ;
	float yaw;
	float pitch;
	bool onGround;
}

struct ServerPlayerPositionLookPacket
{
	const ubyte id = 0x0D;
	const From from = From.Server;

	double positionX;
	double stance;
	double positionY;
	double positionZ;
	float yaw;
	float pitch;
	bool onGround;
}

struct PlayerDiggingPacket
{
	const ubyte id = 0x0E;
	const From from = From.Client;

	byte status;
	int positionX;
	byte positionY;
	int positionZ;
	byte face;
}

struct PlayerBlockPlacementPacket
{
	const ubyte id = 0x0F;
	const From from = From.Client;

	int positionX;
	ubyte positionY;
	int positionZ;
	byte direction;
	void[] slot;
	byte cursorX;
	byte cursorY;
	byte cursorZ;
}

struct HeldItemChangePacket
{
	const ubyte id = 0x10;
	const From from = From.Client;

	short slotId;
}

struct UseBedPacket
{
	const ubyte id = 0x11;
	const From from = From.Server;

	int entityId;
	int positionX;
	byte positionY;
	int positionZ;
}

struct EntityAnimationPacket
{
	const ubyte id = 0x12;
	const From from = From.Both;

	int entityId;
	byte animation;
}

struct EntityActionPacket
{
	const ubyte id = 0x13;
	const From from = From.Client;

	int userId;
	byte action;
}

struct SpawnPlayerEntityPacket
{
	const ubyte id = 0x14;
	const From from = From.Server;

	int entityId;
	string name;
	int positionX;
	int positionY;
	int positionZ;
	byte yaw;
	byte pitch;
	short heldItem;
	void[] meta;
}

struct SpawnDropEntityPacket
{
	const ubyte id = 0x15;
	const From from = From.Server;

	int entityId;
	void[] item;
	int positionX;
	int positionY;
	int positionZ;
	byte rotation;
	byte pitch;
	byte roll;
}

struct EntityCollectDropPacket
{
	const ubyte id = 0x16;
	const From from = From.Server;

	int collectedEntityId;
	int collectorEntityId;
}

struct SpawnVehicleEntityPacket
{
	const ubyte id = 0x17;
	const From from = From.Server;

	int entityId;
	byte type;
	int positionX;
	int positionY;
	int positionZ;
	int data;
	short velocityX;
	short velocityY;
	short velocityZ;
}

struct SpawnMobEntityPacket
{
	const ubyte id = 0x18;
	const From from = From.Server;

	int entityId;
	byte type;
	int positionX;
	int positionY;
	int positionZ;
	byte yaw;
	byte pitch;
	byte headYaw;
	short velocityZ;
	short velocityX;
	short velocityY;
	void[] meta;
}

struct SpawnPaintingEntityPacket
{
	const ubyte id = 0x19;
	const From from = From.Server;

	int entityId;
	string title;
	int positionX;
	int positionY;
	int positionZ;
	int direction;
}

struct SpawnOrbEntityPacket
{
	const ubyte id = 0x1A;
	const From from = From.Server;

	int entityId;
	int positionX;
	int positionY;
	int positionZ;
	short count;
}

struct EntityVelocityPacket
{
	const ubyte id = 0x1C;
	const From from = From.Server;

	int entityId;
	short velocityX;
	short velocityY;
	short velocityZ;
}

struct DestroyEntityPacket
{
	const ubyte id = 0x1D;
	const From from = From.Server;

	int[] entityIds;
}

struct EntityPacket
{
	const ubyte id = 0x1E;
	const From from = From.Server;

	int entityId;
}

struct EntityRelativeMovePacket
{
	const ubyte id = 0x1F;
	const From from = From.Server;

	int entityId;
	byte offsetX;
	byte offsetY;
	byte offsetZ;
}

struct EntityLookPacket
{
	const ubyte id = 0x20;
	const From from = From.Server;

	int entityId;
	byte yaw;
	byte pitch;
}

struct EntityRelativeMoveLookPacket
{
	const ubyte id = 0x21;
	const From from = From.Server;

	int entityId;
	byte offsetX;
	byte offsetY;
	byte offsetZ;
	byte yaw;
	byte pitch;
}

struct EntityTeleportPacket
{
	const ubyte id = 0x22;
	const From from = From.Server;

	int entityId;
	int positionX;
	int positionY;
	int positionZ;
	byte yaw;
	byte pitch;
}

struct EntityHeadLookPacket
{
	const ubyte id = 0x23;
	const From from = From.Server;

	int entityId;
	byte headYaw;
}

struct EntityStatusPacket
{
	const ubyte id = 0x26;
	const From from = From.Server;

	int entityId;
	byte status;
}

struct AttachEntityPacket
{
	const ubyte id = 0x27;
	const From from = From.Server;

	int entityId;
	int vehicleId;
}

struct EntityMetadataPacket
{
	const ubyte id = 0x28;
	const From from = From.Server;

	int entityId;
	void[] metaData;
}

struct EntityEffectPacket
{
	const ubyte id = 0x29;
	const From from = From.Server;

	int entityId;
	byte effect;
	byte amplifier;
	short duration;
}

struct RemoveEntityEffectPacket
{
	const ubyte id = 0x2A;
	const From from = From.Server;

	int entityId;
	byte effect;
}

struct UpdateExperiencePacket
{
	const ubyte id = 0x2B;
	const From from = From.Server;

	float levelExp;
	short level;
	short total;
}

struct ChunkDataPacket
{
	const ubyte id = 0x33;
	const From from = From.Server;

	int chunkX;
	int chunkZ;
	bool groundUpContinuous;
	ushort primaryBitmap;
	ushort addBitmap;
	byte[] chunkData;
}

struct MultiBlockChangePacket
{
	const ubyte id = 0x34;
	const From from = From.Server;

	int chunkX;
	int chunkZ;
	byte[] data;
}

struct BlockChangePacket
{
	const ubyte id = 0x35;
	const From from = From.Server;

	int positionX;
	byte positionY;
	int positionZ;
	short blockType;
	byte blockMeta;
}

struct BlockActionPacket
{
	const ubyte id = 0x36;
	const From from = From.Server;

	int positionX;
	short positionY;
	int positionZ;
	byte blockAction1;
	byte blockAction2;
	short blockId;
}

struct BlockBreakAnimationPacket
{
	const ubyte id = 0x37;
	const From from = From.Server;

	int entityId;
	int positionX;
	int positionY;
	int positionZ;
	byte stage;
}

struct ChunkDataBulkPacket
{
	const ubyte id = 0x38;
	const From from = From.Server;

	short chunkCount;
	byte[] chunkData;
	ChunkMeta[] chunkMeta;
}

struct ExplosionPacket
{
	const ubyte id = 0x3C;
	const From from = From.Server;

	double positionX;
	double positionY;
	double positionZ;
	float radius;
	byte[] explosions;
}

struct WorldEffectPacket
{
	const ubyte id = 0x3D;
	const From from = From.Server;

	int effect;
	int positionX;
	byte positionY;
	int positionZ;
	int data;
	bool valumeDecrease;
}

struct NamedSoundEffectPacket
{
	const ubyte id = 0x3E;
	const From from = From.Server;

	string name;
	int positionX;
	int positionY;
	int positionZ;
	float volume;
	byte pitch;
}

struct UpdateGameStatePacket
{
	const ubyte id = 0x46;
	const From from = From.Server;

	byte reason;
	byte mode;
}

struct LightningPacket
{
	const ubyte id = 0x47;
	const From from = From.Server;

	int entityId;
	int positionX;
	int positionY;
	int positionZ;
}

struct OpenWindowPacket
{
	const ubyte id = 0x64;
	const From from = From.Server;

	byte windowId;
	byte inventoryType;
	string title;
	byte slots;
}

struct CloseWindowPacket
{
	const ubyte id = 0x65;
	const From from = From.Both;

	byte windowId;
}

struct ClickWindowPacket
{
	const ubyte id = 0x66;
	const From from = From.Client;

	byte windowId;
	short slot;
	byte mouseButton;
	short actionId;
	bool shift;
	void[] target;
}

struct SetSlotPacket
{
	const ubyte id = 0x67;
	const From from = From.Server;

	byte windowId;
	short slotId;
	void[] slotValue;
}

struct SetWindowItemsPacket
{
	const ubyte id = 0x68;
	const From from = From.Server;

	byte windowId;
	short count;
	void[] changes;
}

struct UpdateWindowPropertyPacket
{
	const ubyte id = 0x69;
	const From from = From.Server;

	byte windowId;
	short property;
	short value;
}

struct ConfirmTransactionPacket
{
	const ubyte id = 0x6A;
	const From from = From.Both;

	byte windowId;
	short actionId;
	bool accepted;
}

struct CreativeInventoryActionPacket
{
	const ubyte id = 0x6B;
	const From from = From.Both;

	short slotId;
	void[] slotValue;
}

struct EnchantItemPacket
{
	const ubyte id = 0x6C;
	const From from = From.Client;

	byte windowId;
	byte enchantment;
}

struct UpdateSignPacket
{
	const ubyte id = 0x82;
	const From from = From.Both;

	int positionX;
	short positionY;
	int positionZ;
	string line1;
	string line2;
	string line3;
	string line4;
}

struct ItemDataPacket
{
	const ubyte id = 0x83;
	const From from = From.Server;

	short itemType;
	short itemId;
	byte[] data;
}

struct UpdateTileEntityPacket
{
	const ubyte id = 0x84;
	const From from = From.Server;

	int positionX;
	short positionY;
	int positionZ;
	byte[] data;
}

struct IncrementStatisticPacket
{
	const ubyte id = 0xC8;
	const From from = From.Server;

	int statisticId;
	byte amount;
}

struct PlayerListItemPacket
{
	const ubyte id = 0xC9;
	const From from = From.Server;

	string playerName;
	bool online;
	short ping;
}

struct PlayerAbilitiesPacket
{
	const ubyte id = 0xCA;
	const From from = From.Both;

	byte flags;
	byte flyingSpeed;
	byte runningSpeed;
}

struct TabCompletePacket
{
	const ubyte id = 0xCB;
	const From from = From.Both;

	string text;
}

struct ClientSettingsPacket
{
	const ubyte id = 0xCC;
	const From from = From.Client;

	string locale;
	byte viewDistance;
	byte chatFlags;
	byte difficulty;
	bool showCape;
}

struct ClientStatusPacket
{
	const ubyte id = 0xCD;
	const From from = From.Client;

	byte payload;
}

struct PluginMessagePacket
{
	const ubyte id = 0xFA;
	const From from = From.Both;

	string channel;
	byte[] payload;
}

struct EncryptionKeyResponsePacket
{
	const ubyte id = 0xFC;
	const From from = From.Both;

	byte[] sharedSecret;
	byte[] verifyKey;
}

struct EncryptionKeyRequestPacket
{
	const ubyte id = 0xFD;
	const From from = From.Server;

	string serverId;
	byte[] publicKey;
	byte[] verifyKey;
}

struct ServerPingPacket
{
	const ubyte id = 0xFE;
	const From from = From.Client;

}

struct DisconnectKickPacket
{
	const ubyte id = 0xFF;
	const From from = From.Both;

	string reason;
}
