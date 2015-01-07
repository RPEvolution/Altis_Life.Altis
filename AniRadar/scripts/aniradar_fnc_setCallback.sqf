/**
 * Sets the callback used in the animation to gather the positions of entities.
 * The provided callback is called every time the pulse has started anew and the
 * position of the player as well as the maximum distance will be delivered in the parameters.
 * The return value of the callback will be used to calculate the shown dots.
 *
 * To be able to show custom dots (icons, pictures, whatever), a more comples return
 * format has to be chosen.
 * In either formats the returned array has to consist of position arrays and/or 
 * objects like AI Units, players, buildings etc., or to be precise: any objects on
 * which "getPos" can be applied.
 *
 * The callback should be as much optimized as possible to take as less time as possible.
 * The longer the callback needs to calculate the array the longer the delay lasts until
 * the next pulse is sent.
 *
 * Simple return: [ [X,Y,Z], [X,Y,Z], unit, object, [X,Y,Z] ... ];
 * Custom return: [ [object, ["location-to-image.paa", SCALE_FACTOR] ], [[X,Y,Z], "location-to-image.paa" ]  ... ];
 * 
 * The SCALE_FACTOR has to be a decimal number greater than 0.5 and scales the given images appropriate to the factor.
 * This is an optional value and when left out, the defaul value 1.0 will be used.
 *
 * @param 	code	The reference to the callback.
 * @return	none
 * @example
 *
 * mySimpleCallback = {
 * 		_playerPosition = _this select 0;
 *		_maximumDistance = _this select 1;
 *
 *      _entities = _playerPosition nearObjects ["building", _maximumDistance];
 *		_entities	// The returnvalue
 * };
 * // OR
 * myComplexCallback = {
 *		_playerPosition = _this select 0;
 *		_maximumDistance = _this select 1;
 *		_returnValue = [];
 *		_currEntity = [];
 *
 *		_entities = _playerPosition nearEntities [["Air","Land"], _maximumDistance];
 *      {
 *			_currEntity = [];
 *			_currEntity set [0, _x];
 *			_currEntity set [1, [getText(configFile >> "cfgVehicles" >> typeOf _x >> "picture"), 3.0]];
 *
 *			// Better: Cache all pictures of air vehicles to save time
 *			
 *			_returnValue set [count _returnValue, _currEntity];
 *		} forEach _entities;
 *
 *		_returnValue;
 * };
 *
 * // AND FINALLY
 * mySimpleCallback call aniRadarSetCallback;
 */

if (typeName _this == typeName {}) then
{
	aniRadarCallback = _this;
};
