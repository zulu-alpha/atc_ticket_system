#include "..\script_macros.hpp"
/*
	Description:
		Allow or kick a player based on their class

	Params:
		0: OBJECT - Player object

	Returns:
		Nothing
*/
params ["_player"];

_uid = getPlayerUID _player;
_registerd_role = TICKETS_GUID_CLASS_MAPPING getOrDefault [_uid, ""];
_current_role = typeOf _player;
#define MESSAGE format ["Player not registered with a class so adding class %1", _current_role]

if (_registerd_role == "") exitWith {
	LOG_PLAYER(_player, MESSAGE);
	TICKETS_GUID_CLASS_MAPPING set [_uid, typeOf _player];
};

if (_registerd_role != _current_role) exitWith {
	LOG_PLAYER(_player, "Player class does not match registered class so ending");
	_kill_reason = format ["You have been killed as you are joining as the class %1, but you previously joined as %2", _current_role, _registerd_role];
	[_kill_reason] remoteExec ["Tickets_fnc_notifyHuman", _player];
	[_player] call Tickets_fnc_endPlayer;
};
