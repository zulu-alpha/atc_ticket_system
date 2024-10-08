class Tickets
{
	class functions
	{
		file = "tickets\fnc";
		class initServer
		{
			description = "Initialize the ticket system on the server";
			preInit = 1;
		}
		class initPlayer
		{
			description = "Initialize the ticket system on the player's system";
			postInit = 1;
		}
		class notifyServerOfPlayer
		{
			description = "Notify the server when a player with the given UID and class is connecting";
		}
		class processPlayerClass
		{
			description = "Allow or kick a player based on their class";
		}
		class processPlayerTickets
		{
			description = "Initialize player tickets or restore last known tickets.";
		}
		class notifyHuman
		{
			description = "Send a visible message to the player.";
		}
		class reducePersistedTickets
		{
			description = "Reduce the given player's persisted ticket count by 1.";
		}
		class endPlayerMission
		{
			description = "Set the player's tickets to 0 and kill them, in order to stop them from playing.";
		}
		class killEndPlayer
		{
			description = "Set the player's tickets to 0 and kill them, in order to stop them from playing.";
		}
		class killEndPlayerOnLocal
		{
			description = "Does the part of killEndPlayer that needs to be done on the player's machine.";
		}
		class addPlayerEventHandlers
		{
			description = "Add event handlers to player to persist their ticket count.";
		}
		class startSpectator
		{
			description = "Start the ACE spectator mode for a player with ATC settings if the player has no tickets left.";
		}
		class safeRespawnTickets
		{
			description = "A wrapper function to safely assign tickets on the player's machine, even if the player is disabled.";
		}
	}
};
