#include "..\script_macros.hpp"
#include "..\config.hpp"
/*
	Description:
		Set the player's tickets to 0 and kill them, in order to stop them from playing.
		In order to flag the player as ended so as not to persist the reduction in tickets, we also flag the player.

		An "Ended" player, is one that is not allowed to play anymore, unless they rejoin under different conditions that don't also lead them to be "ended".
		For example, joining as a different class than the one they were previously registered with, or joining when they don't have any tickets left as per their persisted tickets.

	Params:
		0: OBJECT - Player object

	Returns:
		Nothing
*/
params ["_player"];

_player setVariable [PLAYER_ENDED_FLAG, true, false];
_current_tickets = [_player, nil, true] call BIS_fnc_respawnTickets;
[_player, -_current_tickets] call BIS_fnc_respawnTickets;
_player setDamage 1;
