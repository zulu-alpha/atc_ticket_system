#include "..\script_macros.hpp"
#include "..\config.hpp"
/*
	Description:
		Does the part of killEndPlayer that needs to be done on the player's machine.

	Params:
		Nothing

	Returns:
		Nothing
*/

[] spawn {
	waitUntil {!(isNull player) and (simulationEnabled player)};
	_current_tickets = [player, nil, true] call BIS_fnc_respawnTickets;
	[player, -_current_tickets] call BIS_fnc_respawnTickets;
	player setDamage 1;
};
