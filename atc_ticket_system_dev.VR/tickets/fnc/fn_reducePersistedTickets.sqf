#include "..\script_macros.hpp"
#include "..\config.hpp"
/*
	Description:
		Reduce the given player's persisted ticket count by 1.

	Params:
		0: OBJECT - Player object

	Returns:
		Nothing
*/
params ["_player"];

if (!isServer) exitWith {};

_uid = getPlayerUID _player;
_current_tickets = [_player, nil, true] call BIS_fnc_respawnTickets;
_is_ended = _player getVariable [PLAYER_ENDED_FLAG, false];

if (_is_ended) exitWith {
	LOG_PLAYER(_player, "Player has ended so not changing persisting ticket count");
};

_new_value = _current_tickets - 1;
#define message format ["Persisting tickent number of %1", _new_value]
LOG_PLAYER(_player, message);
TICKETS_GUID_TICKETS_MAPPING set [_uid, _new_value];
