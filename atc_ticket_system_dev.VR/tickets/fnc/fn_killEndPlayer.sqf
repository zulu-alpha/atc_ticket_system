#include "..\script_macros.hpp"
#include "..\config.hpp"
/*
	Description:
		Set the player's tickets to 0 and kill them, in order to stop them from playing.
		In order to flag the player as ended so as not to persist the reduction in tickets, we also flag the player.

		An "killed" or "ended" player, is one that is not allowed to play anymore, unless they rejoin under different conditions that don't also lead them to be "ended".
		For example, joining when they don't have any tickets left as per their persisted tickets have run out.

	Params:
		0: OBJECT - Player object

	Returns:
		Nothing
*/
params ["_player"];

_player setVariable [PLAYER_ENDED_FLAG, true, false];
remoteExec ["Tickets_fnc_killEndPlayerOnLocal", _player];
