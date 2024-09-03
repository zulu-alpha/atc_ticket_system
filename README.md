# ATC tickets system

A respawn tickets system by Phoenix of Zulu-Alpha, made for ATC

## Specifications

ATC has an issue with tickets.
ATC has a 3 ticket (2 respawns) system, and a disconnect counts against one of those tickets.
This must be changed.
The players must go into spectator only when they have lost their last life/ticket.
It is also required that a player cannot change classes once they started the mission.

## Requirements

ACE is required for its spectator system.

## Usage

Copy the tickets directory in the example mission (`atc_ticket_system_dev.VR`) over to your mission folder and merge the description.ext in the example mission with your own.
Note that some parts of this repo's description.ext does not need to be copied and those parts will be identified with comments in the file.

Customize the `INITIAL_TICKETS` variable in tickets/config.hpp to change the number of respawn tickets available to players at start.

Customize the spectator settings by editing the `tickets/fnc/fn_startSpectator.sqf` file directly.
