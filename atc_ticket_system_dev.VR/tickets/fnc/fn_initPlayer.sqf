/*
	Description:
		Initialize the ticket system on the player's system

	Params:
		Nothing

	Returns:
		Nothing
*/
if (!hasInterface) exitWith {};

[] spawn {
	waitUntil {!isNull player};
	[player] remoteExec ["Tickets_fnc_notifyServerOfPlayer", 2];
};
