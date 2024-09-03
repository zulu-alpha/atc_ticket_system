#include "..\script_macros.hpp"
/*
	Author:
		Phoenix of Zulu-Alpha

	Description:
		Initialize the ticket system on the server

	Params:
		Nothing

	Returns:
		Nothing
*/
if (!isServer) exitWith {};

LOG("Tickets system iniated")

TICKETS_GUID_CLASS_MAPPING = createHashMap;
TICKETS_GUID_TICKETS_MAPPING = createHashMap;
