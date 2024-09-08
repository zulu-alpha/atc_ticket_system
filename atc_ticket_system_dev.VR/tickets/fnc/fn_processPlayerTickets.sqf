#include "..\script_macros.hpp"
#include "..\config.hpp"
/*
	Description:
		Initialize player tickets or restore last known tickets.

	Params:
		0: OBJECT - Player object

	Returns:
		Nothing
*/
params ["_player"];

_uid = getPlayerUID _player;
_persisted_number = TICKETS_GUID_TICKETS_MAPPING getOrDefault [_uid, -1];

#define MESSAGE format ["Player has no persisted tickets so giving initial value of %1", INITIAL_TICKETS]

if (_persisted_number == -1) exitWith {
	LOG_PLAYER(_player, MESSAGE);
	[INITIAL_TICKETS] remoteExec ["Tickets_fnc_safeRespawnTickets", _player];
	TICKETS_GUID_TICKETS_MAPPING set [_uid, INITIAL_TICKETS];
};

#define MESSAGE format ["Player has persisted tickets so giving value of %1", _persisted_number]

if (_persisted_number > 0) exitWith {
	LOG_PLAYER(_player, MESSAGE);
	[_persisted_number] remoteExec ["Tickets_fnc_safeRespawnTickets", _player];
	[format["You have %1 tickets left.", _persisted_number]] remoteExec ["Tickets_fnc_notifyHuman", _player];
};

if (_persisted_number == 0) exitWith {
	LOG_PLAYER(_player, "Player has no tickets so ending the player");
	["You have no remaining respawn tickets."] remoteExec ["Tickets_fnc_notifyHuman", _player];
	[_player] call Tickets_fnc_endPlayer;
};
