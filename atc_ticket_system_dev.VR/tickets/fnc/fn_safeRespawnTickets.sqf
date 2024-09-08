#include "..\script_macros.hpp"
#include "..\config.hpp"
/*
	Description:
		A wrapper function to safely assign tickets on the player's machine, even if the
		player is disabled.

	Params:
		0: Number - Tickets to add.

	Returns:
		Nothing
*/

_this spawn {
	params ["_persisted_number"];
	waitUntil {!(isNull player) and (simulationEnabled player)};
	[player, _persisted_number] call BIS_fnc_respawnTickets;
};
