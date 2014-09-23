/*
    File: fn_richtax.sqf

    Description:
    tax for player with higher then 10kk money
*/




[] spawn

{

while {true} do

{

sleep (5 * 60);

waitUntil {life_atmcash > 1000000};


_tax= life_atmcash -50000;
life_atmcash - _tax;
hint format["Reichensteuer wurde von deinem Konto abgebucht",_tax];
 };



};
