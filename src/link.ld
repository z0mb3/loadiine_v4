OUTPUT(loadiine.elf);

SECTIONS {
	.kernel_code 0x00AE1000 : {
		*(.kernel_code*);
	}
	. = .;
	.text : {
		*(.text*);
	}
	.menu_magic : {
		*(.menu_magic*);
	}
	.loader_magic : {
		*(.loader_magic*);
	}
	.fs_method_calls : {
		*(.fs_method_calls*);
	}
	. = . + 0xBC000000;
	.rodata : {
		*(.rodata*);
	}
	.bss : {
		*(.bss*);
	}
	.fs_magic : {
		*(.fs_magic*);
	}
	.magicptr 0x011DD000 : {
		*(.magicptr*);
	}
	/DISCARD/ : {
		*(*);
	}
}

/******************************************************** FS ********************************************************/
/* coreinit.rpl difference in addresses 0xFE3C00 */
/* FSA methods */
PROVIDE(FSAInit = 0x105EF88);
PROVIDE(FSAShutdown = 0x105F050);
PROVIDE(FSAAddClient = 0x10637B0);
PROVIDE(FSADelClient = 0x105F180);
PROVIDE(FSAOpenFile = 0x10608D4);

/* FS base methods */
PROVIDE(FSInit = 0x10666FC);
PROVIDE(FSShutdown = 0x10668B0);
PROVIDE(FSAddClient = 0x1066D80);
PROVIDE(FSAddClientEx = 0x1066974);
PROVIDE(FSDelClient = 0x1066D8C);
PROVIDE(FSInitCmdBlock = 0x1066FEC);

/* FS methods for path replacement */
PROVIDE(FSOpenFile = 0x0106D4D8);
PROVIDE(FSOpenFileAsync = 0x010685DC);
PROVIDE(FSOpenDir = 0x0106DB58);
PROVIDE(FSOpenDirAsync = 0x010692D8);
PROVIDE(FSChangeDir = 0x0106D458);
PROVIDE(FSChangeDirAsync = 0x010684D8);
PROVIDE(FSGetStat = 0x0106E290);
PROVIDE(FSGetStatAsync = 0x0106A314);
PROVIDE(FSMakeDir = 0x0106DDA8);
PROVIDE(FSMakeDirAsync = 0x01069780);
PROVIDE(FSRename = 0x0106DEA8);
PROVIDE(FSRenameAsync = 0x0106998C);
PROVIDE(FSRemove = 0x0106DE28);
PROVIDE(FSRemoveAsync = 0x01069888);
PROVIDE(FSFlushQuota = 0x0106DF90);
PROVIDE(FSFlushQuotaAsync = 0x01069D6C);
PROVIDE(FSGetFreeSpaceSize = 0x0106E300);
PROVIDE(FSGetFreeSpaceSizeAsync = 0x0106A328);
PROVIDE(FSRollbackQuota = 0x0106E110);
PROVIDE(FSRollbackQuotaAsync = 0x01069E70);

/* FS methods - not replaced */
PROVIDE(FSReadDir = 0x0106DC48);
PROVIDE(FSRewindDir = 0x0106DCB8);
PROVIDE(FSReadFile = 0x106D5D0);
PROVIDE(FSCloseFile = 0x106D550);
PROVIDE(FSCloseDir = 0x0106DBC8);

