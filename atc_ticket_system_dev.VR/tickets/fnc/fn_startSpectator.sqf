/*
	Description:
		Start the ACE spectator mode for a player with ATC settings if the player is not expected to resapawn anymore.

	Params:
		Nothing

	Returns:
		Nothing
*/
[] spawn {
	if !(hasInterface) exitWith{};
	// Need a delay to make sure the timer is updated.
	sleep 3;
	// When the player has no tickets left, their respawn timer is set to a very large number.
	if (playerRespawnTime < 100000) exitWith {};
	// https://ace3mod.com/wiki/framework/spectator-framework.html#41-change-the-local-players-spectator-status
	// If ACRE spectating is disbled, then stay visible
	[true] call ace_spectator_fnc_setSpectator;
	// https://ace3mod.com/wiki/framework/spectator-framework.html#42-whitelistblacklist-units-available-to-spectate
	// https://ace3mod.com/wiki/framework/spectator-framework.html#43-addremove-sides-available-to-spectate
	[[side player], [civilian]] call ace_spectator_fnc_updateSides;
	// https://ace3mod.com/wiki/framework/spectator-framework.html#44-addremove-available-camera-modes
	[[1], [0, 2]] call ace_spectator_fnc_updateCameraModes;
	// https://ace3mod.com/wiki/framework/spectator-framework.html#45-addremove-available-vision-modes
	[[-2, -1], [0, 1, 2, 3, 4, 5, 6, 7]] call ace_spectator_fnc_updateVisionModes;
};
