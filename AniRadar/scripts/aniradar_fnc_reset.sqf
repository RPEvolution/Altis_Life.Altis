/**
 * Resets the radar's state and clears all used caches.
 * Be sure to deactivate the radar prior calling this command.
 *
 * @param	none
 * @return	none
 */

#include "constants.hpp"
 
disableSerialization;
 
if (!isNil "aniRadarHUDCreated") then
{
	ANIRADAR_LOG("Entering Reset")

	terminate aniRadarPulseHandle;
	{
		terminate _x;
	} forEach aniRadar_iconHandles;
	
	{
		_x ctrlSetText "";
		_x ctrlSetFade 1;
		_x ctrlCommit 0;
	} forEach aniRadar_entities;
	
	
	(aniRadar_ctrls select ANIRADAR_PULSE) ctrlSetFade 1;
	(aniRadar_ctrls select ANIRADAR_PULSE) ctrlCommit 0;
	
	
	ANIRADAR_LOG("Leaving Reset");
};
 