/* FS methods - log */
PROVIDE(FSCloseFile_log = 0x106D550);
PROVIDE(FSCloseFileAsync_log = 0x01068754);
PROVIDE(FSSetPosFile_log = 0x106D9F8);
PROVIDE(FSGetPosFile_log = 0x106D988);
PROVIDE(FSGetStatFile_log = 0x106DA68);
PROVIDE(FSIsEof_log = 0x106DAD8);
PROVIDE(FSReadFile_log = 0x106D5D0);
PROVIDE(FSReadFileWithPos_log = 0x106D65C);
PROVIDE(FSReadFileAsync_log = 0x01068B0C);
PROVIDE(FSCloseDir_log = 0x0106DBC8);
PROVIDE(FSGetCwd_log = 0x0106DD38);
PROVIDE(FSReadDir_log = 0x0106DC48);
PROVIDE(FSFlushFile_log = 0x0106D908);
PROVIDE(FSGetErrorCodeForViewer_log = 0x0106A790);
PROVIDE(FSGetLastError_log = 0x0106A754);
PROVIDE(FSGetLastErrorCodeForViewer_log = 0x0106AB94);
PROVIDE(FSSetStateChangeNotification_log = 0x010671E0);
PROVIDE(FSSetCmdPriority_log = 0x0106AC80);
PROVIDE(FSTruncateFile_log = 0x0106D888);
PROVIDE(FSWriteFile_log = 0x0106D6F0);
PROVIDE(FSWriteFileAsync_log = 0x01068D28);
PROVIDE(FSWriteFileWithPos_log = 0x0106D77C);
PROVIDE(FSGetVolumeState_log = 0x010671AC);

/* FS methods for sd card */
PROVIDE(FSGetMountSource = 0x0106D180);
PROVIDE(FSMount = 0x0106D270);
PROVIDE(FSUnmount = 0x0106D2E8);

/* GX2 methods */
PROVIDE(GX2WaitForVsync = 0x1150868);

/* Socket methods */
PROVIDE(socket_lib_init = 0x10BF2F4);
PROVIDE(socket = 0x10C11C8);
PROVIDE(socketclose = 0x10C1314);
PROVIDE(connect = 0x10BF828);
PROVIDE(send = 0x10C06AC);
PROVIDE(recv = 0x10BFAEC);
PROVIDE(setsockopt = 0x10C1E0C);

/* Standard library methods */
PROVIDE(MEMAllocFromDefaultHeapEx = 0x1004E2D0);
PROVIDE(MEMAllocFromDefaultHeap = 0x100B41F8);
PROVIDE(MEMFreeToDefaultHeap = 0x100B41FC);

/* Screen */
PROVIDE(OSScreenInit = 0x01039AD8);
PROVIDE(OSScreenGetBufferSizeEx = 0x01039B74);
PROVIDE(OSScreenSetBufferEx = 0x01039B8C);
PROVIDE(OSScreenClearBufferEx = 0x01039CE8);
PROVIDE(OSScreenFlipBuffersEx = 0x01039C28);
PROVIDE(OSScreenPutFontEx = 0x0103A16C);

/* OS data sysapp */
PROVIDE(title_id = 0x10013010);

/* OS methods */
PROVIDE(OSDynLoad_Acquire = 0x01029F70);
PROVIDE(OSDynLoad_FindExport = 0x0102B3E4);
PROVIDE(OSDynLoad_IsModuleLoaded = 0x0102A158);
PROVIDE(OSDynLoad_GetModuleName = 0x0102B5B4);
PROVIDE(__os_snprintf = 0x102ECE0);
PROVIDE(OSFatal = 0x1030ECC);
/* PROVIDE(OSSetExceptionCallbackEx = 0x01042F40); - Only in 5.3.1 */
PROVIDE(OSSetExceptionCallback = 0x01042F30);
PROVIDE(DCFlushRange = 0x1023A00);

/* VPAD */
PROVIDE(VPADRead = 0x011283D0);

/******************************************************** Menu ********************************************************/
/* Launched application's entry point */
PROVIDE(entry_point = 0x1005CB00); /* Use the same name as pyGecko instead of MiiMaker_main

/******************************************************* Loader *******************************************************/
/* This are the real functions that are used for our purpose */ 
PROVIDE(LiWaitIopComplete                                = 0x0100FBC4);
PROVIDE(LiWaitIopCompleteWithInterrupts                  = 0x0100FAB0);
PROVIDE(LiCheckAndHandleInterrupts                       = 0x0100431C);
PROVIDE(Loader_SysCallGetProcessIndex                    = 0x010000A8);
PROVIDE(LiLoadAsync                                      = 0x0100FC7C);

/* This are just addresses to the real functions which we only need as reference */
PROVIDE(addr_LiWaitOneChunk                              = 0x010007EC);
PROVIDE(addr_LiBounceOneChunk                            = 0x010003B0);