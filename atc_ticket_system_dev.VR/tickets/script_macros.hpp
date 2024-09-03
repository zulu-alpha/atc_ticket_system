#define LOG(MESSAGE) diag_log format["TICKETS SYSTEM: -> %1", MESSAGE];
#define LOG_PLAYER(PLAYER, MESSAGE) diag_log format["TICKETS SYSTEM: %1 (%2) -> %3", name PLAYER, getPlayerUID PLAYER, MESSAGE];