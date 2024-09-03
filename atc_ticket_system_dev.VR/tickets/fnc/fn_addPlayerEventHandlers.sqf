#include "..\script_macros.hpp"
/*
	Description:
		Add event handlers to player to persist their ticket count and handle spectating.

	Params:
		0: OBJECT - Player object

	Returns:
		Nothing
*/
params ["_player"];

LOG_PLAYER(_player, "Adding event handlers.");

_player addMPEventHandler ["MPKilled", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		if !(isPlayer _unit) exitWith {};
		#define MESSAGE format ["Killed event triggered. Unit %1, Killer %2, instigator %3,", _unit, _killer, _instigator]
		LOG_PLAYER(_unit, MESSAGE);
		[_unit] call Tickets_fnc_reducePersistedTickets;
		if (local _unit) then {
			LOG("Starting spectator");
			call Tickets_fnc_startSpectator;
		};
	}
];
