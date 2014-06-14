////////////////////////////////////////////////////////
//                                                    //
//               2013 Arma 3 Mission                  //
//                by Lynx of <G.I.D>                  //
//           - http://www.clan-gid.fr -               //
//                                                    //
////////////////////////////////////////////////////////

X_inIT = false;
X_Server = false;
X_Client = false;
X_JIP = false;
X_SPE = false;

if (isServer) then {};

//Reconnaissance des localités
if (isServer) then
{
    X_Server = true;
    if (!isDedicated) then
    {
        X_Client = true;
        X_SPE = true;
    };
    X_inIT = true;
} else {
    X_Client = true;
    if (isNull player) then
    {
        X_JIP = true;
        [] spawn {waitUntil {!(isNull player)};X_inIT = true};
    } else {
        X_inIT = true;
    };
};

waitUntil {X_inIT};
if (X_Client) then
{
   player addAction ["<t color='#ff1111'>SMGR</t>", "createDialog 'DlgSmgr';", [], 10, false];
    //player addAction ["<t color='#ff1111'>SMGR HUD</t>", "('SmgrRscLayer' call BIS_fnc_rscLayer) cutRsc ['DlgSmgrHud', 'PLAIN', 0.5, true];", [], 10, false];
};