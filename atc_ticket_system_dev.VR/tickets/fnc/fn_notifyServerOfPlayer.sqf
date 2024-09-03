#include "..\script_macros.hpp"
/*
	Description:
		Notify the server when a player with the given player is connecting

	Params:
		0: OBJECT - Player object

	Returns:
		Nothing
*/
params ["_player"];

LOG_PLAYER(_player, "Server notified of player initialization.");

[_player] call Tickets_fnc_addPlayerEventHandlers; // This must be processed first
[_player] call Tickets_fnc_processPlayerTickets;
[_player] call Tickets_fnc_processPlayerClass; 
