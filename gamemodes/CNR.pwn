#include <a_samp>
#include <dudb>
#include <CPLoader>

/*x---------------------------------Defining-------------------------------------x*/
//**COLORS*//
#define COLOR_GREY 0xAFAFAFAA
#define COLOR_GREEN 0x33AA33AA
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_WHITE 0xFFFFFFAA
#define COLOR_BLUE 0x0000FFAA
#define blue 0x0000FFAA
#define COLOR_BROWN 0x993300AA
#define COLOR_ORANGE 0xFF9933AA
#define COLOR_CYAN 0x99FFFFAA
#define COLOR_PINK 0xFF66FFAA
#define COLOR_BLACK 0x2C2727AA
#define COLOR_LIGHTCYAN 0xAAFFCC33
#define COLOR_LEMON 0xDDDD2357
#define COLOR_AQUA 0x7CFC00AA
#define COLOR_WHITEYELLOW 0xFFE87DFF
#define COLOR_BLUEAQUA 0x7E60FFFF
#define COLOR_DARKBLUE 0x15005EFF
#define COLOR_ALIEN 0x90FF87FF
#define COLOR_GOLD 0xB8860BAA
#define KICK_COLOR 0xFF0000FF
#define COLOR_GANGGREEN 0x00FF0096
#define COLOR_BLACK 0x2C2727AA
#define COLOR_SBLUE 0x00BFFFAA

#define WHITE 0xF6F6F6AA
#define GREY 0xC6C6C6AA
#define RED 0xF60000AA
#define COLOR_ERROR 0xF60000AA
#define COLOR_RED 0xAA3333AA
#define LIGHT_BLUE 0x00A4F6AA
#define BLUE 0x0000F6AA
#define DARK_BLUE 0x0000AFAA
#define LIGHT_GREEN 0x00F600AA
#define GREEN 0x00AD00AA
#define DARK_GREEN 0x005000AA
#define YELLOW 0xF6F600AA
#define ORANGE 0xF67F00AA
#define BLACK 0x000000AA
#define COLOR_ROYALBLUE 0x4169FFAA
#define PINK 0xFF6EC7AA

#define SERVER_COLOR 0x85F600AA
#define ERROR 0x990000AA

#define COLOR_MSG 0x00FFFFFF //Color of general messages
#define STUNNED_TIME 4 //The time in seconds the stun lasts
#define ANTISPAM 5 //The minimum allowed time between /taze commands
#define COLOR_KILLED 0x880000FF //The color, when a player gets killed by tazing

#define CIVILIAN 0
#define Medic 1
#define COP 2
#define FBI 3
#define SWAT 4
#define ARMY 5
//--------------Taxi-----------
#define BAJADA_DE_BANDERA 500
#define PRECIO_FICHA 300
#define COLOR_YELLOW 0xFFFF00AA
//-----------------------------

/* ----------HIT COMMAND----------*/
#define COLOR_FOUND 0xFFFF00AA //Color of the message if a hit was found in /hits
#define COLOR_MSG 0x00FFFFFF //Color of general messages
#define ANTISPAM_TIME 5 //The minimum time between /hit commands to prevent spam (in seconds)
/*----------NO NEED TO EDIT FROM HERE----------*/

#define MAX_PLAYERS_ 50

#define SPAWN_GAS_MIN  	35
#define SPAWN_GAS_MAX  	100
#define MAX_START_TIME 	3

#define BAJADA_DE_BANDERA2 500
#define PRECIO_FICHA2 300

#define RegisterName 1
#define LoginName 2

#define SendFormattedMessage(%0,%1,%2) do{new _str[128]; format(_str,128,%2); SendClientMessage(%0,%1,_str);}while(FALSE)

#define dcmd(%1,%2,%3) if ((strcmp((%3)[1], #%1, true, (%2)) == 0) && ((((%3)[(%2) + 1] == 0) && (dcmd_%1(playerid, "")))||(((%3)[(%2) + 1] == 32) && (dcmd_%1(playerid, (%3)[(%2) + 2]))))) return 1

static gTeam[MAX_PLAYERS];

new GPSTimer[MAX_PLAYERS];
new bool:HaveGPS[MAX_PLAYERS];

enum aInfo
{
        aLevel
}
;
new AccountInfo[MAX_PLAYERS][aInfo];

new RecentlyRobbed[MAX_PLAYERS];
new ATMRecentlyRobbed;
new DildoRecentlyRobbed;
new HallRecentlyRobbed;
new RentalRecentlyRobbed;
new BankRecentlyRobbed;
new BincoRecentlyRobbed;
new ZipRecentlyRobbed;
new UrbanRecentlyRobbed;
new AmmuRecentlyRobbed;
new Ammu2RecentlyRobbed;
new Ammu3RecentlyRobbed;
new Ammu4RecentlyRobbed;
new Ammu5RecentlyRobbed;
new DrugsRecentlyRobbed;
new D4RecentlyRobbed;
new CaRecentlyRobbed;

new gPlayerUsingLoopingAnim[MAX_PLAYERS];
new animation[200];

//BUS
new OnBusAsPassenger[MAX_PLAYERS];
new CostoDelViaje2[MAX_PLAYERS];
new contador2[MAX_PLAYERS];
new playerInMiniMission2[MAX_PLAYERS];
new avisado2[MAX_PLAYERS];
new caidadeficha2Timer2;
new cantidadPasajeros2;

forward terminarMission2(playerid);
forward caidadeficha2();
//

new IsSpawned[MAX_PLAYERS];

new SelectBM[MAX_PLAYERS];

new PlayerSkin[MAX_PLAYERS];

new SelectTM[MAX_PLAYERS];

new InTrashMission[MAX_PLAYERS];

new time;

new Muted[MAX_PLAYERS];

new ticketmen[MAX_PLAYERS];

//Lotto
#define yellow 					0xFFFF00AA
#define green					0x33FF33AA
#define white					0xFFFFFFAA
#define red				 		0xFF0000AA
#define grgreen					0x33AA33AA

#define SORSOLASTIMER 			120000  	// 2 perc
#define HIRDETESTIMER           180000      // 3 min
#define ALTERNATIVE_MAX_PLAYERS 500
//いいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいいい

new bool:HaveTicket[ALTERNATIVE_MAX_PLAYERS];
new NyeroSzamok[6][ALTERNATIVE_MAX_PLAYERS];
new KisorsoltSzamok[6];
new TimerKill[2];
new output2[128];

forward Sorsolas();
forward GPSUpdate(playerid,playerid2);
//


//Text Draws
new Text:BOX;
new Text:Welcome;
new Text:text1;
new Text:text2;
new Text:text3;
new Text:BOX2;
new Text:CIVBOX;
new Text:text6;
new Text:text7;
new Text:text8;
new Text:text9;
new Text:text10;
new Text:HALLBOX;
new Text:COPBOX;
new Text:MDCBOX;
new Text:text11;
new Text:text12;
new Text:text13;
new Text:text14;
new Text:text15;
new Text:text16;
new Text:text17;
new Text:text18;
new Text:text19;
new Text:text20;
new Text:text21;
new Text:text22;
new Text:text23;
new Text:CMDBOX;
new Text:BUSBOX;
new Text:text24;
new Text:text25;
new Text:text26;
new Text:text27;
new Text:BBOX;
new Text:text35;
new Text:text36;
new Text:text37;
new Text:text38;
new Text:text39;
new Text:text40;
new Text:AMMUBOX1;
new Text:AMMUBOX2;
new Text:text41;
new Text:text42;
new Text:text43;
new Text:PCBOX;
new Text:text44;
new Text:text45;

new CSKIN[MAX_PLAYERS];
new CSKINZ[MAX_PLAYERS];
new CSKINU[MAX_PLAYERS];
new AMMUBOX[MAX_PLAYERS];
new AMMU[MAX_PLAYERS];

new hit[MAX_PLAYERS];
new hiter[MAX_PLAYERS];
new antispam[MAX_PLAYERS];

new CHALLBOX[MAX_PLAYERS];

//--------------Taxi-----------
new OnTaxiAsPassenger[MAX_PLAYERS];
new CostoDelViaje[MAX_PLAYERS];
new contador[MAX_PLAYERS];
new playerInJob[MAX_PLAYERS];
new avisado[MAX_PLAYERS];
new caidadefichaTimer;
new cantidadPasajeros;
//-----------------------------

new PrisonTime[MAX_PLAYERS];
new BlowTime[MAX_PLAYERS];
new IsPlayerLogged[MAX_PLAYERS];
new BankRecentlyUsed[MAX_PLAYERS];
new RentedACarRecently[MAX_PLAYERS];
new InsideBar[MAX_PLAYERS];
new Working[MAX_PLAYERS];

new RobDildo[MAX_PLAYERS];
new RobHall[MAX_PLAYERS];
new RobRental[MAX_PLAYERS];
new RobBank[MAX_PLAYERS];
new RobBinco[MAX_PLAYERS];
new RobZip[MAX_PLAYERS];
new RobUrban[MAX_PLAYERS];
new RobAmmu[MAX_PLAYERS];
new RobAmmu2[MAX_PLAYERS];
new RobAmmu3[MAX_PLAYERS];
new RobAmmu4[MAX_PLAYERS];
new RobAmmu5[MAX_PLAYERS];
new RobDrugs[MAX_PLAYERS];
new RobD4[MAX_PLAYERS];
new RobCa[MAX_PLAYERS];

new PlayersOnline = 0;

new stunned[MAX_PLAYERS];
new tazetime[MAX_PLAYERS];

new currentcheckpoint[MAX_PLAYERS];
new InBusMission[MAX_PLAYERS];

new Float:buslvcps[14][3] = {
{2268.4399,2410.4167,10.8064}, // CNR BUS LV
{2283.9033,2311.2317,10.8053}, // CNR BUS LV
{2119.3047,2056.9790,10.8091}, // CNR BUS LV
{2043.8802,1545.2958,10.8053}, // CNR BUS LV
{1913.9250,931.6765,10.8648}, // CNR BUS LV
{2190.2798,970.8856,10.8052}, // CNR BUS LV
{2529.7776,1341.0577,10.8125}, // CNR BUS LV
{2516.7334,1530.2107,10.8092}, // CNR BUS LV
{2365.3865,1709.7418,10.8096}, // CNR BUS LV
{2510.1172,1804.4945,10.8076}, // CNR BUS LV
{2530.1377,2095.5022,10.8109}, // CNR BUS LV
{2466.4346,2235.9692,10.8114}, // CNR BUS LV
{2289.9063,2152.5562,10.8054}, // CNR BUS LV
{2267.5027,2409.8799,10.8052} // CNR BUS LV
};

new Float:bussfcps[10][3] = {
{-2003.4783,196.9962,27.6724}, // CNR BUS SF
{-1867.8870,600.6245,35.1489}, // CNR BUS SF
{-1631.6896,726.8736,14.5931}, // CNR BUS SF
{-1607.8712,857.4319,7.6754}, // CNR BUS SF
{-1753.4105,935.9341,24.8759}, // CNR BUS SF
{-2009.8424,883.8640,45.4302}, // CNR BUS SF
{-2658.6536,710.3611,27.9008}, // CNR BUS SF
{-2608.3267,216.7507,6.1830}, // CNR BUS SF
{-2150.0051,251.3069,35.3053}, // CNR BUS SF
{-2081.9294,-72.4678,35.3081} // CNR BUS SF
};

new Float:buslscps[12][3] = {
{1532.9352,-1672.9940,13.5162}, // CNR BUS LS
{1989.8992,-1403.3685,20.1922}, // CNR BUS LS
{1616.9988,-1296.0193,17.3743}, // CNR BUS LS
{1397.4031,-1238.2527,13.5161}, // CNR BUS LS
{1654.5503,-978.6437,38.1222}, // CNR BUS LS
{2254.6162,-1145.9847,26.6225}, // CNR BUS LS
{2285.9170,-1662.1071,15.0599}, // CNR BUS LS
{2310.4282,-1728.8649,13.5161}, // CNR BUS LS
{2061.9836,-1750.6769,13.5216}, // CNR BUS LS
{1824.7760,-1682.8224,13.5161}, // CNR BUS LS
{1687.7714,-1647.1587,13.5151}, // CNR BUS LS
{1532.9352,-1672.9940,13.5162} // CNR BUS LS
};
//Trash
new Float:trashsf[11][4] = {
{-2011.7734,77.6967,27.5766,180.4381}, // SF
{-1812.3108,108.7060,14.8637,183.0066}, // SF
{-1745.2139,161.1245,3.3831,359.8965}, // SF
{-1658.7670,403.0123,6.8630,314.3484}, // SF
{-1572.5560,959.0684,6.8705,34.0789}, // SF
{-1655.3605,1278.8883,6.9383,44.2165}, // SF
{-2615.2693,1323.4918,6.8708,135.5203}, // SF
{-2755.9829,788.3393,53.5922,174.8465}, // SF
{-2522.6113,530.4692,14.3516,181.6205}, // SF
{-2666.0305,224.2849,4.0652,89.1722}, // SF
{-2044.8110,325.5261,34.9185,91.3987} // SF
};

new Float:trashlv[11][4] = {
{2722.2327,852.3853,10.6530,181.5715}, // LV
{2257.7839,970.6597,10.5036,90.4485}, // LV
{2077.2520,1401.7902,10.5740,358.5100}, // LV
{2056.0691,1916.4796,11.9941,334.5270}, // LV
{2285.9055,2237.6394,10.6623,211.1023}, // LV
{2478.9460,2234.6035,10.5094,270.6735}, // LV
{2850.7615,2254.9785,10.5035,176.9784}, // LV
{2506.4492,1946.8312,10.5815,177.7843}, // LV
{2693.0115,1354.6588,6.5156,224.1648}, // LV
{2559.3496,774.1688,10.4999,272.8159}, // LV
{2834.2361,916.7383,10.5813,273.5616} // LV
};

new Float:trashls[15][4] = {
{2281.3162,-2297.6367,12.9399,43.3975}, // LS
{2202.9561,-2167.2607,12.9619,36.9895}, // LS
{1948.9464,-2054.7063,12.9523,88.6539}, // LS
{1794.4558,-2165.4236,12.9487,85.5554}, // LS
{1389.0068,-1866.1375,12.9522,3.1372}, // LS
{1253.4490,-1712.7026,12.9490,91.6804}, // LS
{634.0248,-1726.0410,13.5087,352.0109}, // LS
{635.8566,-1322.7759,12.9489,273.0353}, // LS
{1055.4622,-1308.2499,12.9883,9.7439}, // LS
{1958.8086,-1783.7323,12.9477,203.2567}, // LS
{2214.8762,-1905.9805,12.9456,185.2079}, // LS
{2323.5071,-2121.1521,13.0382,224.9279}, // LS
{2757.7400,-2427.7002,13.0576,180.2331}, // LS
{2647.5708,-2504.0605,13.0586,89.1712}, // LS
{2315.0986,-2342.8865,12.9434,6.7285} // LS
};
// Checkpoints
new cpbankentrance, cpbankexit, cpbank;
new cpatm1, cpatm2, cpatm3, cpatm4, cpatm5, cpatm6, cpatm7, cpatm9, cpatm10, cpatm11;
new cplvpdentrance, cplvpdexit, cplvpdhand;
new cpdildoentrance, cpdildoexit, cpdildo;
new cphospital;
new cplvchentrance, cplvchexit, cpcityhall;
new cpghost;
new cpbarentrance, cpbarexit;
new cpbincoentrance, cpbincoexit, cpbinco;
new cpzipentrance, cpzipexit, cpzip;
new cpbombshop;
new cpurbanentrance, cpurbanexit, cpurban;
new cpdrugs;
new cp4Dragonsentrace;
new cp4Dragonsexit;
new cpcaligulasentrace;
new cpcaligulasexit;
new cpcaligulas;
new cp4Dragons;

new cplspdentrance;
new cplschentrance;
new cplsdrugs;
new cplsbincoentrance;
new cplshospital;
new cplsbombshop;
new cplsbarentrance;
new cplsbankentrance;
new cplsghost;
new cplsurbanentrance;
new cplsurbanentrance2;
new cplszipentrance;

new cpsfpdentrance;
new cpsfdrugs;
new cpsfhospital;
new cpsfbombshop;
new cpsfbankentrance;
new cpsfghost;
new cpsfurbanentrance;
new cpsfzipentrance;

new cpcopLSsus;
new cpcopLSjos;

new cpcopLVjos;
new cpcopLVsus;

new cpcopSFsus;
new cpcopSFjos;

new cpammu;
new cpammu2;
new cpammu3;
new cpammu4;
new cpammu5;
new cpammuexit;
new cpammuexit2;
new cpammuexit3;
new cpammuexit4;
new cpammuexit5;
new cpammuentrace1;
new cpammuentrace2;
new cpammuentrace3;
new cpammuentrace4;
new cpammuentrace5;
new cpammuentrace6;
new cpammuentrace7;
new cpammuentrace8;
new cpammuentrace9;
new cpammuentrace10;

new BAR[MAX_PLAYERS];
new BIC[MAX_PLAYERS];
new PD[MAX_PLAYERS];
new CH[MAX_PLAYERS];
new BK[MAX_PLAYERS];
new CAR[MAX_PLAYERS];
new RB[MAX_PLAYERS];
new ZP[MAX_PLAYERS];
// Menus
new Menu:Hand;
new Menu:Dildo;
new Menu:Rental;
new Menu:CarList;
new Menu:BarEntrance;
new Menu:Drugs;

enum cmdCarInfo
{
	CarcmdI
};

new VehicleNames[212][] = {
	"Landstalker","Bravura","Buffalo","Linerunner","Pereniel","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus",
	"Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","Mr Whoopee","BF Injection",
	"1111","Premier","Enforcer","Securicar","Banshee","Predator","Bus","44444","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie",
	"Stallion","Rumpo","RC Bandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder",
	"Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley's RC Van","Skimmer","PCJ-600","Faggio","Freeway","RC Baron","RC Raider",
	"Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR3 50","Walton","Regina",
	"Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","News Chopper","Rancher","FBI Rancher","Virgo","Greenwood",
	"Jetmax","Hotring","Sandking","Blista Compact","Police Maverick","Boxville","Benson","Mesa","98934","Hotring Racer A","Hotring Racer B",
	"Bloodring Banger","Rancher","Super GT","Elegant","Journey","Bike","Mountain Bike","Beagle","Cropdust","Stunt","Tanker","RoadTrain",
	"Nebula","Majestic","Buccaneer","Shamal","0000","FCR-900","NRG-500","HPV1000","Cement Truck","Tow Truck","Fortune","Cadrona","FBI Truck",
	"Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet","Clover",
	"Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster A",
	"Monster B","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RC Tiger","Flash","Tahoma","Savanna","Bandito","Freight","Trailer",
	"Kart","Mower","Duneride","Sweeper","Broadway","Tornado","MARE","DFT-30","Huntley","Stafford","BF-400","Newsvan","Tug","Trailer A","Emperor",
	"Wayfarer","Euros","Hotdog","Club","Trailer B","Trailer C","Andromada","Dodo","RC Cam","Launch","Police Car (LSPD)","Police Car (SFPD)",
	"Police Car (LVPD)","Police Ranger","Picador","S.W.A.T. Van","Alpha","Phoenix","Glendale","Sadler","Luggage Trailer A","Luggage Trailer B",
	"Stair Trailer","Boxville","Farm Plow","Utility Trailer"
};

new IcmdCar[MAX_PLAYERS][cmdCarInfo];

new tkat[MAX_PLAYERS];

// Vehicles
new Rented[MAX_VEHICLES];

new Float:CivilianSpawn[18][4] =
{
{2022.6539,1007.2164,10.8203,269.9900},
{2177.4451,963.9155,10.8203,359.9802},
{2362.6580,1005.0098,14.2725,91.5136},
{2435.0430,1653.7240,10.8203,178.3609},
{1947.6760,2068.7869,10.8203,89.0601},
{2346.8154,735.3505,11.4683,184.3114},
{2127.4910,2364.1289,10.8203,179.6657},
{1429.1036,-1091.6676,17.5623,186.9590},
{1266.1420,-2009.2614,59.2444,187.8720},
{1671.8055,-1709.1715,20.4844,102.0455},
{2316.8474,-1646.4652,14.8270,185.1704},
{2253.9595,-1777.4771,13.5469,0.6755},
{477.0917,-1514.6082,20.4747,277.2458},
{-2571.2405,1149.4059,55.7266,154.4693},
{-1942.0551,572.1608,35.1719,358.3391},
{-1992.2852,251.0843,35.1719,283.5931},
{-2030.6617,145.9314,28.8359,273.5602},
{-2616.2598,81.0121,4.3435,270.1165}
};

new Float:CopSpawn[6][4] =
{
{2238.2151,2449.3613,11.0372,89.4249},
{2294.8032,2451.5522,10.8203,88.8232},
{2294.0479,2468.4722,10.8203,88.7628},
{2250.7517,2490.9146,10.9908,358.5601},
{-1620.6388,682.8951,7.1875,174.1942},
{1548.1506,-1669.6023,13.5669,88.7577}
};

new Float:PrisonSpawn[3][4] =
{
{198.6401,161.5331,1003.0300,181.3124},
{193.4779,175.5881,1003.0234,6.5961},
{197.7083,174.6549,1003.0234,0.0787}
};

new Float:SFSpawn[3][4] =
{
{1568.0333,-1691.7218,5.8906,183.6940},
{-1593.2145,716.1462,-5.2422,269.8380},
{2267.8535,2448.8921,3.5313,181.4704}
};

new Float:ARMYSpawn[2][4] =
{
{-1473.7511,461.7685,7.1809,2.3054},
{239.7829,1859.5490,14.0840,359.0583}
};

new Float:MedicSpawn[3][4] =
{
{1177.7314,-1323.7150,14.0852,270.0000},
{-2655.1633,631.4604,14.4531,176.9321},
{1607.5931, 1818.5118, 10.8203,83.20}
};

new FALSE = false;

enum pSpeed
{
    Text:Speedom,
    Text:Speedom2,
    ShowSpeed,
    ReFuelTimer,
    Refueling,
    Float:OldCoordsX,
    Float:OldCoordsY
};
new Speed[MAX_PLAYERS][pSpeed];

enum pVeh
{
    Float:Fuel,
    OldFuel
};
new Vehicle[MAX_VEHICLES][pVeh];

new Spawned[MAX_PLAYERS];

enum zoneinfo {
	zone_name[27],
    Float:zone_minx,
    Float:zone_miny,
    Float:zone_minz,
    Float:zone_maxx,
    Float:zone_maxy,
    Float:zone_maxz
}

#define SPAWN_GAS_MIN  	35
#define SPAWN_GAS_MAX  	100
#define MAX_START_TIME 	3

forward Speedometer(playerid);
forward ReFill(playerid);
forward IsAtFuelStation(playerid);

new zones[][zoneinfo] = {
{ "'The Big Ear'",                -410.00,  1403.30,    -3.00,  -137.90,  1681.20,   200.00},
{ "Aldea Malvada",               -1372.10,  2498.50,     0.00, -1277.50,  2615.30,   200.00},
{ "Angel Pine",                  -2324.90, -2584.20,    -6.10, -1964.20, -2212.10,   200.00},
{ "Arco del Oeste",               -901.10,  2221.80,     0.00,  -592.00,  2571.90,   200.00},
{ "Avispa Country Club",         -2646.40,  -355.40,     0.00, -2270.00,  -222.50,   200.00},
{ "Avispa Country Club",         -2831.80,  -430.20,    -6.10, -2646.40,  -222.50,   200.00},
{ "Avispa Country Club",         -2361.50,  -417.10,     0.00, -2270.00,  -355.40,   200.00},
{ "Avispa Country Club",         -2667.80,  -302.10,   -28.80, -2646.40,  -262.30,    71.10},
{ "Avispa Country Club",         -2470.00,  -355.40,     0.00, -2270.00,  -318.40,    46.10},
{ "Avispa Country Club",         -2550.00,  -355.40,     0.00, -2470.00,  -318.40,    39.70},
{ "Back o Beyond",               -1166.90, -2641.10,     0.00,  -321.70, -1856.00,   200.00},
{ "Battery Point",               -2741.00,  1268.40,    -4.50, -2533.00,  1490.40,   200.00},
{ "Bayside",                     -2741.00,  2175.10,     0.00, -2353.10,  2722.70,   200.00},
{ "Bayside Marina",              -2353.10,  2275.70,     0.00, -2153.10,  2475.70,   200.00},
{ "Beacon Hill",                  -399.60, -1075.50,    -1.40,  -319.00,  -977.50,   198.50},
{ "Blackfield",                    964.30,  1203.20,   -89.00,  1197.30,  1403.20,   110.90},
{ "Blackfield",                    964.30,  1403.20,   -89.00,  1197.30,  1726.20,   110.90},
{ "Blackfield Chapel",            1375.60,   596.30,   -89.00,  1558.00,   823.20,   110.90},
{ "Blackfield Chapel",            1325.60,   596.30,   -89.00,  1375.60,   795.00,   110.90},
{ "Blackfield Intersection",      1197.30,  1044.60,   -89.00,  1277.00,  1163.30,   110.90},
{ "Blackfield Intersection",      1166.50,   795.00,   -89.00,  1375.60,  1044.60,   110.90},
{ "Blackfield Intersection",      1277.00,  1044.60,   -89.00,  1315.30,  1087.60,   110.90},
{ "Blackfield Intersection",      1375.60,   823.20,   -89.00,  1457.30,   919.40,   110.90},
{ "Blueberry",                     104.50,  -220.10,     2.30,   349.60,   152.20,   200.00},
{ "Blueberry",                      19.60,  -404.10,     3.80,   349.60,  -220.10,   200.00},
{ "Blueberry Acres",              -319.60,  -220.10,     0.00,   104.50,   293.30,   200.00},
{ "Caligula's Palace",            2087.30,  1543.20,   -89.00,  2437.30,  1703.20,   110.90},
{ "Caligula's Palace",            2137.40,  1703.20,   -89.00,  2437.30,  1783.20,   110.90},
{ "Calton Heights",              -2274.10,   744.10,    -6.10, -1982.30,  1358.90,   200.00},
{ "Chinatown",                   -2274.10,   578.30,    -7.60, -2078.60,   744.10,   200.00},
{ "City Hall",                   -2867.80,   277.40,    -9.10, -2593.40,   458.40,   200.00},
{ "Come-A-Lot",                   2087.30,   943.20,   -89.00,  2623.10,  1203.20,   110.90},
{ "Commerce",                     1323.90, -1842.20,   -89.00,  1701.90, -1722.20,   110.90},
{ "Commerce",                     1323.90, -1722.20,   -89.00,  1440.90, -1577.50,   110.90},
{ "Commerce",                     1370.80, -1577.50,   -89.00,  1463.90, -1384.90,   110.90},
{ "Commerce",                     1463.90, -1577.50,   -89.00,  1667.90, -1430.80,   110.90},
{ "Commerce",                     1583.50, -1722.20,   -89.00,  1758.90, -1577.50,   110.90},
{ "Commerce",                     1667.90, -1577.50,   -89.00,  1812.60, -1430.80,   110.90},
{ "Conference Center",            1046.10, -1804.20,   -89.00,  1323.90, -1722.20,   110.90},
{ "Conference Center",            1073.20, -1842.20,   -89.00,  1323.90, -1804.20,   110.90},
{ "Cranberry Station",           -2007.80,    56.30,     0.00, -1922.00,   224.70,   100.00},
{ "Creek",                        2749.90,  1937.20,   -89.00,  2921.60,  2669.70,   110.90},
{ "Dillimore",                     580.70,  -674.80,    -9.50,   861.00,  -404.70,   200.00},
{ "Doherty",                     -2270.00,  -324.10,    -0.00, -1794.90,  -222.50,   200.00},
{ "Doherty",                     -2173.00,  -222.50,    -0.00, -1794.90,   265.20,   200.00},
{ "Downtown",                    -1982.30,   744.10,    -6.10, -1871.70,  1274.20,   200.00},
{ "Downtown",                    -1871.70,  1176.40,    -4.50, -1620.30,  1274.20,   200.00},
{ "Downtown",                    -1700.00,   744.20,    -6.10, -1580.00,  1176.50,   200.00},
{ "Downtown",                    -1580.00,   744.20,    -6.10, -1499.80,  1025.90,   200.00},
{ "Downtown",                    -2078.60,   578.30,    -7.60, -1499.80,   744.20,   200.00},
{ "Downtown",                    -1993.20,   265.20,    -9.10, -1794.90,   578.30,   200.00},
{ "Downtown Los Santos",          1463.90, -1430.80,   -89.00,  1724.70, -1290.80,   110.90},
{ "Downtown Los Santos",          1724.70, -1430.80,   -89.00,  1812.60, -1250.90,   110.90},
{ "Downtown Los Santos",          1463.90, -1290.80,   -89.00,  1724.70, -1150.80,   110.90},
{ "Downtown Los Santos",          1370.80, -1384.90,   -89.00,  1463.90, -1170.80,   110.90},
{ "Downtown Los Santos",          1724.70, -1250.90,   -89.00,  1812.60, -1150.80,   110.90},
{ "Downtown Los Santos",          1370.80, -1170.80,   -89.00,  1463.90, -1130.80,   110.90},
{ "Downtown Los Santos",          1378.30, -1130.80,   -89.00,  1463.90, -1026.30,   110.90},
{ "Downtown Los Santos",          1391.00, -1026.30,   -89.00,  1463.90,  -926.90,   110.90},
{ "Downtown Los Santos",          1507.50, -1385.20,   110.90,  1582.50, -1325.30,   335.90},
{ "East Beach",                   2632.80, -1852.80,   -89.00,  2959.30, -1668.10,   110.90},
{ "East Beach",                   2632.80, -1668.10,   -89.00,  2747.70, -1393.40,   110.90},
{ "East Beach",                   2747.70, -1668.10,   -89.00,  2959.30, -1498.60,   110.90},
{ "East Beach",                   2747.70, -1498.60,   -89.00,  2959.30, -1120.00,   110.90},
{ "East Los Santos",              2421.00, -1628.50,   -89.00,  2632.80, -1454.30,   110.90},
{ "East Los Santos",              2222.50, -1628.50,   -89.00,  2421.00, -1494.00,   110.90},
{ "East Los Santos",              2266.20, -1494.00,   -89.00,  2381.60, -1372.00,   110.90},
{ "East Los Santos",              2381.60, -1494.00,   -89.00,  2421.00, -1454.30,   110.90},
{ "East Los Santos",              2281.40, -1372.00,   -89.00,  2381.60, -1135.00,   110.90},
{ "East Los Santos",              2381.60, -1454.30,   -89.00,  2462.10, -1135.00,   110.90},
{ "East Los Santos",              2462.10, -1454.30,   -89.00,  2581.70, -1135.00,   110.90},
{ "Easter Basin",                -1794.90,   249.90,    -9.10, -1242.90,   578.30,   200.00},
{ "Easter Basin",                -1794.90,   -50.00,    -0.00, -1499.80,   249.90,   200.00},
{ "Easter Bay Airport",          -1499.80,   -50.00,    -0.00, -1242.90,   249.90,   200.00},
{ "Easter Bay Airport",          -1794.90,  -730.10,    -3.00, -1213.90,   -50.00,   200.00},
{ "Easter Bay Airport",          -1213.90,  -730.10,     0.00, -1132.80,   -50.00,   200.00},
{ "Easter Bay Airport",          -1242.90,   -50.00,     0.00, -1213.90,   578.30,   200.00},
{ "Easter Bay Airport",          -1213.90,   -50.00,    -4.50,  -947.90,   578.30,   200.00},
{ "Easter Bay Airport",          -1315.40,  -405.30,    15.40, -1264.40,  -209.50,    25.40},
{ "Easter Bay Airport",          -1354.30,  -287.30,    15.40, -1315.40,  -209.50,    25.40},
{ "Easter Bay Airport",          -1490.30,  -209.50,    15.40, -1264.40,  -148.30,    25.40},
{ "Easter Bay Chemicals",        -1132.80,  -768.00,     0.00,  -956.40,  -578.10,   200.00},
{ "Easter Bay Chemicals",        -1132.80,  -787.30,     0.00,  -956.40,  -768.00,   200.00},
{ "El Castillo del Diablo",       -464.50,  2217.60,     0.00,  -208.50,  2580.30,   200.00},
{ "El Castillo del Diablo",       -208.50,  2123.00,    -7.60,   114.00,  2337.10,   200.00},
{ "El Castillo del Diablo",       -208.50,  2337.10,     0.00,     8.40,  2487.10,   200.00},
{ "El Corona",                    1812.60, -2179.20,   -89.00,  1970.60, -1852.80,   110.90},
{ "El Corona",                    1692.60, -2179.20,   -89.00,  1812.60, -1842.20,   110.90},
{ "El Quebrados",                -1645.20,  2498.50,     0.00, -1372.10,  2777.80,   200.00},
{ "Esplanade East",              -1620.30,  1176.50,    -4.50, -1580.00,  1274.20,   200.00},
{ "Esplanade East",              -1580.00,  1025.90,    -6.10, -1499.80,  1274.20,   200.00},
{ "Esplanade East",              -1499.80,   578.30,   -79.60, -1339.80,  1274.20,    20.30},
{ "Esplanade North",             -2533.00,  1358.90,    -4.50, -1996.60,  1501.20,   200.00},
{ "Esplanade North",             -1996.60,  1358.90,    -4.50, -1524.20,  1592.50,   200.00},
{ "Esplanade North",             -1982.30,  1274.20,    -4.50, -1524.20,  1358.90,   200.00},
{ "Fallen Tree",                  -792.20,  -698.50,    -5.30,  -452.40,  -380.00,   200.00},
{ "Fallow Bridge",                 434.30,   366.50,     0.00,   603.00,   555.60,   200.00},
{ "Fern Ridge",                    508.10,  -139.20,     0.00,  1306.60,   119.50,   200.00},
{ "Financial",                   -1871.70,   744.10,    -6.10, -1701.30,  1176.40,   300.00},
{ "Fisher's Lagoon",              1916.90,  -233.30,  -100.00,  2131.70,    13.80,   200.00},
{ "Flint Intersection",           -187.70, -1596.70,   -89.00,    17.00, -1276.60,   110.90},
{ "Flint Range",                  -594.10, -1648.50,     0.00,  -187.70, -1276.60,   200.00},
{ "Fort Carson",                  -376.20,   826.30,    -3.00,   123.70,  1220.40,   200.00},
{ "Foster Valley",               -2270.00,  -430.20,    -0.00, -2178.60,  -324.10,   200.00},
{ "Foster Valley",               -2178.60,  -599.80,    -0.00, -1794.90,  -324.10,   200.00},
{ "Foster Valley",               -2178.60, -1115.50,     0.00, -1794.90,  -599.80,   200.00},
{ "Foster Valley",               -2178.60, -1250.90,     0.00, -1794.90, -1115.50,   200.00},
{ "Frederick Bridge",             2759.20,   296.50,     0.00,  2774.20,   594.70,   200.00},
{ "Gant Bridge",                 -2741.40,  1659.60,    -6.10, -2616.40,  2175.10,   200.00},
{ "Gant Bridge",                 -2741.00,  1490.40,    -6.10, -2616.40,  1659.60,   200.00},
{ "Ganton",                       2222.50, -1852.80,   -89.00,  2632.80, -1722.30,   110.90},
{ "Ganton",                       2222.50, -1722.30,   -89.00,  2632.80, -1628.50,   110.90},
{ "Garcia",                      -2411.20,  -222.50,    -0.00, -2173.00,   265.20,   200.00},
{ "Garcia",                      -2395.10,  -222.50,    -5.30, -2354.00,  -204.70,   200.00},
{ "Garver Bridge",               -1339.80,   828.10,   -89.00, -1213.90,  1057.00,   110.90},
{ "Garver Bridge",               -1213.90,   950.00,   -89.00, -1087.90,  1178.90,   110.90},
{ "Garver Bridge",               -1499.80,   696.40,  -179.60, -1339.80,   925.30,    20.30},
{ "Glen Park",                    1812.60, -1449.60,   -89.00,  1996.90, -1350.70,   110.90},
{ "Glen Park",                    1812.60, -1100.80,   -89.00,  1994.30,  -973.30,   110.90},
{ "Glen Park",                    1812.60, -1350.70,   -89.00,  2056.80, -1100.80,   110.90},
{ "Green Palms",                   176.50,  1305.40,    -3.00,   338.60,  1520.70,   200.00},
{ "Greenglass College",            964.30,  1044.60,   -89.00,  1197.30,  1203.20,   110.90},
{ "Greenglass College",            964.30,   930.80,   -89.00,  1166.50,  1044.60,   110.90},
{ "Hampton Barns",                 603.00,   264.30,     0.00,   761.90,   366.50,   200.00},
{ "Hankypanky Point",             2576.90,    62.10,     0.00,  2759.20,   385.50,   200.00},
{ "Harry Gold Parkway",           1777.30,   863.20,   -89.00,  1817.30,  2342.80,   110.90},
{ "Hashbury",                    -2593.40,  -222.50,    -0.00, -2411.20,    54.70,   200.00},
{ "Hilltop Farm",                  967.30,  -450.30,    -3.00,  1176.70,  -217.90,   200.00},
{ "Hunter Quarry",                 337.20,   710.80,  -115.20,   860.50,  1031.70,   203.70},
{ "Idlewood",                     1812.60, -1852.80,   -89.00,  1971.60, -1742.30,   110.90},
{ "Idlewood",                     1812.60, -1742.30,   -89.00,  1951.60, -1602.30,   110.90},
{ "Idlewood",                     1951.60, -1742.30,   -89.00,  2124.60, -1602.30,   110.90},
{ "Idlewood",                     1812.60, -1602.30,   -89.00,  2124.60, -1449.60,   110.90},
{ "Idlewood",                     2124.60, -1742.30,   -89.00,  2222.50, -1494.00,   110.90},
{ "Idlewood",                     1971.60, -1852.80,   -89.00,  2222.50, -1742.30,   110.90},
{ "Jefferson",                    1996.90, -1449.60,   -89.00,  2056.80, -1350.70,   110.90},
{ "Jefferson",                    2124.60, -1494.00,   -89.00,  2266.20, -1449.60,   110.90},
{ "Jefferson",                    2056.80, -1372.00,   -89.00,  2281.40, -1210.70,   110.90},
{ "Jefferson",                    2056.80, -1210.70,   -89.00,  2185.30, -1126.30,   110.90},
{ "Jefferson",                    2185.30, -1210.70,   -89.00,  2281.40, -1154.50,   110.90},
{ "Jefferson",                    2056.80, -1449.60,   -89.00,  2266.20, -1372.00,   110.90},
{ "Julius Thruway East",          2623.10,   943.20,   -89.00,  2749.90,  1055.90,   110.90},
{ "Julius Thruway East",          2685.10,  1055.90,   -89.00,  2749.90,  2626.50,   110.90},
{ "Julius Thruway East",          2536.40,  2442.50,   -89.00,  2685.10,  2542.50,   110.90},
{ "Julius Thruway East",          2625.10,  2202.70,   -89.00,  2685.10,  2442.50,   110.90},
{ "Julius Thruway North",         2498.20,  2542.50,   -89.00,  2685.10,  2626.50,   110.90},
{ "Julius Thruway North",         2237.40,  2542.50,   -89.00,  2498.20,  2663.10,   110.90},
{ "Julius Thruway North",         2121.40,  2508.20,   -89.00,  2237.40,  2663.10,   110.90},
{ "Julius Thruway North",         1938.80,  2508.20,   -89.00,  2121.40,  2624.20,   110.90},
{ "Julius Thruway North",         1534.50,  2433.20,   -89.00,  1848.40,  2583.20,   110.90},
{ "Julius Thruway North",         1848.40,  2478.40,   -89.00,  1938.80,  2553.40,   110.90},
{ "Julius Thruway North",         1704.50,  2342.80,   -89.00,  1848.40,  2433.20,   110.90},
{ "Julius Thruway North",         1377.30,  2433.20,   -89.00,  1534.50,  2507.20,   110.90},
{ "Julius Thruway South",         1457.30,   823.20,   -89.00,  2377.30,   863.20,   110.90},
{ "Julius Thruway South",         2377.30,   788.80,   -89.00,  2537.30,   897.90,   110.90},
{ "Julius Thruway West",          1197.30,  1163.30,   -89.00,  1236.60,  2243.20,   110.90},
{ "Julius Thruway West",          1236.60,  2142.80,   -89.00,  1297.40,  2243.20,   110.90},
{ "Juniper Hill",                -2533.00,   578.30,    -7.60, -2274.10,   968.30,   200.00},
{ "Juniper Hollow",              -2533.00,   968.30,    -6.10, -2274.10,  1358.90,   200.00},
{ "K.A.C.C. Military Fuels",      2498.20,  2626.50,   -89.00,  2749.90,  2861.50,   110.90},
{ "Kincaid Bridge",              -1339.80,   599.20,   -89.00, -1213.90,   828.10,   110.90},
{ "Kincaid Bridge",              -1213.90,   721.10,   -89.00, -1087.90,   950.00,   110.90},
{ "Kincaid Bridge",              -1087.90,   855.30,   -89.00,  -961.90,   986.20,   110.90},
{ "King's",                      -2329.30,   458.40,    -7.60, -1993.20,   578.30,   200.00},
{ "King's",                      -2411.20,   265.20,    -9.10, -1993.20,   373.50,   200.00},
{ "King's",                      -2253.50,   373.50,    -9.10, -1993.20,   458.40,   200.00},
{ "LVA Freight Depot",            1457.30,   863.20,   -89.00,  1777.40,  1143.20,   110.90},
{ "LVA Freight Depot",            1375.60,   919.40,   -89.00,  1457.30,  1203.20,   110.90},
{ "LVA Freight Depot",            1277.00,  1087.60,   -89.00,  1375.60,  1203.20,   110.90},
{ "LVA Freight Depot",            1315.30,  1044.60,   -89.00,  1375.60,  1087.60,   110.90},
{ "LVA Freight Depot",            1236.60,  1163.40,   -89.00,  1277.00,  1203.20,   110.90},
{ "Las Barrancas",                -926.10,  1398.70,    -3.00,  -719.20,  1634.60,   200.00},
{ "Las Brujas",                   -365.10,  2123.00,    -3.00,  -208.50,  2217.60,   200.00},
{ "Las Colinas",                  1994.30, -1100.80,   -89.00,  2056.80,  -920.80,   110.90},
{ "Las Colinas",                  2056.80, -1126.30,   -89.00,  2126.80,  -920.80,   110.90},
{ "Las Colinas",                  2185.30, -1154.50,   -89.00,  2281.40,  -934.40,   110.90},
{ "Las Colinas",                  2126.80, -1126.30,   -89.00,  2185.30,  -934.40,   110.90},
{ "Las Colinas",                  2747.70, -1120.00,   -89.00,  2959.30,  -945.00,   110.90},
{ "Las Colinas",                  2632.70, -1135.00,   -89.00,  2747.70,  -945.00,   110.90},
{ "Las Colinas",                  2281.40, -1135.00,   -89.00,  2632.70,  -945.00,   110.90},
{ "Las Payasadas",                -354.30,  2580.30,     2.00,  -133.60,  2816.80,   200.00},
{ "Las Venturas Airport",         1236.60,  1203.20,   -89.00,  1457.30,  1883.10,   110.90},
{ "Las Venturas Airport",         1457.30,  1203.20,   -89.00,  1777.30,  1883.10,   110.90},
{ "Las Venturas Airport",         1457.30,  1143.20,   -89.00,  1777.40,  1203.20,   110.90},
{ "Las Venturas Airport",         1515.80,  1586.40,   -12.50,  1729.90,  1714.50,    87.50},
{ "Last Dime Motel",              1823.00,   596.30,   -89.00,  1997.20,   823.20,   110.90},
{ "Leafy Hollow",                -1166.90, -1856.00,     0.00,  -815.60, -1602.00,   200.00},
{ "Lil' Probe Inn",                -90.20,  1286.80,    -3.00,   153.80,  1554.10,   200.00},
{ "Linden Side",                  2749.90,   943.20,   -89.00,  2923.30,  1198.90,   110.90},
{ "Linden Station",               2749.90,  1198.90,   -89.00,  2923.30,  1548.90,   110.90},
{ "Linden Station",               2811.20,  1229.50,   -39.50,  2861.20,  1407.50,    60.40},
{ "Little Mexico",                1701.90, -1842.20,   -89.00,  1812.60, -1722.20,   110.90},
{ "Little Mexico",                1758.90, -1722.20,   -89.00,  1812.60, -1577.50,   110.90},
{ "Los Flores",                   2581.70, -1454.30,   -89.00,  2632.80, -1393.40,   110.90},
{ "Los Flores",                   2581.70, -1393.40,   -89.00,  2747.70, -1135.00,   110.90},
{ "Los Santos International",     1249.60, -2394.30,   -89.00,  1852.00, -2179.20,   110.90},
{ "Los Santos International",     1852.00, -2394.30,   -89.00,  2089.00, -2179.20,   110.90},
{ "Los Santos International",     1382.70, -2730.80,   -89.00,  2201.80, -2394.30,   110.90},
{ "Los Santos International",     1974.60, -2394.30,   -39.00,  2089.00, -2256.50,    60.90},
{ "Los Santos International",     1400.90, -2669.20,   -39.00,  2189.80, -2597.20,    60.90},
{ "Los Santos International",     2051.60, -2597.20,   -39.00,  2152.40, -2394.30,    60.90},
{ "Marina",                        647.70, -1804.20,   -89.00,   851.40, -1577.50,   110.90},
{ "Marina",                        647.70, -1577.50,   -89.00,   807.90, -1416.20,   110.90},
{ "Marina",                        807.90, -1577.50,   -89.00,   926.90, -1416.20,   110.90},
{ "Market",                        787.40, -1416.20,   -89.00,  1072.60, -1310.20,   110.90},
{ "Market",                        952.60, -1310.20,   -89.00,  1072.60, -1130.80,   110.90},
{ "Market",                       1072.60, -1416.20,   -89.00,  1370.80, -1130.80,   110.90},
{ "Market",                        926.90, -1577.50,   -89.00,  1370.80, -1416.20,   110.90},
{ "Market Station",                787.40, -1410.90,   -34.10,   866.00, -1310.20,    65.80},
{ "Martin Bridge",                -222.10,   293.30,     0.00,  -122.10,   476.40,   200.00},
{ "Missionary Hill",             -2994.40,  -811.20,     0.00, -2178.60,  -430.20,   200.00},
{ "Montgomery",                   1119.50,   119.50,    -3.00,  1451.40,   493.30,   200.00},
{ "Montgomery",                   1451.40,   347.40,    -6.10,  1582.40,   420.80,   200.00},
{ "Montgomery Intersection",      1546.60,   208.10,     0.00,  1745.80,   347.40,   200.00},
{ "Montgomery Intersection",      1582.40,   347.40,     0.00,  1664.60,   401.70,   200.00},
{ "Mulholland",                   1414.00,  -768.00,   -89.00,  1667.60,  -452.40,   110.90},
{ "Mulholland",                   1281.10,  -452.40,   -89.00,  1641.10,  -290.90,   110.90},
{ "Mulholland",                   1269.10,  -768.00,   -89.00,  1414.00,  -452.40,   110.90},
{ "Mulholland",                   1357.00,  -926.90,   -89.00,  1463.90,  -768.00,   110.90},
{ "Mulholland",                   1318.10,  -910.10,   -89.00,  1357.00,  -768.00,   110.90},
{ "Mulholland",                   1169.10,  -910.10,   -89.00,  1318.10,  -768.00,   110.90},
{ "Mulholland",                    768.60,  -954.60,   -89.00,   952.60,  -860.60,   110.90},
{ "Mulholland",                    687.80,  -860.60,   -89.00,   911.80,  -768.00,   110.90},
{ "Mulholland",                    737.50,  -768.00,   -89.00,  1142.20,  -674.80,   110.90},
{ "Mulholland",                   1096.40,  -910.10,   -89.00,  1169.10,  -768.00,   110.90},
{ "Mulholland",                    952.60,  -937.10,   -89.00,  1096.40,  -860.60,   110.90},
{ "Mulholland",                    911.80,  -860.60,   -89.00,  1096.40,  -768.00,   110.90},
{ "Mulholland",                    861.00,  -674.80,   -89.00,  1156.50,  -600.80,   110.90},
{ "Mulholland Intersection",      1463.90, -1150.80,   -89.00,  1812.60,  -768.00,   110.90},
{ "North Rock",                   2285.30,  -768.00,     0.00,  2770.50,  -269.70,   200.00},
{ "Ocean Docks",                  2373.70, -2697.00,   -89.00,  2809.20, -2330.40,   110.90},
{ "Ocean Docks",                  2201.80, -2418.30,   -89.00,  2324.00, -2095.00,   110.90},
{ "Ocean Docks",                  2324.00, -2302.30,   -89.00,  2703.50, -2145.10,   110.90},
{ "Ocean Docks",                  2089.00, -2394.30,   -89.00,  2201.80, -2235.80,   110.90},
{ "Ocean Docks",                  2201.80, -2730.80,   -89.00,  2324.00, -2418.30,   110.90},
{ "Ocean Docks",                  2703.50, -2302.30,   -89.00,  2959.30, -2126.90,   110.90},
{ "Ocean Docks",                  2324.00, -2145.10,   -89.00,  2703.50, -2059.20,   110.90},
{ "Ocean Flats",                 -2994.40,   277.40,    -9.10, -2867.80,   458.40,   200.00},
{ "Ocean Flats",                 -2994.40,  -222.50,    -0.00, -2593.40,   277.40,   200.00},
{ "Ocean Flats",                 -2994.40,  -430.20,    -0.00, -2831.80,  -222.50,   200.00},
{ "Octane Springs",                338.60,  1228.50,     0.00,   664.30,  1655.00,   200.00},
{ "Old Venturas Strip",           2162.30,  2012.10,   -89.00,  2685.10,  2202.70,   110.90},
{ "Palisades",                   -2994.40,   458.40,    -6.10, -2741.00,  1339.60,   200.00},
{ "Palomino Creek",               2160.20,  -149.00,     0.00,  2576.90,   228.30,   200.00},
{ "Paradiso",                    -2741.00,   793.40,    -6.10, -2533.00,  1268.40,   200.00},
{ "Pershing Square",              1440.90, -1722.20,   -89.00,  1583.50, -1577.50,   110.90},
{ "Pilgrim",                      2437.30,  1383.20,   -89.00,  2624.40,  1783.20,   110.90},
{ "Pilgrim",                      2624.40,  1383.20,   -89.00,  2685.10,  1783.20,   110.90},
{ "Pilson Intersection",          1098.30,  2243.20,   -89.00,  1377.30,  2507.20,   110.90},
{ "Pirates in Men's Pants",       1817.30,  1469.20,   -89.00,  2027.40,  1703.20,   110.90},
{ "Playa del Seville",            2703.50, -2126.90,   -89.00,  2959.30, -1852.80,   110.90},
{ "Prickle Pine",                 1534.50,  2583.20,   -89.00,  1848.40,  2863.20,   110.90},
{ "Prickle Pine",                 1117.40,  2507.20,   -89.00,  1534.50,  2723.20,   110.90},
{ "Prickle Pine",                 1848.40,  2553.40,   -89.00,  1938.80,  2863.20,   110.90},
{ "Prickle Pine",                 1938.80,  2624.20,   -89.00,  2121.40,  2861.50,   110.90},
{ "Queens",                      -2533.00,   458.40,     0.00, -2329.30,   578.30,   200.00},
{ "Queens",                      -2593.40,    54.70,     0.00, -2411.20,   458.40,   200.00},
{ "Queens",                      -2411.20,   373.50,     0.00, -2253.50,   458.40,   200.00},
{ "Randolph Industrial Estate",   1558.00,   596.30,   -89.00,  1823.00,   823.20,   110.90},
{ "Redsands East",                1817.30,  2011.80,   -89.00,  2106.70,  2202.70,   110.90},
{ "Redsands East",                1817.30,  2202.70,   -89.00,  2011.90,  2342.80,   110.90},
{ "Redsands East",                1848.40,  2342.80,   -89.00,  2011.90,  2478.40,   110.90},
{ "Redsands West",                1236.60,  1883.10,   -89.00,  1777.30,  2142.80,   110.90},
{ "Redsands West",                1297.40,  2142.80,   -89.00,  1777.30,  2243.20,   110.90},
{ "Redsands West",                1377.30,  2243.20,   -89.00,  1704.50,  2433.20,   110.90},
{ "Redsands West",                1704.50,  2243.20,   -89.00,  1777.30,  2342.80,   110.90},
{ "Regular Tom",                  -405.70,  1712.80,    -3.00,  -276.70,  1892.70,   200.00},
{ "Richman",                       647.50, -1118.20,   -89.00,   787.40,  -954.60,   110.90},
{ "Richman",                       647.50,  -954.60,   -89.00,   768.60,  -860.60,   110.90},
{ "Richman",                       225.10, -1369.60,   -89.00,   334.50, -1292.00,   110.90},
{ "Richman",                       225.10, -1292.00,   -89.00,   466.20, -1235.00,   110.90},
{ "Richman",                        72.60, -1404.90,   -89.00,   225.10, -1235.00,   110.90},
{ "Richman",                        72.60, -1235.00,   -89.00,   321.30, -1008.10,   110.90},
{ "Richman",                       321.30, -1235.00,   -89.00,   647.50, -1044.00,   110.90},
{ "Richman",                       321.30, -1044.00,   -89.00,   647.50,  -860.60,   110.90},
{ "Richman",                       321.30,  -860.60,   -89.00,   687.80,  -768.00,   110.90},
{ "Richman",                       321.30,  -768.00,   -89.00,   700.70,  -674.80,   110.90},
{ "Robada Intersection",         -1119.00,  1178.90,   -89.00,  -862.00,  1351.40,   110.90},
{ "Roca Escalante",               2237.40,  2202.70,   -89.00,  2536.40,  2542.50,   110.90},
{ "Roca Escalante",               2536.40,  2202.70,   -89.00,  2625.10,  2442.50,   110.90},
{ "Rockshore East",               2537.30,   676.50,   -89.00,  2902.30,   943.20,   110.90},
{ "Rockshore West",               1997.20,   596.30,   -89.00,  2377.30,   823.20,   110.90},
{ "Rockshore West",               2377.30,   596.30,   -89.00,  2537.30,   788.80,   110.90},
{ "Rodeo",                          72.60, -1684.60,   -89.00,   225.10, -1544.10,   110.90},
{ "Rodeo",                          72.60, -1544.10,   -89.00,   225.10, -1404.90,   110.90},
{ "Rodeo",                         225.10, -1684.60,   -89.00,   312.80, -1501.90,   110.90},
{ "Rodeo",                         225.10, -1501.90,   -89.00,   334.50, -1369.60,   110.90},
{ "Rodeo",                         334.50, -1501.90,   -89.00,   422.60, -1406.00,   110.90},
{ "Rodeo",                         312.80, -1684.60,   -89.00,   422.60, -1501.90,   110.90},
{ "Rodeo",                         422.60, -1684.60,   -89.00,   558.00, -1570.20,   110.90},
{ "Rodeo",                         558.00, -1684.60,   -89.00,   647.50, -1384.90,   110.90},
{ "Rodeo",                         466.20, -1570.20,   -89.00,   558.00, -1385.00,   110.90},
{ "Rodeo",                         422.60, -1570.20,   -89.00,   466.20, -1406.00,   110.90},
{ "Rodeo",                         466.20, -1385.00,   -89.00,   647.50, -1235.00,   110.90},
{ "Rodeo",                         334.50, -1406.00,   -89.00,   466.20, -1292.00,   110.90},
{ "Royal Casino",                 2087.30,  1383.20,   -89.00,  2437.30,  1543.20,   110.90},
{ "San Andreas Sound",            2450.30,   385.50,  -100.00,  2759.20,   562.30,   200.00},
{ "Santa Flora",                 -2741.00,   458.40,    -7.60, -2533.00,   793.40,   200.00},
{ "Santa Maria Beach",             342.60, -2173.20,   -89.00,   647.70, -1684.60,   110.90},
{ "Santa Maria Beach",              72.60, -2173.20,   -89.00,   342.60, -1684.60,   110.90},
{ "Shady Cabin",                 -1632.80, -2263.40,    -3.00, -1601.30, -2231.70,   200.00},
{ "Shady Creeks",                -1820.60, -2643.60,    -8.00, -1226.70, -1771.60,   200.00},
{ "Shady Creeks",                -2030.10, -2174.80,    -6.10, -1820.60, -1771.60,   200.00},
{ "Sobell Rail Yards",            2749.90,  1548.90,   -89.00,  2923.30,  1937.20,   110.90},
{ "Spinybed",                     2121.40,  2663.10,   -89.00,  2498.20,  2861.50,   110.90},
{ "Starfish Casino",              2437.30,  1783.20,   -89.00,  2685.10,  2012.10,   110.90},
{ "Starfish Casino",              2437.30,  1858.10,   -39.00,  2495.00,  1970.80,    60.90},
{ "Starfish Casino",              2162.30,  1883.20,   -89.00,  2437.30,  2012.10,   110.90},
{ "Temple",                       1252.30, -1130.80,   -89.00,  1378.30, -1026.30,   110.90},
{ "Temple",                       1252.30, -1026.30,   -89.00,  1391.00,  -926.90,   110.90},
{ "Temple",                       1252.30,  -926.90,   -89.00,  1357.00,  -910.10,   110.90},
{ "Temple",                        952.60, -1130.80,   -89.00,  1096.40,  -937.10,   110.90},
{ "Temple",                       1096.40, -1130.80,   -89.00,  1252.30, -1026.30,   110.90},
{ "Temple",                       1096.40, -1026.30,   -89.00,  1252.30,  -910.10,   110.90},
{ "The Camel's Toe",              2087.30,  1203.20,   -89.00,  2640.40,  1383.20,   110.90},
{ "The Clown's Pocket",           2162.30,  1783.20,   -89.00,  2437.30,  1883.20,   110.90},
{ "The Emerald Isle",             2011.90,  2202.70,   -89.00,  2237.40,  2508.20,   110.90},
{ "The Farm",                    -1209.60, -1317.10,   114.90,  -908.10,  -787.30,   251.90},
{ "The Four Dragons Casino",      1817.30,   863.20,   -89.00,  2027.30,  1083.20,   110.90},
{ "The High Roller",              1817.30,  1283.20,   -89.00,  2027.30,  1469.20,   110.90},
{ "The Mako Span",                1664.60,   401.70,     0.00,  1785.10,   567.20,   200.00},
{ "The Panopticon",               -947.90,  -304.30,    -1.10,  -319.60,   327.00,   200.00},
{ "The Pink Swan",                1817.30,  1083.20,   -89.00,  2027.30,  1283.20,   110.90},
{ "The Sherman Dam",              -968.70,  1929.40,    -3.00,  -481.10,  2155.20,   200.00},
{ "The Strip",                    2027.40,   863.20,   -89.00,  2087.30,  1703.20,   110.90},
{ "The Strip",                    2106.70,  1863.20,   -89.00,  2162.30,  2202.70,   110.90},
{ "The Strip",                    2027.40,  1783.20,   -89.00,  2162.30,  1863.20,   110.90},
{ "The Strip",                    2027.40,  1703.20,   -89.00,  2137.40,  1783.20,   110.90},
{ "The Visage",                   1817.30,  1863.20,   -89.00,  2106.70,  2011.80,   110.90},
{ "The Visage",                   1817.30,  1703.20,   -89.00,  2027.40,  1863.20,   110.90},
{ "Unity Station",                1692.60, -1971.80,   -20.40,  1812.60, -1932.80,    79.50},
{ "Valle Ocultado",               -936.60,  2611.40,     2.00,  -715.90,  2847.90,   200.00},
{ "Verdant Bluffs",                930.20, -2488.40,   -89.00,  1249.60, -2006.70,   110.90},
{ "Verdant Bluffs",               1073.20, -2006.70,   -89.00,  1249.60, -1842.20,   110.90},
{ "Verdant Bluffs",               1249.60, -2179.20,   -89.00,  1692.60, -1842.20,   110.90},
{ "Verdant Meadows",                37.00,  2337.10,    -3.00,   435.90,  2677.90,   200.00},
{ "Verona Beach",                  647.70, -2173.20,   -89.00,   930.20, -1804.20,   110.90},
{ "Verona Beach",                  930.20, -2006.70,   -89.00,  1073.20, -1804.20,   110.90},
{ "Verona Beach",                  851.40, -1804.20,   -89.00,  1046.10, -1577.50,   110.90},
{ "Verona Beach",                 1161.50, -1722.20,   -89.00,  1323.90, -1577.50,   110.90},
{ "Verona Beach",                 1046.10, -1722.20,   -89.00,  1161.50, -1577.50,   110.90},
{ "Vinewood",                      787.40, -1310.20,   -89.00,   952.60, -1130.80,   110.90},
{ "Vinewood",                      787.40, -1130.80,   -89.00,   952.60,  -954.60,   110.90},
{ "Vinewood",                      647.50, -1227.20,   -89.00,   787.40, -1118.20,   110.90},
{ "Vinewood",                      647.70, -1416.20,   -89.00,   787.40, -1227.20,   110.90},
{ "Whitewood Estates",             883.30,  1726.20,   -89.00,  1098.30,  2507.20,   110.90},
{ "Whitewood Estates",            1098.30,  1726.20,   -89.00,  1197.30,  2243.20,   110.90},
{ "Willowfield",                  1970.60, -2179.20,   -89.00,  2089.00, -1852.80,   110.90},
{ "Willowfield",                  2089.00, -2235.80,   -89.00,  2201.80, -1989.90,   110.90},
{ "Willowfield",                  2089.00, -1989.90,   -89.00,  2324.00, -1852.80,   110.90},
{ "Willowfield",                  2201.80, -2095.00,   -89.00,  2324.00, -1989.90,   110.90},
{ "Willowfield",                  2541.70, -1941.40,   -89.00,  2703.50, -1852.80,   110.90},
{ "Willowfield",                  2324.00, -2059.20,   -89.00,  2541.70, -1852.80,   110.90},
{ "Willowfield",                  2541.70, -2059.20,   -89.00,  2703.50, -1941.40,   110.90},
{ "Yellow Bell Station",          1377.40,  2600.40,   -21.90,  1492.40,  2687.30,    78.00},
// Main Zones
{ "Los Santos",                     44.60, -2892.90,  -242.90,  2997.00,  -768.00,   900.00},
{ "Las Venturas",                  869.40,   596.30,  -242.90,  2997.00,  2993.80,   900.00},
{ "Bone County",                  -480.50,   596.30,  -242.90,   869.40,  2993.80,   900.00},
{ "Tierra Robada",               -2997.40,  1659.60,  -242.90,  -480.50,  2993.80,   900.00},
{ "Tierra Robada",               -1213.90,   596.30,  -242.90,  -480.50,  1659.60,   900.00},
{ "San Fierro",                  -2997.40, -1115.50,  -242.90, -1213.90,  1659.60,   900.00},
{ "Red County",                  -1213.90,  -768.00,  -242.90,  2997.00,   596.30,   900.00},
{ "Flint County",                -1213.90, -2892.90,  -242.90,    44.60,  -768.00,   900.00},
{ "Whetstone",                   -2997.40, -2892.90,  -242.90, -1213.90, -1115.50,   900.00}};

main() print("xorg62 & Cheaterman's CnR");

#pragma unused ret_memcpy

forward PlayerRecentlyRobbed();
forward HandCuffs();
forward TimeUpdate();
forward WantedLevel();
forward Float:GetDistanceBetweenPlayers(p1, p2);
forward ShowCarListMenu(playerid);
forward Unjail();
forward RobbingStores();
forward AllStores();
forward BankRecentlyUsedByRobber();
forward RecentlyRentedACar();
forward ResetMedicWeapons();
forward BlowPlayers();
forward BlowCar(vehicleid);
forward ReFill(playerid);
forward BlowUpBar();
forward RebuildBar();
forward DriverSalary();
forward GivePlayerMoneyEx(playerid,money,reason[]);
forward PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z);
//---------------TAXI----------------
forward terminarMission(playerid);
forward caidadeficha();
//-----------------------------------
//-----------------------------------------------------------------------------|
//                                                                             |
//-----------------------------------------------------------------------------|

public OnGameModeExit()
{
    for(new i = 0; i <MAX_PLAYERS; i++)
	{
		TextDrawDestroy(Text:Speed[i][Speedom]);
	}
	for (new p = 0; p < 2; p++) KillTimer(TimerKill[p]);
}

public OnGameModeInit()
{
	SendRconCommand("mapname by xorg62 and Cheaterman");
	SetGameModeText("Extended Cops and Robbers");

	DisableInteriorEnterExits();
	ShowPlayerMarkers(2);
	ManualVehicleEngineAndLights();

	//BUS
	for (new i=0;i<MAX_PLAYERS;i++)
	    {
     	playerInMiniMission2[i]=-1;
    	avisado2[i]=-1;
    	OnBusAsPassenger[i]=-1;
	    }
    caidadeficha2Timer2=-1;
    cantidadPasajeros2=0;
	SetTimer("caidadeficha2",30000,1);
	//

	//-------------TAXI------------
	for (new i=0;i<MAX_PLAYERS;i++)
	    {
     	playerInJob[i]=-1;
    	avisado[i]=-1;
    	OnTaxiAsPassenger[i]=-1;
	    }
    caidadefichaTimer=-1;
    cantidadPasajeros=0;
	SetTimer("caidadeficha",30000,1);
	//------------------------------

	SetTimer("TimeUpdate", 600000, true);
	ATMRecentlyRobbed = 0;
	DildoRecentlyRobbed = 0;
	HallRecentlyRobbed = 0;
	RentalRecentlyRobbed = 0;
	time = 12;
	//LV
   	cpbankentrance = CPS_AddCheckpoint(2019.5000, 1913.0396, 12.3114, 2, 40);
	cpbank = CPS_AddCheckpoint(2315.8755, -7.4058, 26.7422, 2, 7);
	cplvpdentrance = CPS_AddCheckpoint(2287.0925, 2431.6145, 10.8203, 2, 40);
	cphospital = CPS_AddCheckpoint(1607.4465, 1816.1157, 10.8203, 2, 100);
	cpdildoentrance = CPS_AddCheckpoint(2085.6697, 2074.0100, 11.0547, 2, 40);
	cpdildo = CPS_AddCheckpoint(-104.7753, -10.6159, 1000.7188, 2, 20);
	cplvchentrance = CPS_AddCheckpoint(2412.5625, 1123.8337, 10.8203, 2, 40);
	cpcityhall = CPS_AddCheckpoint(362.6970, 173.7694, 1008.3828, 2, 20);
	cpghost = CPS_AddCheckpoint(2172.1233, 1398.1210, 11.0625, 2, 15);
	cpbarentrance = CPS_AddCheckpoint(2113.2854, 1333.5800, 10.8203, 2, 40);
	cpbarexit = CPS_AddCheckpoint(2102.4478, 1328.3512, 1297.4639, 2, 10);
	cpbincoentrance = CPS_AddCheckpoint(2101.8979, 2257.3718, 11.0234, 2, 40);
	cpzipentrance = CPS_AddCheckpoint(2249.1479, 960.5301, 10.8130, 2, 40);
	cpzip = CPS_AddCheckpoint(162.7595, -83.2518, 1001.8047, 2, 10);
	cpbombshop = CPS_AddCheckpoint(2032.1550, 2162.4448, 10.8203, 2, 40);
	cpurbanentrance = CPS_AddCheckpoint(2184.2126, 2295.6084, 10.8203, 2, 40);
	cpurban = CPS_AddCheckpoint(203.2626, -43.2611, 1001.8047, 2, 5);
	cpdrugs = CPS_AddCheckpoint(2491.5000, 918.4912, 11.0234, 2, 40);
	cp4Dragonsentrace = CPS_AddCheckpoint(2019.3212,1007.7536,10.8203, 2, 40);
	cp4Dragonsexit = CPS_AddCheckpoint(2019.0708,1017.8350,996.8750, 2, 40);
	cpcaligulasentrace = CPS_AddCheckpoint(2196.9517,1677.1399,12.3672, 2, 40);
	cpcaligulasexit = CPS_AddCheckpoint(2233.9785,1714.6780,1012.3828, 2, 40);
	cpcaligulas = CPS_AddCheckpoint(2144.1499,1641.6793,993.5761, 2, 40);
	cp4Dragons = CPS_AddCheckpoint(1940.6887,983.4753,992.4688, 2, 40);
	//LS
	cplspdentrance = CPS_AddCheckpoint(1555.0673,-1675.6428,16.1953, 2, 40);
	cplschentrance = CPS_AddCheckpoint(1481.1427,-1771.6808,18.7958, 2, 20);
	cplsdrugs = CPS_AddCheckpoint(1122.7067,-2037.0416,69.8942, 2, 40);
	cplsbincoentrance = CPS_AddCheckpoint(2244.4128,-1665.5463,15.4766, 2, 5);
	cplshospital = CPS_AddCheckpoint(1172.8318,-1323.2954,15.4001, 2, 40);
	cplsbombshop = CPS_AddCheckpoint(1857.1792,-1874.2761,13.4829, 2, 40);
	cplsbarentrance = CPS_AddCheckpoint(2309.8811,-1643.7646,14.8270, 2, 40);
	cplsbankentrance = CPS_AddCheckpoint(1411.7141,-1700.0085,13.5395, 2, 40);
	cplsghost = CPS_AddCheckpoint(1703.9697,-1469.9948,13.5469, 2, 15);
	cplsurbanentrance = CPS_AddCheckpoint(499.6478,-1360.3167,16.3421, 2, 40);
	cplsurbanentrance2 = CPS_AddCheckpoint(822.3297,-1757.5181,13.6484, 2, 40);
	cplszipentrance = CPS_AddCheckpoint(2139.1853,-1743.2207,13.5524, 2, 40);

	//SF
	cpsfpdentrance = CPS_AddCheckpoint(-1605.4486,710.8713,13.8672, 2, 60);
	cpsfdrugs = CPS_AddCheckpoint(-2719.4172,-319.2030,7.8438, 2, 60);
	cpsfhospital = CPS_AddCheckpoint(-2655.0779,640.0289,14.4545, 2, 40);
	cpsfbombshop = CPS_AddCheckpoint(-2032.9038,161.4297,29.0461, 2, 40);
	cpsfbankentrance = CPS_AddCheckpoint(-1581.2535,867.2552,7.6953, 2, 40);
	cpsfghost = CPS_AddCheckpoint(-1946.0483,273.3452,35.4739, 2, 15);
	cpsfurbanentrance = CPS_AddCheckpoint(-2490.9307,-142.7729,25.6172, 2, 40);
	cpsfzipentrance = CPS_AddCheckpoint(-1881.1808,823.0976,35.1770, 2, 40);

	//In Interior
	cpbankexit = CPS_AddCheckpoint(2306.5283, -16.2048, 26.7496, 2, 7);
	cpurbanexit = CPS_AddCheckpoint(203.7821, -50.6640, 1001.8047, 2, 5);
	cpzipexit = CPS_AddCheckpoint(161.3950, -97.1106, 1001.8047, 2, 10);
	cpbincoexit = CPS_AddCheckpoint(207.6098, -111.2587, 1005.1328, 2, 5);
	cplvchexit = CPS_AddCheckpoint(390.7697, 173.8317, 1008.3828, 2, 20);
	cpdildoexit = CPS_AddCheckpoint(-100.3964, -24.5959, 1000.7188, 2, 20);
	cplvpdexit = CPS_AddCheckpoint(238.6930, 139.1192, 1003.0234, 2, 20);
	cplvpdhand = CPS_AddCheckpoint(235.6114, 165.4718, 1003.0300, 2, 20);
    cpbinco = CPS_AddCheckpoint(208.8474, -100.3271, 1005.25789, 2, 5);
    cpammu = CPS_AddCheckpoint(296.5011,-37.9712,1001.5156,1,35);
    cpammu2 = CPS_AddCheckpoint(314.2445,-133.1708,999.6016,1,35);
    cpammu3 = CPS_AddCheckpoint(295.6205,-80.8057,1001.5156,1,35);
    cpammu4 = CPS_AddCheckpoint(312.3840,-166.1258,999.6010,1,35);
    cpammu5 = CPS_AddCheckpoint(289.5338,-109.7698,1001.5156,1,35);
    cpammuexit = CPS_AddCheckpoint(285.4340,-41.7365,1001.5156,1,20);
    cpammuexit2 = CPS_AddCheckpoint(315.8784,-143.6499,999.6016,1,20);
    cpammuexit3 = CPS_AddCheckpoint(285.7483,-86.5335,1001.5229,1,20);
    cpammuexit4 = CPS_AddCheckpoint(316.4094,-170.2954,999.5938,1,20);
    cpammuexit5 = CPS_AddCheckpoint(296.7770,-111.8694,1001.5156,1,20);
    
    //Ammunations
    cpammuentrace1 = CPS_AddCheckpoint(-314.4526,829.8660,14.2422,2.0,50); //Ammu
    cpammuentrace2 = CPS_AddCheckpoint(-1509.1987,2607.8308,55.8359,2.0,50); //Ammu
    cpammuentrace3 = CPS_AddCheckpoint(778.0967,1871.3663,4.9064,2.0,50); //Ammu
    cpammuentrace4 = CPS_AddCheckpoint(2157.2400,943.3561,10.8203,2.0,50); //Ammu
    cpammuentrace5 = CPS_AddCheckpoint(2537.2446,2083.8816,10.8203,2.0,50); //Ammu
    cpammuentrace6 = CPS_AddCheckpoint(2335.0498,61.5352,26.4832,2.0,50); //Ammu
    cpammuentrace7 = CPS_AddCheckpoint(1365.1813,-1279.3116,13.5469,2.0,50); //Ammu
    cpammuentrace8 = CPS_AddCheckpoint(2400.5313,-1980.2539,13.5469,2.0,50); //Ammu
    cpammuentrace9 = CPS_AddCheckpoint(-2625.8728,210.1599,4.6168,2.0,50); //Ammu
    cpammuentrace10 = CPS_AddCheckpoint(-2092.6567,-2463.5925,30.6250,2.0,50); //Ammu

    //ATM-uri
    cpatm1 = CPS_AddCheckpoint(2172.8428, 1416.7751, 11.0625, 2, 40);
	cpatm2 = CPS_AddCheckpoint(2110.5188, 2060.4219, 10.8203, 2, 40);
	cpatm3 = CPS_AddCheckpoint(2134.0115, 2379.3159, 10.8203, 2, 40);
	cpatm4 = CPS_AddCheckpoint(2455.5420, 1681.4117, 11.0234, 2, 40);
	cpatm5 = CPS_AddCheckpoint(-2635.9067,1398.5020,7.0938, 2, 40);
	cpatm6 = CPS_AddCheckpoint(-1575.3977,902.4458,7.5610, 2, 40);
	cpatm7 = CPS_AddCheckpoint(-2434.0908,516.8967,30.3705, 2, 40);
	cpatm9 = CPS_AddCheckpoint(852.7184,-1760.9111,13.5491, 2, 40);
	cpatm10 = CPS_AddCheckpoint(1243.2965,-1561.1505,13.5545, 2, 40);
	cpatm11 = CPS_AddCheckpoint(1787.9928,-1592.2491,13.4870, 2, 40);
	
	//LS COP
    cpcopLSjos = CPS_AddCheckpoint(1568.7113,-1690.4612,5.8906, 2, 20);
    cpcopLSsus = CPS_AddCheckpoint(1573.0570,-1675.4435,28.3955, 2, 40);

	//LV COP
    cpcopLVjos = CPS_AddCheckpoint(2268.2466,2448.4587,3.5313, 2, 40);
    cpcopLVsus = CPS_AddCheckpoint(2271.7534,2463.8074,38.6837, 2, 40);

	//SF COP
    cpcopSFsus = CPS_AddCheckpoint(-1593.4403,716.2719,-5.2422, 2, 40);
    cpcopSFjos = CPS_AddCheckpoint(-1610.6396,703.1793,48.9375, 2, 40);

	Hand = CreateMenu("Hand", 1, 50.0, 200.0, 120.0, 250.0);
	AddMenuItem(Hand, 0, "Yes");
	AddMenuItem(Hand, 0, "No");

	Dildo = CreateMenu("CDildos", 1, 50.0, 200.0, 120.0, 250.0);
	AddMenuItem(Dildo, 0, "Purple Dildo $50");
	AddMenuItem(Dildo, 0, "White Dildo $50");
	AddMenuItem(Dildo, 0, "GREY Dildo $50");
	AddMenuItem(Dildo, 0, "Rob Store");

	Rental = CreateMenu("Car Shop", 1, 50.0, 200.0, 120.0, 250.0);
	AddMenuItem(Rental, 0, "Car List");
	AddMenuItem(Rental, 0, "Rob Store");

	CarList = CreateMenu("Buy", 1, 50.0, 200.0, 120.0, 250.0);
	AddMenuItem(CarList, 0, "Voodoo $20000");
	AddMenuItem(CarList, 0, "Sultan $50000");
	AddMenuItem(CarList, 0, "Savanna $35000");
	AddMenuItem(CarList, 0, "Slamvan $25000");

	BarEntrance = CreateMenu("Bar", 1, 50.0, 200.0, 120.0, 250.0);
	AddMenuItem(BarEntrance, 0, "Enter Bar");

	Drugs = CreateMenu("Drugs", 1, 50.0, 200.0, 120.0, 250.0);
	AddMenuItem(Drugs, 0, "5 grams");
	AddMenuItem(Drugs, 0, "15 grams");
	AddMenuItem(Drugs, 0, "20 grams");
	AddMenuItem(Drugs, 0, "25 grams");
	AddMenuItem(Drugs, 0, "Rob");

	SetTimer("WantedLevel", 500, true);
	SetTimer("PlayerRecentlyRobbed", 1000, true);
	SetTimer("Unjail", 1000, true);
	SetTimer("RobbingStores", 1000, true);
	SetTimer("AllStores", 1000, true);
	SetTimer("BlowPlayers", 1000, true);
	SetTimer("BankRecentlyUsedByRobber", 1000, true);
	SetTimer("4DRecentlyUsedByRobber", 1000, true);
	SetTimer("CaRecentlyUsedByRobber", 1000, true);
	SetTimer("ResetMedicWeapons", 1000, true);
	TimerKill[0] = SetTimer("Sorsolas", SORSOLASTIMER, 1);
	TimerKill[1] = SetTimer("LottoHirdetes", HIRDETESTIMER, 1);
	
	for(new Vehicles = 0; Vehicles < MAX_VEHICLES; Vehicles++)
 	{
 		Vehicle[Vehicles][Fuel] = Random(SPAWN_GAS_MIN, SPAWN_GAS_MAX);
  	}
	for(new i = 0; i < MAX_PLAYERS; i++)
  	{
  		Speed[i][ShowSpeed] = 1;
  		Speed[i][Refueling] = 0;

  		Speed[i][Speedom] = TextDrawCreate(1.000000, 430.000000,"_");
		TextDrawTextSize(Speed[i][Speedom],625.000000,0.000000);
		TextDrawAlignment(Speed[i][Speedom],0);
        TextDrawBackgroundColor(Speed[i][Speedom],0x0000ffff);
		TextDrawFont(Speed[i][Speedom],1);
		TextDrawLetterSize(Speed[i][Speedom],0.399999, 1.400000);
		TextDrawColor(Speed[i][Speedom],0xffff00ff);
		TextDrawSetOutline(Speed[i][Speedom],1);
		TextDrawSetProportional(Speed[i][Speedom],1);
		TextDrawSetShadow(Speed[i][Speedom],1);
		
		Speed[i][Speedom2] = TextDrawCreate(1.000000, 430.000000,"_");
		TextDrawTextSize(Speed[i][Speedom2],625.000000,0.000000);
		TextDrawAlignment(Speed[i][Speedom2],0);
		TextDrawFont(Speed[i][Speedom2],1);
		TextDrawLetterSize(Speed[i][Speedom2],0.399999, 1.400000);
		TextDrawColor(Speed[i][Speedom2],0xffff00ff);
		TextDrawSetOutline(Speed[i][Speedom2],1);
		TextDrawSetProportional(Speed[i][Speedom2],1);
		TextDrawSetShadow(Speed[i][Speedom2],1);

		SetTimerEx("Speedometer",1000,true,"i",i);
	}


	AddPlayerClass(280, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Police
	AddPlayerClass(281, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Police
	AddPlayerClass(282, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Police
	AddPlayerClass(283, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Police
	AddPlayerClass(284, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Police
	AddPlayerClass(288, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Police

	AddPlayerClass(286, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // FBI

	AddPlayerClass(285, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // SWAT

	AddPlayerClass(287, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Army
	
	AddPlayerClass(274, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Medic
	AddPlayerClass(275, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Medic
	AddPlayerClass(276, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Medic 20
	
	AddPlayerClass(7, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Civilian 0
	AddPlayerClass(11, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Civilian
	AddPlayerClass(19, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Civilian
	AddPlayerClass(21, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Civilian
	AddPlayerClass(23, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Civilian
	AddPlayerClass(28, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Civilian 5
	AddPlayerClass(29, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Civilian
	AddPlayerClass(46, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Civilian
	AddPlayerClass(47, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Civilian
	AddPlayerClass(59, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Civilian
	AddPlayerClass(98, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Civilian 10
	AddPlayerClass(101, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Civilian
	AddPlayerClass(116, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Civilian
	AddPlayerClass(124, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Civilian
	AddPlayerClass(186, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Civilian
	AddPlayerClass(188, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Civilian 15
	AddPlayerClass(223, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Civilian
	AddPlayerClass(240, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Civilian
	AddPlayerClass(58, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0); // Civilian

	CreateObject(2754,2173.642,1416.756,10.965,0.0,0.0,0.0);
	CreateObject(2754,2110.551,2061.222,10.645,0.0,0.0,90.000);
	CreateObject(2754,2134.022,2380.115,10.722,0.0,0.0,90.000);
	CreateObject(2754,2455.509,1682.210,10.926,0.0,0.0,90.000);

	CreateObject(2754,1787.425,-1591.667,13.383,0.0,-0.859,128.984);//
    CreateObject(2754,852.741,-1760.101,13.451,0.0,0.0,90.000);//
    CreateObject(2754,1243.338,-1560.346,13.458,0.0,0.0,-270.000);//
    CreateObject(2754,-1575.455,901.579,7.555,0.0,0.0,-90.000);//
    CreateObject(2754,-2636.126,1399.269,7.002,0.0,0.0,-254.453);//
    CreateObject(2754,-2434.890,516.938,30.266,0.0,0.0,-180.077);//

	CreateObject(3077,2173.666,1398.133,10.055,0.0,0.0,-90.000);
	CreateObject(3249,2120.823,1333.566,9.820,0.0,0.0,-90.000);
	CreateObject(2591,2086.406,1331.995,1297.114,0.0,0.0,90.000);
	CreateObject(970,2131.378,1331.550,10.373,0.0,0.0,90.000);
	CreateObject(970,2131.370,1335.675,10.379,0.0,0.0,90.000);
	CreateObject(1267,2100.687,1315.522,25.885,0.0,0.0,112.500);
	CreateObject(615,2102.430,1344.295,9.814,0.0,0.0,0.0);
	CreateObject(615,2097.778,1352.475,9.807,0.0,0.0,0.0);
	CreateObject(18018,2102.414,1338.047,1296.456,0.0,0.0,180.000);
	CreateObject(18090,2111.170,1334.028,1299.027,0.0,0.0,0.0);
	CreateObject(1541,2112.979,1330.078,1298.828,0.0,0.0,90.000);
	CreateObject(1545,2112.193,1335.818,1298.379,0.0,0.0,270.000);
	CreateObject(1487,2112.616,1335.134,1298.334,0.0,0.0,0.0);
	CreateObject(1487,2112.611,1334.913,1298.334,0.0,0.0,0.0);
	CreateObject(1512,2110.238,1333.208,1297.708,0.0,0.0,56.250);
	CreateObject(1520,2112.489,1334.566,1297.703,0.0,0.0,0.0);
	CreateObject(1543,2109.845,1334.312,1297.506,0.0,0.0,0.0);
	CreateObject(1543,2112.590,1333.678,1298.671,0.0,0.0,0.0);
	CreateObject(1544,2112.452,1334.781,1298.671,0.0,0.0,0.0);
	CreateObject(1544,2110.382,1337.917,1297.499,0.0,0.0,0.0);
	CreateObject(1547,2109.969,1336.964,1297.512,0.0,0.0,236.250);
	CreateObject(1548,2112.032,1338.103,1297.516,0.0,0.0,11.250);
	CreateObject(1664,2112.576,1333.818,1298.303,0.0,0.0,0.0);
	CreateObject(1665,2109.716,1333.551,1297.521,0.0,0.0,0.0);
	CreateObject(18077,2106.904,1333.482,1297.027,0.0,0.0,0.0);
	CreateObject(1532,2103.933,1327.937,1296.457,0.0,0.0,180.000);
	CreateObject(1532,2102.428,1327.950,1296.457,0.0,0.0,180.000);
	CreateObject(3851,2086.412,1337.231,1299.647,0.0,0.0,0.0);
	CreateObject(1523,2082.852,1331.578,1299.467,0.0,0.0,0.0);
	CreateObject(936,2083.701,1341.965,1299.954,0.0,0.0,0.0);
	CreateObject(1744,2086.156,1341.337,1300.562,0.0,0.0,-90.000);
	CreateObject(2737,2084.512,1342.509,1301.116,0.0,0.0,0.0);
	CreateObject(2291,2085.635,1335.864,1299.478,0.0,0.0,270.000);
	CreateObject(2291,2085.626,1334.943,1299.478,0.0,0.0,270.000);
	CreateObject(2291,2085.626,1333.982,1299.478,0.0,0.0,270.000);
	CreateObject(1663,2083.330,1340.874,1299.939,0.0,0.0,146.250);
	CreateObject(1723,2097.586,1330.152,1298.891,0.0,0.0,-90.000);
	CreateObject(1723,2094.974,1326.679,1298.992,0.0,0.0,-180.000);
	CreateObject(1723,2088.941,1329.203,1298.891,0.0,0.0,90.000);
	CreateObject(2311,2093.204,1328.834,1298.885,0.0,0.0,0.0);
	CreateObject(1696,2081.341,1329.203,1298.483,0.0,0.0,0.0);
	CreateObject(2785,2112.033,1351.602,1297.308,0.0,0.0,0.0);
	CreateObject(2785,2115.960,1348.485,1297.308,0.0,0.0,-90.000);
	CreateObject(2785,2112.367,1345.267,1297.300,0.0,0.0,180.000);
	CreateObject(2780,2096.854,1338.657,1290.535,0.0,0.0,0.0);
	CreateObject(1486,2089.066,1331.882,1299.968,0.0,0.0,0.0);
	CreateObject(1486,2094.264,1329.094,1299.536,0.0,0.0,0.0);
	CreateObject(1486,2093.797,1328.578,1299.538,0.0,0.0,0.0);
	CreateObject(1486,2093.226,1328.986,1299.536,0.0,0.0,0.0);
	CreateObject(1486,2089.160,1331.983,1299.968,0.0,0.0,0.0);
	CreateObject(1486,2089.131,1329.373,1299.380,90.241,0.0,33.750);
	CreateObject(1486,2089.921,1330.388,1298.913,94.538,0.0,33.750);
	CreateObject(1486,2098.262,1331.060,1299.968,0.0,0.0,0.0);
	CreateObject(1512,2099.001,1330.510,1296.486,87.663,0.0,0.0);
	CreateObject(9833,2096.497,1347.317,1305.492,180.482,0.0,45.000);
	CreateObject(9833,2090.230,1347.290,1310.471,180.482,0.0,45.000);
	CreateObject(9833,2103.819,1347.284,1310.421,180.482,0.0,45.000);
	CreateObject(2732,2264.098,968.830,13.681,0.0,0.0,180.000);
	CreateObject(2733,2254.177,968.780,13.664,0.0,0.0,180.000);
	CreateObject(2734,2244.198,968.755,13.689,0.0,0.0,180.000);
	CreateObject(2735,2252.341,961.731,11.525,0.0,0.0,180.000);
	CreateObject(2733,2246.148,961.706,11.507,0.0,0.0,180.000);

	AddStaticVehicleEx(534,2472.9211,1658.7762,10.5465,359.8307,6,6, 500); //
	AddStaticVehicleEx(499,2405.3523,1667.8323,10.8129,359.5840,109,32, 500); //
	AddStaticVehicleEx(412,2372.6116,1648.4834,10.6580,0.8343,10,8, 500); //
	AddStaticVehicleEx(562,2466.3171,1677.0613,10.4786,178.7625,66,72, 500); //
	AddStaticVehicleEx(426,2461.7959,1629.1102,10.5639,179.0690,0,0, 500); //
	AddStaticVehicleEx(402,2445.7551,1629.4286,10.6519,0.2863,13,13, 500); //
	AddStaticVehicleEx(603,2405.8633,1629.0724,10.6586,359.5122,8,8, 500); //
	AddStaticVehicleEx(535,2392.5156,1658.7957,10.5837,1.0343,28,1, 500); //
	AddStaticVehicleEx(575,2479.2625,1667.8008,10.4150,179.7732,3,3, 500); //
	AddStaticVehicleEx(411,2367.4495,1004.6971,10.5474,269.8430,64,64, 500); //
	AddStaticVehicleEx(477,2393.2632,988.4747,10.5774,92.3181,0,0, 500); //
	AddStaticVehicleEx(546,2393.1833,994.2506,10.5446,270.0536,42,42, 500); //
	AddStaticVehicleEx(565,2394.5703,999.7688,10.4460,88.1333,42,42, 500); //
	AddStaticVehicleEx(603,2393.6338,1005.4090,10.6583,90.0020,3,3, 500); //
	AddStaticVehicleEx(462,2142.3591,1012.7918,10.4165,91.9208,13,13, 500); //
	AddStaticVehicleEx(412,2142.2070,1022.6295,10.6581,271.0170,11,1, 500); //
	AddStaticVehicleEx(535,2162.6340,1028.9689,10.5832,270.9259,31,1, 500); //
	AddStaticVehicleEx(567,2157.7578,987.4936,10.6888,180.2066,88,64, 500); //
	AddStaticVehicleEx(582,2163.1558,1009.7912,10.8740,270.0522,41,20, 500); //
	AddStaticVehicleEx(560,2172.2048,1019.2856,10.5256,89.6247,9,39, 500); //
	AddStaticVehicleEx(558,2172.0122,1006.4577,10.4501,89.5966,116,1, 500); //
	AddStaticVehicleEx(405,2172.1658,1012.8825,10.6953,269.3904,9,39, 500); //
	AddStaticVehicleEx(559,2132.1841,1019.4150,10.4767,271.0511,73,73, 500); //
	AddStaticVehicleEx(426,2141.7686,987.2473,10.5639,179.6218,6,6, 500); //
	AddStaticVehicleEx(547,2179.5127,987.5496,10.5846,359.1130,108,108, 500); //
	AddStaticVehicleEx(412,2354.4670,728.7990,11.0687,178.6039,27,1, 500); //
	AddStaticVehicleEx(461,2362.4084,739.2892,11.0465,175.1550,37,1, 500); //
	AddStaticVehicleEx(405,2353.5063,698.0624,11.1730,359.5570,17,1, 500); //
	AddStaticVehicleEx(551,2361.1511,698.7083,10.9552,178.5026,62,62, 500); //
	AddStaticVehicleEx(567,2405.7837,728.8138,11.1389,178.9894,90,96, 500); //
	AddStaticVehicleEx(575,2309.6528,699.0496,10.7698,179.9338,6,6, 500); //
	AddStaticVehicleEx(409,2125.7625,2358.8254,10.5424,90.4384,96,96, 500); //
	AddStaticVehicleEx(579,2119.8899,2366.2922,10.7528,180.1806,42,42, 500); //
	AddStaticVehicleEx(579,2135.4375,2366.5396,10.7533,179.2225,53,53, 500); //
	AddStaticVehicleEx(411,1945.9452,2081.0701,10.5474,358.7133,44,44, 500); //
	AddStaticVehicleEx(560,1945.9236,2056.6816,10.5259,0.5755,17,1, 500); //
	AddStaticVehicleEx(461,1939.7405,2077.5396,10.3958,0.3513,43,1, 500); //
	AddStaticVehicleEx(522,1939.7479,2069.5010,10.3899,357.2454,3,8, 500); //
	AddStaticVehicleEx(481,1939.5156,2063.3462,10.3363,0.0796,3,6, 500); //
	AddStaticVehicleEx(550,2040.0674,1019.7483,10.4857,180.0628,3,3, 500); //
	AddStaticVehicleEx(551,2040.1283,1001.6779,10.4723,179.5286,44,44, 500); //
	AddStaticVehicleEx(522,2040.3741,1011.2333,10.2425,179.6930,7,79, 500); //
	AddStaticVehicleEx(420,2082.1479,2479.3735,10.5991,179.7290,6,76, 500); //
	AddStaticVehicleEx(438,2090.6277,2479.4390,10.8244,359.7547,6,76, 500); //
	AddStaticVehicleEx(420,2084.8745,2469.1799,10.5993,359.1951,6,76, 500); //
	AddStaticVehicleEx(438,2046.3571,2468.8115,10.8230,359.5204,6,76, 500); //
	AddStaticVehicleEx(438,2057.1445,2479.5557,10.8238,0.0725,6,76, 500); //
	AddStaticVehicleEx(420,2126.6108,2468.6418,10.5982,0.4535,6,76, 500); //
	AddStaticVehicleEx(438,2135.0234,2468.9534,10.8212,359.4664,6,76, 500); //
	AddStaticVehicleEx(420,2153.2742,2479.4822,10.6011,269.2158,6,76, 500); //
	AddStaticVehicleEx(420,2152.7151,2494.5276,10.6009,89.9420,6,76, 500); //
	AddStaticVehicleEx(598,2282.1550,2443.3625,10.5685,0.4613,0,1, 500); //
	AddStaticVehicleEx(598,2277.8914,2461.0503,10.5662,179.0250,0,1, 500); //
	AddStaticVehicleEx(598,2282.2273,2477.1331,10.5640,359.6212,0,1, 500); //
	AddStaticVehicleEx(598,2269.0532,2476.5664,10.5676,178.9592,0,1, 500); //
	AddStaticVehicleEx(598,2273.5305,2443.7686,10.5652,179.1985,0,1, 500); //
	AddStaticVehicleEx(598,2256.0552,2443.9597,10.5665,359.5947,0,1, 500); //
	AddStaticVehicleEx(598,2251.6458,2459.4985,10.5687,358.2122,0,1, 500); //
	AddStaticVehicleEx(598,2260.4390,2477.6992,10.5672,357.7829,0,1, 500); //
	AddStaticVehicleEx(598,2256.0339,2477.6545,10.5663,177.3497,0,1, 500); //
	AddStaticVehicleEx(490,2260.3430,2458.3870,10.9491,359.3593,0,1, 500); //
	AddStaticVehicleEx(490,2269.4644,2443.1841,10.9485,178.7726,0,1, 500); //
	AddStaticVehicleEx(427,2290.9546,2442.8438,10.9533,177.9908,0,1, 500); //
	AddStaticVehicleEx(427,2273.4326,2458.7405,10.9524,178.5145,0,1, 500); //
	AddStaticVehicleEx(546,2032.5714,1905.6959,11.9413,183.0488,42,42, 500); //
	AddStaticVehicleEx(418,2033.0281,1930.4526,12.2988,173.5465,3,3, 500); //
	AddStaticVehicleEx(558,2044.9039,1907.8097,11.7633,183.0264,116,1, 500); //
	AddStaticVehicleEx(560,2044.9648,1925.6631,11.8462,176.9535,21,1, 500); //
	AddStaticVehicleEx(535,2044.7391,1917.5081,11.9041,179.6416,28,1, 500); //
	AddStaticVehicleEx(416,1612.7440,1839.2080,10.9697,180.1315,1,3, 500); //
	AddStaticVehicleEx(416,1602.1962,1831.9338,10.9778,0.0186,1,3, 500); //
	AddStaticVehicleEx(416,1599.1062,1849.7390,10.9698,180.6114,1,3, 500); //
	AddStaticVehicleEx(416,1613.9442,1850.1570,10.9698,180.0313,1,3, 500); //
	AddStaticVehicleEx(416,1593.5956,1840.0591,10.9702,1.2758,1,3, 500); //
	AddStaticVehicleEx(575,2132.7542,1408.5275,10.4920,0.1349,4,4, 500); //
	AddStaticVehicleEx(567,2123.1653,1398.6191,10.6987,179.6008,88,64, 500); //
	AddStaticVehicleEx(558,2139.0557,1398.0648,10.4417,359.4670,24,1, 500); //
	AddStaticVehicleEx(559,2106.9807,1398.2726,10.4767,179.8120,3,3, 500); //
	AddStaticVehicleEx(536,2100.8140,1408.8713,10.5579,178.6800,32,1, 500); //
	AddStaticVehicleEx(560,2145.6990,1408.7677,10.5256,179.8884,33,0, 500); //
    AddStaticVehicleEx(541,2116.2251,1340.6744,10.4450,91.1779,0,0, 500); //
	AddStaticVehicleEx(437,-1988.6128,191.8639,27.6723,0.5789,23,84, 500); // CNR
	AddStaticVehicleEx(420,-1988.1422,178.9573,27.3183,1.4396,6,6, 500); // CNR
	AddStaticVehicleEx(420,-1987.9703,172.1282,27.3211,1.4395,6,6, 500); // CNR
	AddStaticVehicleEx(420,-1987.7473,163.2685,27.3186,1.4395,6,6, 500); // CNR
	AddStaticVehicleEx(420,-1988.0347,153.0820,27.3179,359.3752,6,6, 500); // CNR
	AddStaticVehicleEx(420,-1988.1346,146.2245,27.3194,0.3721,6,6, 500); // CNR
	AddStaticVehicleEx(437,-1988.6406,106.2428,27.6724,0.9065,117,47, 500); // CNR
	AddStaticVehicleEx(438,-1988.2738,131.3374,27.5397,358.4913,6,6, 500); // CNR
	AddStaticVehicleEx(438,-1988.5242,121.8434,27.5445,358.4913,6,6, 500); // CNR
	AddStaticVehicleEx(540,-2029.3890,157.1268,28.6981,358.3036,32,107, 500); // CNR
	AddStaticVehicleEx(526,-1987.0029,307.0458,34.9423,65.8231,25,84, 500); // CNR
	AddStaticVehicleEx(559,-1990.3962,272.7261,34.7868,240.6091,117,10, 500); // CNR
	AddStaticVehicleEx(524,-2130.3035,297.3135,35.6152,240.0539,39,32, 500); // CNR
	AddStaticVehicleEx(497,-1681.5543,706.1519,30.7784,271.6265,0,1, 500); // CNR
	AddStaticVehicleEx(597,-1600.3014,749.5445,-5.4735,359.8234,0,1, 500); // CNR
	AddStaticVehicleEx(597,-1574.5607,742.6702,-5.4750,90.5884,0,1, 500); // CNR
	AddStaticVehicleEx(597,-1574.0773,718.3009,-5.4733,88.2228,0,1, 500); // CNR
	AddStaticVehicleEx(597,-1639.7535,686.2418,-5.4767,94.0520,0,1, 500); // CNR
	AddStaticVehicleEx(597,-1620.8264,692.0425,-5.4724,179.9455,0,1, 500); // CNR
	AddStaticVehicleEx(528,-1600.0839,675.3750,-5.2003,358.0193,70,11, 500); // CNR
	AddStaticVehicleEx(528,-1622.4645,654.0593,-5.1985,268.2474,70,11, 500); // CNR
	AddStaticVehicleEx(528,-1580.2118,749.0043,-5.1976,358.6027,70,11, 500); // CNR
	AddStaticVehicleEx(528,-1612.4758,732.7313,-5.1965,180.3062,70,11, 500); // CNR
	AddStaticVehicleEx(490,-1608.5421,741.3525,-5.1148,224.1386,96,79, 500); //
	AddStaticVehicleEx(490,-1590.2271,710.4675,-5.1134,270.6260,0,0, 500); // CNR
	AddStaticVehicleEx(427,-1573.5730,722.6011,-5.1104,89.3115,0,1, 500); // CNR
	AddStaticVehicleEx(428,-1581.7739,673.5168,7.3130,359.1592,1,0, 500); // CNR
	AddStaticVehicleEx(597,-1605.6608,674.2237,6.9549,359.5684,0,1, 500); // CNR
	AddStaticVehicleEx(597,-1600.0083,652.1969,6.9549,1.3530,0,1, 500); // CNR
	AddStaticVehicleEx(412,-1626.7611,722.6164,14.4156,252.3011,89,52, 500); // CNR
	AddStaticVehicleEx(418,-1625.2798,833.4026,7.6379,269.8319,50,75, 500); // CNR
	AddStaticVehicleEx(424,-2132.2112,722.4828,69.3477,136.9095,54,22, 500); // CNR
	AddStaticVehicleEx(434,-2482.1794,741.7360,34.9838,177.3357,91,105, 500); // CNR
	AddStaticVehicleEx(416,-2647.7981,584.1959,14.6023,90.5916,48,74, 500); // CNR
	AddStaticVehicleEx(416,-2679.0544,627.3723,14.6019,269.1387,48,74, 500); // CNR
	AddStaticVehicleEx(439,-2543.4226,599.0334,14.3481,90.4391,117,91, 500); // CNR
	AddStaticVehicleEx(522,-2661.4856,268.5721,3.9123,178.5994,3,3, 500); // CNR
	AddStaticVehicleEx(560,-2616.3931,90.1765,4.0128,308.5160,79,103, 500); // CNR
	AddStaticVehicleEx(517,-2661.3965,235.5974,4.1935,88.1109,62,20, 500); // CNR
	AddStaticVehicleEx(517,-2505.2500,413.4430,27.6352,320.1658,62,20, 500); // CNR
	AddStaticVehicleEx(411,-2372.3169,519.1977,28.2521,22.9398,24,105, 500); // CNR
	AddStaticVehicleEx(411,-2646.3179,1334.5313,6.8518,342.3297,24,105, 500); // CNR
	AddStaticVehicleEx(409,-2624.9553,1378.8749,6.9232,270.0377,1,1, 500); // CNR
	AddStaticVehicleEx(534,-2762.5125,-295.7481,6.7661,359.8021,16,66, 500); // CNR
	AddStaticVehicleEx(481,-2889.2112,-1032.4730,9.0006,182.6653,125,40, 500); // CNR
	AddStaticVehicleEx(468,-2408.3962,-2190.2612,32.9582,351.4587,29,72, 500); // CNR
	AddStaticVehicleEx(468,-2398.6426,-2215.8879,32.9574,196.7935,29,72, 500); // CNR
	AddStaticVehicleEx(510,-2323.2595,-1631.8724,483.2980,206.6769,80,102, 500); // CNR
	AddStaticVehicleEx(412,-2187.1804,-2295.0037,30.3802,221.3219,101,15, 500); // CNR
	AddStaticVehicleEx(478,-2094.1873,-2481.8191,30.5478,101.2632,93,100, 500); // CNR
	AddStaticVehicleEx(605,-629.6401,-2555.3210,68.4381,35.9639,36,120, 500); // cNR
	AddStaticVehicleEx(604,-355.7040,-2337.2158,82.3132,342.8585,14,73, 500); // CNR
	AddStaticVehicleEx(593,-1361.9164,-485.1834,14.6313,203.2765,98,48, 500); // CNR
	AddStaticVehicleEx(593,-1441.0549,-523.4969,14.6326,207.9127,107,78, 500); // CNR
	AddStaticVehicleEx(553,-1273.5382,-611.5309,15.4884,0.0814,50,97, 500); // CNR
	AddStaticVehicleEx(553,-1329.6910,-616.8340,15.4800,344.8188,9,9, 500); // CNR
	AddStaticVehicleEx(519,-1526.4309,-599.8280,15.0703,275.2200,6,76, 500); // CNR
	AddStaticVehicleEx(487,-1183.4301,23.3701,14.3281,47.5092,0,1, 500); // CNR
	AddStaticVehicleEx(487,-1223.9756,-12.9300,14.3376,45.5123,0,1, 500); // CNR
	AddStaticVehicleEx(487,-1636.7146,-626.3158,14.3246,276.2187,182,127, 500); // CNR
	AddStaticVehicleEx(473,-1149.2510,-479.3979,-0.3647,342.6399,35,6, 500); // CNR
	AddStaticVehicleEx(472,-1113.4923,329.8786,0.1266,315.0088,53,122, 500); // CNR
	AddStaticVehicleEx(493,-1475.8485,687.6431,-0.0686,358.0009,0,7, 500); // CNR
	AddStaticVehicleEx(595,-1461.7936,1022.8047,0.2081,89.4682,103,110, 500); // CNR
	AddStaticVehicleEx(493,-1566.3278,1263.2714,0.0268,89.8198,0,7, 500); // CNR
	AddStaticVehicleEx(452,-1895.3483,1399.6223,-0.4755,272.2622,40,37, 500); // CNR
	AddStaticVehicleEx(423,-1791.1069,1425.7482,7.2173,355.6911,110,57, 500); // CNR
	AddStaticVehicleEx(587,-1665.9906,1209.3291,6.9828,299.6061,36,25, 500); // CNR
	AddStaticVehicleEx(411,-1663.9546,1222.1163,13.3544,237.1603,115,120, 500); // CNR
	AddStaticVehicleEx(451,-2156.0752,1058.8573,79.7092,10.4905,84,44, 500); // CNR
	AddStaticVehicleEx(411,-2457.4963,2304.9705,4.6544,276.6973,20,108, 500); // CNR
	AddStaticVehicleEx(426,-2480.1841,416.1389,27.5246,137.6551,0,0, 500); // CNR
	AddStaticVehicleEx(421,-2486.8831,421.7173,27.6637,137.7021,2,1, 500); // CNR
	AddStaticVehicleEx(412,-2499.1658,433.9863,27.6155,318.3919,87,64, 500); // CNR
	AddStaticVehicleEx(562,-2480.3999,393.1013,27.4380,141.8022,74,48, 500); // CNR
	AddStaticVehicleEx(400,-2542.6204,587.1049,14.5455,270.1338,95,24, 500); // CNR
	AddStaticVehicleEx(416,-2589.0984,621.9482,14.6087,270.2829,1,3, 500); // CNR
	AddStaticVehicleEx(416,-2589.3169,632.6327,14.6024,270.3439,1,3, 500); // CNR
	AddStaticVehicleEx(416,-2545.6440,647.7982,14.6085,269.7815,1,3, 500); // CNR
	AddStaticVehicleEx(559,-2176.9211,657.9245,49.0938,178.8880,0,0, 500); // CNR
	AddStaticVehicleEx(433,-1477.4896,460.0663,7.6225,359.8576,42,31, 500); // CNR
	AddStaticVehicleEx(470,-1470.0477,458.8246,7.1754,358.5681,114,69, 500); // CNR
	AddStaticVehicleEx(470,-1464.5531,458.7328,7.1745,358.5191,97,62, 500); // CNR
	AddStaticVehicleEx(470,-1458.6755,458.6252,7.1773,358.6697,35,49, 500); // CNR
	AddStaticVehicleEx(433,-1452.6025,460.1559,7.6208,359.1512,36,71, 500); // CNR
	AddStaticVehicleEx(548,-1254.6019,459.1282,8.8423,64.3847,84,48, 500); // CNR
	AddStaticVehicleEx(470,-1266.7256,439.1088,7.1769,30.9449,2,10, 500); // CNR
	AddStaticVehicleEx(433,-1305.5168,440.4816,7.6239,46.9552,47,1, 500); // CNR
	AddStaticVehicleEx(404,-1500.6406,993.8652,6.9214,89.7719,34,74, 500); // CNR
	AddStaticVehicleEx(418,-1611.2949,1147.5748,7.2028,359.1432,96,5, 500); // CNR
	AddStaticVehicleEx(400,-1637.8809,1297.3248,7.1281,134.9772,24,37, 500); // CNR
	AddStaticVehicleEx(401,-1645.2125,1304.6230,6.8081,134.2872,78,36, 500); // CNR
	AddStaticVehicleEx(424,-2010.6729,1269.7745,9.4492,1.5402,96,57, 500); // CNR
	AddStaticVehicleEx(402,-2531.2639,1140.4996,55.5583,352.4629,74,87, 500); // CNR
	AddStaticVehicleEx(400,-2567.8296,1147.7538,55.8189,337.2007,23,63, 500); // CNR
	AddStaticVehicleEx(534,-2637.6321,802.1845,49.6711,180.5369,103,23, 500); // CNR
	AddStaticVehicleEx(596,1539.2555,-1644.3197,5.6109,359.9586,47,95, 500); // CNR
	AddStaticVehicleEx(596,1544.8132,-1658.8232,5.6096,89.2314,47,95, 500); // CNR
	AddStaticVehicleEx(596,1544.7218,-1684.1376,5.6113,267.8804,47,95, 500); // CNR
	AddStaticVehicleEx(596,1574.4397,-1710.7479,5.6093,180.7318,47,95, 500); // CNR
	AddStaticVehicleEx(596,1602.1147,-1696.4015,5.6124,267.8443,47,95, 500); // CNR
	AddStaticVehicleEx(427,1529.5773,-1684.2161,6.0226,87.6918,54,38, 500); // CNR
	AddStaticVehicleEx(427,1601.5450,-1704.1082,6.0227,270.3358,54,38, 500); // CNR
	AddStaticVehicleEx(427,1558.8358,-1613.9513,13.5147,175.3478,54,38, 500); // CNR
	AddStaticVehicleEx(596,1601.9608,-1628.7412,13.2071,88.4642,1,0, 500); // CNR
	AddStaticVehicleEx(596,1536.0029,-1678.5251,13.1041,181.2446,1,0, 500); // CNR
	AddStaticVehicleEx(596,1535.5918,-1667.6024,13.1045,181.2998,1,0, 500); // CNR
	AddStaticVehicleEx(412,1350.7225,-1593.1829,13.3356,171.2246,120,63, 500); // CNR
	AddStaticVehicleEx(412,1471.5330,-1498.9709,13.3844,214.8573,120,63, 500); // CNR
	AddStaticVehicleEx(543,1663.3156,-1718.2933,20.2969,126.2698,125,13, 500); // CNR
	AddStaticVehicleEx(545,1476.0431,-1738.6343,13.3579,270.2405,19,88, 500); // CNR
	AddStaticVehicleEx(576,1858.8785,-1426.5573,13.1862,205.2842,50,45, 500); // CNR
	AddStaticVehicleEx(541,2146.3120,-1454.7037,24.5068,270.1099,114,18, 500); // CNR
	AddStaticVehicleEx(574,2159.9788,-1309.2162,23.7098,144.8127,121,81, 500); // CNR
	AddStaticVehicleEx(566,1709.8203,-1339.8234,13.2535,330.5721,110,20, 500); // CNR
	AddStaticVehicleEx(463,1255.5306,-1438.6350,18.2297,260.2033,86,15, 500); // CNR
	AddStaticVehicleEx(416,1189.8268,-1366.3300,13.6137,359.3892,69,8, 500); // CNR
	AddStaticVehicleEx(416,1190.0822,-1344.7936,13.6316,357.8732,69,8, 500); // CNR
	AddStaticVehicleEx(416,1177.0189,-1308.6743,14.0180,89.7719,69,8, 500); // CNR
	AddStaticVehicleEx(416,1210.5793,-1311.3835,13.6255,177.7648,69,8, 500); // CNR
	AddStaticVehicleEx(416,1210.8770,-1381.2939,13.4991,178.2684,69,8, 500); // CNR
	AddStaticVehicleEx(588,1278.8674,-1293.7701,13.2362,89.3756,34,0, 500); // CNR
	AddStaticVehicleEx(526,1140.4080,-1472.4884,15.5636,94.6149,34,71, 500); // CNR
	AddStaticVehicleEx(586,871.6463,-1762.0640,13.0556,80.0748,112,91, 500); // CNR
	AddStaticVehicleEx(603,768.0140,-1789.1705,12.8355,135.9006,96,100, 500); // CNR
	AddStaticVehicleEx(603,588.0920,-1579.5155,15.8537,90.8709,96,100, 500); // CNR
	AddStaticVehicleEx(560,665.6003,-1225.8263,15.3248,273.2521,11,73, 500); // CNR
	AddStaticVehicleEx(560,655.0095,-1223.4033,16.6347,200.2075,1,255, 500); // CNR
	AddStaticVehicleEx(463,662.1331,-1223.1228,15.5249,63.3169,39,97, 500); // CNR
	AddStaticVehicleEx(463,658.1104,-1230.9053,15.5060,58.8725,39,97, 500); // CNR
	AddStaticVehicleEx(583,486.2061,-1359.3267,17.4421,165.2249,12,28, 500); // CNR
	AddStaticVehicleEx(602,478.8647,-1508.4924,20.3364,134.6098,104,122, 500); // CNR
	AddStaticVehicleEx(602,159.0004,-1531.8573,11.7415,197.7620,104,122, 500); // CNR
	AddStaticVehicleEx(600,364.4498,-1360.2690,14.2063,328.3542,80,52, 500); // CNR
	AddStaticVehicleEx(560,1337.5819,-1263.0737,13.1667,178.0636,66,103, 500); // CNR
	AddStaticVehicleEx(524,1236.9630,-1266.5527,14.3741,269.3505,117,50, 500); // CNR
	AddStaticVehicleEx(567,1015.5640,-1133.5992,23.7293,47.1603,35,36, 500); // CNR
	AddStaticVehicleEx(442,923.2741,-1122.1011,23.8356,2.0281,1,18, 500); // CNR
	AddStaticVehicleEx(455,2691.3254,-2499.0781,13.9564,54.3853,52,82, 500); // CNR
	AddStaticVehicleEx(470,2741.8213,-2476.4526,13.6400,358.9606,105,42, 500); // CNR
	AddStaticVehicleEx(470,2739.6182,-2425.5833,13.6355,149.2840,105,42, 500); // CNR
	AddStaticVehicleEx(470,2725.4558,-2391.7080,13.6314,269.6312,105,42, 500); // CNR
	AddStaticVehicleEx(470,2784.0935,-2387.6138,13.6287,356.4348,105,42, 500); // CNR
	AddStaticVehicleEx(548,2777.7478,-2346.0249,15.2715,165.5650,46,68, 500); // CNR
	AddStaticVehicleEx(433,2787.4146,-2418.3120,14.0703,89.0070,70,6, 500); // CNR
	AddStaticVehicleEx(433,2786.1667,-2455.7805,14.0707,89.1321,70,6, 500); // CNR
	AddStaticVehicleEx(433,2785.8806,-2494.5603,14.0893,88.3835,70,6, 500); // CNR
	AddStaticVehicleEx(525,2692.9285,-2467.9971,13.5217,86.5740,14,63, 500); // CNR
	AddStaticVehicleEx(525,2693.2854,-2452.8250,13.5165,89.8568,14,63, 500); // CNR
	AddStaticVehicleEx(528,2758.8633,-2457.2893,13.5664,1.0570,5,23, 500); // CNR
	AddStaticVehicleEx(528,2764.0215,-2455.1875,13.5579,3.0803,5,23, 500); // CNR
	AddStaticVehicleEx(583,2644.6338,-2387.8462,13.1734,11.1478,10,15, 500); // CNR
	AddStaticVehicleEx(562,2267.8796,-2018.3160,13.2044,282.6059,30,97, 500); // CNR
	AddStaticVehicleEx(558,2229.7759,-1762.9365,13.1912,0.2561,54,122, 500); // CNR
	AddStaticVehicleEx(499,2250.7107,-1779.2504,13.5382,351.8078,0,0, 500); // CNR
	AddStaticVehicleEx(411,2501.1316,-1755.5726,13.1029,0.6107,93,121, 500); // CNR
	AddStaticVehicleEx(434,2517.5837,-1672.6176,14.1060,232.5694,32,20, 500); // CNR
	AddStaticVehicleEx(451,2225.6018,-1639.5422,15.1659,26.3051,60,73, 500); // CNR
	AddStaticVehicleEx(451,2337.8655,-1611.1965,20.7983,115.9090,60,73, 500); // CNR
	AddStaticVehicleEx(451,2407.9385,-1482.4860,23.5266,194.5191,60,73, 500); // CNR
	AddStaticVehicleEx(451,2465.3860,-1424.1887,23.4578,271.1841,60,73, 500); // CNR
	AddStaticVehicleEx(451,2465.5339,-1413.9205,23.4570,268.5215,60,73, 500); // CNR
	AddStaticVehicleEx(411,2433.4316,-1260.9491,23.5550,97.2068,65,46, 500); // CNR
	AddStaticVehicleEx(411,2378.0330,-1248.9265,23.6113,24.8095,65,46, 500); // CNR
	AddStaticVehicleEx(421,2363.1147,-1166.6296,27.4895,343.4427,62,103, 500); // CNR
	AddStaticVehicleEx(421,2533.9192,-1144.2948,42.3100,267.9478,62,103, 500); // CNR
	AddStaticVehicleEx(412,2683.8364,-1110.4365,69.2337,267.6568,0,40, 500); // CNR
	AddStaticVehicleEx(410,2750.2366,-1112.4893,69.2323,162.1354,121,37, 500); // CNR
	AddStaticVehicleEx(424,2564.3171,-1277.7893,45.9237,134.5531,29,62, 500); // CNR
	AddStaticVehicleEx(424,2517.3235,-1395.2300,28.2242,182.8000,29,62, 500); // CNR
	AddStaticVehicleEx(502,2681.7283,-1673.7838,9.3156,178.9488,68,6, 500); // CNR
	AddStaticVehicleEx(419,2595.1094,-1640.5896,2.3411,356.7394,34,87, 500); // CNR
	AddStaticVehicleEx(437,1780.6001,-1887.4373,13.5230,269.2689,65,16, 500); // CNR
	AddStaticVehicleEx(437,1781.0718,-1891.0201,13.5237,269.8186,65,16, 500); // CNR
	AddStaticVehicleEx(437,1781.6692,-1896.8356,13.5239,269.7447,65,16, 500); // CNR
	AddStaticVehicleEx(437,1780.4521,-1902.3815,13.5235,267.0726,65,16, 500); // CNR
	AddStaticVehicleEx(437,1781.3156,-1906.7104,13.5234,267.8438,65,16, 500); // CNR
	AddStaticVehicleEx(420,1777.3168,-1912.5166,13.1622,268.8852,6,6, 500); // CNR
	AddStaticVehicleEx(420,1777.7452,-1916.8807,13.1650,270.0446,6,6, 500); // CNR
	AddStaticVehicleEx(420,1777.4371,-1920.8295,13.1673,268.6692,6,6, 500); // CNR
	AddStaticVehicleEx(420,1777.5826,-1924.3154,13.1673,270.9490,6,6, 500); // CNR
	AddStaticVehicleEx(420,1777.0709,-1927.6826,13.1646,267.4850,6,6, 500); // CNR
	AddStaticVehicleEx(420,1777.7676,-1932.2742,13.1654,269.5245,6,6, 500); // CNR
	AddStaticVehicleEx(462,1838.0708,-1871.0637,12.9894,16.7216,90,110, 500); // CNR
	AddStaticVehicleEx(489,1703.4624,-1514.6466,13.5289,354.6726,6,64, 500); // CNR
	AddStaticVehicleEx(489,1681.7804,-1165.2457,23.8883,96.7670,6,64, 500); // CNR
	AddStaticVehicleEx(489,1622.5425,-1088.9559,24.0498,272.3766,6,64, 500); // CNR
	AddStaticVehicleEx(492,1648.7659,-1084.5262,23.6877,268.7659,88,51, 500); // CNR
	AddStaticVehicleEx(445,1426.7501,-1088.7882,17.4328,178.8861,20,53, 500); // CNR
	AddStaticVehicleEx(419,1963.9802,-1171.6763,25.8101,171.9996,54,9, 500); // CNR
	AddStaticVehicleEx(419,2135.7939,-1261.7487,23.7886,266.9993,54,9, 500); // CNR
	AddStaticVehicleEx(419,2166.0537,-1984.9197,13.3558,177.7469,54,9, 500); // CNR
	AddStaticVehicleEx(419,1793.6608,-2124.4517,13.3428,175.8265,54,9, 500); // CNR
	AddStaticVehicleEx(492,1616.9003,-1892.5708,13.3299,261.1858,122,23, 500); // CNR
	AddStaticVehicleEx(492,1345.8270,-1854.9633,13.2459,305.1307,122,23, 500); // CNR
	AddStaticVehicleEx(492,1071.0842,-1837.2305,13.3695,279.7008,122,23, 500); // CNR
	AddStaticVehicleEx(492,558.4954,-1740.1851,12.5294,89.1122,122,23, 500); // CNR
	AddStaticVehicleEx(492,333.8728,-1745.5265,4.2778,275.7159,122,23, 500); // CNR
	AddStaticVehicleEx(492,203.6131,-1381.0515,49.0262,303.5283,122,23, 500); // CNR
	AddStaticVehicleEx(477,269.5095,-1365.8063,52.9312,195.7436,51,68, 500); // CNR
	AddStaticVehicleEx(477,1532.2039,-892.9706,60.8801,47.5508,51,68, 500); // CNR
	AddStaticVehicleEx(477,1614.7751,73.0663,37.2610,137.4652,51,68, 500); // CNR
	AddStaticVehicleEx(477,1825.6857,873.9662,10.4787,250.8812,51,68, 500); // CNR
	AddStaticVehicleEx(409,1174.8761,-2011.1066,68.8034,180.2955,19,45, 500); // CAR LS
    AddStaticVehicleEx(409,1174.8418,-2062.4541,68.8005,358.8616,1,3, 500); // CAR LS
    AddStaticVehicleEx(560,1247.4678,-2010.8546,59.4837,0.0172,61,92, 500); // CAR LS
    AddStaticVehicleEx(426,1262.6028,-2010.7106,59.0890,1.0326,117,115, 500); // CAR LS
    AddStaticVehicleEx(421,1246.6702,-2021.0757,59.6878,89.3090,14,90, 500); // CAR LS
    AddStaticVehicleEx(411,1668.3333,-1698.4595,20.2095,111.0195,103,17, 500); // CAR LS
    AddStaticVehicleEx(541,2304.2561,-1642.3811,14.1568,181.6377,6,0, 500); // CAR LS
    AddStaticVehicleEx(426,-1956.4415,585.4780,34.8601,0.5932,86,124, 500); // CAR SF
    AddStaticVehicleEx(402,-1953.3643,585.3503,34.9529,359.0071,89,63, 500); // CAR SF
    AddStaticVehicleEx(451,-1935.3063,585.5364,34.8246,359.2379,45,121, 500); // CAR SF
    AddStaticVehicleEx(421,-1944.2689,585.3606,35.0076,358.5772,6,6, 500); // CAR SF
    AddStaticVehicleEx(517,-1992.3827,243.5176,35.0268,139.5587,51,31, 500); // CAR SF
    AddStaticVehicleEx(517,-2616.6008,74.8332,4.1908,88.2741,51,31, 500); // CAR SF
    AddStaticVehicleEx(470,-1445.0464,458.8409,7.1795,0.7084,104,87, 500); //
    AddStaticVehicleEx(470,-1333.8381,449.1157,7.1787,4.3272,104,87, 500); //
    AddStaticVehicleEx(476,-1262.6820,507.5797,18.9375,90.3696,80,104, 500); //
    AddStaticVehicleEx(476,-1289.9688,507.5169,18.9479,89.8120,80,104, 500); //
    AddStaticVehicleEx(476,-1320.5983,507.4883,18.9391,89.6654,80,104, 500); //
    AddStaticVehicleEx(476,-1353.2142,507.5184,18.9426,89.9565,80,104, 500); //
    AddStaticVehicleEx(476,-1391.2141,507.5581,18.9433,89.8580,80,104, 500); //
    AddStaticVehicleEx(548,-1459.0627,500.0371,19.9570,131.7253,99,13, 500); //
    AddStaticVehicleEx(470,276.9211,2023.4412,17.6336,272.6233,39,87, 500); //
    AddStaticVehicleEx(433,275.3499,1988.9595,18.0773,272.0024,34,29, 500); //
    AddStaticVehicleEx(470,275.7674,1956.0403,17.6353,271.2579,99,57, 500); //
    AddStaticVehicleEx(476,307.7774,2053.0532,18.3447,179.5164,43,80, 500); //
    AddStaticVehicleEx(476,307.5680,2022.5872,18.3858,179.5979,43,80, 500); //
    AddStaticVehicleEx(476,307.3362,1976.8934,18.3709,179.7407,43,80, 500); //
    AddStaticVehicleEx(476,307.2180,1939.5699,18.3737,179.7749,43,80, 500); //
    AddStaticVehicleEx(548,187.2346,1911.3690,19.3550,257.1326,121,85, 500); //
    AddStaticVehicleEx(470,266.7537,1839.7186,17.6412,204.7390,86,125, 500); //
    AddStaticVehicleEx(470,124.2681,1858.7083,17.7494,127.9176,86,125, 500); //
    AddStaticVehicleEx(599,2315.6006,2460.4211,3.4631,268.2009,0,0, 500); //
    AddStaticVehicleEx(599,2314.2319,2495.2148,3.4635,90.5629,0,0, 500); //
    AddStaticVehicleEx(599,2277.0205,2473.9304,3.4663,179.2646,0,0, 500); //
    AddStaticVehicleEx(599,2239.8240,2475.6514,3.4651,90.3094,0,0, 500); //
    AddStaticVehicleEx(598,2246.4983,2430.4946,3.0187,178.6759,0,1, 500); //
    AddStaticVehicleEx(598,2277.1196,2430.7041,3.0192,179.9285,0,1, 500); //
    AddStaticVehicleEx(437,2150.8921,2502.0471,10.9536,89.5910,117,47, 500); // BUS
    AddStaticVehicleEx(437,2151.5706,2487.0315,10.9536,90.0462,117,47, 500); // BUS
    AddStaticVehicleEx(437,2117.9272,2511.0586,10.9536,189.0172,117,47, 500); // BUS
    AddStaticVehicleEx(437,2128.5891,2513.8132,10.9536,191.7403,117,47, 500); // BUS
    AddStaticVehicleEx(437,2139.0928,2516.6362,10.9537,192.0088,117,47, 500); // BUS
    
    AddStaticVehicleEx(542,2040.1665,1541.1476,10.4117,179.8827,5,111, 500); // CNR
	AddStaticVehicleEx(526,-2341.6965,301.3115,38.3723,119.5160,25,84, 500); // CNR
	AddStaticVehicleEx(526,-2587.8901,230.1816,9.2137,306.6687,25,84, 500); // CNR
	AddStaticVehicleEx(587,-2711.5107,125.7587,4.0167,198.6476,101,63, 500); // CNR
	AddStaticVehicleEx(587,-2700.8530,-8.1576,4.0145,168.2139,101,63, 500); // CNR
	AddStaticVehicleEx(518,-2656.5635,-113.2985,3.7102,152.2127,7,39, 500); // CNR
	AddStaticVehicleEx(518,-2452.6841,-204.8913,33.2267,286.0015,7,39, 500); // CNR
	AddStaticVehicleEx(518,-2414.1636,-1.2807,34.9913,141.3731,7,39, 500); // CNR
	AddStaticVehicleEx(518,-2468.1257,45.6428,30.8559,95.0810,7,39, 500); // CNR
	AddStaticVehicleEx(526,-2506.3384,7.4253,25.4506,170.8600,26,65, 500); // CNR
	AddStaticVehicleEx(526,-2267.7336,69.8399,34.9263,87.5834,26,65, 500); // CNR
	AddStaticVehicleEx(602,-2267.4490,85.0063,34.9783,269.4507,49,90, 500); // CNR
	AddStaticVehicleEx(604,-2265.3428,193.2783,34.9053,271.6914,97,105, 500); // CNR
	AddStaticVehicleEx(456,-2132.3853,-118.2248,35.4937,179.3912,36,5, 500); // CNR
	AddStaticVehicleEx(456,-2124.9753,-118.3633,35.4934,179.7911,36,5, 500); // CNR
	AddStaticVehicleEx(456,-2120.4097,-117.3749,35.4940,181.8442,36,5, 500); // CNR
	AddStaticVehicleEx(456,-2116.3167,-118.2943,35.4939,180.6833,36,5, 500); // CNR
	AddStaticVehicleEx(526,-2068.6343,-83.4163,34.9318,180.3597,3,69, 500); // CNR
	AddStaticVehicleEx(543,-2093.7336,88.1683,35.1245,232.5689,33,108, 500); // CNR
	AddStaticVehicleEx(543,-2351.9707,-125.6556,35.1257,354.9290,33,108, 500); // CNR
	AddStaticVehicleEx(541,-2329.9082,-125.5207,34.9375,359.1688,76,33, 500); // CNR
	AddStaticVehicleEx(541,-2464.3247,-100.6371,25.4662,294.0855,76,33, 500); // CNR
	AddStaticVehicleEx(405,-2231.3872,421.5504,34.9756,299.8992,0,39, 500); // CNR
	AddStaticVehicleEx(521,-2127.0417,574.4770,34.7435,230.8675,123,88, 500); // CNR
	AddStaticVehicleEx(521,-2295.7781,813.7700,48.9887,95.7591,123,88, 500); // CNR
	AddStaticVehicleEx(561,-2276.0356,923.5562,66.4632,359.8312,68,81, 500); // CNR
	AddStaticVehicleEx(561,-2066.6218,963.7202,60.3641,206.2542,68,81, 500); // CNR
	AddStaticVehicleEx(561,-1862.5454,939.4189,34.9020,272.2769,68,81, 500); // CNR
	AddStaticVehicleEx(411,2559.0032,2058.0518,10.5474,358.8848,120,79, 500); // CNR
	AddStaticVehicleEx(543,2372.4365,2153.9763,10.5650,90.0188,70,95, 500); // CNR
	AddStaticVehicleEx(543,2242.6753,2234.8413,10.5911,89.7699,70,95, 500); // CNR
	AddStaticVehicleEx(551,2289.7383,2419.0125,10.5444,89.4434,38,87, 500); // CNR
	AddStaticVehicleEx(551,2154.5811,2182.2068,10.4724,178.0841,38,87, 500); // CNR
	AddStaticVehicleEx(541,2120.5012,2057.1758,10.2968,179.2608,75,37, 500); // CNR
	AddStaticVehicleEx(567,1363.7404,2650.0776,10.6862,0.0810,108,24, 500); // CNR
	AddStaticVehicleEx(567,1313.7893,2648.5498,10.6905,178.9520,108,24, 500); // CNR
	AddStaticVehicleEx(588,1363.8280,2692.4224,10.7288,354.3495,41,82, 500); // CNR
	AddStaticVehicleEx(565,1494.1061,2838.1091,10.4460,0.2073,90,71, 500); // CNR
	AddStaticVehicleEx(565,1486.7734,2878.4204,10.4458,0.1254,90,71, 500); // CNR
	AddStaticVehicleEx(589,1529.5310,2845.5171,10.4782,87.7141,88,29, 500); // CNR
	AddStaticVehicleEx(478,2520.1194,1178.1515,10.7946,26.0029,90,78, 500); // CNR
	AddStaticVehicleEx(478,2420.3704,1225.1432,10.8117,23.4396,90,78, 500); // CNR
	AddStaticVehicleEx(559,2455.4565,1366.9805,10.4386,235.0470,25,59, 500); // CNR
	AddStaticVehicleEx(559,2541.6331,1447.6624,10.4425,10.1614,25,59, 500); // CNR
	AddStaticVehicleEx(481,2487.8972,1532.3549,10.2910,37.8486,0,89, 500); // CNR
	AddStaticVehicleEx(491,2569.4146,1776.7362,10.5766,73.3304,59,98, 500); // CNR
	AddStaticVehicleEx(491,2546.8101,1967.7610,10.5766,268.7982,59,98, 500); // CNR
	AddStaticVehicleEx(402,2690.8196,1849.0352,8.0623,223.9609,13,13, 500); // CNR
	AddStaticVehicleEx(402,2810.6094,1980.9949,10.6520,277.2421,13,13, 500); // CNR
	AddStaticVehicleEx(600,2842.7473,2281.6948,10.4584,5.2392,66,67, 500); // CNR
	AddStaticVehicleEx(420,2641.1345,2317.9609,10.4508,267.3100,6,6, 500); // CNR
	AddStaticVehicleEx(420,2650.7837,2319.4680,10.4505,293.7864,6,6, 500); // CNR
	AddStaticVehicleEx(420,2655.3694,2324.2441,10.4514,331.5359,6,6, 500); // CNR
	AddStaticVehicleEx(420,2655.9180,2328.3752,10.4529,351.1672,6,6, 500); // CNR
	AddStaticVehicleEx(420,2655.6936,2335.0090,10.4510,8.7652,6,6, 500); // CNR
	AddStaticVehicleEx(420,2653.2844,2340.3762,10.4541,27.0566,6,6, 500); // CNR
	AddStaticVehicleEx(420,2649.4768,2344.3462,10.4520,51.3639,6,6, 500); // CNR
	AddStaticVehicleEx(420,2642.0635,2348.2180,10.4437,85.2092,6,6, 500); // CNR
	AddStaticVehicleEx(420,2633.1831,2347.3845,10.4508,109.8921,6,6, 500); // CNR
	AddStaticVehicleEx(420,2626.5432,2341.0552,10.4514,153.4898,6,6, 500); // CNR
	AddStaticVehicleEx(420,2625.4980,2331.8423,10.4513,178.8905,6,6, 500); // CNR
	AddStaticVehicleEx(510,1684.4990,2191.9824,10.4260,83.9953,34,34, 500); // CNR
	AddStaticVehicleEx(562,1729.0618,1909.6370,10.4790,271.3743,120,76, 500); // CNR
	AddStaticVehicleEx(420,1714.8448,1426.2880,10.2746,186.4587,6,6, 500); // CNR
	AddStaticVehicleEx(487,1632.4012,1532.0526,10.9751,324.7820,105,73, 500); // CNR
	AddStaticVehicleEx(487,1677.4297,1631.5037,10.9976,176.8011,105,73, 500); // CNR
	AddStaticVehicleEx(563,1575.3679,1448.2814,11.5410,84.8106,22,123, 500); // CNR
	AddStaticVehicleEx(417,1284.6426,1278.6028,10.9078,268.7768,24,35, 500); // CNR
	AddStaticVehicleEx(519,1304.2306,1361.0856,11.7390,268.5266,52,53, 500); // CNR
	AddStaticVehicleEx(519,1305.0592,1323.4504,11.7449,271.6293,52,53, 500); // CNR
	AddStaticVehicleEx(511,1586.5626,1248.2086,12.1885,357.9796,85,31, 500); // CNR
	AddStaticVehicleEx(487,1363.0966,1712.9581,11.0203,249.5521,82,25, 500); // CNR
	AddStaticVehicleEx(487,1394.8047,1768.8315,10.9960,263.3808,82,25, 500); // CNR
	AddStaticVehicleEx(535,2296.8708,2046.2445,10.5845,270.7708,19,89, 500); // CNR
	AddStaticVehicleEx(535,2102.5154,2036.7355,10.5841,90.0563,19,89, 500); // CNR
	AddStaticVehicleEx(535,2276.6492,1952.4087,9.6302,180.4975,19,89, 500); // CNR
	AddStaticVehicleEx(535,2083.9036,1788.4523,10.4353,155.0733,19,89, 500); // CNR
	AddStaticVehicleEx(426,2033.3590,-1925.3810,13.2904,277.6970,117,115, 500); // CNR
	AddStaticVehicleEx(412,2065.4001,-1904.0715,13.3848,358.1083,60,96, 500); // CNR
	AddStaticVehicleEx(411,2095.6167,-1796.8693,13.1114,359.9858,90,29, 500); // CNR
	AddStaticVehicleEx(445,2271.8911,-1432.2534,23.7070,356.1421,0,4, 500); // CNR
	AddStaticVehicleEx(445,2217.3262,-1161.5483,25.6015,91.3140,0,4, 500); // CNR
	AddStaticVehicleEx(445,2093.8022,-980.3689,52.3642,77.4384,0,4, 500); // CNR
	AddStaticVehicleEx(445,2429.1523,-1016.3676,54.1773,194.8109,0,4, 500); // CNR
	AddStaticVehicleEx(442,2668.2712,-1065.6130,69.1268,269.3304,105,79, 500); // CNR
	AddStaticVehicleEx(424,2476.7788,-1526.0499,23.7793,176.1171,29,62, 500); // CNR
	
	//Tara
	AddStaticVehicleEx(517,2075.5396,1159.9681,10.8151,179.0163,122,104, 500); // CNR
	AddStaticVehicleEx(489,2089.4844,766.8369,11.3459,0.7682,122,104, 500); // CNR
	AddStaticVehicleEx(516,-1970.2419,-2432.0332,30.3508,133.6701,101,63, 500); // CNR
	AddStaticVehicleEx(518,-1562.2563,-2737.9390,48.2715,144.0236,101,63, 500); // CNR
	AddStaticVehicleEx(526,-39.6861,-2497.9128,36.3045,39.5643,101,63, 500); // CNR
	AddStaticVehicleEx(587,-274.5593,-2184.9531,28.5088,42.9390,101,63, 500); // CNR
	AddStaticVehicleEx(527,-375.1182,-1411.3190,25.4539,317.5267,101,63, 500); // CNR
	AddStaticVehicleEx(531,-60.7286,-1161.0027,1.4760,151.1579,101,63, 500); // CNR
	AddStaticVehicleEx(533,-80.8599,-1190.8860,1.4769,66.2110,101,63, 500); // CNR
	AddStaticVehicleEx(534,1423.8083,-1713.2639,13.1881,4.4781,101,63, 500); // CNR
	AddStaticVehicleEx(533,1585.5643,-1289.9722,17.2886,303.9691,101,63, 500); // CNR
	AddStaticVehicleEx(535,2474.3628,-1997.8347,13.2737,349.6246,101,63, 500); // CNR
	AddStaticVehicleEx(536,1209.9705,-1694.4044,13.2736,15.9955,101,63, 500); // CNR
	AddStaticVehicleEx(542,1359.9768,-616.8415,108.8596,106.7133,101,63, 500); // CNR
	AddStaticVehicleEx(587,853.5654,-825.7502,89.1909,204.0222,101,63, 500); // CNR
	AddStaticVehicleEx(542,405.5824,-1153.8650,77.0404,148.8526,43,32, 500); // CNR
	AddStaticVehicleEx(411,665.8790,-583.0681,16.0630,92.7505,43,32, 500); // CNR
	AddStaticVehicleEx(554,608.5742,-512.2045,16.0630,0.3112,43,32, 500); // CNR
	AddStaticVehicleEx(547,669.2391,-445.3273,16.0648,316.0027,43,32, 500); // CNR
	AddStaticVehicleEx(546,478.7328,-402.5107,27.5950,146.2253,43,32, 500); // CNR
	AddStaticVehicleEx(545,253.9584,-271.8160,1.3064,218.9784,43,32, 500); // CNR
	AddStaticVehicleEx(549,212.7126,-158.8963,1.3052,74.2594,43,32, 500); // CNR
	AddStaticVehicleEx(550,-65.2376,25.8776,2.8400,282.0338,43,32, 500); // CNR
	AddStaticVehicleEx(551,-216.6941,189.8682,9.2267,175.1628,43,32, 500); // CNR
	AddStaticVehicleEx(552,-520.6651,-101.0537,62.9681,306.1696,43,32, 500); // CNR
	AddStaticVehicleEx(531,-577.2156,-80.9335,64.4163,291.5171,43,32, 500); // CNR
	AddStaticVehicleEx(552,-714.0253,219.2714,2.2432,355.5893,43,32, 500); // CNR
	AddStaticVehicleEx(604,-73.9032,534.6065,6.4640,328.4308,57,61, 500); // CNR
	AddStaticVehicleEx(604,141.3975,748.1796,21.0883,163.8463,57,61, 500); // CNR
	AddStaticVehicleEx(545,317.2584,852.9238,20.2172,111.5509,101,91, 500); // CNR
	AddStaticVehicleEx(555,839.6096,674.4523,11.7150,178.2789,101,91, 500); // CNR
	AddStaticVehicleEx(558,1156.6543,1035.0153,10.8110,305.1578,101,91, 500); // CNR
	AddStaticVehicleEx(568,1606.1685,862.7391,6.7022,42.6466,101,91, 500); // CNR
	AddStaticVehicleEx(567,1676.8790,986.0024,10.6310,2.4389,101,91, 500); // CNR
	AddStaticVehicleEx(576,1671.3633,1028.0043,10.6315,3.9298,101,91, 500); // CNR
	AddStaticVehicleEx(575,1820.7029,1140.1342,13.1734,86.9393,101,91, 500); // CNR
	AddStaticVehicleEx(574,1697.1289,1159.1084,10.5206,296.5815,101,91, 500); // CNR
	AddStaticVehicleEx(579,1514.0720,1049.8076,10.6314,183.3940,101,91, 500); // CNR
	AddStaticVehicleEx(545,1146.6322,1366.2839,10.5703,237.6763,101,91, 500); // CNR
	AddStaticVehicleEx(581,979.5918,1726.2512,8.3784,275.0772,111,98, 500); // CNR
	AddStaticVehicleEx(582,901.1104,2007.7759,10.5047,24.5841,111,98, 500); // CNR
	AddStaticVehicleEx(583,782.1112,1892.9449,4.7674,268.5634,111,98, 500); // CNR
	AddStaticVehicleEx(411,782.4042,1901.3929,4.8241,271.7296,111,98, 500); // CNR
	AddStaticVehicleEx(437,668.0688,1832.4818,5.2842,351.4436,95,92, 500); // CNR
	AddStaticVehicleEx(437,674.5248,1830.5004,5.3506,350.2623,95,92, 500); // CNR
	AddStaticVehicleEx(437,680.4826,1829.7554,5.3773,348.0234,95,92, 500); // CNR
	AddStaticVehicleEx(437,685.8540,1828.2682,5.4115,349.3768,95,92, 500); // CNR
	AddStaticVehicleEx(437,691.9702,1827.4613,5.4320,351.5141,95,92, 500); // CNR
	AddStaticVehicleEx(456,1705.9196,744.9429,10.9936,179.7625,55,3, 500); // CNR
	AddStaticVehicleEx(456,1701.1128,743.6215,10.9956,178.2189,55,3, 500); // CNR
	AddStaticVehicleEx(456,1694.5353,742.4569,10.9939,177.5050,55,3, 500); // CNR
	AddStaticVehicleEx(456,1688.2727,741.8121,10.9932,182.4310,55,3, 500); // CNR
	AddStaticVehicleEx(456,1682.0300,739.3403,10.9936,176.0572,55,3, 500); // CNR
	AddStaticVehicleEx(605,1913.9691,131.0648,34.9952,178.7953,30,27, 500); // CNR
	AddStaticVehicleEx(603,2261.4111,86.4051,26.1332,84.3789,30,27, 500); // CNR
	AddStaticVehicleEx(604,2385.4780,83.1053,26.2114,224.5368,30,27, 500); // CNR
	AddStaticVehicleEx(600,2540.2559,22.4918,26.2115,4.4060,30,27, 500); // CNR
	AddStaticVehicleEx(589,1390.2664,242.1277,19.1986,354.3281,30,27, 500); // CNR
	AddStaticVehicleEx(587,1301.9567,294.4987,19.2779,181.3858,30,27, 500); // CNR
	AddStaticVehicleEx(586,1366.4778,438.2332,19.6276,329.9564,30,27, 500); // CNR
	AddStaticVehicleEx(411,1363.5507,476.1961,19.9371,326.8012,30,27, 500); // CNR
    
    //Transport gunoi
    AddStaticVehicleEx(408,2843.1929,955.6085,11.2969,89.5661,11,45,200); //
    AddStaticVehicleEx(408,2843.6284,972.8670,11.2958,90.5455,29,27,200); //
    AddStaticVehicleEx(408,2825.2346,969.5697,11.2970,179.9391,1,1,200); //
    AddStaticVehicleEx(408,2804.4385,969.4114,11.3004,179.2567,98,107,200); //
    AddStaticVehicleEx(408,2855.2180,897.0206,10.7781,358.7838,9,121,200); //
    AddStaticVehicleEx(408,2827.3604,895.0255,10.5967,358.9578,73,51,200); //
    AddStaticVehicleEx(408,2817.9473,896.3116,10.7238,359.2844,77,115,200); //
    AddStaticVehicleEx(408,-2120.4287,193.9991,35.4618,268.9165,35,2,200); //
    AddStaticVehicleEx(408,-2124.2146,201.3019,35.8529,272.5458,35,2,200); //
    AddStaticVehicleEx(408,-2112.1619,224.6825,35.3498,0.2208,35,2,200); //
    AddStaticVehicleEx(408,-2100.4873,179.2280,35.6423,82.9298,35,2,200); //
    AddStaticVehicleEx(408,-2089.0471,235.2498,35.7527,332.5468,35,2,200); //
    AddStaticVehicleEx(408,2283.9163,-2349.9485,14.1001,314.4154,35,2,200); //
    AddStaticVehicleEx(408,2295.7773,-2338.3167,14.0916,314.6231,35,2,200); //
    AddStaticVehicleEx(408,2282.9431,-2320.1995,14.0794,248.8206,35,2,200); //
    AddStaticVehicleEx(408,2265.5208,-2335.7126,14.0915,95.2029,35,2,200); //
    AddStaticVehicleEx(408,2315.8528,-2307.0100,14.0893,134.9706,35,2,200); //
    AddStaticVehicleEx(408,2303.3162,-2295.4124,14.0685,213.0804,35,2,200); //

    BOX2 = TextDrawCreate(1.000000, 430.000000, "~n~");
    TextDrawUseBox(BOX2, 1);
	TextDrawBoxColor(BOX2, 0x000000cc);
	TextDrawTextSize(BOX2, 720.000000, 300.000000);
	TextDrawAlignment(BOX2, 0);
	TextDrawBackgroundColor(BOX2, 0x000000ff);
	TextDrawFont(BOX2, 3);
	TextDrawLetterSize(BOX2, 1.700000, 5.299999);
	TextDrawColor(BOX2, 0x000000ff);
	TextDrawSetOutline(BOX2, 1);
	TextDrawSetShadow(BOX2, 1);
	TextDrawSetProportional(BOX2, 1);
	
	BUSBOX = TextDrawCreate(5.000000, 120.000000, "~n~");
    TextDrawUseBox(BUSBOX, 1);
	TextDrawBoxColor(BUSBOX, 0x000000cc);
	TextDrawTextSize(BUSBOX, 180.000000, 250.000000);
	TextDrawAlignment(BUSBOX, 0);
	TextDrawBackgroundColor(BUSBOX, 0x000000ff);
	TextDrawFont(BUSBOX, 3);
	TextDrawLetterSize(BUSBOX, 1.700000, 5.699999);
	TextDrawColor(BUSBOX, 0x000000ff);
	TextDrawSetOutline(BUSBOX, 1);
	TextDrawSetShadow(BUSBOX, 1);
	TextDrawSetProportional(BUSBOX, 1);
	
	BBOX = TextDrawCreate(5.000000, 120.000000, "~n~");
    TextDrawUseBox(BBOX, 1);
	TextDrawBoxColor(BBOX, 0x000000cc);
	TextDrawTextSize(BBOX, 180.000000, 250.000000);
	TextDrawAlignment(BBOX, 0);
	TextDrawBackgroundColor(BBOX, 0x000000ff);
	TextDrawFont(BBOX, 3);
	TextDrawLetterSize(BBOX, 1.700000, 5.699999);
	TextDrawColor(BBOX, 0x000000ff);
	TextDrawSetOutline(BBOX, 1);
	TextDrawSetShadow(BBOX, 1);
	TextDrawSetProportional(BBOX, 1);

	CIVBOX = TextDrawCreate(5.000000, 120.000000, "~n~~n~~n~");
    TextDrawUseBox(CIVBOX, 1);
	TextDrawBoxColor(CIVBOX, 0x000000cc);
	TextDrawTextSize(CIVBOX, 170.000000, 250.000000);
	TextDrawAlignment(CIVBOX, 0);
	TextDrawBackgroundColor(CIVBOX, 0x000000ff);
	TextDrawFont(CIVBOX, 3);
	TextDrawLetterSize(CIVBOX, 1.700000, 5.699999);
	TextDrawColor(CIVBOX, 0x000000ff);
	TextDrawSetOutline(CIVBOX, 1);
	TextDrawSetShadow(CIVBOX, 1);
	TextDrawSetProportional(CIVBOX, 1);

	COPBOX = TextDrawCreate(5.000000, 120.000000, "~n~~n~~n~");
    TextDrawUseBox(COPBOX, 1);
	TextDrawBoxColor(COPBOX, 0x000000cc);
	TextDrawTextSize(COPBOX, 180.000000, 250.000000);
	TextDrawAlignment(COPBOX, 0);
	TextDrawBackgroundColor(COPBOX, 0x000000ff);
	TextDrawFont(COPBOX, 3);
	TextDrawLetterSize(COPBOX, 1.700000, 5.699999);
	TextDrawColor(COPBOX, 0x000000ff);
	TextDrawSetOutline(COPBOX, 1);
	TextDrawSetShadow(COPBOX, 1);
	TextDrawSetProportional(COPBOX, 1);
	
	CMDBOX = TextDrawCreate(5.000000, 120.000000, "~n~~n~");
    TextDrawUseBox(CMDBOX, 1);
	TextDrawBoxColor(CMDBOX, 0x000000cc);
	TextDrawTextSize(CMDBOX, 180.000000, 250.000000);
	TextDrawAlignment(CMDBOX, 0);
	TextDrawBackgroundColor(CMDBOX, 0x000000ff);
	TextDrawFont(CMDBOX, 3);
	TextDrawLetterSize(CMDBOX, 1.700000, 5.699999);
	TextDrawColor(CMDBOX, 0x000000ff);
	TextDrawSetOutline(CMDBOX, 1);
	TextDrawSetShadow(CMDBOX, 1);
	TextDrawSetProportional(CMDBOX, 1);
	
	PCBOX = TextDrawCreate(5.000000, 120.000000, "~n~~n~");
    TextDrawUseBox(PCBOX, 1);
	TextDrawBoxColor(PCBOX, 0x000000cc);
	TextDrawTextSize(PCBOX, 210.000000, 300.000000);
	TextDrawAlignment(PCBOX, 0);
	TextDrawBackgroundColor(PCBOX, 0x000000ff);
	TextDrawFont(PCBOX, 3);
	TextDrawLetterSize(PCBOX, 1.700000, 6.299999);
	TextDrawColor(PCBOX, 0x000000ff);
	TextDrawSetOutline(PCBOX, 1);
	TextDrawSetShadow(PCBOX, 1);
	TextDrawSetProportional(PCBOX, 1);
	
	AMMUBOX1 = TextDrawCreate(5.000000, 120.000000, "~n~~n~");
    TextDrawUseBox(AMMUBOX1, 1);
	TextDrawBoxColor(AMMUBOX1, 0x000000cc);
	TextDrawTextSize(AMMUBOX1, 180.000000, 250.000000);
	TextDrawAlignment(AMMUBOX1, 0);
	TextDrawBackgroundColor(AMMUBOX1, 0x000000ff);
	TextDrawFont(AMMUBOX1, 3);
	TextDrawLetterSize(AMMUBOX1, 1.700000, 5.699999);
	TextDrawColor(AMMUBOX1, 0x000000ff);
	TextDrawSetOutline(AMMUBOX1, 1);
	TextDrawSetShadow(AMMUBOX1, 1);
	TextDrawSetProportional(AMMUBOX1, 1);
	
	AMMUBOX2 = TextDrawCreate(5.000000, 120.000000, "~n~~n~~n~");
    TextDrawUseBox(AMMUBOX2, 1);
	TextDrawBoxColor(AMMUBOX2, 0x000000cc);
	TextDrawTextSize(AMMUBOX2, 180.000000, 250.000000);
	TextDrawAlignment(AMMUBOX2, 0);
	TextDrawBackgroundColor(AMMUBOX2, 0x000000ff);
	TextDrawFont(AMMUBOX2, 3);
	TextDrawLetterSize(AMMUBOX2, 1.700000, 5.699999);
	TextDrawColor(AMMUBOX2, 0x000000ff);
	TextDrawSetOutline(AMMUBOX2, 1);
	TextDrawSetShadow(AMMUBOX2, 1);
	TextDrawSetProportional(AMMUBOX2, 1);
	
	MDCBOX = TextDrawCreate(5.000000, 120.000000, "~n~~n~~n~");
    TextDrawUseBox(MDCBOX, 1);
	TextDrawBoxColor(MDCBOX, 0x000000cc);
	TextDrawTextSize(MDCBOX, 180.000000, 250.000000);
	TextDrawAlignment(MDCBOX, 0);
	TextDrawBackgroundColor(MDCBOX, 0x000000ff);
	TextDrawFont(MDCBOX, 3);
	TextDrawLetterSize(MDCBOX, 1.700000, 5.699999);
	TextDrawColor(MDCBOX, 0x000000ff);
	TextDrawSetOutline(MDCBOX, 1);
	TextDrawSetShadow(MDCBOX, 1);
	TextDrawSetProportional(MDCBOX, 1);

	HALLBOX = TextDrawCreate(5.000000, 120.000000, "~n~");
    TextDrawUseBox(HALLBOX, 1);
	TextDrawBoxColor(HALLBOX, 0x000000cc);
	TextDrawTextSize(HALLBOX, 150.000000, 200.000000);
	TextDrawAlignment(HALLBOX, 0);
	TextDrawBackgroundColor(HALLBOX, 0x000000ff);
	TextDrawFont(HALLBOX, 3);
	TextDrawLetterSize(HALLBOX, 1.700000, 5.299999);
	TextDrawColor(HALLBOX, 0x000000ff);
	TextDrawSetOutline(HALLBOX, 1);
	TextDrawSetShadow(HALLBOX, 1);
	TextDrawSetProportional(HALLBOX, 1);

	text6 = TextDrawCreate(7.000000, 123.000000, "~y~Civilian Help");
    TextDrawAlignment(text6, 0);
    TextDrawBackgroundColor(text6, 0x0000ffff);
    TextDrawFont(text6, 1);
    TextDrawLetterSize(text6, 0.299999, 0.900000);
    TextDrawColor(text6, 0xffff00ff);
    TextDrawSetOutline(text6, 1);
    TextDrawSetProportional(text6, 1);
    TextDrawSetShadow(text6, 1);
    
    text43 = TextDrawCreate(7.000000, 123.000000, "~p~Player Color");
    TextDrawAlignment(text43, 0);
    TextDrawBackgroundColor(text43, 0x0000ffff);
    TextDrawFont(text43, 1);
    TextDrawLetterSize(text43, 0.299999, 0.900000);
    TextDrawColor(text43, 0xffff00ff);
    TextDrawSetOutline(text43, 1);
    TextDrawSetProportional(text43, 1);
    TextDrawSetShadow(text43, 1);
    
    text19 = TextDrawCreate(7.000000, 123.000000, " ");
    TextDrawAlignment(text19, 0);
    TextDrawLetterSize(text19, 0.299999, 0.900000);
    TextDrawColor(text19, 0xffff00ff);
    TextDrawSetOutline(text19, 1);
    TextDrawSetProportional(text19, 1);
    TextDrawSetShadow(text19, 1);
        
    text22 = TextDrawCreate(7.000000, 136.000000, "~n~~w~/help [MESSAGE] /w /cw /pc~n~~w~/hit [ID] /hitlist /admins~n~~w~/report [ID] [REASON] /rules~n~~w~/animlist /househelp /GPS /i~n~~w~/blow /blowcar /buyc4 /givecash");
    TextDrawAlignment(text22, 0);
    TextDrawLetterSize(text22, 0.299999, 0.900000);
    TextDrawColor(text22, 0xffff00ff);
    TextDrawSetOutline(text22, 1);
    TextDrawSetProportional(text22, 1);
    TextDrawSetShadow(text22, 1);
    
    text35 = TextDrawCreate(7.000000, 136.000000, "~n~~r~1.~w~Change your skin~n~~r~2.~w~Rob Store");
    
    text26 = TextDrawCreate(7.000000, 136.000000, "~n~~w~/drunk /bomb /slapass~n~~w~/laugh /lookout /robman /lay~n~~w~/crossarms /hide /vomit /eat");
    TextDrawAlignment(text26, 0);
    TextDrawLetterSize(text26, 0.299999, 0.900000);
    TextDrawColor(text26, 0xffff00ff);
    TextDrawSetOutline(text26, 1);
    TextDrawSetProportional(text26, 1);
    TextDrawSetShadow(text26, 1);
    
    text27 = TextDrawCreate(7.000000, 136.000000, "~n~~n~~n~~n~~w~/taichi /deal /crack /smoke~n~~w~/groundsit /chat /dance /wave");
    TextDrawAlignment(text27, 0);
    TextDrawLetterSize(text27, 0.299999, 0.900000);
    TextDrawColor(text27, 0xffff00ff);
    TextDrawSetOutline(text27, 1);
    TextDrawSetProportional(text27, 1);
    TextDrawSetShadow(text27, 1);
    
    text23 = TextDrawCreate(7.000000, 136.000000, "~n~~n~~n~~n~~n~~n~~n~~w~Use ~r~LMB ~w~To Hide~n~~w~Thes Boxes");
    TextDrawAlignment(text23, 0);
    TextDrawLetterSize(text23, 0.299999, 0.900000);
    TextDrawColor(text23, 0xffff00ff);
    TextDrawSetOutline(text23, 1);
    TextDrawSetProportional(text23, 1);
    TextDrawSetShadow(text23, 1);
    
    text20 = TextDrawCreate(7.000000, 123.000000, " ");
    TextDrawAlignment(text20, 0);
    TextDrawLetterSize(text20, 0.299999, 0.900000);
    TextDrawColor(text20, 0xffff00ff);
    TextDrawSetOutline(text20, 1);
    TextDrawSetProportional(text20, 1);
    TextDrawSetShadow(text20, 1);
    
    text44 = TextDrawCreate(7.000000, 123.000000, " ");
    TextDrawAlignment(text44, 0);
    TextDrawLetterSize(text44, 0.299999, 0.900000);
    TextDrawColor(text44, 0xffff00ff);
    TextDrawSetOutline(text44, 1);
    TextDrawSetProportional(text44, 1);
    TextDrawSetShadow(text44, 1);
    
    text45 = TextDrawCreate(7.000000, 123.000000, " ");
    TextDrawAlignment(text45, 0);
    TextDrawLetterSize(text45, 0.299999, 0.900000);
    TextDrawColor(text45, 0xffff00ff);
    TextDrawSetOutline(text45, 1);
    TextDrawSetProportional(text45, 1);
    TextDrawSetShadow(text45, 1);
    
    text11 = TextDrawCreate(7.000000, 123.000000, "~p~~h~Police help");
    TextDrawAlignment(text11, 0);
    TextDrawBackgroundColor(text11, 0x0000ffff);
    TextDrawFont(text11, 1);
    TextDrawLetterSize(text11, 0.299999, 0.900000);
    TextDrawColor(text11, 0xffff00ff);
    TextDrawSetOutline(text11, 1);
    TextDrawSetProportional(text11, 1);
    TextDrawSetShadow(text11, 1);
    
    text18 = TextDrawCreate(7.000000, 123.000000, "Medic help");
    TextDrawAlignment(text18, 0);
    TextDrawBackgroundColor(text18, 0x0000ffff);
    TextDrawFont(text18, 1);
    TextDrawLetterSize(text18, 0.299999, 0.900000);
    TextDrawColor(text18, 0xffff00ff);
    TextDrawSetOutline(text18, 1);
    TextDrawSetProportional(text18, 1);
    TextDrawSetShadow(text18, 1);
    
    text21 = TextDrawCreate(7.000000, 123.000000, "General Commands:");
    TextDrawAlignment(text21, 0);
    TextDrawBackgroundColor(text21, 0xF6F600AA);
    TextDrawFont(text21, 1);
    TextDrawLetterSize(text21, 0.499999, 1.200000);
    TextDrawColor(text21, 0x0000ffff);
    TextDrawSetOutline(text21, 1);
    TextDrawSetProportional(text21, 1);
    TextDrawSetShadow(text21, 1);
    
    text37 = TextDrawCreate(7.000000, 123.000000, "Ammunation:");
    TextDrawAlignment(text37, 0);
    TextDrawBackgroundColor(text37, 0xF6F600AA);
    TextDrawFont(text37, 1);
    TextDrawLetterSize(text37, 0.499999, 1.200000);
    TextDrawColor(text37, 0x0000ffff);
    TextDrawSetOutline(text37, 1);
    TextDrawSetProportional(text37, 1);
    TextDrawSetShadow(text37, 1);
    
    text25 = TextDrawCreate(7.000000, 123.000000, "Available Animation:");
    TextDrawAlignment(text25, 0);
    TextDrawBackgroundColor(text25, 0xF6F600AA);
    TextDrawFont(text25, 1);
    TextDrawLetterSize(text25, 0.499999, 1.200000);
    TextDrawColor(text25, 0x0000ffff);
    TextDrawSetOutline(text25, 1);
    TextDrawSetProportional(text25, 1);
    TextDrawSetShadow(text25, 1);
    
    text36 = TextDrawCreate(7.000000, 123.000000, "Binco:");
    TextDrawAlignment(text36, 0);
    TextDrawBackgroundColor(text36, 0xF6F600AA);
    TextDrawFont(text36, 1);
    TextDrawLetterSize(text36, 0.499999, 1.200000);
    TextDrawColor(text36, 0x0000ffff);
    TextDrawSetOutline(text36, 1);
    TextDrawSetProportional(text36, 1);
    TextDrawSetShadow(text36, 1);

    
    text38 = TextDrawCreate(7.000000, 136.000000, "~n~~r~1.~w~Buy Weapons~n~~r~2.~w~Rob Ammunation");
    text39 = TextDrawCreate(7.000000, 136.000000, "~n~~r~1.~w~Deagle~n~~r~2.~w~Tec9~n~~r~3.~w~Mp5~n~~r~4.~w~M4~n~~r~5.~w~Sniper Rifle~n~~r~6.~w~Molotov~n~~n~~w~Use ~r~LMB ~w~ to hide thes~n~~w~boxes");

    text7 = TextDrawCreate(7.000000, 136.000000, "~w~As A Civilian, Your Job Is~n~~w~To Rob Banks, Casinos, Stores,~n~~w~People, And Get Away From~n~~w~The~b~Police~w~.");
    TextDrawAlignment(text7, 0);
    TextDrawLetterSize(text7, 0.299999, 0.900000);
    TextDrawColor(text7, 0xffff00ff);
    TextDrawSetOutline(text7, 1);
    TextDrawSetProportional(text7, 1);
    TextDrawSetShadow(text7, 1);
    
    text41 = TextDrawCreate(7.000000, 136.000000, "~w~White Player: Innocent Civilian.~n~~y~~h~Yellow Player: Suspect Civilian.~n~~y~Orange Player: Wanted Criminal.~n~~r~~h~Red Player: Most Wanted Criminal.~n~~b~Blue Player: Cop/Law Enforcement.");
    TextDrawAlignment(text41, 0);
    TextDrawLetterSize(text41, 0.299999, 0.900000);
    TextDrawColor(text41, 0xffff00ff);
    TextDrawSetOutline(text41, 1);
    TextDrawSetProportional(text41, 1);
    TextDrawSetShadow(text41, 1);
    
    text42 = TextDrawCreate(7.000000, 136.000000, "~n~~n~~n~~n~~n~~g~Green Player: Army/Law Enforcement.~n~~p~~h~Pink Player: Medic~n~~n~~w~Type ~r~LMB ~w~to hide thes boxes!");
    TextDrawAlignment(text42, 0);
    TextDrawLetterSize(text42, 0.299999, 0.900000);
    TextDrawColor(text42, 0xffff00ff);
    TextDrawSetOutline(text42, 1);
    TextDrawSetProportional(text42, 1);
    TextDrawSetShadow(text42, 1);
    
    text24 = TextDrawCreate(7.000000, 125.000000, "~r~1.~w~Mission in LS~n~~r~2.~w~Mission in SF~n~~r~3.~w~Mission in LV");
    TextDrawAlignment(text24, 0);
    TextDrawLetterSize(text24, 0.299999, 0.900000);
    TextDrawColor(text24, 0xffff00ff);
    TextDrawSetOutline(text24, 1);
    TextDrawSetProportional(text24, 1);
    TextDrawSetShadow(text24, 1);
    
    text40 = TextDrawCreate(7.000000, 125.000000, "~r~1.~w~Mission in LS~n~~r~2.~w~Mission in SF~n~~r~3.~w~Mission in LV");
    TextDrawAlignment(text40, 0);
    TextDrawLetterSize(text40, 0.299999, 0.900000);
    TextDrawColor(text40, 0xffff00ff);
    TextDrawSetOutline(text40, 1);
    TextDrawSetProportional(text40, 1);
    TextDrawSetShadow(text40, 1);

    text10 = TextDrawCreate(7.000000, 136.000000, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~/rob~n~~n~~w~For A List Of Commands,~n~~w~Type ~y~/cmds~w~.~n~~n~~w~Press ~r~LMB ~w~to Hide Thes~n~~w~Boxes");
    TextDrawAlignment(text10, 0);
    TextDrawLetterSize(text10, 0.299999, 0.900000);
    TextDrawColor(text10, 0xffff00ff);
    TextDrawSetOutline(text10, 1);
    TextDrawSetProportional(text10, 1);
    TextDrawSetShadow(text10, 1);

    text8 = TextDrawCreate(7.000000, 136.000000, "~n~~n~~n~~n~~w~You Can Also Take On Legal~n~~w~Jobs.Such As Truck Driving,~n~~w~Bus Driving And Taxi Driving~n~~n~~w~/hits, /hit, /blow, /blowcar");
    TextDrawAlignment(text8, 0);
    TextDrawLetterSize(text8, 0.299999, 0.900000);
    TextDrawColor(text8, 0xffff00ff);
    TextDrawSetOutline(text8, 1);
    TextDrawSetProportional(text8, 1);
    TextDrawSetShadow(text8, 1);
    
    
    text12 = TextDrawCreate(7.000000, 136.000000, "~w~As A ~b~Police Officer~w~, Your Job~n~~w~Is To Arrest ~r~Red ~w~Player, And~n~~w~Ticket ~y~Yellow ~w~Players Using~n~~w~/arrest and /ticket. You Must~n~~r~Never~w~Shoot Yellow Or White~n~~w~Players.");
    TextDrawAlignment(text12, 0);
    TextDrawLetterSize(text12, 0.299999, 0.900000);
    TextDrawColor(text12, 0xffff00ff);
    TextDrawSetOutline(text12, 1);
    TextDrawSetProportional(text12, 1);
    TextDrawSetShadow(text12, 1);

    text13 = TextDrawCreate(7.000000, 136.000000, "~n~~n~~n~~n~~n~~n~~n~~w~/arrest, /ticket, /taze, /cm");
    TextDrawAlignment(text13, 0);
    TextDrawLetterSize(text13, 0.299999, 0.900000);
    TextDrawColor(text13, 0xffff00ff);
    TextDrawSetOutline(text13, 1);
    TextDrawSetProportional(text13, 1);
    TextDrawSetShadow(text13, 1);

    text14 = TextDrawCreate(7.000000, 136.000000, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~For A Full List Of Commands,~n~~w~Type /cmds~n~~n~Use ~r~LMB ~w~To Hide Thes Boxes.");
    TextDrawAlignment(text14, 0);
    TextDrawLetterSize(text14, 0.299999, 0.900000);
    TextDrawColor(text14, 0xffff00ff);
    TextDrawSetOutline(text14, 1);
    TextDrawSetProportional(text14, 1);
    TextDrawSetShadow(text14, 1);
    
    text15 = TextDrawCreate(7.000000, 136.000000, "~w~As A ~p~~h~Medic~w~,Your Job Is~n~~w~To Heal Injured Players.~n~~w~Enter An Amblulance, And~n~~w~Wait For A Call.");
    TextDrawAlignment(text15, 0);
    TextDrawLetterSize(text15, 0.299999, 0.900000);
    TextDrawColor(text15, 0xffff00ff);
    TextDrawSetOutline(text15, 1);
    TextDrawSetProportional(text15, 1);
    TextDrawSetShadow(text15, 1);
    
    text16 = TextDrawCreate(7.000000, 136.000000, "~n~~n~~n~~n~~n~~w~/heal, /healme~n~~n~~w~For A Full List Of Commands,~n~~w~Type ~y~/cmds~w~.");
    TextDrawAlignment(text16, 0);
    TextDrawLetterSize(text16, 0.299999, 0.900000);
    TextDrawColor(text16, 0xffff00ff);
    TextDrawSetOutline(text16, 1);
    TextDrawSetProportional(text16, 1);
    TextDrawSetShadow(text16, 1);
    
    text17 = TextDrawCreate(7.000000, 136.000000, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~Use ~r~LMB ~w~To Hide Thes Boxes.");
    TextDrawAlignment(text17, 0);
    TextDrawLetterSize(text17, 0.299999, 0.900000);
    TextDrawColor(text17, 0xffff00ff);
    TextDrawSetOutline(text17, 1);
    TextDrawSetProportional(text17, 1);
    TextDrawSetShadow(text17, 1);
    
    text9 = TextDrawCreate(30.000000, 123.000000, "City Hall");
    TextDrawAlignment(text9, 0);
    TextDrawBackgroundColor(text9, 0x0000ffff);
    TextDrawFont(text9, 1);
    TextDrawLetterSize(text9, 0.299999, 0.900000);
    TextDrawColor(text9, 0xffff00ff);
    TextDrawSetOutline(text9, 1);
    TextDrawSetProportional(text9, 1);
    TextDrawSetShadow(text9, 1);

    //Text Draw WELCOME
	BOX = TextDrawCreate(1.000000, 300.000000, "~n~~n~~n~~n~~n~~n~");
	Welcome = TextDrawCreate(277.000000, 305.000000, "Welcome");
	text1 = TextDrawCreate(300.000000, 320.000000, "to");
	text2 = TextDrawCreate(200.000000, 335.000000, "RuNix's Cops And Robbers");
	text3 = TextDrawCreate(1.000000, 430.000000, "WwW.RsS-ro.CoM");
	TextDrawUseBox(BOX, 1);
	TextDrawBoxColor(BOX, 0x000000cc);
	TextDrawTextSize(BOX, 720.000000, 200.000000);
	TextDrawAlignment(BOX, 0);
	TextDrawAlignment(Welcome, 0);
	TextDrawAlignment(text1, 0);
	TextDrawAlignment(text2, 0);
	TextDrawAlignment(text3, 0);
	TextDrawBackgroundColor(BOX, 0x000000ff);
	TextDrawBackgroundColor(Welcome, 0x00ff0066);
	TextDrawBackgroundColor(text1, 0xF6F600AA);
	TextDrawBackgroundColor(text2, 0xF6F600AA);
	TextDrawBackgroundColor(text3, 0x0000ffff);
	TextDrawFont(BOX, 3);
	TextDrawLetterSize(BOX, 1.000000, 3.299999);
	TextDrawFont(Welcome, 0);
	TextDrawLetterSize(Welcome, 0.599999, 1.600000);
	TextDrawFont(text1, 0);
	TextDrawLetterSize(text1, 0.599999, 1.600000);
	TextDrawFont(text2, 0);
	TextDrawLetterSize(text2, 0.599999, 1.600000);
	TextDrawFont(text3, 1);
	TextDrawLetterSize(text3, 0.399999, 1.400000);
	TextDrawColor(BOX, 0x000000ff);
	TextDrawColor(Welcome, 0xff0000ff);
	TextDrawColor(text1, 0x0000AFAA);
	TextDrawColor(text2, 0xF67F00AA);
	TextDrawColor(text3, 0xffff00ff);
	TextDrawSetOutline(BOX, 1);
	TextDrawSetOutline(Welcome, 1);
	TextDrawSetOutline(text1, 1);
	TextDrawSetOutline(text2, 1);
	TextDrawSetOutline(text3, 1);
	TextDrawSetProportional(BOX, 1);
	TextDrawSetProportional(BOX2, 1);
	TextDrawSetProportional(Welcome, 1);
	TextDrawSetProportional(text1, 1);
	TextDrawSetProportional(text2, 1);
	TextDrawSetProportional(text3, 1);
	TextDrawSetShadow(BOX, 1);
	TextDrawSetShadow(Welcome, 1);
	TextDrawSetShadow(text1, 1);
	TextDrawSetShadow(text2, 1);
	TextDrawSetShadow(text3, 1);
   	return true;
}

SetPlayerTeamFromClass(playerid, classid)
{
	if(classid >= 0 && classid <= 5) gTeam[playerid] = COP;
	else if(classid == 6) gTeam[playerid] = FBI;
	else if(classid == 7) gTeam[playerid] = SWAT;
	else if(classid == 8) gTeam[playerid] = ARMY;
	else if(classid >= 9 && classid <= 11) gTeam[playerid] = Medic;
	else if(classid >= 12 && classid <= 30) gTeam[playerid] = CIVILIAN;
}

public OnPlayerRequestClass(playerid, classid)
{
    SetPlayerTeamFromClass(playerid, classid);
    Spawned[playerid] = 0;
    if(classid >= 0 && classid <= 5)
	{
		GameTextForPlayer(playerid, "~b~Police Officer", 3000, 3);
		SetPlayerInterior(playerid, 1);
	 	SetPlayerPos(playerid, 214.7581,-41.0411,1002.0234);
	    SetPlayerFacingAngle(playerid, 94.0821);
	    SetPlayerCameraPos(playerid, 212.6498,-41.0299,1002.0234);
        SetPlayerCameraLookAt(playerid, 214.7581,-41.0411,1002.0234);
	}else if(classid == 6)
	{
		GameTextForPlayer(playerid, "~b~FBI", 3000, 3);
		SetPlayerInterior(playerid, 1);
	 	SetPlayerPos(playerid, 214.7581,-41.0411,1002.0234);
	    SetPlayerFacingAngle(playerid, 94.0821);
	    SetPlayerCameraPos(playerid, 212.6498,-41.0299,1002.0234);
        SetPlayerCameraLookAt(playerid, 214.7581,-41.0411,1002.0234);
	}else if(classid == 7)
	{
		GameTextForPlayer(playerid, "~b~SWAT", 3000, 3);
		SetPlayerInterior(playerid, 1);
	 	SetPlayerPos(playerid, 214.7581,-41.0411,1002.0234);
	    SetPlayerFacingAngle(playerid, 94.0821);
	    SetPlayerCameraPos(playerid, 212.6498,-41.0299,1002.0234);
        SetPlayerCameraLookAt(playerid, 214.7581,-41.0411,1002.0234);
	}
	else if(classid == 8)
	{
		GameTextForPlayer(playerid, "~g~Army", 3000, 3);
		SetPlayerInterior(playerid, 1);
	 	SetPlayerPos(playerid, 214.7581,-41.0411,1002.0234);
	    SetPlayerFacingAngle(playerid, 94.0821);
	    SetPlayerCameraPos(playerid, 212.6498,-41.0299,1002.0234);
        SetPlayerCameraLookAt(playerid, 214.7581,-41.0411,1002.0234);
	}
	else if(classid >= 9 && classid <= 11)
 	{
	 	GameTextForPlayer(playerid, "~p~~h~Medic", 3000, 3);
	 	SetPlayerInterior(playerid, 1);
	 	SetPlayerPos(playerid, 214.7581,-41.0411,1002.0234);
	    SetPlayerFacingAngle(playerid, 94.0821);
	    SetPlayerCameraPos(playerid, 212.6498,-41.0299,1002.0234);
        SetPlayerCameraLookAt(playerid, 214.7581,-41.0411,1002.0234);
	}
	if(classid >= 12 && classid <= 30)
	{
		GameTextForPlayer(playerid, "~w~Civilian", 3000, 3);
		SetPlayerInterior(playerid, 1);
	 	SetPlayerPos(playerid, 214.7581,-41.0411,1002.0234);
	    SetPlayerFacingAngle(playerid, 94.0821);
	    SetPlayerCameraPos(playerid, 212.6498,-41.0299,1002.0234);
        SetPlayerCameraLookAt(playerid, 214.7581,-41.0411,1002.0234);
	}
	return true;
}

public OnPlayerConnect(playerid)
{
	new string[256], playername[MAX_PLAYER_NAME], file[255];
    GetPlayerName(playerid, playername, sizeof(playername));
    format(string, sizeof(string), "%s has joined RuNix's Cops And Robbers!", playername);
    Announce(string);
    IsPlayerLogged[playerid] = 0;
	RecentlyRobbed[playerid] = 0;
	SelectBM[playerid] = 0;
	AMMUBOX[playerid] = 0;
	CSKINZ[playerid] = 0;
	CSKINU[playerid] = 0;
	CSKIN[playerid] = 0;
	CHALLBOX[playerid] = 0;
	IcmdCar[playerid][CarcmdI] = -1;
	IsSpawned[playerid] =0;
	GPSTimer[playerid] = 0;
	HaveGPS[playerid] = false;
	Muted[playerid] = 0;
	AccountInfo[playerid][aLevel] = 0;
	//Text Draws
	TextDrawShowForPlayer(playerid, BOX);
	TextDrawShowForPlayer(playerid, Welcome);
	TextDrawShowForPlayer(playerid, text1);
	TextDrawShowForPlayer(playerid, text2);
	TextDrawShowForPlayer(playerid, text3);
	HaveTicket[playerid] = false;
	new Registre[250];
	format(file, sizeof(file), "%s.runix", playername);
	if(fexist(file))
	{
	GetPlayerName(playerid,playername,MAX_PLAYER_NAME);
    format(Registre,sizeof(Registre),"Welcome back %s!\n\nPlease Login to continue!",playername);
    ShowPlayerDialog(playerid,LoginName,DIALOG_STYLE_INPUT,"Login",Registre,"Login","Ban");
    }
    else
    if(!fexist(file))
	{
	GetPlayerName(playerid,playername,MAX_PLAYER_NAME);
    format(Registre,sizeof(Registre),"Welcome %s!\n\nPlease register to continue!",playername);
    ShowPlayerDialog(playerid,RegisterName,DIALOG_STYLE_INPUT,"Register",Registre,"Register","Ban");
    }
	return true;
}

public OnPlayerDisconnect(playerid, reason)
{
	new string[256], playername[MAX_PLAYER_NAME], file[256];
	PlayersOnline--;
    GetPlayerName(playerid, playername, sizeof(playername));
    format(file, sizeof(file), "%s.runix", playername);
    format(string, sizeof(string), "%s has left RuNix's Cops and Robbers!", playername);
    Announce(string);
    IsPlayerLogged[playerid] = 0;
    RecentlyRobbed[playerid] = 0;
    dini_IntSet(file, "Money", GetPlayerMoney(playerid));
    dini_IntSet(file, "Score", GetPlayerScore(playerid));
    dini_IntSet(file, "Admin", AccountInfo[playerid][aLevel]);
    dini_IntSet(file, "WantedLevel", GetPlayerWantedLevel(playerid));
    if(IcmdCar[playerid][CarcmdI] != -1) UcideMasinileBoule(IcmdCar[playerid][CarcmdI]);
	if(playerInJob[playerid]>0)
	{
	terminarMission(playerid);
	}
	OnTaxiAsPassenger[playerid]=-1;
	if 	(playerInMiniMission2[playerid]>0)
	    {
		terminarMission2(playerid);
		}
	OnBusAsPassenger[playerid]=-1;
	SelectBM[playerid] = 0;
	AMMUBOX[playerid] = 0;
	CSKINZ[playerid] = 0;
	CSKINU[playerid] = 0;
	CSKIN[playerid] = 0;
	CHALLBOX[playerid] = 0;
	AccountInfo[playerid][aLevel] = 0;
	if(HaveGPS[playerid]) {
    KillTimer(GPSTimer[playerid]);
    HaveGPS[playerid] = false;
    GPSTimer[playerid] = 0;
    }
    if(hit[playerid] > 0)
	{
		format(string, sizeof(string), "The hit on %s (%i) has been cancelled (disconnected)", ReturnPlayerName(playerid), playerid);
		SendClientMessageToAll(COLOR_MSG, string);
		hit[playerid] = 0;
	}
	return true;
}

public OnPlayerSpawn(playerid)
{
    HideDraw(playerid);
    SetPlayerInterior(playerid, 0);
	//LV MAP ICON
    SetPlayerMapIcon(playerid, 0, 2019.5000, 1913.0396, 12.3114, 52, 0); // Bank
    SetPlayerMapIcon(playerid, 5, 2287.0925, 2431.6145, 10.8203, 30, 0); // LVPD
    SetPlayerMapIcon(playerid, 6, 1607.4465, 1816.1157, 10.8203, 22, 0); // Hospital
    SetPlayerMapIcon(playerid, 7, 2412.5625, 1123.8337, 10.8203, 56, 0); // City Hall
    SetPlayerMapIcon(playerid, 8, 2085.6697, 2074.0100, 11.0547, 12, 0); // RuNix's Dildos
    SetPlayerMapIcon(playerid, 9, 2172.1233, 1398.1210, 11.0625, 55, 0); // Car Shop
    SetPlayerMapIcon(playerid, 10, 2113.2854, 1333.5800, 10.8203, 49, 0); // BulletXT's Bar
    SetPlayerMapIcon(playerid, 11, 2101.8979, 2257.3718, 11.0234, 45, 0); // Binco
    SetPlayerMapIcon(playerid, 12, 2249.1479, 960.5301, 10.8130, 45, 0); // ZIP
    SetPlayerMapIcon(playerid, 13, 2032.1550, 2162.4448, 10.8203, 8, 0); // Bomb Shop
    SetPlayerMapIcon(playerid, 14, 2184.2126, 2295.6084, 10.8203, 45, 0); // SubUrban
    SetPlayerMapIcon(playerid, 15, 2491.5000, 918.4912, 11.0234, 24, 0); // Drug Point
    SetPlayerMapIcon(playerid, 42, 2019.3212,1007.7536,10.8203, 44, 0); // D4ragoni
    SetPlayerMapIcon(playerid, 43, 2196.9517,1677.1399,12.3672, 25, 0); // Caligulas
    //LS MAP ICON
    SetPlayerMapIcon(playerid, 16, 1122.7067,-2037.0416,69.8942, 24, 0); // Drug Point
    SetPlayerMapIcon(playerid, 17, 1857.1792,-1874.2761,13.4829, 8, 0); // Bomb Shop
    SetPlayerMapIcon(playerid, 18, 2244.4128,-1665.5463,15.4766, 45, 0); // Binco
    SetPlayerMapIcon(playerid, 19, 2309.8811,-1643.7646,14.8270, 49, 0); // Bar
    SetPlayerMapIcon(playerid, 20, 1481.1427,-1771.6808,18.7958, 56, 0); // City Hall
    SetPlayerMapIcon(playerid, 21, 1172.8318,-1323.2954,15.4001, 22, 0); // Hospital
    SetPlayerMapIcon(playerid, 22, 1555.0673,-1675.6428,16.1953, 30, 0); // LSPD
    SetPlayerMapIcon(playerid, 23, 1411.7141,-1700.0085,13.5395, 52, 0); // Bank
    SetPlayerMapIcon(playerid, 24, 1703.9697,-1469.9948,13.5469, 55, 0); // Car Shop
    SetPlayerMapIcon(playerid, 25, 499.6478,-1360.3167,16.3421, 45, 0); // SubUrban
    SetPlayerMapIcon(playerid, 26, 822.3297,-1757.5181,13.6484, 45, 0); // SubUrban 2
    SetPlayerMapIcon(playerid, 27, 2139.1853,-1743.2207,13.5524, 45, 0); // ZIP
    //SF MAP ICON
    SetPlayerMapIcon(playerid, 28, -2719.4172,-319.2030,7.8438, 24, 0); // Drug Point
    SetPlayerMapIcon(playerid, 29, -2032.9038,161.4297,29.0461, 8, 0); // Bomb Shop
    SetPlayerMapIcon(playerid, 30, -2655.0779,640.0289,14.4545, 22, 0); // Hospital
    SetPlayerMapIcon(playerid, 31, -1605.4486,710.8713,13.8672, 30, 0); // SFPD
    SetPlayerMapIcon(playerid, 32, -1581.2535,867.2552,7.6953, 52, 0); // Bank
    SetPlayerMapIcon(playerid, 33, -1946.0483,273.3452,35.4739, 55, 0); // Car Shop
    SetPlayerMapIcon(playerid, 34, -2490.9307,-142.7729,25.6172, 45, 0); // SubUrban
    SetPlayerMapIcon(playerid, 35, -1881.1808,823.0976,35.1770, 45, 0); // ZIP
    //ATM-uri
    SetPlayerMapIcon(playerid, 1,2172.8428, 1416.7751, 11.0625, 52, 0); // ATM
    SetPlayerMapIcon(playerid, 2,2110.5188, 2060.4219, 10.8203, 52, 0); // ATM
    SetPlayerMapIcon(playerid, 3,2134.0115, 2379.3159, 10.8203, 52, 0); // ATM
    SetPlayerMapIcon(playerid, 4,2455.5420, 1681.4117, 11.0234, 52, 0); // ATM
    SetPlayerMapIcon(playerid, 36,-2635.9067,1398.5020,7.0938, 52, 0); // ATM
    SetPlayerMapIcon(playerid, 37,-1575.3977,902.4458,7.5610, 52, 0); // ATM
    SetPlayerMapIcon(playerid, 38,-2434.0908,516.8967,30.3705, 52, 0); // ATM
    SetPlayerMapIcon(playerid, 39,852.7184,-1760.9111,13.5491, 52, 0); // ATM
    SetPlayerMapIcon(playerid, 40,1243.2965,-1561.1505,13.5545, 52, 0); // ATM
    SetPlayerMapIcon(playerid, 41,1787.9928,-1592.2491,13.4870, 52, 0); // ATM

    TextDrawHideForPlayer(playerid, BOX);
	TextDrawHideForPlayer(playerid, Welcome);
	TextDrawHideForPlayer(playerid, text1);
	TextDrawHideForPlayer(playerid, text2);
	TextDrawHideForPlayer(playerid, text3);
	TextDrawShowForPlayer(playerid, BOX2);
	IsSpawned[playerid] =1;

	new playername[MAX_PLAYER_NAME];
	GetPlayerName(playerid, playername, sizeof(playername));

	if(gTeam[playerid] == CIVILIAN)
	{
		SetPlayerColor(playerid, WHITE);
		new file[256];
		new name[MAX_PLAYER_NAME];
	    GetPlayerName(playerid, name, sizeof(name));
	    format(file, sizeof(file), "%s.runix", name);
		new position = random(sizeof(CivilianSpawn));
		SetPlayerPos(playerid, CivilianSpawn[position][0], CivilianSpawn[position][1], CivilianSpawn[position][2]);
		SetPlayerFacingAngle(playerid, CivilianSpawn[position][3]);
		SetCameraBehindPlayer(playerid);
		TextDrawShowForPlayer(playerid, CIVBOX);
		TextDrawShowForPlayer(playerid, text6);
		TextDrawShowForPlayer(playerid, text7);
		TextDrawShowForPlayer(playerid, text8);
		TextDrawShowForPlayer(playerid, text10);
		TogglePlayerControllable(playerid, true);
		GivePlayerWeapon(playerid,5,1);
		if(PlayerSkin[playerid] >= 0)
		{
		SetPlayerSkin(playerid,dini_Int(file, "Skin"));
		}
	}
	else if(gTeam[playerid] == Medic)
	{
		SetPlayerColor(playerid, PINK);
		new position = random(sizeof(MedicSpawn));
		SetPlayerPos(playerid, MedicSpawn[position][0], MedicSpawn[position][1], MedicSpawn[position][2]);
		SetPlayerFacingAngle(playerid, MedicSpawn[position][3]);
		SetCameraBehindPlayer(playerid);
		TextDrawShowForPlayer(playerid, MDCBOX);
		TextDrawShowForPlayer(playerid, text15);
		TextDrawShowForPlayer(playerid, text16);
		TextDrawShowForPlayer(playerid, text17);
		TextDrawShowForPlayer(playerid, text18);
		GivePlayerWeapon(playerid,41,1000);
	}
	else if(gTeam[playerid] == COP)
	{
	    new position = random(sizeof(CopSpawn));
		SetPlayerColor(playerid, LIGHT_BLUE);
		SetPlayerPos(playerid, CopSpawn[position][0], CopSpawn[position][1], CopSpawn[position][2]);
		SetPlayerFacingAngle(playerid, CopSpawn[position][3]);
		SetCameraBehindPlayer(playerid);
		TextDrawShowForPlayer(playerid, COPBOX);
		TextDrawShowForPlayer(playerid, text11);
		TextDrawShowForPlayer(playerid, text12);
		TextDrawShowForPlayer(playerid, text13);
		TextDrawShowForPlayer(playerid, text14);
		GivePlayerWeapon(playerid,25,100);
		GivePlayerWeapon(playerid,22,100);
	}
	else if(gTeam[playerid] == SWAT || gTeam[playerid] == FBI)
	{
        SetPlayerColor(playerid, BLUE);
		new position = random(sizeof(SFSpawn));
		SetPlayerPos(playerid, SFSpawn[position][0], SFSpawn[position][1], SFSpawn[position][2]);
		SetPlayerFacingAngle(playerid, SFSpawn[position][3]);
		SetCameraBehindPlayer(playerid);
		TextDrawShowForPlayer(playerid, COPBOX);
		TextDrawShowForPlayer(playerid, text11);
		TextDrawShowForPlayer(playerid, text12);
		TextDrawShowForPlayer(playerid, text13);
		TextDrawShowForPlayer(playerid, text14);
		GivePlayerWeapon(playerid,29,400);
		GivePlayerWeapon(playerid,22,100);
		GivePlayerWeapon(playerid,31,300);
	}
	else if(gTeam[playerid] == ARMY)
	{
        SetPlayerColor(playerid, GREEN);
		new position = random(sizeof(ARMYSpawn));
		SetPlayerPos(playerid, ARMYSpawn[position][0], ARMYSpawn[position][1], ARMYSpawn[position][2]);
		SetPlayerFacingAngle(playerid, ARMYSpawn[position][3]);
		SetCameraBehindPlayer(playerid);
		TextDrawShowForPlayer(playerid, COPBOX);
		TextDrawShowForPlayer(playerid, text11);
		TextDrawShowForPlayer(playerid, text12);
		TextDrawShowForPlayer(playerid, text13);
		TextDrawShowForPlayer(playerid, text14);
		GivePlayerWeapon(playerid,29,400);
		GivePlayerWeapon(playerid,22,100);
		GivePlayerWeapon(playerid,31,300);
	}
	Spawned[playerid] = 1;
	return true;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    HideDraw(playerid);
    SendDeathMessage(killerid, playerid, reason);
	SetPlayerColor(playerid, GREY);
	SetPlayerWantedLevel(playerid, 0);

    if(reason <= 46 && hit[playerid] != 0)
	{
		new string[256];
		format(string, sizeof(string), "%s (%i) killed %s (%i) and recieved $%i for a completed hit", ReturnPlayerName(killerid), killerid, ReturnPlayerName(playerid), playerid, hit[playerid]);
		SendClientMessageToAll(COLOR_MSG, string);
		GivePlayerMoney(killerid, hit[playerid]);
		GivePlayerMoney(hiter[playerid], GetPlayerMoney(hiter[playerid])-hit[playerid]);
		hit[playerid] = 0;
	}
	else if(hit[playerid] != 0)
	{
		new string[256];
		format(string, sizeof(string), "The hit on %s (%i) has been cancelled (died)", ReturnPlayerName(playerid), playerid);
		SendClientMessageToAll(COLOR_MSG, string);
		hit[playerid] = 0;
	}

	IsSpawned[playerid] =0;
	if(HaveGPS[playerid]) {
    KillTimer(GPSTimer[playerid]);
    HaveGPS[playerid] = false;
    GPSTimer[playerid] = 0;
    }
	return true;
}

public OnPlayerText(playerid, text[])
{
    if(text[0] == '@' && AccountInfo[playerid][aLevel] > 0)
	{
	    new string[256], name[60], message[350];
	    GetPlayerName(playerid, name, 60);
	    strmid(string, text, 1, strlen(text), 256);
	    format(message, 350, "%s: %s", name, string);
		for(new i;i<MAX_PLAYERS;i++)
		{
		    if(AccountInfo[i][aLevel] > 0)
		    {
		        SendClientMessage(i, COLOR_GREEN, message);
			}
		}
		return 0;
	}
	if(Muted[playerid] == 1)
	{
	    SendClientMessage(playerid, COLOR_RED, "You are muted, you cannot chat!");
		return 0;
	}
    new rname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, rname, sizeof(rname));
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	if(text[0] == '1' && SelectBM[playerid] == 1)
	{
	MissionIni2(playerid);
	HideDraw(playerid);
	SelectBM[playerid] = 0;
    InBusMission[playerid] = 1;
    currentcheckpoint[playerid] = 0;
    SetPlayerRaceCheckpoint(playerid,0,buslscps[0][0],buslscps[0][1],buslscps[0][2],buslscps[1][0],buslscps[1][1],buslscps[1][2],7);
    SendClientMessage(playerid,LIGHT_BLUE,"Go to the red markers on the map to reach the bus stop!");
    return false;
	}
	if(text[0] == '1' && SelectTM[playerid] == 1)
	{
	HideDraw(playerid);
	SelectTM[playerid] = 0;
    InTrashMission[playerid] = 1;
    currentcheckpoint[playerid] = 0;
    SetPlayerRaceCheckpoint(playerid,0,trashls[0][0],trashls[0][1],trashls[0][2],trashls[1][0],trashls[1][1],trashls[1][2],7);
    SendClientMessage(playerid,LIGHT_BLUE,"Go to the red markers on the map to reach the stop!");
    return false;
	}
	if(text[0] == '2' && SelectTM[playerid] == 1)
	{
	HideDraw(playerid);
	SelectTM[playerid] = 0;
    InTrashMission[playerid] = 2;
    currentcheckpoint[playerid] = 0;
    SetPlayerRaceCheckpoint(playerid,0,trashsf[0][0],trashsf[0][1],trashsf[0][2],trashsf[1][0],trashsf[1][1],trashsf[1][2],7);
    SendClientMessage(playerid,LIGHT_BLUE,"Go to the red markers on the map to reach the stop!");
    return false;
	}
	if(text[0] == '3' && SelectTM[playerid] == 1)
	{
	HideDraw(playerid);
	SelectTM[playerid] = 0;
    InTrashMission[playerid] = 3;
    currentcheckpoint[playerid] = 0;
    SetPlayerRaceCheckpoint(playerid,0,trashlv[0][0],trashlv[0][1],trashlv[0][2],trashlv[1][0],trashlv[1][1],trashlv[1][2],7);
    SendClientMessage(playerid,LIGHT_BLUE,"Go to the red markers on the map to reach the stop!");
    return false;
	}
	if(text[0] == '1' && AMMUBOX[playerid] == 1)
	{
	if(CPS_IsPlayerInCheckpoint(playerid, cpammu) || CPS_IsPlayerInCheckpoint(playerid, cpammu2) || CPS_IsPlayerInCheckpoint(playerid, cpammu3) || CPS_IsPlayerInCheckpoint(playerid, cpammu4) || CPS_IsPlayerInCheckpoint(playerid, cpammu5))
	{
	HideDraw(playerid);
	TextDrawShowForPlayer(playerid, text39);
	TextDrawShowForPlayer(playerid, AMMUBOX2);
	AMMUBOX[playerid] = 2;
	}else SendClientMessage(playerid, ERROR, "You're not at Ammunation.");
	return false;
	}
	if(text[0] == '2' && AMMUBOX[playerid] == 1)
	{
	if(CPS_IsPlayerInCheckpoint(playerid, cpammu))
	    {
            AMMUBOX[playerid] = 0;
	        if(gTeam[playerid] != COP && gTeam[playerid] != Medic && gTeam[playerid] != SWAT && gTeam[playerid] != FBI && gTeam[playerid] != ARMY)
			{
				    if(AmmuRecentlyRobbed == 0)
					{
						new chances = random(500);
						if(chances >= 0 && chances <= 400)
						{
						    new string[250];
			           		RobAmmu[playerid] = 20;
			           		AmmuRecentlyRobbed = 150;
			           		format(string, sizeof(string), "%s[ID:%d] started a robbery at Ammunation!", name, playerid);
			           		Announce(string);
			           		return true;
						}
						else if(chances >= 401 && chances <= 500)
						{
						    new copmsg[250];
						    SendClientMessage(playerid, ERROR, "Your attempt to rob Ammunation failed!");
						    SendClientMessage(playerid, ERROR, "The Police are on their way to the store.");
							SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 5);
							format(copmsg, sizeof(copmsg), "[HQ] %s attemped to rob Ammunation.", name);
							SendRadioMessageToCops(copmsg);
							AmmuRecentlyRobbed = 100;
							return true;
						}
					}
					else if(AmmuRecentlyRobbed > 0) return SendClientMessage(playerid, ERROR, "Ammunation has been robbed recently!");
			}
			else SendClientMessage(playerid, ERROR, "Your team cannot rob anything.");
  		}
	if(CPS_IsPlayerInCheckpoint(playerid, cpammu2))
	    {
            AMMUBOX[playerid] = 0;
	        if(gTeam[playerid] != COP && gTeam[playerid] != Medic && gTeam[playerid] != SWAT && gTeam[playerid] != FBI && gTeam[playerid] != ARMY)
			{
				    if(Ammu2RecentlyRobbed == 0)
					{
						new chances = random(500);
						if(chances >= 0 && chances <= 400)
						{
						    new string[250];
			           		RobAmmu2[playerid] = 20;
			           		Ammu2RecentlyRobbed = 150;
			           		format(string, sizeof(string), "%s[ID:%d] started a robbery at Ammunation!", name, playerid);
			           		Announce(string);
			           		return true;
						}
						else if(chances >= 401 && chances <= 500)
						{
						    new copmsg[250];
						    SendClientMessage(playerid, ERROR, "Your attempt to rob Ammunation failed!");
						    SendClientMessage(playerid, ERROR, "The Police are on their way to the store.");
							SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 5);
							format(copmsg, sizeof(copmsg), "[HQ] %s attemped to rob Ammunation.", name);
							SendRadioMessageToCops(copmsg);
							Ammu2RecentlyRobbed = 100;
							return true;
						}
					}
					else if(Ammu2RecentlyRobbed > 0) return SendClientMessage(playerid, ERROR, "Ammunation has been robbed recently!");
			}
			else SendClientMessage(playerid, ERROR, "Your team cannot rob anything.");
  		}
	if(CPS_IsPlayerInCheckpoint(playerid, cpammu3))
	        {
            AMMUBOX[playerid] = 0;
	        if(gTeam[playerid] != COP && gTeam[playerid] != Medic && gTeam[playerid] != SWAT && gTeam[playerid] != FBI && gTeam[playerid] != ARMY)
			{
				    if(Ammu3RecentlyRobbed == 0)
					{
						new chances = random(500);
						if(chances >= 0 && chances <= 400)
						{
						    new string[250];
			           		RobAmmu3[playerid] = 20;
			           		Ammu3RecentlyRobbed = 150;
			           		format(string, sizeof(string), "%s[ID:%d] started a robbery at Ammunation!", name, playerid);
			           		Announce(string);
			           		return true;
						}
						else if(chances >= 401 && chances <= 500)
						{
						    new copmsg[250];
						    SendClientMessage(playerid, ERROR, "Your attempt to rob Ammunation failed!");
						    SendClientMessage(playerid, ERROR, "The Police are on their way to the store.");
							SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 5);
							format(copmsg, sizeof(copmsg), "[HQ] %s attemped to rob Ammunation.", name);
							SendRadioMessageToCops(copmsg);
							Ammu3RecentlyRobbed = 100;
							return true;
						}
					}
					else if(Ammu3RecentlyRobbed > 0) return SendClientMessage(playerid, ERROR, "Ammunation has been robbed recently!");
			}
			else SendClientMessage(playerid, ERROR, "Your team cannot rob anything.");
  		}
	if(CPS_IsPlayerInCheckpoint(playerid, cpammu4))
	        {
            AMMUBOX[playerid] = 0;
	        if(gTeam[playerid] != COP && gTeam[playerid] != Medic && gTeam[playerid] != SWAT && gTeam[playerid] != FBI && gTeam[playerid] != ARMY)
			{
				    if(Ammu4RecentlyRobbed == 0)
					{
						new chances = random(500);
						if(chances >= 0 && chances <= 400)
						{
						    new string[250];
			           		RobAmmu4[playerid] = 20;
			           		Ammu4RecentlyRobbed = 150;
			           		format(string, sizeof(string), "%s[ID:%d] started a robbery at Ammunation!", name, playerid);
			           		Announce(string);
			           		return true;
						}
						else if(chances >= 401 && chances <= 500)
						{
						    new copmsg[250];
						    SendClientMessage(playerid, ERROR, "Your attempt to rob Ammunation failed!");
						    SendClientMessage(playerid, ERROR, "The Police are on their way to the store.");
							SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 5);
							format(copmsg, sizeof(copmsg), "[HQ] %s attemped to rob Ammunation.", name);
							SendRadioMessageToCops(copmsg);
							Ammu4RecentlyRobbed = 100;
							return true;
						}
					}
					else if(Ammu4RecentlyRobbed > 0) return SendClientMessage(playerid, ERROR, "Ammunation has been robbed recently!");
			}
			else SendClientMessage(playerid, ERROR, "Your team cannot rob anything.");
  		}
	if(CPS_IsPlayerInCheckpoint(playerid, cpammu5))
 	{
            AMMUBOX[playerid] = 0;
	        if(gTeam[playerid] != COP && gTeam[playerid] != Medic && gTeam[playerid] != SWAT && gTeam[playerid] != FBI && gTeam[playerid] != ARMY)
			{
				    if(Ammu5RecentlyRobbed == 0)
					{
						new chances = random(500);
						if(chances >= 0 && chances <= 400)
						{
						    new string[250];
			           		RobAmmu5[playerid] = 20;
			           		Ammu5RecentlyRobbed = 150;
			           		format(string, sizeof(string), "%s[ID:%d] started a robbery at Ammunation!", name, playerid);
			           		Announce(string);
			           		return true;
						}
						else if(chances >= 401 && chances <= 500)
						{
						    new copmsg[250];
						    SendClientMessage(playerid, ERROR, "Your attempt to rob Ammunation failed!");
						    SendClientMessage(playerid, ERROR, "The Police are on their way to the store.");
							SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 5);
							format(copmsg, sizeof(copmsg), "[HQ] %s attemped to rob Ammunation.", name);
							SendRadioMessageToCops(copmsg);
							Ammu5RecentlyRobbed = 100;
							return true;
						}
					}
					else if(Ammu5RecentlyRobbed > 0) return SendClientMessage(playerid, ERROR, "Ammunation has been robbed recently!");
			}
			else SendClientMessage(playerid, ERROR, "Your team cannot rob anything.");
	}
	return false;
	}
	if(text[0] == '1' && AMMUBOX[playerid] == 2)
	{
	if(CPS_IsPlayerInCheckpoint(playerid, cpammu) || CPS_IsPlayerInCheckpoint(playerid, cpammu2) || CPS_IsPlayerInCheckpoint(playerid, cpammu3) || CPS_IsPlayerInCheckpoint(playerid, cpammu4) || CPS_IsPlayerInCheckpoint(playerid, cpammu5))
	{
	if(GetPlayerMoney(playerid) > 499)
	{
	GivePlayerMoney(playerid,-500);
	GivePlayerWeapon(playerid,24,10);
	SendClientMessage(playerid,LIGHT_BLUE,"You bought succesfull an Desert Eagle with 10 ammu");
	}else SendClientMessage(playerid, ERROR, "You not have enough money.");
	}else SendClientMessage(playerid, ERROR, "You're not at Ammunation.");
	return false;
	}
	if(text[0] == '2' && AMMUBOX[playerid] == 2)
	{
	if(CPS_IsPlayerInCheckpoint(playerid, cpammu) || CPS_IsPlayerInCheckpoint(playerid, cpammu2) || CPS_IsPlayerInCheckpoint(playerid, cpammu3) || CPS_IsPlayerInCheckpoint(playerid, cpammu4) || CPS_IsPlayerInCheckpoint(playerid, cpammu5))
	{
	if(GetPlayerMoney(playerid) > 899)
	{
	GivePlayerMoney(playerid,-900);
	GivePlayerWeapon(playerid,32,60);
	SendClientMessage(playerid,LIGHT_BLUE,"You bought succesfull an Tec9 with 60 ammu");
	}else SendClientMessage(playerid, ERROR, "You not have enough money.");
	}else SendClientMessage(playerid, ERROR, "You're not at Ammunation.");
	return false;
	}
	if(text[0] == '3' && AMMUBOX[playerid] == 2)
	{
	if(CPS_IsPlayerInCheckpoint(playerid, cpammu) || CPS_IsPlayerInCheckpoint(playerid, cpammu2) || CPS_IsPlayerInCheckpoint(playerid, cpammu3) || CPS_IsPlayerInCheckpoint(playerid, cpammu4) || CPS_IsPlayerInCheckpoint(playerid, cpammu5))
	{
	if(GetPlayerMoney(playerid) > 899)
	{
	GivePlayerMoney(playerid,-900);
	GivePlayerWeapon(playerid,29,60);
	SendClientMessage(playerid,LIGHT_BLUE,"You bought succesfull an MP5 with 60 ammu");
	}else SendClientMessage(playerid, ERROR, "You not have enough money.");
	}else SendClientMessage(playerid, ERROR, "You're not at Ammunation.");
	return false;
	}
	if(text[0] == '4' && AMMUBOX[playerid] == 2)
	{
	if(CPS_IsPlayerInCheckpoint(playerid, cpammu) || CPS_IsPlayerInCheckpoint(playerid, cpammu2) || CPS_IsPlayerInCheckpoint(playerid, cpammu3) || CPS_IsPlayerInCheckpoint(playerid, cpammu4) || CPS_IsPlayerInCheckpoint(playerid, cpammu5))
	{
	if(GetPlayerMoney(playerid) > 1200)
	{
	GivePlayerMoney(playerid,-1200);
	GivePlayerWeapon(playerid,31,60);
	SendClientMessage(playerid,LIGHT_BLUE,"You bought succesfull an M4 with 60 ammu");
	}else SendClientMessage(playerid, ERROR, "You not have enough money.");
	}else SendClientMessage(playerid, ERROR, "You're not at Ammunation.");
	return false;
	}
	if(text[0] == '5' && AMMUBOX[playerid] == 2)
	{
	if(CPS_IsPlayerInCheckpoint(playerid, cpammu) || CPS_IsPlayerInCheckpoint(playerid, cpammu2) || CPS_IsPlayerInCheckpoint(playerid, cpammu3) || CPS_IsPlayerInCheckpoint(playerid, cpammu4) || CPS_IsPlayerInCheckpoint(playerid, cpammu5))
	{
	if(GetPlayerMoney(playerid) > 1200)
	{
	GivePlayerMoney(playerid,-1200);
	GivePlayerWeapon(playerid,34,20);
	SendClientMessage(playerid,LIGHT_BLUE,"You bought succesfull an Sniper Rifle with 20 ammu");
	}else SendClientMessage(playerid, ERROR, "You not have enough money.");
	}else SendClientMessage(playerid, ERROR, "You're not at Ammunation.");
	return false;
	}
	if(text[0] == '6' && AMMUBOX[playerid] == 2)
	{
	if(CPS_IsPlayerInCheckpoint(playerid, cpammu) || CPS_IsPlayerInCheckpoint(playerid, cpammu2) || CPS_IsPlayerInCheckpoint(playerid, cpammu3) || CPS_IsPlayerInCheckpoint(playerid, cpammu4) || CPS_IsPlayerInCheckpoint(playerid, cpammu5))
	{
	if(GetPlayerMoney(playerid) > 2999)
	{
	GivePlayerMoney(playerid,-1999);
	GivePlayerWeapon(playerid,18,3);
	SendClientMessage(playerid,LIGHT_BLUE,"You bought succesfull an Moldov with 3 ammu");
	}else SendClientMessage(playerid, ERROR, "You not have enough money.");
	}else SendClientMessage(playerid, ERROR, "You're not at Ammunation.");
	return false;
	}
	if(text[0] == '1' && CSKIN[playerid] == 1)
	{
	if(CPS_IsPlayerInCheckpoint(playerid, cpbinco))
	{
	if(gTeam[playerid] == CIVILIAN)
	{
	SetPlayerPos(playerid, 218.2430,-98.2941,1005.2578);
	SetPlayerFacingAngle(playerid, 93.6636);
	SetPlayerSkin(playerid,7);
	HideDraw(playerid);
	TogglePlayerControllable(playerid,0);
	SetPlayerCameraPos(playerid, 215.7693,-98.2494,1005.2578);
	SetPlayerCameraLookAt(playerid, 218.2430,-98.2941,1005.2578);
	SendClientMessage(playerid,LIGHT_BLUE,"Type /next for next skin and /select for select skin!");
	CSKIN[playerid] = 2;
	}else SendClientMessage(playerid,ERROR,"You are not Civilian! Only Civilians can change skin");
	}else SendClientMessage(playerid, ERROR, "You're not at Binco.");
	return false;
	}
	if(text[0] == '1' && CSKINZ[playerid] == 1)
	{
	if(CPS_IsPlayerInCheckpoint(playerid, cpzip))
	{
	if(gTeam[playerid] == CIVILIAN)
	{
	SetPlayerPos(playerid, 181.5906,-87.5578,1002.0234);
	SetPlayerFacingAngle(playerid, 100.5187);
	SetPlayerSkin(playerid,7);
	HideDraw(playerid);
	TogglePlayerControllable(playerid,0);
	SetPlayerCameraPos(playerid, 179.6538,-87.7981,1002.0234);
	SetPlayerCameraLookAt(playerid, 181.5906,-87.5578,1002.0234);
	SendClientMessage(playerid,LIGHT_BLUE,"Type /next for next skin and /select for select skin!");
	CSKINZ[playerid] = 2;
	}else SendClientMessage(playerid,ERROR,"You are not Civilian! Only Civilians can change skin");
	}else SendClientMessage(playerid, ERROR, "You're not at Zip.");
	return false;
	}
	if(text[0] == '2' && CSKINZ[playerid] == 1)
	{
	if(CPS_IsPlayerInCheckpoint(playerid, cpzip))
	    {
            CSKINZ[playerid] = 0;
	        if(gTeam[playerid] != COP && gTeam[playerid] != Medic && gTeam[playerid] != SWAT && gTeam[playerid] != FBI && gTeam[playerid] != ARMY)
			{
				    if(ZipRecentlyRobbed == 0)
					{
						new chances = random(500);
						if(chances >= 0 && chances <= 400)
						{
						    new string[250];
			           		RobZip[playerid] = 20;
			           		ZipRecentlyRobbed = 150;
			           		format(string, sizeof(string), "%s[ID:%d] started a robbery at ZIP!", name, playerid);
			           		Announce(string);
			           		return true;
						}
						else if(chances >= 401 && chances <= 500)
						{
						    new copmsg[250];
						    SendClientMessage(playerid, ERROR, "Your attempt to rob ZIP failed!");
						    SendClientMessage(playerid, ERROR, "The Police are on their way to the store.");
							SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 4);
							format(copmsg, sizeof(copmsg), "[HQ] %s attemped to rob ZIP.", name);
							SendRadioMessageToCops(copmsg);
							ZipRecentlyRobbed = 100;
							return true;
						}
					}
					else if(ZipRecentlyRobbed > 0) return SendClientMessage(playerid, ERROR, "ZIP has been robbed recently!");
			}
			else return SendClientMessage(playerid, ERROR, "Your team cannot rob anything.");
  		}
  		else return SendClientMessage(playerid, ERROR, "You're not at ZIP.");
	return false;
	}
	if(text[0] == '1' && CSKINU[playerid] == 1)
	{
	if(CPS_IsPlayerInCheckpoint(playerid, cpurban))
	{
	if(gTeam[playerid] == CIVILIAN)
	{
	SetPlayerPos(playerid, 214.7581,-41.0411,1002.0234);
	SetPlayerFacingAngle(playerid, 94.0821);
	SetPlayerSkin(playerid,7);
	HideDraw(playerid);
	TogglePlayerControllable(playerid,0);
	SetPlayerCameraPos(playerid, 212.6498,-41.0299,1002.0234);
	SetPlayerCameraLookAt(playerid, 214.7581,-41.0411,1002.0234);
	SendClientMessage(playerid,LIGHT_BLUE,"Type /next for next skin and /select for select skin!");
	CSKINU[playerid] = 2;
	}else SendClientMessage(playerid,ERROR,"You are not Civilian! Only Civilians can change skin");
	}else SendClientMessage(playerid, ERROR, "You're not at SubUrban.");
	return false;
	}
	if(text[0] == '2' && CSKINU[playerid] == 1)
	{
	if(CPS_IsPlayerInCheckpoint(playerid, cpurban))
	    {
            CSKINU[playerid] = 0;
	        if(gTeam[playerid] != COP && gTeam[playerid] != Medic && gTeam[playerid] != SWAT && gTeam[playerid] != FBI && gTeam[playerid] != ARMY)
			{
				    if(UrbanRecentlyRobbed == 0)
					{
						new chances = random(500);
						HideDraw(playerid);
						CSKIN[playerid] = 0;
						if(chances >= 0 && chances <= 400)
						{
						    new string[250];
			           		RobUrban[playerid] = 20;
			           		UrbanRecentlyRobbed = 150;
			           		format(string, sizeof(string), "%s[ID:%d] started a robbery at SubUrban!", name, playerid);
			           		Announce(string);
			           		return true;
						}
						else if(chances >= 401 && chances <= 500)
						{
						    new copmsg[250];
						    SendClientMessage(playerid, ERROR, "Your attempt to rob SubUrban failed!");
						    SendClientMessage(playerid, ERROR, "The Police are on their way to the store.");
							SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 1);
							format(copmsg, sizeof(copmsg), "[HQ] %s attemped to rob SubUrban.", name);
							SendRadioMessageToCops(copmsg);
							UrbanRecentlyRobbed = 100;
							return true;
						}
					}
					else if(ZipRecentlyRobbed > 0) return SendClientMessage(playerid, ERROR, "SubUrban has been robbed recently!");
			}
			else return SendClientMessage(playerid, ERROR, "Your team cannot rob anything.");
  		}
  		else return SendClientMessage(playerid, ERROR, "You're not at SubUrban.");
	return false;
	}
	if(text[0] == '2' && CSKIN[playerid] == 1)
	{
	if(CPS_IsPlayerInCheckpoint(playerid, cpbinco))
	    {
            CSKIN[playerid] = 0;
	        if(gTeam[playerid] != COP && gTeam[playerid] != Medic)
			{
				    if(BincoRecentlyRobbed == 0)
					{
						new chances = random(500);
						HideDraw(playerid);
						CSKIN[playerid] = 0;
						if(chances >= 0 && chances <= 400)
						{
						    new string[250];
			           		RobBinco[playerid] = 20;
			           		BincoRecentlyRobbed = 150;
			           		format(string, sizeof(string), "%s[ID:%d] started a robbery at Binco!", name, playerid);
			           		Announce(string);
			           		return true;
						}
						else if(chances >= 401 && chances <= 500)
						{
						    new copmsg[250];
						    SendClientMessage(playerid, ERROR, "Your attempt to rob Binco failed!");
						    SendClientMessage(playerid, ERROR, "The Police are on their way to the store.");
							SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 1);
							format(copmsg, sizeof(copmsg), "[HQ] %s attemped to rob Binco.", name);
							SendRadioMessageToCops(copmsg);
							BincoRecentlyRobbed = 100;
							return true;
						}
					}
					else if(BincoRecentlyRobbed > 0) return SendClientMessage(playerid, ERROR, "Binco has been robbed recently!");
			}
			else return SendClientMessage(playerid, ERROR, "Your team cannot rob anything.");
  		}
  		else return SendClientMessage(playerid, ERROR, "You're not at Binco.");
    return false;
	}
	if(text[0] == '2' && SelectBM[playerid] == 1)
	{
	MissionIni2(playerid);
	HideDraw(playerid);
	SelectBM[playerid] = 0;
    InBusMission[playerid] = 2;
    currentcheckpoint[playerid] = 0;
    SetPlayerRaceCheckpoint(playerid,0,bussfcps[0][0],bussfcps[0][1],bussfcps[0][2],bussfcps[1][0],bussfcps[1][1],bussfcps[1][2],7);
    SendClientMessage(playerid,LIGHT_BLUE,"Go to the red markers on the map to reach the bus stop!");
    return false;
	}
	if(text[0] == '3' && SelectBM[playerid] == 1)
	{
	MissionIni2(playerid);
	HideDraw(playerid);
    InBusMission[playerid] = 3;
    SelectBM[playerid] = 0;
    currentcheckpoint[playerid] = 0;
    SetPlayerRaceCheckpoint(playerid,0,buslvcps[0][0],buslvcps[0][1],buslvcps[0][2],buslvcps[1][0],buslvcps[1][1],buslvcps[1][2],7);
    SendClientMessage(playerid,LIGHT_BLUE,"Go to the red markers on the map to reach the bus stop!");
    return false;
	}
    if(text[0] == '2' && CHALLBOX[playerid] == 1)
	{
        HideDraw(playerid);
        CHALLBOX[playerid] = 0;
	    if(gTeam[playerid] != COP && gTeam[playerid] != Medic)
				{
		            if(HallRecentlyRobbed == 0)
		            {
		                new chances = random(200);
		                if(chances >= 0 && chances <= 150)
		                {
		                    new string[250];
		            		RobHall[playerid] = 20;
		            		TogglePlayerControllable(playerid, true);
		            		HallRecentlyRobbed = 150;
		            		if(CH[playerid] == 1)
		            		{
		            		format(string, sizeof(string), "%s[ID:%d] started a Robbery at the Las Venturas City Hall!", rname, playerid);
			           		Announce(string);
			           		}
			           		if(CH[playerid] == 2)
		            		{
		            		format(string, sizeof(string), "%s[ID:%d] started a Robbery at the Los Santos City Hall!", rname, playerid);
			           		Announce(string);
			           		}
						}
						else
						if(chances >= 151 && chances <= 200)
						{
						    new copmsg[250];
						    GetPlayerName(playerid, name, sizeof(name));
						    SendClientMessage(playerid, ERROR, "Your attempt to rob the City Hall failed!");
						    SendClientMessage(playerid, ERROR, "The Police are on their way to the hall.");
							SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 1);
							if(CH[playerid] == 1)
		            		{
							format(copmsg, sizeof(copmsg), "[HQ] %s attemped to rob the Las Venturas City Hall.", name);
							SendRadioMessageToCops(copmsg);
							}
							if(CH[playerid] == 2)
		            		{
							format(copmsg, sizeof(copmsg), "[HQ] %s attemped to rob the Los Santos City Hall.", name);
							SendRadioMessageToCops(copmsg);
							}
							HallRecentlyRobbed = 100;
							TogglePlayerControllable(playerid, true);
						}
					}
					else if(HallRecentlyRobbed > 0)
					{
						SendClientMessage(playerid, ERROR, "The City Hall has been robbed recently!");
						TogglePlayerControllable(playerid, true);
					}
		} else SendClientMessage(playerid, ERROR, "Your team cannot rob anything."); TogglePlayerControllable(playerid, true);
	    return false;
	}
    if(text[0] == '1' && CHALLBOX[playerid] == 1)
	{
        new string[250];
        new string2[250];
        CHALLBOX[playerid] = 0;
        HideDraw(playerid);
		TextDrawShowForPlayer(playerid, COPBOX);
		TextDrawShowForPlayer(playerid, text19);
		TextDrawShowForPlayer(playerid, text20);
		format(string, sizeof(string),"~r~1.~w~Type F4.~n~~r~2.~w~Kill you self.~n~~r~3.~w~Select your class.");
        format(string2, sizeof(string2),"~n~~n~~n~~n~~w~Use ~r~LMB ~w~To Hide Thes~n~~w~Boxes");
	    TextDrawSetString(text19, string);
	    TextDrawSetString(text20, string2);
		TogglePlayerControllable(playerid, true);
	    return 0;
	}
	if(IsPlayerLogged[playerid] == 0)
	{
	    SendClientMessage(playerid, ERROR, "Login before talking!");
	    return false;
	}
	else if(IsPlayerLogged[playerid] == 1) return true;
	return true;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    new cmd[256], idx, tmp[256], name[MAX_PLAYER_NAME], file[256];
    new giveplayerid;
	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "%s.runix", name);
	cmd = strtok(cmdtext, idx);
	new playermoney;
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];
	new moneys;

	dcmd(taze, 4, cmdtext);
	dcmd(i, 1, cmdtext);
	dcmd(lottohelp,9,cmdtext);
	dcmd(buyticket,9,cmdtext);
	dcmd(mylotto,7,cmdtext);
	dcmd(lottotest,9,cmdtext);
	dcmd(refuel,6,cmdtext);
	dcmd(giveweapon,10,cmdtext);
	dcmd(car,3,cmdtext);
	dcmd(hit, 3, cmdtext);
	
	
	dcmd(kick, 4, cmdtext);
	dcmd(ban, 3, cmdtext);
	dcmd(freeze, 6, cmdtext);
	dcmd(unfreeze, 8, cmdtext);
	dcmd(akill, 5, cmdtext);
	dcmd(mute, 4, cmdtext);
	dcmd(unmute, 6, cmdtext);
	dcmd(admins, 6, cmdtext);
	dcmd(setlevel, 8, cmdtext);
	dcmd(setscore, 8, cmdtext);
	dcmd(jetpack, 7, cmdtext);
	dcmd(slap, 4, cmdtext);
	dcmd(announce, 8, cmdtext);
	dcmd(spec, 4, cmdtext);
	dcmd(specoff, 7, cmdtext);
	dcmd(agivemoney, 10, cmdtext);
	dcmd(goto, 4, cmdtext);
	dcmd(gethere, 7, cmdtext);
	dcmd(ahelp, 5, cmdtext);
	dcmd(report, 6, cmdtext);
	dcmd(sethp, 5, cmdtext);

    if(strcmp(cmd, "/register", true) == 0)
	{
	    tmp = strtok(cmdtext, idx);
	    if(strlen(tmp) == 0) return SendClientMessage(playerid, ERROR, "Use: /register [PASSWORD]");
	    format(file,sizeof(file),"%s.runix", name);
	    if(!fexist(file))
		{
			dini_Create(file);
			dini_IntSet(file, "Password", udb_hash(tmp));
			dini_IntSet(file, "Money", 2500);
			dini_IntSet(file, "Score", 1);
			dini_IntSet(file, "Bank", 1000);
			dini_IntSet(file, "RobSkill", 1);
			dini_IntSet(file, "TerSkill", 1);
			dini_IntSet(file, "Admin", 0);
			dini_IntSet(file, "Warnings", 0);
			dini_IntSet(file, "WantedLevel", 0);
			dini_IntSet(file, "Jail", 0);
			dini_IntSet(file, "RentalOwner", 0);
			dini_IntSet(file, "Drugs", 0);
			dini_IntSet(file, "C4", 0);
			dini_IntSet(file, "Skin", -1);
			SendClientMessage(playerid, GREY, "Thanks for registering!");
			SendClientMessage(playerid, GREY, "You may now login.");
			SendClientMessage(playerid, GREY, "To do so, type: /login [PASSWORD]");
			GameTextForPlayer(playerid, "~r~Registered!", 3000, 1);
		}
		else SendClientMessage(playerid, ERROR, "This account is already registered in our system. Use: /login [PASSWORD]");
		return true;
	}

	if(strcmp(cmd, "/login", true) == 0)
	{
	    new tmp2[256];
	    tmp = strtok(cmdtext, idx);
	    if(strlen(tmp) == 0) return SendClientMessage(playerid, ERROR, "Use: /login [PASSWORD]");
	    else
	    {
			if(IsPlayerLogged[playerid] == 1) return SendClientMessage(playerid, ERROR, "You are already logged in.");
			else
			{
				if(fexist(file))
				{
			    	tmp2 = dini_Get(file, "Password");
				  	if(udb_hash(tmp) != strval(tmp2)) return SendClientMessage(playerid, ERROR, "Wrong password.");
					else
					{
					 	IsPlayerLogged[playerid] = 1;
					 	SetPlayerMoney(playerid, dini_Int(file, "Money"));
					 	SetPlayerScore(playerid, dini_Int(file, "Score"));
						PlayerSkin[playerid] = dini_Int(file,"Skin");
					 	SetPlayerWantedLevel(playerid, dini_Int(file, "WantedLevel"));
						SendClientMessage(playerid, GREY, "You are now logged in. Your status will be saved on your logout.");
						GameTextForPlayer(playerid, "~r~Logged In!", 3000, 1);
					}
				}
				else return SendClientMessage(playerid, ERROR, "This username was not found on our database. Use: /register [PASSWORD]");
			}
		}
		return true;
	}

	if(strcmp(cmd, "/deposit", true) == 0)
	{
		tmp = strtok(cmdtext, idx);
		if(CPS_IsPlayerInCheckpoint(playerid, cpbank))
		{
		    if(BankRecentlyUsed[playerid] == 0)
		    {
				if(strlen(tmp) == 0) return SendClientMessage(playerid, ERROR, "Use: /deposit [AMOUNT]");
				else
				{
				    if(strval(tmp) == 0) return SendClientMessage(playerid, ERROR, "The amount must be higher than 1.");
				    else
				    {
					    if(strval(tmp) > GetPlayerMoney(playerid)) return SendClientMessage(playerid, ERROR, "You do not have this amount.");
					    else
					    {
					        new string[150], string2[150];
					    	SetPlayerBankCash(playerid, GetPlayerBankCash(playerid)+strval(tmp));
					    	SendClientMessage(playerid, GREY, "|_| Bank |_|");
							format(string, sizeof(string), "Amount deposited: $%d", strval(tmp));
					    	format(string2, sizeof(string2), "Current state: $%d", GetPlayerBankCash(playerid));
					    	SendClientMessage(playerid, WHITE, string);
					    	SendClientMessage(playerid, WHITE, string2);
					    	GivePlayerMoney(playerid, -strval(tmp));
					    	printf("%s[ID:%d] deposited $%d. Location: Bank", name, playerid, strval(tmp));
					    	return true;
						}
					}
				}
			}
			else if(BankRecentlyUsed[playerid] >= 1) SendClientMessage(playerid, ERROR, "You have recently robbed the Bank."); return true;
		}
		else return SendClientMessage(playerid, ERROR, "You must be on the Bank to use this command!");
	}

	if(strcmp(cmd, "/withdraw", true) == 0)
	{
    tmp = strtok(cmdtext, idx);
if(CPS_IsPlayerInCheckpoint(playerid, cpbank) || CPS_IsPlayerInCheckpoint(playerid, cpatm1) || CPS_IsPlayerInCheckpoint(playerid, cpatm2) || CPS_IsPlayerInCheckpoint(playerid, cpatm3) || CPS_IsPlayerInCheckpoint(playerid, cpatm4) || CPS_IsPlayerInCheckpoint(playerid, cpatm5) || CPS_IsPlayerInCheckpoint(playerid, cpatm6) || CPS_IsPlayerInCheckpoint(playerid, cpatm7) || CPS_IsPlayerInCheckpoint(playerid, cpatm9) || CPS_IsPlayerInCheckpoint(playerid, cpatm10) || CPS_IsPlayerInCheckpoint(playerid, cpatm11))
		{
		    if(BankRecentlyUsed[playerid] == 0)
		    {
			    if(strlen(tmp) == 0) return SendClientMessage(playerid, ERROR, "Use: /withdraw [AMOUNT]");
			    else
			    {
			        if(strval(tmp) == 0) return SendClientMessage(playerid, ERROR, "The amount must be higher than 1.");
				    else
					{
				        if(GetPlayerBankCash(playerid) < strval(tmp)) return SendClientMessage(playerid, ERROR, "You do not have this amount on your Bank Account.");
				        else
				        {
				            new string[150], string2[150];
				            SetPlayerBankCash(playerid, GetPlayerBankCash(playerid)-strval(tmp));
							SendClientMessage(playerid, GREY, "|_|  Bank |_|");
							format(string, sizeof(string), "Amount withdrawn: $%d", strval(tmp));
							format(string2, sizeof(string2), "Current state: $%d", GetPlayerBankCash(playerid));
							SendClientMessage(playerid, WHITE, string);
							SendClientMessage(playerid, WHITE, string2);
							GivePlayerMoney(playerid, strval(tmp));
							printf("%s[ID:%d] withdrawn $%d. Location: Bank", name, playerid, strval(tmp));
							return true;
						}
					}
				}
			}
			else if(BankRecentlyUsed[playerid] >= 1) SendClientMessage(playerid, ERROR, "You have recently robbed the Bank."); return true;
		}
		else return SendClientMessage(playerid, ERROR, "You must be on the Bank or in an ATM to use this command!");
	}

	if(strcmp(cmdtext, "/state", true) == 0)
	{
if(CPS_IsPlayerInCheckpoint(playerid, cpbank) || CPS_IsPlayerInCheckpoint(playerid, cpatm1) || CPS_IsPlayerInCheckpoint(playerid, cpatm2) || CPS_IsPlayerInCheckpoint(playerid, cpatm3) || CPS_IsPlayerInCheckpoint(playerid, cpatm4) || CPS_IsPlayerInCheckpoint(playerid, cpatm5) || CPS_IsPlayerInCheckpoint(playerid, cpatm6) || CPS_IsPlayerInCheckpoint(playerid, cpatm7) || CPS_IsPlayerInCheckpoint(playerid, cpatm9) || CPS_IsPlayerInCheckpoint(playerid, cpatm10) || CPS_IsPlayerInCheckpoint(playerid, cpatm11))
		{
		    if(BankRecentlyUsed[playerid] == 0)
		    {
				new string[150];
				SendClientMessage(playerid, GREY, "|_|  Bank |_|");
				format(string, sizeof(string), "You currently have $%d on your Bank Account.", GetPlayerBankCash(playerid));
				SendClientMessage(playerid, WHITE, string);
				return true;
			}
			else if(BankRecentlyUsed[playerid] >= 1) SendClientMessage(playerid, ERROR, "You have recently robbed the Bank."); return true;
		}
		else return SendClientMessage(playerid, ERROR, "You must be on the Bank or in an ATM to use this command!");
	}

	if(strcmp(cmd, "/rob", true) == 0)
	{
	    tmp = strtok(cmdtext, idx);
	    if(strlen(tmp) == 0) return SendClientMessage(playerid, ERROR, "Use: /rob [ID]");
	    else
	    {
		    if(IsPlayerSpawned(playerid))
		    {
				if(gTeam[playerid] == CIVILIAN)
				{
				    if(strval(tmp) != playerid)
				    {
						if(!IsPlayerInAnyVehicle(playerid))
						{
						    if(!IsPlayerInAnyVehicle(strval(tmp)))
						    {
						        if(IsPlayerConnected(strval(tmp)))
					        	{
						                if(GetPlayerMoney(strval(tmp) > 0))
						                {
						                    if(GetDistanceBetweenPlayers(playerid, strval(tmp)) <= 8)
						                    {
											    if(RecentlyRobbed[strval(tmp)] == 0)
											    {
												if(GetPlayerMoney(strval(tmp)) > 4999)
												{
												    new string[250], string2[250], string3[250], robbedcash, robbedname[MAX_PLAYER_NAME], robbername[MAX_PLAYER_NAME];
												    robbedcash = random(5000);
												    GetPlayerName(playerid, robbername, sizeof(robbername));
												    GetPlayerName(strval(tmp), robbedname, sizeof(robbedname));
												    format(string, sizeof(string), "You have robbed $%d from %s[ID:%d]", robbedcash, robbedname, strval(tmp));
												    SendClientMessage(playerid, SERVER_COLOR, string);
												    format(string2, sizeof(string2), "%s[ID:%d] has robbed $%d from you!", robbername, playerid, robbedcash);
												    SendClientMessage(strval(tmp), RED, string2);
												    format(string3, sizeof(string3), "[HQ] %s has robbed $%d from %s.", robbername, robbedname, robbedcash);
               									    SendRadioMessageToCops(string3);
													GivePlayerMoney(playerid, robbedcash);
													GivePlayerMoney(strval(tmp), -robbedcash);
													RecentlyRobbed[strval(tmp)] = 60;
													GivePlayerScore(playerid, 1);
													if(gTeam[strval(tmp)] == CIVILIAN)
													{
													SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 2);
													}
													if(gTeam[strval(tmp)] == COP || gTeam[strval(tmp)] == SWAT || gTeam[strval(tmp)] == FBI || gTeam[strval(tmp)] == ARMY || gTeam[strval(tmp)] == Medic)
													{
													SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 5);
													}
													SetPlayerRobbingSkill(playerid, GetPlayerRobbingSkill(playerid)+1);
												    return true;
												}
												else if(GetPlayerMoney(strval(tmp)) < 4999)
												{
													new string[250], recentlyrobber[MAX_PLAYER_NAME];
													GetPlayerName(strval(tmp), recentlyrobber, sizeof(recentlyrobber));
													format(string, sizeof(string), "%s[ID:%d] don't have enought money.", recentlyrobber, strval(tmp));
													return SendClientMessage(playerid, ERROR, string);
												}
												}
												else if(RecentlyRobbed[strval(tmp)] > 0)
												{
													new string[250], recentlyrobber[MAX_PLAYER_NAME];
													GetPlayerName(strval(tmp), recentlyrobber, sizeof(recentlyrobber));
													format(string, sizeof(string), "%s[ID:%d] has been robbed recently. Try again later.", recentlyrobber, strval(tmp));
													return SendClientMessage(playerid, ERROR, string);
												}
											else
											{
												new string[250], faraway[MAX_PLAYER_NAME];
											    GetPlayerName(strval(tmp), faraway, sizeof(faraway));
											    format(string, sizeof(string), "%s[ID:%d] is too far away.", faraway, strval(tmp));
												return SendClientMessage(playerid, ERROR, string);
											}
										}
										else if(GetPlayerMoney(strval(tmp)) == 0)
										{
										    new string[250], poor[MAX_PLAYER_NAME];
										    GetPlayerName(strval(tmp), poor, sizeof(poor));
										    format(string, sizeof(string), "%s[ID:%d] does not have any money.", poor, strval(tmp));
											return SendClientMessage(playerid, ERROR, string);
										}
									}
								}
								else if(!IsPlayerConnected(strval(tmp)))
								{
									new string[250];
									format(string, sizeof(string), "ID %d is not connected.", strval(tmp));
									return SendClientMessage(playerid, ERROR, string);
								}
							}
							else if(IsPlayerInAnyVehicle(strval(tmp)))
							{
							    new string[250], invehicle[MAX_PLAYER_NAME];
							    GetPlayerName(strval(tmp), invehicle, sizeof(invehicle));
								format(string, sizeof(string), "%s[ID:%d] is in a vehicle. You cannot rob him.", invehicle, strval(tmp));
								return SendClientMessage(playerid, ERROR, string);
							}
						}
						else if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, ERROR, "You cannot rob anyone from inside a vehicle.");
					}
					else return SendClientMessage(playerid, ERROR, "You cannot rob yourself.");
				}
				else return SendClientMessage(playerid, ERROR, "Only CIVILIANS can use this command!");
		    }
	    }
	    return 1;
	}
	
	
	if(strcmp(cmd, "/heal", true) == 0)
	{
	    tmp = strtok(cmdtext, idx);
	    new Float:health;
	    if(strlen(tmp) == 0) return SendClientMessage(playerid, ERROR, "Use: /heal [ID]");
	    else
	    {
            GetPlayerHealth(strlen(tmp), health);
		    if(IsPlayerSpawned(playerid))
		    {
				if(gTeam[playerid] == Medic)
				{
                    if(strval(tmp) != playerid)
				    {
						if(!IsPlayerInAnyVehicle(playerid))
						{
						    if(!IsPlayerInAnyVehicle(strval(tmp)))
						    {
						        if(IsPlayerConnected(strval(tmp)))
					        	{
						                if(GetPlayerMoney(strval(tmp) > 499))
						                {
						                    if(GetDistanceBetweenPlayers(playerid, strval(tmp)) <= 3)
						                    {
                                               if(health < 100)
				                               {
												    new string[250], string2[250], healedname[MAX_PLAYER_NAME], medicname[MAX_PLAYER_NAME];
												    GetPlayerName(playerid, medicname, sizeof(medicname));
												    GetPlayerName(strval(tmp), healedname, sizeof(healedname));
												    format(string, sizeof(string), "You have healed from %s[ID:%d]! You give him $ 500!", medicname, playerid);
												    SendClientMessage(strval(tmp), SERVER_COLOR, string);
												    format(string2, sizeof(string2), "You heal %s[ID:%d]! You received $ 500", healedname, strval(tmp));
												    SendClientMessage(playerid, SERVER_COLOR, string2);
													GivePlayerMoney(playerid, 500);
													GivePlayerMoney(strval(tmp), -500);
													SetPlayerHealth(strval(tmp), 100);
													GivePlayerScore(playerid, 1);
												}
				                                else if(health == 100) return SendClientMessage(playerid, ERROR, "You seem OK to me.");
											}
											else
											{
												new string[250], faraway[MAX_PLAYER_NAME];
											    GetPlayerName(strval(tmp), faraway, sizeof(faraway));
											    format(string, sizeof(string), "%s[ID:%d] is too far away.", faraway, strval(tmp));
												return SendClientMessage(playerid, ERROR, string);
											}
										}
										else if(GetPlayerMoney(strval(tmp)) == 0)
										{
										    new string[250], poor[MAX_PLAYER_NAME];
										    GetPlayerName(strval(tmp), poor, sizeof(poor));
										    format(string, sizeof(string), "%s[ID:%d] does not have any money.", poor, strval(tmp));
											return SendClientMessage(playerid, ERROR, string);
										}
									}
								}
								else if(!IsPlayerConnected(strval(tmp)))
								{
									new string[250];
									format(string, sizeof(string), "ID %d is not connected.", strval(tmp));
									return SendClientMessage(playerid, ERROR, string);
								}
							}
							else if(IsPlayerInAnyVehicle(strval(tmp)))
							{
							    new string[250], invehicle[MAX_PLAYER_NAME];
							    GetPlayerName(strval(tmp), invehicle, sizeof(invehicle));
								format(string, sizeof(string), "%s[ID:%d] is in a vehicle. You cannot heal him.", invehicle, strval(tmp));
								return SendClientMessage(playerid, ERROR, string);
							}
						}
						else if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, ERROR, "You cannot heal anyone from inside a vehicle.");
					}
					else return SendClientMessage(playerid, ERROR, "You cannot heal yourself.");
				}
				else return SendClientMessage(playerid, ERROR, "Only Medics can use this command!");
		    }
    return 1;
	}
	if(strcmp(cmd,"/animlist",true)==0)
	{
		HideDraw(playerid);
        TextDrawShowForPlayer(playerid, CMDBOX);
		TextDrawShowForPlayer(playerid, text25);
		TextDrawShowForPlayer(playerid, text26);
		TextDrawShowForPlayer(playerid, text27);
	return 1;
	}
	if(strcmp(cmd, "/arrest", true) == 0 || strcmp(cmd, "/ar", true) == 0)
	{
	new string[250];
    if(IsSpawned[playerid] == 0)
	{
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] != COP && gTeam[playerid] != SWAT && gTeam[playerid] != ARMY && gTeam[playerid] != FBI)
	{
    SendClientMessage(playerid,COLOR_ERROR,"You are not a Law Enforcement officer ");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp))
	{
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /ar (id)");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsNumeric(tmp))
	{
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /ar (id) ID Must be a number");
    return 1;
    }
    if(!IsPlayerConnected(giveplayerid))
	{
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new oname[24];
    new pname[24];
    GetPlayerName(playerid,oname, 24);
	GetPlayerName(giveplayerid, pname, 24);
	if(GetPlayerWantedLevel(giveplayerid) <= 3)
	{
	format(string, sizeof(string), "%s(%d) Does not have a warrant. You cannot arrest a player without a warrant",pname,giveplayerid);
	SendClientMessage(playerid,COLOR_ERROR,string);
    return 1;
    }
    if(IsPlayerInAnyVehicle(playerid))
	{
    SendClientMessage(playerid,COLOR_ERROR,"You cannot arrest a suspect if you are in a car");
    return 1;
    }
    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 10)
	{
    format(string, sizeof(string), "%s(%d) Is too far away. You cannot arrest that player",pname,giveplayerid);
    SendClientMessage(playerid,COLOR_ERROR,string);
    return 1;
    }
    if(IsSpawned[giveplayerid] == 0)
	{
	format(string, sizeof(string), "%s(%d) Is dead. You cannot arrest a dead body",pname,giveplayerid);
    SendClientMessage(playerid,COLOR_ERROR,string);
    return 1;
    }
    SetPlayerVirtualWorld(giveplayerid,0);
    if(GetPlayerWantedLevel(playerid) >=1)
	{
    SendClientMessage(playerid,COLOR_ERROR,"You cannot use this command if you are wanted by the police");
    return 1;
    }
    if(giveplayerid == playerid)
	{
    SendClientMessage(playerid,COLOR_ERROR,"You cannot arrest yourself");
    return 1;
    }
    new spawn = random(sizeof(PrisonSpawn)), string2[250], Float:health, copname[MAX_PLAYER_NAME], arrested[MAX_PLAYER_NAME];
    GetPlayerName(playerid, copname, sizeof(copname));
    GetPlayerName(strval(tmp), arrested, sizeof(arrested));
    GetPlayerHealth(strval(tmp), health);
	SendClientMessage(strval(tmp), GREY, "|_| San Andreas Police Dept. |_|");
	format(string, sizeof(string), "Officer %s has arrested you.", copname);
	SendClientMessage(strval(tmp), WHITE, string);
	ResetPlayerWeapons(strval(tmp));
	SetPlayerPos(strval(tmp), PrisonSpawn[spawn][0], PrisonSpawn[spawn][1], PrisonSpawn[spawn][2]);
	SetPlayerFacingAngle(strval(tmp), PrisonSpawn[spawn][3]);
	SetCameraBehindPlayer(strval(tmp));
	if(GetPlayerWantedLevel(strval(tmp)) >= 4 && GetPlayerWantedLevel(strval(tmp)) <= 5)
	{
	PrisonTime[strval(tmp)] = 60;
	GivePlayerMoney(playerid,25000);
	GivePlayerScore(playerid,1);
	}
	else if(GetPlayerWantedLevel(strval(tmp)) >= 6 && GetPlayerWantedLevel(strval(tmp)) <= 8)
	{
	PrisonTime[strval(tmp)] = 120;
	GivePlayerMoney(playerid,35000);
	GivePlayerScore(playerid,1);
	}
	else if(GetPlayerWantedLevel(strval(tmp)) >= 9 && GetPlayerWantedLevel(playerid) <= 11)
	{
	PrisonTime[strval(tmp)] = 180;
	GivePlayerMoney(playerid,45000);
	GivePlayerScore(playerid,2);
	}
	else if(GetPlayerWantedLevel(strval(tmp)) >= 12 && GetPlayerWantedLevel(strval(tmp)) <= 14)
	{
	PrisonTime[strval(tmp)] = 240;
	GivePlayerMoney(playerid,55000);
	GivePlayerScore(playerid,2);
	}
	else if(GetPlayerWantedLevel(strval(tmp)) >= 15)
	{
	PrisonTime[strval(tmp)] = 300;
	GivePlayerMoney(playerid,65000);
	GivePlayerScore(playerid,3);
	}
	SetPlayerWantedLevel(strval(tmp), 0);
	SetPlayerInterior(strval(tmp),3);
	SetPlayerHealth(strval(tmp),99999);
	TogglePlayerControllable(strval(tmp), true);
	SetPlayerJailed(strval(tmp), true);
	format(string2, sizeof(string2), "Officer %s[ID:%d] arrested %s[ID:%d].", copname, playerid, arrested, strval(tmp));
	Announce(string2);
	if(health <= 90)
	{
    SendClientMessage(strval(tmp), GREY, "|_| San Andreas Police Dept. |_|");
    SendClientMessage(strval(tmp), WHITE, "SAPD has given you some food.");
    SetPlayerHealth(strval(tmp), health+10);
    ApplyAnimation(strval(tmp), "FOOD", "EAT_Burger", 4.0, 0, 0, 0, 0, 0);
	}
    return 1;
    }
    
    if(strcmp(cmd, "/givecash", true) == 0) {
		tmp = strtok(cmdtext, idx);
		new string[256];
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /givecash [playerid] [amount]");
			return 1;
		}
		giveplayerid = strval(tmp);

		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COLOR_WHITE, "USAGE: /givecash [playerid] [amount]");
			return 1;
		}
 		moneys = strval(tmp);

		//printf("givecash_command: %d %d",giveplayerid,moneys);


		if (IsPlayerConnected(giveplayerid)) {
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			playermoney = GetPlayerMoney(playerid);
			if (moneys > 0 && playermoney >= moneys) {
				GivePlayerMoney(playerid, (0 - moneys));
				GivePlayerMoney(giveplayerid, moneys);
				format(string, sizeof(string), "You have sent %s(player: %d), $%d.", giveplayer,giveplayerid, moneys);
				SendClientMessage(playerid, COLOR_YELLOW, string);
				format(string, sizeof(string), "You have recieved $%d from %s(player: %d).", moneys, sendername, playerid);
				SendClientMessage(giveplayerid, COLOR_YELLOW, string);
				printf("%s(playerid:%d) has transfered %d to %s(playerid:%d)",sendername, playerid, moneys, giveplayer, giveplayerid);
			}
			else {
				SendClientMessage(playerid, COLOR_YELLOW, "Invalid transaction amount.");
			}
		}
		else {
				format(string, sizeof(string), "%d is not an active player.", giveplayerid);
				SendClientMessage(playerid, COLOR_YELLOW, string);
			}
		return 1;
	}

    if(strcmp(cmd, "/ticket", true) == 0 || strcmp(cmd, "/tk", true) == 0)
    {
    new string[128];
    if(IsSpawned[playerid] == 0)
	{
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] != COP && gTeam[playerid] != SWAT && gTeam[playerid] != ARMY && gTeam[playerid] != FBI)
	{
    SendClientMessage(playerid,COLOR_ERROR,"You are not Law Enforcement");
    return 1;
    }
    tmp = strtok(cmdtext, idx);
    if(!strlen(tmp)) {
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /tk (id)");
    return 1;
    }
    if(!IsNumeric(tmp))
	{
    SendClientMessage(playerid, COLOR_ERROR, "USAGE: /tk (id) ID Must be a number");
    return 1;
    }
    giveplayerid = strval(tmp);
    if(!IsPlayerConnected(giveplayerid))
	{
    format(string, sizeof(string), "ID (%d) is not an active player", giveplayerid);
    SendClientMessage(playerid, COLOR_ERROR, string);
    return 1;
    }
    new oname[24];
    new pname[24];
    GetPlayerName(playerid,oname, 24);
	GetPlayerName(giveplayerid, pname, 24);
	if(GetPlayerWantedLevel(giveplayerid) == 0)
	{
	format(string, sizeof(string), "%s(%d) Is innocent. You cannot issue a ticket!",pname,giveplayerid);
	SendClientMessage(playerid,COLOR_ERROR,string);
    return 1;
    }

    if(GetDistanceBetweenPlayers(playerid,giveplayerid) > 10)
	{
    format(string, sizeof(string), "%s(%d) Is too far away. You cannot issue a ticket",pname,giveplayerid);
    SendClientMessage(playerid,COLOR_ERROR,string);
    return 1;
    }
    if(GetPlayerWantedLevel(giveplayerid) == 1)
	{
    format(string, sizeof(string), "Officer %s(%d) has give you a ticket. Type /pay for pay! ",oname,playerid);
    SendClientMessage(giveplayerid,LIGHT_BLUE, string);
    format(string, sizeof(string), "~b~Officer ~r~%s(%d)~n~~w~has give you a ticket.~n~~w~Type ~b~/pay ~w~for pay!",oname,playerid);
    GameTextForPlayer(giveplayerid, string,10000, 5);
    ticketmen[giveplayerid] = playerid;
	tkat[giveplayerid] = 1;
	SendClientMessage(playerid,LIGHT_BLUE,"You have give an ticket");
    return 1;
    }
    if(GetPlayerWantedLevel(giveplayerid) == 2)
	{
    format(string, sizeof(string), "Officer %s(%d) has give you a ticket. Type /pay for pay! ",oname,playerid);
    SendClientMessage(giveplayerid,LIGHT_BLUE, string);
    format(string, sizeof(string), "~b~Officer ~r~%s(%d)~n~~w~has give you a ticket.~n~~w~Type ~b~/pay ~w~for pay!",oname,playerid);
    GameTextForPlayer(giveplayerid, string,10000, 5);
    ticketmen[giveplayerid] = playerid;
	tkat[giveplayerid] = 2;
	SendClientMessage(playerid,LIGHT_BLUE,"You have give an ticket");
    return 1;
    }
    if(GetPlayerWantedLevel(giveplayerid) == 3)
	{
    format(string, sizeof(string), "Officer %s(%d) has give you a ticket. Type /pay for pay! ",oname,playerid);
    SendClientMessage(giveplayerid,LIGHT_BLUE, string);
    format(string, sizeof(string), "~b~Officer ~r~%s(%d)~n~~w~has give you a ticket.~n~~w~Type ~b~/pay ~w~for pay!",oname,playerid);
    GameTextForPlayer(giveplayerid, string,10000, 5);
    ticketmen[giveplayerid] = playerid;
	tkat[giveplayerid] = 3;
	SendClientMessage(playerid,LIGHT_BLUE,"You have give an ticket");
    }
    if(GetPlayerWantedLevel(giveplayerid) >= 4)
	{
    format(string, sizeof(string), "~r~%s(%d) ~w~Has a warrant. ~n~~w~You cannot issue a fine.~n~~w~Take the suspect into custody",pname,giveplayerid);
    GameTextForPlayer(playerid, string,10000, 5);
    }
    return 1;
    }

	if(strcmp(cmd, "/pay", true) == 0)
	{
        new oname[24];
        new string[128];
        GetPlayerName(playerid,oname, 24);
        if(tkat[playerid] == 0)
	    {
	    SendClientMessage(playerid,ERROR,"You have no tickets");
	    tkat[playerid] = 0;
		}else
	    if(tkat[playerid] == 1)
	    {
	    if(GetPlayerMoney(playerid) >= 500)
	    {
	    GameTextForPlayer(playerid, "You pay the ticket",4000, 5);
	    format(string, sizeof(string), "~r~%s(%d)~n~~w~has pay the ticket!~n~+500$ and +1score",oname,playerid);
	    GameTextForPlayer(ticketmen[playerid], string,4000, 5);
	    GivePlayerMoney(ticketmen[playerid],500);
		GivePlayerScore(ticketmen[playerid],1);
		GivePlayerMoney(playerid,-500);
		tkat[playerid] = 0;
		SetPlayerWantedLevel(playerid,0);
		}
		}else
		if(tkat[playerid] == 2)
	    {
	    if(GetPlayerMoney(playerid) >= 1500)
	    {
	    GameTextForPlayer(playerid, "You pay the ticket",4000, 5);
	    format(string, sizeof(string), "~r~%s(%d)~n~~w~has pay the ticket!~n~+1500$ and +1score",oname,playerid);
	    GameTextForPlayer(ticketmen[playerid], string,4000, 5);
	    GivePlayerMoney(ticketmen[playerid],1500);
		GivePlayerScore(ticketmen[playerid],1);
		GivePlayerMoney(playerid,-1500);
		tkat[playerid] = 0;
		SetPlayerWantedLevel(playerid,0);
		}
		}else
		if(tkat[playerid] == 3)
	    {
	    if(GetPlayerMoney(playerid) >= 2500)
	    {
	    GameTextForPlayer(playerid, "You pay the ticket",4000, 5);
	    format(string, sizeof(string), "~r~%s(%d)~n~~w~has pay the ticket!~n~+2500$ and +2score",oname,playerid);
	    GameTextForPlayer(ticketmen[playerid], string,4000, 5);
	    GivePlayerMoney(ticketmen[playerid],2500);
		GivePlayerScore(ticketmen[playerid],2);
		GivePlayerMoney(playerid,-2500);
		tkat[playerid] = 0;
		SetPlayerWantedLevel(playerid,0);
		}
		}else
		if(tkat[playerid] > 3)
	    {
	    SendClientMessage(playerid,ERROR,"You have no tickets");
	    tkat[playerid] = 0;
		}
		return 1;
	}

	if(strcmp(cmdtext, "/robzip", true) == 0)
	{
	    if(CPS_IsPlayerInCheckpoint(playerid, cpzip))
	    {
	        if(gTeam[playerid] != COP && gTeam[playerid] != Medic)
			{
				    if(ZipRecentlyRobbed == 0)
					{
						new chances = random(500);
						if(chances >= 0 && chances <= 400)
						{
						    new string[250];
			           		RobZip[playerid] = 20;
			           		ZipRecentlyRobbed = 250;
			           		format(string, sizeof(string), "%s[ID:%d] started a robbery at ZIP!", name, playerid);
			           		Announce(string);
			           		return true;
						}
						else if(chances >= 401 && chances <= 500)
						{
						    new copmsg[250];
						    SendClientMessage(playerid, ERROR, "Your attempt to rob ZIP failed!");
						    SendClientMessage(playerid, ERROR, "The Police are on their way to the store.");
							SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 4);
							format(copmsg, sizeof(copmsg), "[HQ] %s attemped to rob ZIP.", name);
							SendRadioMessageToCops(copmsg);
							ZipRecentlyRobbed = 250;
							return true;
						}
					}
					else if(ZipRecentlyRobbed > 0) return SendClientMessage(playerid, ERROR, "ZIP has been robbed recently!");
			}
			else return SendClientMessage(playerid, ERROR, "Your team cannot rob anything.");
  		}
  		else return SendClientMessage(playerid, ERROR, "You're not at ZIP.");
	}

	if(strcmp(cmdtext, "/roburban", true) == 0)
	{
	    if(CPS_IsPlayerInCheckpoint(playerid, cpurban))
	    {
	        if(gTeam[playerid] != COP && gTeam[playerid] != Medic)
			{
				    if(UrbanRecentlyRobbed == 0)
					{
						new chances = random(500);
						if(chances >= 0 && chances <= 400)
						{
						    new string[250];
			           		RobUrban[playerid] = 20;
			           		UrbanRecentlyRobbed = 250;
			           		format(string, sizeof(string), "%s[ID:%d] started a robbery at SubUrban!", name, playerid);
			           		Announce(string);
			           		return true;
						}
						else if(chances >= 401 && chances <= 500)
						{
						    new copmsg[250];
						    SendClientMessage(playerid, ERROR, "Your attempt to rob SubUrban failed!");
						    SendClientMessage(playerid, ERROR, "The Police are on their way to the store.");
							SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 4);
							format(copmsg, sizeof(copmsg), "[HQ] %s attemped to rob SubUrban.", name);
							SendRadioMessageToCops(copmsg);
							UrbanRecentlyRobbed = 250;
							return true;
						}
					}
					else if(ZipRecentlyRobbed > 0) return SendClientMessage(playerid, ERROR, "SubUrban has been robbed recently!");
			}
			else return SendClientMessage(playerid, ERROR, "Your team cannot rob anything.");
  		}
  		else return SendClientMessage(playerid, ERROR, "You're not at SubUrban.");
	}

	if(strcmp(cmdtext, "/robatm", true) == 0)
	{
	    if(CPS_IsPlayerInCheckpoint(playerid, cpatm1) || CPS_IsPlayerInCheckpoint(playerid, cpatm2) || CPS_IsPlayerInCheckpoint(playerid, cpatm3) || CPS_IsPlayerInCheckpoint(playerid, cpatm4) || CPS_IsPlayerInCheckpoint(playerid, cpatm5) || CPS_IsPlayerInCheckpoint(playerid, cpatm6) || CPS_IsPlayerInCheckpoint(playerid, cpatm7) || CPS_IsPlayerInCheckpoint(playerid, cpatm9) || CPS_IsPlayerInCheckpoint(playerid, cpatm10) || CPS_IsPlayerInCheckpoint(playerid, cpatm11))
	    {
			if(ATMRecentlyRobbed == 0)
			{
				if(gTeam[playerid] != COP && gTeam[playerid] != Medic && gTeam[playerid] != FBI && gTeam[playerid] != SWAT && gTeam[playerid] != FBI && gTeam[playerid] != ARMY)
				{
				    if(!IsPlayerInAnyVehicle(playerid))
				    {
					        new chances = random(100);
					        if(chances >= 0 && chances <= 60)
					        {
					            new cash = random(42562), robbername[MAX_PLAYER_NAME], robbermsg[250], copmsg[250];
					            ATMRecentlyRobbed = 150;
					            GivePlayerMoney(playerid, cash);
								GivePlayerScore(playerid, 1);
								GetPlayerName(playerid, robbername, sizeof(robbername));
								SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 4);
								format(robbermsg, sizeof(robbermsg), "You robbed the ATM. You got $%d. Watch out for the police!", cash);
								format(copmsg, sizeof(copmsg), "[HQ] %s has robbed $%d from an ATM Machine. Location: %s", robbername, cash, ReturnPlayerZone(playerid));
								SendRadioMessageToCops(copmsg);
								SendClientMessage(playerid, WHITE, robbermsg);
								GivePlayerScore(playerid, 1);
								printf("%s[ID:%d] robbed $%d from an ATM.", name, playerid, cash);
								return true;
							}
							else if(chances >= 61 && chances <= 100)
							{
								SendClientMessage(playerid, ERROR, "You couldn't rob any money this time. Try again later.");
								ATMRecentlyRobbed = 100;
								printf("%s[ID:%d] failed to rob an ATM.", name, playerid);
								return true;
							}
					}
					else return SendClientMessage(playerid, ERROR, "You cannot rob an ATM from inside a vehicle.");
				}
				else return SendClientMessage(playerid, ERROR, "Your team cannot rob ATMs.");
			}
			else if(ATMRecentlyRobbed > 0) return SendClientMessage(playerid, ERROR, "The ATM network has been robbed recently.");
	    }
	    else return SendClientMessage(playerid, ERROR, "You must be on an ATM checkpoint to rob it.");
	}

	if(strcmp(cmdtext, "/robbank", true) == 0)
	{
	    if(CPS_IsPlayerInCheckpoint(playerid, cpbank))
	    {
	        if(gTeam[playerid] != COP && gTeam[playerid] != Medic && gTeam[playerid] != SWAT &&  gTeam[playerid] != FBI && gTeam[playerid] != ARMY)
			{
				    if(BankRecentlyRobbed == 0)
					{
						new chances = random(1000);
						if(chances >= 0 && chances <= 350)
						{
						    new string[250];
			           		RobBank[playerid] = 60;
			           		BankRecentlyRobbed = 100;
			           		if(BK[playerid] == 2)
			           		{
			           		format(string, sizeof(string), "%s[ID:%d] started a Robbery at Bank! Location : Los Santos / Commerce", name, playerid);
			           		Announce(string);
			           		}
			           		if(BK[playerid] == 3)
			           		{
			           		format(string, sizeof(string), "%s[ID:%d] started a Robbery at Bank! Location : San Fierro / DownTown", name, playerid);
			           		Announce(string);
			           		}
			           		if(BK[playerid] == 1)
			           		{
			           		format(string, sizeof(string), "%s[ID:%d] started a Robbery at Bank! Location : Las Venturas / The Visage", name, playerid);
			           		Announce(string);
			           		}
			           		BankRecentlyUsed[playerid] = 60;
			           		return true;
						}
						else if(chances >= 351 && chances <= 1000)
						{
						    new copmsg[250];
						    if(BK[playerid] == 2)
			           		{
						    SendClientMessage(playerid, ERROR, "Your attempt to rob Los Santos Bank failed!");
						    }
						    if(BK[playerid] == 3)
			           		{
						    SendClientMessage(playerid, ERROR, "Your attempt to rob San Fierro Bank failed!");
						    }
						    if(BK[playerid] == 1)
			           		{
						    SendClientMessage(playerid, ERROR, "Your attempt to rob Las Venturas Bank failed!");
						    }
						    SendClientMessage(playerid, ERROR, "The Police are on their way to the Bank.");
							SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 5);
							if(BK[playerid] == 2)
			           		{
							format(copmsg, sizeof(copmsg), "[HQ] %s attemped to rob Bank. Location : Los Santos / Commerce", name);
							SendRadioMessageToCops(copmsg);
							}
							if(BK[playerid] == 3)
			           		{
							format(copmsg, sizeof(copmsg), "[HQ] %s attemped to rob Bank. Location : San Fierro / DownTown", name);
							SendRadioMessageToCops(copmsg);
							}
							if(BK[playerid] == 1)
			           		{
							format(copmsg, sizeof(copmsg), "[HQ] %s attemped to rob Bank. Location : Las Venturas / The Visage", name);
							SendRadioMessageToCops(copmsg);
							}
							BankRecentlyRobbed = 200;
							BankRecentlyUsed[playerid] = 60;
							return true;
						}
					}
					else if(BankRecentlyRobbed > 0) return SendClientMessage(playerid, ERROR, "RuNix's Intl. Bank has been robbed recently!");
			}
			else return SendClientMessage(playerid, ERROR, "Your team cannot rob anything.");
  		}
  		else return SendClientMessage(playerid, ERROR, "You're not in the Bank.");
	}
	
	if(strcmp(cmdtext, "/robcasino", true) == 0)
	{
	    if(CPS_IsPlayerInCheckpoint(playerid, cp4Dragons))
	    {
	        if(gTeam[playerid] != COP && gTeam[playerid] != Medic && gTeam[playerid] != SWAT &&  gTeam[playerid] != FBI && gTeam[playerid] != ARMY)
			{
				    if(D4RecentlyRobbed == 0)
					{
						new chances = random(500);
						if(chances >= 0 && chances <= 400)
						{
						    new string[250];
			           		RobD4[playerid] = 60;
			           		D4RecentlyRobbed = 150;
			           		format(string, sizeof(string), "%s[ID:%d] started a robbery at 4Dragons Casino!", name, playerid);
			           		Announce(string);
			           		return true;
						}
						else if(chances >= 401 && chances <= 500)
						{
						    new copmsg[250];
						    SendClientMessage(playerid, ERROR, "Your attempt to rob 4Dragons Casino failed!");
						    SendClientMessage(playerid, ERROR, "The Police are on their way to the Casino.");
							SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 5);
							format(copmsg, sizeof(copmsg), "[HQ] %s attemped to rob 4Dragons Casino.", name);
							SendRadioMessageToCops(copmsg);
							D4RecentlyRobbed = 100;
							return true;
						}
					}
					else if(D4RecentlyRobbed > 0) return SendClientMessage(playerid, ERROR, "Ammunation has been robbed recently!");
			}
			else SendClientMessage(playerid, ERROR, "Your team cannot rob anything.");
  		}
		if(CPS_IsPlayerInCheckpoint(playerid, cpcaligulas))
	    {
	        if(gTeam[playerid] != COP && gTeam[playerid] != Medic && gTeam[playerid] != SWAT &&  gTeam[playerid] != FBI && gTeam[playerid] != ARMY)
			{
				    if(CaRecentlyRobbed == 0)
					{
						new chances = random(500);
						if(chances >= 0 && chances <= 400)
						{
						    new string[250];
			           		RobCa[playerid] = 60;
			           		CaRecentlyRobbed = 150;
			           		format(string, sizeof(string), "%s[ID:%d] started a robbery at Caligulas Casino!", name, playerid);
			           		Announce(string);
			           		return true;
						}
						else if(chances >= 401 && chances <= 500)
						{
						    new copmsg[250];
						    SendClientMessage(playerid, ERROR, "Your attempt to rob Caligulas Casino failed!");
						    SendClientMessage(playerid, ERROR, "The Police are on their way to the Casino.");
							SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 5);
							format(copmsg, sizeof(copmsg), "[HQ] %s attemped to rob Caligulas Casino.", name);
							SendRadioMessageToCops(copmsg);
							CaRecentlyRobbed = 100;
							return true;
						}
					}
					else if(CaRecentlyRobbed > 0) return SendClientMessage(playerid, ERROR, "Caligulas has been robbed recently!");
			}
			else SendClientMessage(playerid, ERROR, "Your team cannot rob anything.");
  		}
	return 1;
	}

	if(strcmp(cmdtext, "/buyc4", true) == 0)
	{
	    if(CPS_IsPlayerInCheckpoint(playerid, cpbombshop) || CPS_IsPlayerInCheckpoint(playerid, cplsbombshop) || CPS_IsPlayerInCheckpoint(playerid, cpsfbombshop))
	    {
		    if(GetPlayerC4Amount(playerid) <= 2)
		    {
				if(GetPlayerMoney(playerid) >= 1000)
				{
				    new string[250];
        			SetPlayerC4Amount(playerid, GetPlayerC4Amount(playerid)+1);
				    GivePlayerMoney(playerid, -1000);
				    SendClientMessage(playerid, GREY, "|_| C4 Bought! |_|");
				    format(string, sizeof(string), "You bought a C4 block. You now carry %d block(s).", GetPlayerC4Amount(playerid));
				    SendClientMessage(playerid, WHITE, string);
				    return true;
				}
				else if(GetPlayerMoney(playerid) <= 999) return SendClientMessage(playerid, ERROR, "You do not have $1000 to buy a C4 block.");
			}
			else if(GetPlayerC4Amount(playerid) == 3) return SendClientMessage(playerid, ERROR, "You have enough blocks for now. (3 Blocks)");
		}
		else return SendClientMessage(playerid, ERROR, "You are not in the Bomb Shop.");
	}

	if(strcmp(cmd, "/blow", true) == 0)
	{
	    tmp = strtok(cmdtext, idx);
	    if(strlen(tmp) == 0) return SendClientMessage(playerid, ERROR, "Use: /blow [ID]");
	    if(gTeam[playerid] == CIVILIAN)
	    {
		    if(GetPlayerC4Amount(playerid) > 0)
		    {
				if(playerid != strval(tmp))
				{
				    if(GetDistanceBetweenPlayers(playerid, strval(tmp)) <= 4)
				    {
				        if(IsPlayerSpawned(playerid))
				        {
				            if(IsPlayerSpawned(strval(tmp)))
				            {
				                if(!IsPlayerInAnyVehicle(playerid))
				                {
				                    if(!IsPlayerInAnyVehicle(strval(tmp)))
				                    {
				                        new terrorname[MAX_PLAYER_NAME], string[250], string2[256], copmsg[257], blown[MAX_PLAYER_NAME];
										GetPlayerName(playerid, terrorname, sizeof(terrorname));
	                                    GetPlayerName(strval(tmp), blown, sizeof(blown));
										SendClientMessage(strval(tmp), RED, "|_| C4 Planted On You |_|");
										format(string, sizeof(string), "The Player %s[ID:%d] has planted a C4 on you.", terrorname, playerid);
										SendClientMessage(strval(tmp), WHITE, string);
										SendClientMessage(playerid, GREY, "|_| C4 Planted On Player |_|");
										format(string2, sizeof(string2), "You have planted a C4 on %s[ID:%d].", blown, strval(tmp));
										SendClientMessage(playerid, WHITE, string2);
										SendClientMessage(playerid, WHITE, "Run for your life!");
										SetPlayerC4Amount(playerid, GetPlayerC4Amount(playerid)-1);
										BlowTime[strval(tmp)] = 6;
										SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 3);
										format(copmsg, sizeof(copmsg), "[HQ] The Player %s has blown %s with a C4.", terrorname, blown);
										SendRadioMessageToCops(copmsg);
										return true;
									}
									else
									{
                                        new errormsg[250];
                                        new blown[MAX_PLAYER_NAME];
                                        GetPlayerName(strval(tmp), blown, sizeof(blown));
									    format(errormsg, sizeof(errormsg), "%s[ID:%d] is in a Vehicle. You cannot blow the person inside a vehicle.", blown, strval(tmp));
									    SendClientMessage(playerid, ERROR, errormsg);
									    return true;
									}
								}
								else return SendClientMessage(playerid, ERROR, "You cannot blow anyone from inside a vehicle.");
				            }
				            else
							{
                                new errormsg[250];
                                new blown[MAX_PLAYER_NAME];
                                GetPlayerName(strval(tmp), blown, sizeof(blown));
							    format(errormsg, sizeof(errormsg), "%s[ID:%d] is dead.", blown, strval(tmp));
							    SendClientMessage(playerid, ERROR, errormsg);
							    return true;
							}
						}
						else return SendClientMessage(playerid, ERROR, "You are dead.");
					}
					else return SendClientMessage(playerid, ERROR, "This player is too far away.");
				}
				else return SendClientMessage(playerid, ERROR, "You cannot blow yourself!");
			}
			else return SendClientMessage(playerid, ERROR, "You do not have any C4 left!");
		}
		else return SendClientMessage(playerid, ERROR, "Only CIVILIANS can blow people.");
	}

	if(strcmp(cmdtext, "/blowcar", true) == 0)
	{
	    tmp = strtok(cmdtext, idx);
	    if(gTeam[playerid] == CIVILIAN)
	    {
		    if(GetPlayerC4Amount(playerid) > 0)
		    {
		        if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_PASSENGER)
		        {
					new vehicleid = GetPlayerVehicleID(playerid), terrorname[MAX_PLAYER_NAME], string[250];
					GetPlayerName(playerid, terrorname, sizeof(terrorname));
		            SetTimerEx("BlowCar", 5000, false, "d", vehicleid);
		            SetPlayerC4Amount(playerid, GetPlayerC4Amount(playerid)-1);
		            SendClientMessage(playerid, GREY, "|_| C4 Planted |_|");
		            SendClientMessage(playerid, WHITE, "You've planted a C4 in this vehicle.");
		            SendClientMessage(playerid, WHITE, "Run for your life: The C4 blows in 5 seconds!");
		            SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 5);
		            for(new i = 0; i < MAX_PLAYERS; i++)
		            {
		                if(IsPlayerInAnyVehicle(i) && GetPlayerVehicleID(i) == vehicleid)
		                {
		                    format(string, sizeof(string), "The Player %s[ID:%d] has planted a C4 on this vehicle. Jump off it!", terrorname, playerid);
		                    SendClientMessage(i, RED, string);
		                }
					}
					return true;
		        }
		        else return SendClientMessage(playerid, ERROR, "You must be passenger in order to plant a C4 on this vehicle.");
			}
			else return SendClientMessage(playerid, ERROR, "You do not have any C4 left.");
		}
		else return SendClientMessage(playerid, ERROR, "Only terrorists can blow cars.");
	}

	if(strcmp(cmdtext, "/cmds", true) == 0)
	{
        HideDraw(playerid);
        TextDrawShowForPlayer(playerid, CMDBOX);
		TextDrawShowForPlayer(playerid, text21);
		TextDrawShowForPlayer(playerid, text22);
		TextDrawShowForPlayer(playerid, text23);
		return true;
	}

	if(strcmp(cmd, "/help", true) == 0)
	{
	    tmp = strtok(cmdtext, idx);
	    if(strlen(tmp) == 0) return SendClientMessage(playerid, ERROR, "Use: /help [MESSAGE]");
		new string[250];
		format(string, sizeof(string), "[ ! ] %s[ID:%d] asks help:%s", name, playerid, strlen(tmp));
		SendClientMessageToAdmins(string);
	}

	if(strcmp(cmdtext, "/healme", true) == 0)
	{
		new Float:health;
		GetPlayerHealth(playerid, health);
		if(CPS_IsPlayerInCheckpoint(playerid, cphospital) || CPS_IsPlayerInCheckpoint(playerid, cplshospital) || CPS_IsPlayerInCheckpoint(playerid, cpsfhospital))
		{
		    if(gTeam[playerid] != Medic)
		    {
				if(health < 100)
				{
				    if(GetPlayerMoney(playerid) > 499)
				    {
				    	SendClientMessage(playerid, DARK_GREEN, "|_| You've been Healed! |_|");
				    	SendClientMessage(playerid, WHITE, "The doctors charged you in $500.");
				    	GivePlayerMoney(playerid, -500);
				    	return SetPlayerHealth(playerid, 100);
					}
					else return SendClientMessage(playerid, ERROR, "You do not have $500!");
				}
				else if(health == 100) return SendClientMessage(playerid, ERROR, "You seem OK to me.");
			}
		else if(CPS_IsPlayerInCheckpoint(playerid, cphospital) && gTeam[playerid] == Medic || !CPS_IsPlayerInCheckpoint(playerid, cphospital) && gTeam[playerid] == Medic || CPS_IsPlayerInCheckpoint(playerid, cplshospital) && gTeam[playerid] == Medic || !CPS_IsPlayerInCheckpoint(playerid, cplshospital) && gTeam[playerid] == Medic )
		{
		    if(health < 100)
			{
		    	SendClientMessage(playerid, DARK_GREEN, "|_| You've Healed Yourself! |_|");
		    	SendClientMessage(playerid, WHITE, "You are a Medic. No need to pay.");
		    	return SetPlayerHealth(playerid, 100);
			}
		}
		else if(!CPS_IsPlayerInCheckpoint(playerid, cphospital) && gTeam[playerid] != Medic) return SendClientMessage(playerid, ERROR, "You are not in the Hospital.");
	}
	return 1;
	}

	if(strcmp(cmd,"/cw",true)==0)
	{
	if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(!IsPlayerInAnyVehicle(playerid)) {
    SendClientMessage(playerid, COLOR_ERROR, "You not in any vehicle. You cannot use this command");
    return 1;
    }

    if(strlen(cmdtext) <= 4) {
    SendClientMessage(playerid,COLOR_ERROR,"USAGE: /cw (msg)");
    return 1;
    }
    new string[128];
    new cwhisperid = GetPlayerVehicleID(playerid);
    new output[150];
	new pname[24];
	GetPlayerName(playerid, pname, 24);
    strmid(output,cmdtext,3,strlen(cmdtext));
    format(string, sizeof(string), "(CAR WHISPER): %s(%d) %s",pname,playerid,output);
    printf("%s", string);
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(IsPlayerInAnyVehicle(i))
	{
	if(GetPlayerVehicleID(i) == cwhisperid)
	{
    format(string, sizeof(string), "(CAR WHISPER): %s(%d) %s",pname,playerid,output);
    SendClientMessage(i,COLOR_YELLOW,string);
    }
    }
    }
    return 1;
    }

    if(strcmp(cmd,"/w",true)==0)
	{
	new string[128];
	if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(strlen(cmdtext) <= 3) {
    SendClientMessage(playerid,COLOR_ERROR,"USAGE: /w (msg)");
    return 1;
    }
    new output[150];
	new pname[24];
	GetPlayerName(playerid, pname, 24);
    strmid(output,cmdtext,2,strlen(cmdtext));
    format(string, sizeof(string), "(WHISPER): %s(%d) %s",pname,playerid,output);
    printf("%s", string);
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(IsPlayerConnected(i) && GetDistanceBetweenPlayers(playerid,i) < 10) {
	{
    format(string, sizeof(string), "(WHISPER): %s(%d) %s",pname,playerid,output);
    SendClientMessage(i,COLOR_YELLOW,string);
    }
    }
    }
    return 1;
    }



 	if(strcmp(cmd, "/dance", true) == 0) {
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {

      		tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid,COLOR_ERROR,"Usage: /dance [style 1-3]");
				return 1;
			}

			new dancestyle = strval(tmp);
			if(dancestyle < 1 || dancestyle > 3) {
			    SendClientMessage(playerid,COLOR_ERROR,"Usage: /dance [style 1-3]");
			    return 1;
			}

			if(dancestyle == 1) {
			    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE1);
			} else if(dancestyle == 2) {
			    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE2);
			} else if(dancestyle == 3) {
			    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE3);
			}
 	  		return 1;
		}
	}
	
	if(strcmp(cmd, "/drunk", true) == 0) {
                LoopingAnim(playerid,"PED","WALK_DRUNK",4.1,1,1,1,1,1);
                return 1;
    }


    if (strcmp("/bomb", cmdtext, true) == 0) {
                ClearAnimations(playerid);
                LoopingAnim(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,0);
                return 1;
        }
    if (strcmp("/laugh", cmdtext, true) == 0) {
          OnePlayAnim(playerid, "RAPPING", "Laugh_01", 4.0, 0, 0, 0, 0, 0);
                  return 1;
        }
        if (strcmp("/lookout", cmdtext, true) == 0) {
          OnePlayAnim(playerid, "SHOP", "ROB_Shifty", 4.0, 0, 0, 0, 0, 0);
                  return 1;
        }

    if (strcmp("/robman", cmdtext, true) == 0) {
          LoopingAnim(playerid, "SHOP", "ROB_Loop_Threat", 4.0, 1, 0, 0, 0, 0);
                  return 1;
        }

    if (strcmp("/crossarms", cmdtext, true) == 0) {
          LoopingAnim(playerid, "COP_AMBIENT", "Coplook_loop", 4.0, 0, 1, 1, 1, -1);
                  return 1;
        }

    if (strcmp("/lay", cmdtext, true) == 0) {
          LoopingAnim(playerid,"BEACH", "bather", 4.0, 1, 0, 0, 0, 0);
                  return 1;
    }

    if (strcmp("/hide", cmdtext, true) == 0) {
          LoopingAnim(playerid, "ped", "cower", 3.0, 1, 0, 0, 0, 0);
                  return 1;
        }

    if (strcmp("/vomit", cmdtext, true) == 0) {
              OnePlayAnim(playerid, "FOOD", "EAT_Vomit_P", 3.0, 0, 0, 0, 0, 0);
                  return 1;
        }

    if (strcmp("/eat", cmdtext, true) == 0) {
              OnePlayAnim(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0);
                  return 1;
        }

    if (strcmp("/wave", cmdtext, true) == 0) {
              LoopingAnim(playerid, "ON_LOOKERS", "wave_loop", 4.0, 1, 0, 0, 0, 0);
                  return 1;
        }

    if (strcmp("/slapass", cmdtext, true) == 0) {
                OnePlayAnim(playerid, "SWEET", "sweet_ass_slap", 4.0, 0, 0, 0, 0, 0);
                return 1;
        }
        if (strcmp("/deal", cmdtext, true) == 0) {
          OnePlayAnim(playerid, "DEALER", "DEALER_DEAL", 4.0, 0, 0, 0, 0, 0);
                  return 1;
        }

    if (strcmp("/crack", cmdtext, true) == 0) {
          LoopingAnim(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
                  return 1;
        }

        if(strcmp(cmd, "/smoke", true) == 0)
    {
        if (!strlen(cmdtext[7])) return SendClientMessage(playerid,0xEFEFF7AA,"USAGE: /smoke [1-4]");
        switch (cmdtext[7])
        {
                case '1': LoopingAnim(playerid,"SMOKING", "M_smklean_loop", 4.0, 1, 0, 0, 0, 0);
                case '2': LoopingAnim(playerid,"SMOKING", "F_smklean_loop", 4.0, 1, 0, 0, 0, 0);
                case '3': LoopingAnim(playerid,"SMOKING","M_smkstnd_loop", 4.0, 1, 0, 0, 0, 0);
                case '4': LoopingAnim(playerid,"SMOKING","M_smk_out", 4.0, 1, 0, 0, 0, 0);
                default: SendClientMessage(playerid,0xEFEFF7AA,"USAGE: /smoke [1-4]");
        }
        return 1;
    }

    if (strcmp("/groundsit", cmdtext, true) == 0 || strcmp("/gro", cmdtext, true) == 0) {
          LoopingAnim(playerid,"BEACH", "ParkSit_M_loop", 4.0, 1, 0, 0, 0, 0);
                  return 1;
    }

    if(strcmp(cmd, "/chat", true) == 0) {
                 LoopingAnim(playerid,"PED","IDLE_CHAT",4.0,1,0,0,1,1);
         return 1;
    }

    if(strcmp(cmd, "/fuckyou", true) == 0) {
                 OnePlayAnim(playerid,"PED","fucku",4.0,0,0,0,0,0);
         return 1;
    }

    if(strcmp(cmd, "/taichi", true) == 0) {
                 LoopingAnim(playerid,"PARK","Tai_Chi_Loop",4.0,1,0,0,0,0);
         return 1;
    }


    if(strcmp(cmd, "/chairsit", true) == 0) {
                 LoopingAnim(playerid,"PED","SEAT_down",4.1,0,1,1,1,0);
         return 1;
    }
    
    if (strcmp("/cm", cmdtext, true, 3) == 0)
    {
    new string[128];
    if(IsSpawned[playerid] == 0) {
	SendClientMessage(playerid, COLOR_ERROR, "You are dead. You cannot use this command");
    return 1;
    }
    if(gTeam[playerid] != COP && gTeam[playerid] != SWAT && gTeam[playerid] != ARMY && gTeam[playerid] != FBI) {
    SendClientMessage(playerid,COLOR_ROYALBLUE,"You ar not Police Officer!");
    }
    if(strlen(cmdtext) <= 4) {
    SendClientMessage(playerid,COLOR_ERROR,"USAGE: /cm yourmessagehere");
    return 1;
    }
	else{
	new output[255];
	new pname[24];
	GetPlayerName(playerid, pname, 24);
    strmid(output,cmdtext,3,strlen(cmdtext));
    format(string, sizeof(string), "COP MESSAGE: %s(%d) %s",pname,playerid,output);
    printf("%s", string);
    for(new i=0;i<MAX_PLAYERS;i++)
	{
    if(gTeam[i] == COP || gTeam[i] == SWAT || gTeam[i] == ARMY || gTeam[i] == FBI) {
    format(string, sizeof(string), "COP MESSAGE: %s(%d) %s",pname,playerid,output);
    SendClientMessage(i,COLOR_ROYALBLUE,string);
    }
    }
    }
    return 1;
    }
    if (strcmp("/next", cmdtext, true) == 0)
    {
    if(CSKIN[playerid] ==1)
    {
    SetPlayerSkin(playerid,7);
    CSKIN[playerid] = 2;
    }else
    if(CSKIN[playerid] ==2)
    {
    SetPlayerSkin(playerid,11);
    CSKIN[playerid] = 3;
    }else
    if(CSKIN[playerid] ==3)
    {
    SetPlayerSkin(playerid,19);
    CSKIN[playerid] = 4;
    }else
    if(CSKIN[playerid] ==4)
    {
    SetPlayerSkin(playerid,21);
    CSKIN[playerid] = 5;
    }else
    if(CSKIN[playerid] ==5)
    {
    SetPlayerSkin(playerid,23);
    CSKIN[playerid] = 6;
    }else
    if(CSKIN[playerid] ==6)
    {
    SetPlayerSkin(playerid,28);
    CSKIN[playerid] = 7;
    }else
    if(CSKIN[playerid] ==7)
    {
    SetPlayerSkin(playerid,29);
    CSKIN[playerid] = 8;
    }else
    if(CSKIN[playerid] ==8)
    {
    SetPlayerSkin(playerid,46);
    CSKIN[playerid] = 9;
    }else
    if(CSKIN[playerid] ==9)
    {
    SetPlayerSkin(playerid,47);
    CSKIN[playerid] = 10;
    }else
    if(CSKIN[playerid] ==10)
    {
    SetPlayerSkin(playerid,59);
    CSKIN[playerid] = 11;
    }else
    if(CSKIN[playerid] ==11)
    {
    SetPlayerSkin(playerid,98);
    CSKIN[playerid] = 12;
    }else
    if(CSKIN[playerid] ==12)
    {
    SetPlayerSkin(playerid,101);
    CSKIN[playerid] = 13;
    }else
    if(CSKIN[playerid] ==13)
    {
    SetPlayerSkin(playerid,116);
    CSKIN[playerid] = 14;
    }else
    if(CSKIN[playerid] ==14)
    {
    SetPlayerSkin(playerid,124);
    CSKIN[playerid] = 15;
    }else
    if(CSKIN[playerid] ==15)
    {
    SetPlayerSkin(playerid,186);
    CSKIN[playerid] = 16;
    }else
    if(CSKIN[playerid] ==16)
    {
    SetPlayerSkin(playerid,188);
    CSKIN[playerid] = 17;
    }else
    if(CSKIN[playerid] ==17)
    {
    SetPlayerSkin(playerid,223);
    CSKIN[playerid] = 18;
    }else
    if(CSKIN[playerid] ==18)
    {
    SetPlayerSkin(playerid,240);
    CSKIN[playerid] = 19;
    }else
    if(CSKIN[playerid] ==19)
    {
    SetPlayerSkin(playerid,58);
    CSKIN[playerid] = 1;
    }else
    if(CSKINZ[playerid] ==1)
    {
    SetPlayerSkin(playerid,7);
    CSKINZ[playerid] = 2;
    }else
    if(CSKINZ[playerid] ==2)
    {
    SetPlayerSkin(playerid,11);
    CSKINZ[playerid] = 3;
    }else
    if(CSKINZ[playerid] ==3)
    {
    SetPlayerSkin(playerid,19);
    CSKINZ[playerid] = 4;
    }else
    if(CSKINZ[playerid] ==4)
    {
    SetPlayerSkin(playerid,21);
    CSKINZ[playerid] = 5;
    }else
    if(CSKINZ[playerid] ==5)
    {
    SetPlayerSkin(playerid,23);
    CSKINZ[playerid] = 6;
    }else
    if(CSKINZ[playerid] ==6)
    {
    SetPlayerSkin(playerid,28);
    CSKINZ[playerid] = 7;
    }else
    if(CSKINZ[playerid] ==7)
    {
    SetPlayerSkin(playerid,29);
    CSKINZ[playerid] = 8;
    }else
    if(CSKINZ[playerid] ==8)
    {
    SetPlayerSkin(playerid,46);
    CSKINZ[playerid] = 9;
    }else
    if(CSKINZ[playerid] ==9)
    {
    SetPlayerSkin(playerid,47);
    CSKINZ[playerid] = 10;
    }else
    if(CSKINZ[playerid] ==10)
    {
    SetPlayerSkin(playerid,59);
    CSKINZ[playerid] = 11;
    }else
    if(CSKINZ[playerid] ==11)
    {
    SetPlayerSkin(playerid,98);
    CSKINZ[playerid] = 12;
    }else
    if(CSKINZ[playerid] ==12)
    {
    SetPlayerSkin(playerid,101);
    CSKINZ[playerid] = 13;
    }else
    if(CSKINZ[playerid] ==13)
    {
    SetPlayerSkin(playerid,116);
    CSKINZ[playerid] = 14;
    }else
    if(CSKINZ[playerid] ==14)
    {
    SetPlayerSkin(playerid,124);
    CSKINZ[playerid] = 15;
    }else
    if(CSKINZ[playerid] ==15)
    {
    SetPlayerSkin(playerid,186);
    CSKINZ[playerid] = 16;
    }else
    if(CSKINZ[playerid] ==16)
    {
    SetPlayerSkin(playerid,188);
    CSKINZ[playerid] = 17;
    }else
    if(CSKINZ[playerid] ==17)
    {
    SetPlayerSkin(playerid,223);
    CSKINZ[playerid] = 18;
    }else
    if(CSKINZ[playerid] ==18)
    {
    SetPlayerSkin(playerid,240);
    CSKINZ[playerid] = 19;
    }else
    if(CSKINZ[playerid] ==19)
    {
    SetPlayerSkin(playerid,58);
    CSKINZ[playerid] = 1;
    }else
    if(CSKINU[playerid] ==1)
    {
    SetPlayerSkin(playerid,7);
    CSKINU[playerid] = 2;
    }else
    if(CSKINU[playerid] ==2)
    {
    SetPlayerSkin(playerid,11);
    CSKINU[playerid] = 3;
    }else
    if(CSKINU[playerid] ==3)
    {
    SetPlayerSkin(playerid,19);
    CSKINU[playerid] = 4;
    }else
    if(CSKINU[playerid] ==4)
    {
    SetPlayerSkin(playerid,21);
    CSKINU[playerid] = 5;
    }else
    if(CSKINU[playerid] ==5)
    {
    SetPlayerSkin(playerid,23);
    CSKINU[playerid] = 6;
    }else
    if(CSKINU[playerid] ==6)
    {
    SetPlayerSkin(playerid,28);
    CSKINU[playerid] = 7;
    }else
    if(CSKINU[playerid] ==7)
    {
    SetPlayerSkin(playerid,29);
    CSKINU[playerid] = 8;
    }else
    if(CSKINU[playerid] ==8)
    {
    SetPlayerSkin(playerid,46);
    CSKINU[playerid] = 9;
    }else
    if(CSKINU[playerid] ==9)
    {
    SetPlayerSkin(playerid,47);
    CSKINU[playerid] = 10;
    }else
    if(CSKINU[playerid] ==10)
    {
    SetPlayerSkin(playerid,59);
    CSKINU[playerid] = 11;
    }else
    if(CSKINU[playerid] ==11)
    {
    SetPlayerSkin(playerid,98);
    CSKINU[playerid] = 12;
    }else
    if(CSKINU[playerid] ==12)
    {
    SetPlayerSkin(playerid,101);
    CSKINU[playerid] = 13;
    }else
    if(CSKINU[playerid] ==13)
    {
    SetPlayerSkin(playerid,116);
    CSKINU[playerid] = 14;
    }else
    if(CSKINU[playerid] ==14)
    {
    SetPlayerSkin(playerid,124);
    CSKINU[playerid] = 15;
    }else
    if(CSKINU[playerid] ==15)
    {
    SetPlayerSkin(playerid,186);
    CSKINU[playerid] = 16;
    }else
    if(CSKINU[playerid] ==16)
    {
    SetPlayerSkin(playerid,188);
    CSKINU[playerid] = 17;
    }else
    if(CSKINU[playerid] ==17)
    {
    SetPlayerSkin(playerid,223);
    CSKINU[playerid] = 18;
    }else
    if(CSKINU[playerid] ==18)
    {
    SetPlayerSkin(playerid,240);
    CSKINU[playerid] = 19;
    }else
    if(CSKINU[playerid] ==19)
    {
    SetPlayerSkin(playerid,58);
    CSKINU[playerid] = 1;
    }else SendClientMessage(playerid,LIGHT_BLUE,"You are not in a skin shop location");
    return 1;
    }
    if (strcmp("/select", cmdtext, true, 3) == 0)
    {
    if(CSKIN[playerid] >=2)
    {
	GetPlayerName(playerid,name,MAX_PLAYER_NAME);
    format(file,sizeof(file),"%s.runix", name);
	new skin = GetPlayerSkin(playerid);
	dini_IntSet(file, "Skin", skin);
	TogglePlayerControllable(playerid,1);
	SetPlayerPos(playerid,218.2430,-98.2941,1005.2578);
	SetCameraBehindPlayer(playerid);
	CSKIN[playerid] = 0;
	}else
    if(CSKINZ[playerid] >=2)
    {
	GetPlayerName(playerid,name,MAX_PLAYER_NAME);
    format(file,sizeof(file),"%s.runix", name);
	new skin = GetPlayerSkin(playerid);
	dini_IntSet(file, "Skin", skin);
	TogglePlayerControllable(playerid,1);
	SetPlayerPos(playerid,181.5906,-87.5578,1002.0234);
	SetCameraBehindPlayer(playerid);
	CSKINZ[playerid] = 0;
	}else
    if(CSKINU[playerid] >=2)
    {
	GetPlayerName(playerid,name,MAX_PLAYER_NAME);
    format(file,sizeof(file),"%s.runix", name);
	new skin = GetPlayerSkin(playerid);
	dini_IntSet(file, "Skin", skin);
	TogglePlayerControllable(playerid,1);
	SetPlayerPos(playerid,214.7581,-41.0411,1002.0234);
	SetCameraBehindPlayer(playerid);
	CSKINU[playerid] = 0;
	}else SendClientMessage(playerid,LIGHT_BLUE,"You are not in a skin shop location");
    return 1;
    }
    
    if(!strcmp(cmdtext, "/hitlist", true))
	{
		new count = 0;
		SendClientMessage(playerid, COLOR_MSG, "Listing currently placed hits:");
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if(IsPlayerConnected(i) && hit[i] > 0)
			{
				new string[256];
				format(string, 256, "Hit on %s (%i) for $%i", ReturnPlayerName(i), i, hit[i]);
				SendClientMessage(playerid, COLOR_FOUND, string);
				count++;
			}
		}
		if(count == 0)
		{
			SendClientMessage(playerid, COLOR_ERROR, "No hits placed at this time!");
		}
	}
    
    if(!strcmp(cmd, "/gps", true))
        {
        tmp = strtok(cmdtext,idx);
        if(!strlen(tmp)) return SendClientMessage(playerid, 0xFFFFFFAA, "Use: /gps [playerid / off]");
                if(!strcmp(tmp, "off", true)) {
                        if(HaveGPS[playerid]) {
                                KillTimer(GPSTimer[playerid]);
                                HaveGPS[playerid] = false;
                                GPSTimer[playerid] = 0;
                                DisablePlayerRaceCheckpoint(playerid);
                                SendClientMessage(playerid, 0xFFFF00AA, "SERVER: GPS off.");
                        }else SendClientMessage(playerid, 0xFF0000AA, "SERVER: Your GPS is not ON!");
                        return 1;
                }
                if(IsPlayerConnected(strval(tmp))) {
                        if(strval(tmp) != playerid) {
                                if(HaveGPS[playerid]) {
                                        KillTimer(GPSTimer[playerid]);
                                        HaveGPS[playerid] = false;
                                        GPSTimer[playerid] = 0;
                                }
                                GPSTimer[playerid] = SetTimerEx("GPSUpdate", 500, true, "dd", playerid,strval(tmp));
                                HaveGPS[playerid] = true;
                                new str[128],nick[24];
                                GetPlayerName(strval(tmp),nick,24);
                                format(str,128,"SERVER: GPS enabled. Target: %s (ID: %d)",nick,strval(tmp));
                                SendClientMessage(playerid, 0xFFFF00AA, str);
                        }else SendClientMessage(playerid, 0xFF0000AA, "SERVER: can't use their ID !");
                }else SendClientMessage(playerid, 0xFF0000AA, "SERVER: This ID is not connected!");
                return 1;
        }
        if(!strcmp(cmdtext,"/pc",true))
	    {
	    HideDraw(playerid);
	    TextDrawShowForPlayer(playerid,text41);
	    TextDrawShowForPlayer(playerid,text42);
	    TextDrawShowForPlayer(playerid,PCBOX);
	    TextDrawShowForPlayer(playerid,text43);
	    return 1;
	    }
	    if(!strcmp(cmdtext,"/rules",true))
    	{
	    SendClientMessage(playerid, 0x00C2ECFF, "Rule 1: Do Not Hack, Cheat Or Bug Abuse Or You Will Get Kicked/Banned.");
	    SendClientMessage(playerid, 0x00C2ECFF, "Rule 2: Do Not Deathmatch Other Players. Cops can only kill reds and oranges.");
	    SendClientMessage(playerid, 0x00C2ECFF, "Rule 3: Do Not Insult Admins. Respect other players.");
	    SendClientMessage(playerid, 0x00C2ECFF, "Rule 4: Do Not Ask To Be An Admin. We will ask you.");
	    SendClientMessage(playerid, 0x00C2ECFF, "Rule 5: Do Not Bitch/Complain About The Server.");
	    SendClientMessage(playerid, 0x00C2ECFF, "If you want to be admin, apply at www.rss-ro.com");
		return 1;
	    }
	return SendClientMessage(playerid, ERROR, "Invalid command. Use /cmds to see the general commands.");
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    new vehicleid = GetPlayerVehicleID(playerid);
    if(Spawned[playerid] == 1)
    {
    if(newstate == PLAYER_STATE_ONFOOT)
    {
    TextDrawHideForPlayer(playerid, Speed[playerid][Speedom]);
    TextDrawHideForPlayer(playerid, Speed[playerid][Speedom2]);
    new string[250];
    TextDrawShowForPlayer(playerid, Speed[playerid][Speedom]);
    format(string,sizeof(string),"~w~LoLocation: ~w~%s" ,ReturnPlayerZone(playerid));
    TextDrawSetString(Speed[playerid][Speedom], string);
    }
    }
//--------------------------------------------------------------------------------------------------------------------------
	if(newstate == PLAYER_STATE_DRIVER && GetVehicleModel(vehicleid) == 427 || GetVehicleModel(vehicleid) == 490 || GetVehicleModel(vehicleid) == 523 || GetVehicleModel(vehicleid) == 528 || GetVehicleModel(vehicleid) == 596 || GetVehicleModel(vehicleid) == 597 || GetVehicleModel(vehicleid) == 598 || GetVehicleModel(vehicleid) == 599 || GetVehicleModel(vehicleid) == 601)
	{
		if(gTeam[playerid] != COP && gTeam[playerid] != Medic && gTeam[playerid] != ARMY && gTeam[playerid] != FBI && gTeam[playerid] != SWAT)
		{
			RemovePlayerFromVehicle(playerid);
		    SendClientMessage(playerid, ERROR, "Only Police Officers can use this vehicle.");
		}
		else if(gTeam[playerid] == COP) SendClientMessage(playerid, WHITE, "This is a city's vehicle. You can use this one to work.");
		else if(gTeam[playerid] == Medic)
		{
		    RemovePlayerFromVehicle(playerid);
		    SendClientMessage(playerid, ERROR, "Only Police Officers can use this vehicle.");
		}
	}
//-----------------------------------------------TAXI----------------------------------------------------------------------
	new msg[255];
	if 	(newstate==PLAYER_STATE_DRIVER)
	    {
	    if (gTeam[playerid] == CIVILIAN && IsPlayerInAnyVehicle(playerid) && GetVehicleModel(GetPlayerVehicleID(playerid)) == 420 || gTeam[playerid] == CIVILIAN && IsPlayerInAnyVehicle(playerid) && GetVehicleModel(GetPlayerVehicleID(playerid)) == 438)
	        {
	        if 	(avisado[playerid]==-1)
	            {
				GameTextForPlayer(playerid,"~w~Type key ~b~2~g~(SubMission)~n~~w~to start the ~n~~r~Taxi~w~ Job.",5000,6);
				}
			else
			    {
			    KillTimer(avisado[playerid]);
			    avisado[playerid]=-1;
			    }
		    }
	    }
	if 	(newstate==PLAYER_STATE_ONFOOT)
	    {
	    if 	((playerInJob[playerid]>0)&&(avisado[playerid]==-1))
		    {
		    GameTextForPlayer(playerid,"~w~You have ~r~10 sec ~n~~w~ to enter in ~r~TAXI",5000,6);
		    avisado[playerid]=SetTimerEx("terminarMission",10000,0,"%d",playerid);
		    }
		if 	(OnTaxiAsPassenger[playerid]!=-1)
			{
			new taxista = OnTaxiAsPassenger[playerid];
			new name[MAX_PLAYER_NAME];
			GetPlayerName(taxista,name,MAX_PLAYER_NAME);
			OnTaxiAsPassenger[playerid]=-1;
			new viaje = CostoDelViaje[playerid];
			format(msg,sizeof(msg),"~w~You pay to ~g~%s ~n~~r~$%d~w~ for the ~r~Taxi Driver",name,viaje);
			GameTextForPlayer(playerid,msg,5000,6);
			format(msg,sizeof(msg),"~w~You get ~r~$%d~w~ ~n~for the ~r~Pasager.",viaje);
			GameTextForPlayer(taxista,msg,5000,6);
			GivePlayerMoney(playerid,-viaje);
			GivePlayerMoney(taxista,viaje);
			cantidadPasajeros--;
			if 	(cantidadPasajeros==0)
			    {
				KillTimer(caidadefichaTimer);
				}
			}
	    }
	if 	(newstate==PLAYER_STATE_PASSENGER)
		{
		if (GetVehicleModel(GetPlayerVehicleID(playerid)) == 420 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 438)
			{
			new i=0;
	  		while 	(i<MAX_PLAYERS)
	  		        {
	  		        if 	((playerInJob[i]==1)&&(GetPlayerState(i)==PLAYER_STATE_DRIVER))
	  		            {
		    			if 	(GetPlayerVehicleID(i) == GetPlayerVehicleID(playerid))
		    			    {
		    				new name[MAX_PLAYER_NAME];
							GetPlayerName(i,name,MAX_PLAYER_NAME);
							contador[i]++;
							format(msg,sizeof(msg),"~w~You have gotten into ~n~~g~%s's ~r~Taxi~w~",name);
							GameTextForPlayer(playerid,msg,5000,6);
							format(msg,sizeof(msg),"~w~You have one new~n~~r~PASENGER~w~");
							GameTextForPlayer(playerid,msg,5000,6);
							OnTaxiAsPassenger[playerid]=i;
							CostoDelViaje[playerid]=BAJADA_DE_BANDERA;
							if 	(cantidadPasajeros==0)
							    {
								caidadefichaTimer=SetTimer("caidadeficha",30000,1);
								}
							cantidadPasajeros++;
							i=MAX_PLAYERS;
		    			    }
	  		            }
	  		        i++;
	  		        }
			}
		}
//-------------------------------------------------------------------------------------------------------------------------
	//BUS
	if 	(newstate==PLAYER_STATE_DRIVER)
	    {
	    if (gTeam[playerid] == CIVILIAN && GetVehicleModel(GetPlayerVehicleID(playerid)) == 431 || gTeam[playerid] == CIVILIAN &&  GetVehicleModel(GetPlayerVehicleID(playerid)) == 437)
	        {
	        if 	(avisado2[playerid]==-1)
	            {
				GameTextForPlayer(playerid,"~w~Type key ~b~2~g~(SubMission)~n~~w~to start the ~n~~r~Bus~w~ Job.",5000,6);
				}
			else
			    {
			    KillTimer(avisado2[playerid]);
			    avisado2[playerid]=-1;
			    }
		    }
	    }
	if 	(newstate==PLAYER_STATE_ONFOOT)
	    {
	    if 	((playerInMiniMission2[playerid]>0)&&(avisado2[playerid]==-1))
		    {
		    GameTextForPlayer(playerid,"~w~You have ~r~10 sec ~n~~w~ to enter a ~r~Bus",5000,6);
		    avisado2[playerid]=SetTimerEx("terminarMission2",10000,0,"%d",playerid);
		    }
		if 	(OnBusAsPassenger[playerid]!=-1)
			{
			new Bussta = OnBusAsPassenger[playerid];
			new name[MAX_PLAYER_NAME];
			GetPlayerName(Bussta,name,MAX_PLAYER_NAME);
			OnBusAsPassenger[playerid]=-1;
			new viaje = CostoDelViaje2[playerid];
			format(msg,sizeof(msg),"~w~You pay to ~g~%s ~n~~r~$%d~w~ for the ~r~Bus~w~ ride.",name,viaje);
			GameTextForPlayer(playerid,msg,5000,6);
			format(msg,sizeof(msg),"~w~You get ~r~$%d~w~ ~n~for the ~r~Bus~w~ ride.",viaje);
			GameTextForPlayer(Bussta,msg,5000,6);
			GivePlayerMoney(playerid,-viaje);
			GivePlayerMoney(Bussta,viaje);
			cantidadPasajeros2--;
			if 	(cantidadPasajeros2==0)
			    {
				KillTimer(caidadeficha2Timer2);
				}
			}
	    }
	if 	(newstate==PLAYER_STATE_PASSENGER)
		{
		if (GetVehicleModel(GetPlayerVehicleID(playerid)) == 431 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 437)
			{
			new i=0;
	  		while 	(i<MAX_PLAYERS)
	  		        {
	  		        if 	((playerInMiniMission2[i]==1)&&(GetPlayerState(i)==PLAYER_STATE_DRIVER))
	  		            {
		    			if 	(GetPlayerVehicleID(i) == GetPlayerVehicleID(playerid))
		    			    {
		    				new name[MAX_PLAYER_NAME];
							GetPlayerName(i,name,MAX_PLAYER_NAME);
							contador2[i]++;
							format(msg,sizeof(msg),"~w~You have gotten into ~n~~g~%s's ~r~Bus~w~",name);
							GameTextForPlayer(playerid,msg,5000,6);
							format(msg,sizeof(msg),"~w~You have one new~n~~r~PASENGER~w~");
							GameTextForPlayer(playerid,msg,5000,6);
							OnBusAsPassenger[playerid]=i;
							CostoDelViaje2[playerid]=BAJADA_DE_BANDERA2;
							if 	(cantidadPasajeros2==0)
							    {
								caidadeficha2Timer2=SetTimer("caidadeficha2",30000,1);
								}
							cantidadPasajeros2++;
							i=MAX_PLAYERS;
		    			    }
	  		            }
	  		        i++;
	  		        }
			}
		}
		//
		//Trash
		if 	(newstate==PLAYER_STATE_DRIVER)
	    {
	    if (gTeam[playerid] == CIVILIAN && GetVehicleModel(GetPlayerVehicleID(playerid)) == 408)
	        {
	        
				GameTextForPlayer(playerid,"~w~Type key ~b~2~g~(SubMission)~n~~w~to start the ~n~~r~Bus~w~ Job.",5000,6);
		    }
	    }
	    if 	(newstate==PLAYER_STATE_ONFOOT)
	    {
	    if(InTrashMission[playerid] > 0)
	    {
	    DisablePlayerRaceCheckpoint(playerid);
	    InTrashMission[playerid] = 0;
	    SelectTM[playerid] = 0;
	    }
	    }
	    //
	return true;
}
public OnPlayerEnterRaceCheckpoint(playerid)
{
	if(InBusMission[playerid] == 1) {
        if(currentcheckpoint[playerid] <= 2)
	    {
			currentcheckpoint[playerid]++;
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid,LIGHT_BLUE,"You received $500!");
			GivePlayerMoney(playerid,500);
			SetPlayerRaceCheckpoint(playerid,0,buslscps[currentcheckpoint[playerid]][0],buslscps[currentcheckpoint[playerid]][1],buslscps[currentcheckpoint[playerid]][2],
			buslscps[currentcheckpoint[playerid]+1][0],buslscps[currentcheckpoint[playerid]+1][1],buslscps[currentcheckpoint[playerid]+1][2],7);
		} else if(currentcheckpoint[playerid] >= 3 && currentcheckpoint[playerid] != 16) {
			currentcheckpoint[playerid]++;
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid,LIGHT_BLUE,"You received $500!");
			GivePlayerMoney(playerid,500);
			SetPlayerRaceCheckpoint(playerid,0,buslscps[currentcheckpoint[playerid]-4][0],buslscps[currentcheckpoint[playerid]-4][1],
			buslscps[currentcheckpoint[playerid]-4][2],buslscps[currentcheckpoint[playerid]-3][0],buslscps[currentcheckpoint[playerid]-3][1],
			buslscps[currentcheckpoint[playerid]-3][2],7);
		} else if(currentcheckpoint[playerid] == 16) {
            currentcheckpoint[playerid] = 0;
            SetPlayerRaceCheckpoint(playerid,0,buslscps[0][0],buslscps[0][1],buslscps[0][2],buslscps[1][0],buslscps[1][1],buslscps[1][2],7);
		    SendClientMessage(playerid,LIGHT_BLUE,"You finished the bus route! You can do it again!");
		}
	}
	if(InBusMission[playerid] == 2) {
        if(currentcheckpoint[playerid] <= 2)
	    {
			currentcheckpoint[playerid]++;
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid,LIGHT_BLUE,"You received $500!");
			GivePlayerMoney(playerid,500);
			SetPlayerRaceCheckpoint(playerid,0,bussfcps[currentcheckpoint[playerid]][0],bussfcps[currentcheckpoint[playerid]][1],bussfcps[currentcheckpoint[playerid]][2],
			bussfcps[currentcheckpoint[playerid]+1][0],bussfcps[currentcheckpoint[playerid]+1][1],bussfcps[currentcheckpoint[playerid]+1][2],7);
		} else if(currentcheckpoint[playerid] >= 3 && currentcheckpoint[playerid] != 12) {
			currentcheckpoint[playerid]++;
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid,LIGHT_BLUE,"You received $500!");
			GivePlayerMoney(playerid,500);
			SetPlayerRaceCheckpoint(playerid,0,bussfcps[currentcheckpoint[playerid]-4][0],bussfcps[currentcheckpoint[playerid]-4][1],
			bussfcps[currentcheckpoint[playerid]-4][2],bussfcps[currentcheckpoint[playerid]-3][0],bussfcps[currentcheckpoint[playerid]-3][1],
			bussfcps[currentcheckpoint[playerid]-3][2],7);
		} else if(currentcheckpoint[playerid] == 12) {
            currentcheckpoint[playerid] = 0;
            SetPlayerRaceCheckpoint(playerid,0,bussfcps[0][0],bussfcps[0][1],bussfcps[0][2],bussfcps[1][0],bussfcps[1][1],bussfcps[1][2],7);
		    SendClientMessage(playerid,LIGHT_BLUE,"You finished the bus route! You can do it again!");
		}
	}
	if(InBusMission[playerid] == 3) {
        if(currentcheckpoint[playerid] <= 2)
	    {
			currentcheckpoint[playerid]++;
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid,LIGHT_BLUE,"You received $500!");
			GivePlayerMoney(playerid,500);
			SetPlayerRaceCheckpoint(playerid,0,buslvcps[currentcheckpoint[playerid]][0],buslvcps[currentcheckpoint[playerid]][1],buslvcps[currentcheckpoint[playerid]][2],
			buslvcps[currentcheckpoint[playerid]+1][0],buslvcps[currentcheckpoint[playerid]+1][1],buslvcps[currentcheckpoint[playerid]+1][2],7);
		} else if(currentcheckpoint[playerid] >= 3 && currentcheckpoint[playerid] != 14) {
			currentcheckpoint[playerid]++;
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid,LIGHT_BLUE,"You received $500!");
			GivePlayerMoney(playerid,500);
			SetPlayerRaceCheckpoint(playerid,0,buslvcps[currentcheckpoint[playerid]-4][0],buslvcps[currentcheckpoint[playerid]-4][1],
			buslvcps[currentcheckpoint[playerid]-4][2],buslvcps[currentcheckpoint[playerid]-3][0],buslvcps[currentcheckpoint[playerid]-3][1],
			buslvcps[currentcheckpoint[playerid]-3][2],7);
		} else if(currentcheckpoint[playerid] == 14) {
            currentcheckpoint[playerid] = 0;
            SetPlayerRaceCheckpoint(playerid,0,buslvcps[0][0],buslvcps[0][1],buslvcps[0][2],buslvcps[1][0],buslvcps[1][1],buslvcps[1][2],7);
		    SendClientMessage(playerid,LIGHT_BLUE,"You finished the bus route! You can do it again!");
		}
	}
	if(InTrashMission[playerid] == 1) {
        if(currentcheckpoint[playerid] <= 2)
	    {
			currentcheckpoint[playerid]++;
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid,LIGHT_BLUE,"You received $500!");
			GivePlayerMoney(playerid,500);
			SetPlayerRaceCheckpoint(playerid,0,trashls[currentcheckpoint[playerid]][0],trashls[currentcheckpoint[playerid]][1],trashls[currentcheckpoint[playerid]][2],
			trashls[currentcheckpoint[playerid]+1][0],trashls[currentcheckpoint[playerid]+1][1],trashls[currentcheckpoint[playerid]+1][2],7);
		} else if(currentcheckpoint[playerid] >= 3 && currentcheckpoint[playerid] != 13) {
			currentcheckpoint[playerid]++;
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid,LIGHT_BLUE,"You received $500!");
			GivePlayerMoney(playerid,500);
			SetPlayerRaceCheckpoint(playerid,0,trashls[currentcheckpoint[playerid]-4][0],trashls[currentcheckpoint[playerid]-4][1],
			trashls[currentcheckpoint[playerid]-4][2],trashls[currentcheckpoint[playerid]-3][0],trashls[currentcheckpoint[playerid]-3][1],
			trashls[currentcheckpoint[playerid]-3][2],7);
		} else if(currentcheckpoint[playerid] == 13) {
            currentcheckpoint[playerid] = 0;
            SetPlayerRaceCheckpoint(playerid,0,trashls[0][0],trashls[0][1],trashls[0][2],trashls[1][0],trashls[1][1],trashls[1][2],7);
		    SendClientMessage(playerid,LIGHT_BLUE,"You finished the trash route! You can do it again!");
		}
	}
	if(InTrashMission[playerid] == 2) {
        if(currentcheckpoint[playerid] <= 2)
	    {
			currentcheckpoint[playerid]++;
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid,LIGHT_BLUE,"You received $500!");
			GivePlayerMoney(playerid,500);
			SetPlayerRaceCheckpoint(playerid,0,trashsf[currentcheckpoint[playerid]][0],trashsf[currentcheckpoint[playerid]][1],trashsf[currentcheckpoint[playerid]][2],
			trashsf[currentcheckpoint[playerid]+1][0],trashsf[currentcheckpoint[playerid]+1][1],trashsf[currentcheckpoint[playerid]+1][2],7);
		} else if(currentcheckpoint[playerid] >= 3 && currentcheckpoint[playerid] != 9) {
			currentcheckpoint[playerid]++;
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid,LIGHT_BLUE,"You received $500!");
			GivePlayerMoney(playerid,500);
			SetPlayerRaceCheckpoint(playerid,0,trashsf[currentcheckpoint[playerid]-4][0],trashsf[currentcheckpoint[playerid]-4][1],
			trashsf[currentcheckpoint[playerid]-4][2],trashsf[currentcheckpoint[playerid]-3][0],trashsf[currentcheckpoint[playerid]-3][1],
			trashsf[currentcheckpoint[playerid]-3][2],7);
		} else if(currentcheckpoint[playerid] == 9) {
            currentcheckpoint[playerid] = 0;
            SetPlayerRaceCheckpoint(playerid,0,trashsf[0][0],trashsf[0][1],trashsf[0][2],trashsf[1][0],trashsf[1][1],trashsf[1][2],7);
		    SendClientMessage(playerid,LIGHT_BLUE,"You finished the trash route! You can do it again!");
		}
	}
    if(InTrashMission[playerid] == 3) {
        if(currentcheckpoint[playerid] <= 2)
	    {
			currentcheckpoint[playerid]++;
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid,LIGHT_BLUE,"You received $500!");
			GivePlayerMoney(playerid,500);
			SetPlayerRaceCheckpoint(playerid,0,trashlv[currentcheckpoint[playerid]][0],trashlv[currentcheckpoint[playerid]][1],trashlv[currentcheckpoint[playerid]][2],
			trashlv[currentcheckpoint[playerid]+1][0],trashlv[currentcheckpoint[playerid]+1][1],trashlv[currentcheckpoint[playerid]+1][2],7);
		} else if(currentcheckpoint[playerid] >= 3 && currentcheckpoint[playerid] != 13) {
			currentcheckpoint[playerid]++;
			DisablePlayerRaceCheckpoint(playerid);
			SendClientMessage(playerid,LIGHT_BLUE,"You received $500!");
			GivePlayerMoney(playerid,500);
			SetPlayerRaceCheckpoint(playerid,0,trashlv[currentcheckpoint[playerid]-4][0],trashlv[currentcheckpoint[playerid]-4][1],
			trashlv[currentcheckpoint[playerid]-4][2],trashlv[currentcheckpoint[playerid]-3][0],trashlv[currentcheckpoint[playerid]-3][1],
			trashlv[currentcheckpoint[playerid]-3][2],7);
		} else if(currentcheckpoint[playerid] == 13) {
            currentcheckpoint[playerid] = 0;
            SetPlayerRaceCheckpoint(playerid,0,trashlv[0][0],trashlv[0][1],trashlv[0][2],trashlv[1][0],trashlv[1][1],trashlv[1][2],7);
		    SendClientMessage(playerid,LIGHT_BLUE,"You finished the trash route! You can do it again!");
		}
	}
    return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
    if(CPS_IsPlayerInCheckpoint(playerid, cpcopLSjos))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
	        SetPlayerPos(playerid, 1574.0499,-1668.5148,28.3956);
	    }
	}

if(CPS_IsPlayerInCheckpoint(playerid, cpcopLSsus))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
	        SetPlayerPos(playerid, 1575.7050,-1692.9965,6.2188);
	    }
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpcopLVjos))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
	        SetPlayerPos(playerid, 2277.9282,2459.3528,38.6837);
	    }
	}

if(CPS_IsPlayerInCheckpoint(playerid, cpcopLVsus))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
	        SetPlayerPos(playerid, 2276.2097,2445.7578,3.5313);
	    }
	}


if(CPS_IsPlayerInCheckpoint(playerid, cpcopSFjos))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
	        SetPlayerPos(playerid, -1589.9498,724.9433,-4.9063);
	    }
	}

if(CPS_IsPlayerInCheckpoint(playerid, cpcopSFsus))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
	        SetPlayerPos(playerid, -1620.5464,707.2188,48.9375);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpbankentrance))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerPos(playerid, 2309.7588, -15.3791, 26.7496);
		    SetPlayerFacingAngle(playerid, 270.7787);
		    BK[playerid] = 1;
		    SetCameraBehindPlayer(playerid);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cp4Dragonsentrace))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerPos(playerid, 2016.2699,1017.7790,996.8750);
		    SetPlayerInterior(playerid,10);
		    SetCameraBehindPlayer(playerid);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cp4Dragonsexit))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerPos(playerid, 2024.4655,1007.9456,10.8203);
		    SetPlayerInterior(playerid,0);
		    SetCameraBehindPlayer(playerid);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpcaligulasentrace))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerPos(playerid, 2233.8032,1712.2303,1011.7632);
		    SetPlayerInterior(playerid,1);
		    SetCameraBehindPlayer(playerid);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpcaligulasexit))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerPos(playerid, 2192.7700,1676.9839,12.3672);
		    SetPlayerInterior(playerid,0);
		    SetCameraBehindPlayer(playerid);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpammuentrace1))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerPos(playerid, 291.5846,-34.8323,1001.5156);
	        SetPlayerInterior(playerid, 1);
		    AMMU[playerid] = 1;
		    SetCameraBehindPlayer(playerid);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpammuentrace2))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerPos(playerid, 314.820984,-141.431992,999.661987);
	        SetPlayerInterior(playerid, 7);
		    AMMU[playerid] = 2;
		    SetCameraBehindPlayer(playerid);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpammuentrace3))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerPos(playerid, 286.800995 , -82.547600 ,1001.539978);
	        SetPlayerInterior(playerid, 4);
		    AMMU[playerid] = 3;
		    SetCameraBehindPlayer(playerid);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpammuentrace4))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerPos(playerid, 316.524994,-167.706985,999.661987);
        	SetPlayerInterior(playerid, 6);
		    AMMU[playerid] = 4;
		    SetCameraBehindPlayer(playerid);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpammuentrace5))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerPos(playerid, 296.919983,-108.071999,1001.569946 );
	        SetPlayerInterior(playerid, 6);
		    AMMU[playerid] = 5;
		    SetCameraBehindPlayer(playerid);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpammuentrace6))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerPos(playerid, 286.800995 , -82.547600 ,1001.539978);
	        SetPlayerInterior(playerid, 4);
		    AMMU[playerid] = 6;
		    SetCameraBehindPlayer(playerid);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpammuentrace7))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerPos(playerid, 291.5846,-34.8323,1001.5156);
	        SetPlayerInterior(playerid, 1);
		    AMMU[playerid] = 7;
		    SetCameraBehindPlayer(playerid);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpammuentrace8))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerPos(playerid, 316.524994,-167.706985,999.661987);
        	SetPlayerInterior(playerid, 6);
		    AMMU[playerid] = 8;
		    SetCameraBehindPlayer(playerid);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpammuentrace9))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerPos(playerid, 291.5846,-34.8323,1001.5156);
	        SetPlayerInterior(playerid, 1);
		    AMMU[playerid] = 9;
		    SetCameraBehindPlayer(playerid);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpammuentrace10))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerPos(playerid, 286.800995 , -82.547600 ,1001.539978);
	        SetPlayerInterior(playerid, 4);
		    AMMU[playerid] = 10;
		    SetCameraBehindPlayer(playerid);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpammuexit))
	{
	    if(AMMU[playerid] == 1)
	    {
		    SetPlayerPos(playerid,-313.8697,827.5607,14.2422); // SPAWN AMMU 1
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 2)
	    {
		    SetPlayerPos(playerid,-1506.8827,2609.1174,55.8359); // SPAWN AMMU 2
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 3)
	    {
		    SetPlayerPos(playerid,778.2792,1873.9513,4.9228); // SPAWN AMMU 3
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 4)
	    {
		    SetPlayerPos(playerid,2156.9932,946.3765,10.8203); // SPAWN AMMU 4
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 5)
	    {
		    SetPlayerPos(playerid,2537.5974,2086.1917,10.8203); // SPAWN AMMU 5
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 6)
	    {
            SetPlayerPos(playerid,2334.7634,64.1842,26.4837); // SPAWN AMMU 6
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 7)
	    {
		    SetPlayerPos(playerid,1365.6986,-1282.1617,13.5469); // SPAWN AMMU 7
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 8)
	    {
		    SetPlayerPos(playerid,2398.4277,-1980.7507,13.5469); // SPAWN AMMU 8
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 9)
	    {
		    SetPlayerPos(playerid,-2628.1152,209.7469,4.5584); // SPAWN AMMU 9
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 10)
	    {
		    SetPlayerPos(playerid,-2094.8826,-2462.5586,30.6250); // SPAWN AMMU 10
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpammuexit2))
	{
	    if(AMMU[playerid] == 1)
	    {
		    SetPlayerPos(playerid,-313.8697,827.5607,14.2422); // SPAWN AMMU 1
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 2)
	    {
		    SetPlayerPos(playerid,-1506.8827,2609.1174,55.8359); // SPAWN AMMU 2
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 3)
	    {
		    SetPlayerPos(playerid,778.2792,1873.9513,4.9228); // SPAWN AMMU 3
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 4)
	    {
		    SetPlayerPos(playerid,2156.9932,946.3765,10.8203); // SPAWN AMMU 4
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 5)
	    {
		    SetPlayerPos(playerid,2537.5974,2086.1917,10.8203); // SPAWN AMMU 5
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 6)
	    {
            SetPlayerPos(playerid,2334.7634,64.1842,26.4837); // SPAWN AMMU 6
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 7)
	    {
		    SetPlayerPos(playerid,1365.6986,-1282.1617,13.5469); // SPAWN AMMU 7
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 8)
	    {
		    SetPlayerPos(playerid,2398.4277,-1980.7507,13.5469); // SPAWN AMMU 8
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 9)
	    {
		    SetPlayerPos(playerid,-2628.1152,209.7469,4.5584); // SPAWN AMMU 9
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 10)
	    {
		    SetPlayerPos(playerid,-2094.8826,-2462.5586,30.6250); // SPAWN AMMU 10
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpammuexit3))
	{
	    if(AMMU[playerid] == 1)
	    {
		    SetPlayerPos(playerid,-313.8697,827.5607,14.2422); // SPAWN AMMU 1
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 2)
	    {
		    SetPlayerPos(playerid,-1506.8827,2609.1174,55.8359); // SPAWN AMMU 2
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 3)
	    {
		    SetPlayerPos(playerid,778.2792,1873.9513,4.9228); // SPAWN AMMU 3
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 4)
	    {
		    SetPlayerPos(playerid,2156.9932,946.3765,10.8203); // SPAWN AMMU 4
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 5)
	    {
		    SetPlayerPos(playerid,2537.5974,2086.1917,10.8203); // SPAWN AMMU 5
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 6)
	    {
            SetPlayerPos(playerid,2334.7634,64.1842,26.4837); // SPAWN AMMU 6
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 7)
	    {
		    SetPlayerPos(playerid,1365.6986,-1282.1617,13.5469); // SPAWN AMMU 7
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 8)
	    {
		    SetPlayerPos(playerid,2398.4277,-1980.7507,13.5469); // SPAWN AMMU 8
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 9)
	    {
		    SetPlayerPos(playerid,-2628.1152,209.7469,4.5584); // SPAWN AMMU 9
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 10)
	    {
		    SetPlayerPos(playerid,-2094.8826,-2462.5586,30.6250); // SPAWN AMMU 10
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpammuexit4))
	{
	    if(AMMU[playerid] == 1)
	    {
		    SetPlayerPos(playerid,-313.8697,827.5607,14.2422); // SPAWN AMMU 1
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 2)
	    {
		    SetPlayerPos(playerid,-1506.8827,2609.1174,55.8359); // SPAWN AMMU 2
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 3)
	    {
		    SetPlayerPos(playerid,778.2792,1873.9513,4.9228); // SPAWN AMMU 3
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 4)
	    {
		    SetPlayerPos(playerid,2156.9932,946.3765,10.8203); // SPAWN AMMU 4
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 5)
	    {
		    SetPlayerPos(playerid,2537.5974,2086.1917,10.8203); // SPAWN AMMU 5
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 6)
	    {
            SetPlayerPos(playerid,2334.7634,64.1842,26.4837); // SPAWN AMMU 6
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 7)
	    {
		    SetPlayerPos(playerid,1365.6986,-1282.1617,13.5469); // SPAWN AMMU 7
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 8)
	    {
		    SetPlayerPos(playerid,2398.4277,-1980.7507,13.5469); // SPAWN AMMU 8
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 9)
	    {
		    SetPlayerPos(playerid,-2628.1152,209.7469,4.5584); // SPAWN AMMU 9
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 10)
	    {
		    SetPlayerPos(playerid,-2094.8826,-2462.5586,30.6250); // SPAWN AMMU 10
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpammuexit5))
	{
	    if(AMMU[playerid] == 1)
	    {
		    SetPlayerPos(playerid,-313.8697,827.5607,14.2422); // SPAWN AMMU 1
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 2)
	    {
		    SetPlayerPos(playerid,-1506.8827,2609.1174,55.8359); // SPAWN AMMU 2
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 3)
	    {
		    SetPlayerPos(playerid,778.2792,1873.9513,4.9228); // SPAWN AMMU 3
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 4)
	    {
		    SetPlayerPos(playerid,2156.9932,946.3765,10.8203); // SPAWN AMMU 4
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 5)
	    {
		    SetPlayerPos(playerid,2537.5974,2086.1917,10.8203); // SPAWN AMMU 5
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 6)
	    {
            SetPlayerPos(playerid,2334.7634,64.1842,26.4837); // SPAWN AMMU 6
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 7)
	    {
		    SetPlayerPos(playerid,1365.6986,-1282.1617,13.5469); // SPAWN AMMU 7
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 8)
	    {
		    SetPlayerPos(playerid,2398.4277,-1980.7507,13.5469); // SPAWN AMMU 8
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 9)
	    {
		    SetPlayerPos(playerid,-2628.1152,209.7469,4.5584); // SPAWN AMMU 9
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	    if(AMMU[playerid] == 10)
	    {
		    SetPlayerPos(playerid,-2094.8826,-2462.5586,30.6250); // SPAWN AMMU 10
	        SetPlayerInterior(playerid, 0);
		    AMMU[playerid] = 0;
		    SetCameraBehindPlayer(playerid);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cplsbankentrance))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerPos(playerid, 2309.7588, -15.3791, 26.7496);
		    SetPlayerFacingAngle(playerid, 270.7787);
		    BK[playerid] = 2;
		    SetCameraBehindPlayer(playerid);
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpsfbankentrance))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerPos(playerid, 2309.7588, -15.3791, 26.7496);
		    SetPlayerFacingAngle(playerid, 270.7787);
		    BK[playerid] = 3;
		    SetCameraBehindPlayer(playerid);
	    }
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpbankexit))
	{
		if(BK[playerid] == 1)
		{
	    SetPlayerPos(playerid, 2030.2551, 1913.0118, 12.3059);
	    SetPlayerFacingAngle(playerid, 276.3724);
	    SetCameraBehindPlayer(playerid);
	    }
	    if(BK[playerid] == 2)
		{
	    SetPlayerPos(playerid, 1415.9304,-1703.1160,13.5395);
	    SetPlayerFacingAngle(playerid, 249.8486);
	    SetCameraBehindPlayer(playerid);
	    }
	    if(BK[playerid] == 3)
		{
	    SetPlayerPos(playerid, -1581.3892,863.6969,7.4521);
	    SetPlayerFacingAngle(playerid, 179.7295);
	    SetCameraBehindPlayer(playerid);
	    }
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpbank))
	{
	    SendClientMessage(playerid, GREY, "|_| RuNix's Intl. Bank |_|");
	    SendClientMessage(playerid, WHITE, "Deposit (/deposit)");
		SendClientMessage(playerid, WHITE, "Withdraw (/withdraw)");
	    SendClientMessage(playerid, WHITE, "State (/state)");
	    SendClientMessage(playerid, WHITE, "Rob /robbank");
	}
	
	if(CPS_IsPlayerInCheckpoint(playerid, cpcaligulas))
	{
	    SendClientMessage(playerid, GREY, "|_| Caligulas Casino |_|");
	    SendClientMessage(playerid, WHITE, "Rob /robcasino");
	}
	
	if(CPS_IsPlayerInCheckpoint(playerid, cp4Dragons))
	{
	    SendClientMessage(playerid, GREY, "|_| 4Dragons Casino |_|");
	    SendClientMessage(playerid, WHITE, "Rob /robcasino");
	}

if(CPS_IsPlayerInCheckpoint(playerid, cpatm1) || CPS_IsPlayerInCheckpoint(playerid, cpatm2) || CPS_IsPlayerInCheckpoint(playerid, cpatm3) || CPS_IsPlayerInCheckpoint(playerid, cpatm4) || CPS_IsPlayerInCheckpoint(playerid, cpatm5) || CPS_IsPlayerInCheckpoint(playerid, cpatm6) || CPS_IsPlayerInCheckpoint(playerid, cpatm7) || CPS_IsPlayerInCheckpoint(playerid, cpatm9) || CPS_IsPlayerInCheckpoint(playerid, cpatm10) || CPS_IsPlayerInCheckpoint(playerid, cpatm11))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
	        SendClientMessage(playerid, GREY, "|_| RuNix's Intl. 24 Hours |_|");
	        SendClientMessage(playerid, WHITE, "Withdraw: /withdraw");
	        SendClientMessage(playerid, WHITE, "State /state");
	        SendClientMessage(playerid, WHITE, "Rob /robatm");
	    }
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cplvpdentrance))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
	        SetPlayerInterior(playerid, 3);
	        SetPlayerPos(playerid, 238.7411, 143.9135, 1003.0234);
	        SetPlayerFacingAngle(playerid, 0);
	        SetCameraBehindPlayer(playerid);
	        PD[playerid] = 1;
	        SendClientMessage(playerid, WHITE, "Welcome to Las Venturas Police Dept.");
	    }
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cplspdentrance))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
	        SetPlayerInterior(playerid, 3);
	        SetPlayerPos(playerid, 238.7411, 143.9135, 1003.0234);
	        SetPlayerFacingAngle(playerid, 0);
	        SetCameraBehindPlayer(playerid);
			PD[playerid] = 2;
	        SendClientMessage(playerid, WHITE, "Welcome to Los Santos Police Dept.");
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpsfpdentrance))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
	        SetPlayerInterior(playerid, 3);
	        SetPlayerPos(playerid, 238.7411, 143.9135, 1003.0234);
	        SetPlayerFacingAngle(playerid, 0);
	        SetCameraBehindPlayer(playerid);
			PD[playerid] = 3;
	        SendClientMessage(playerid, WHITE, "Welcome to San Fierro Police Dept.");
	    }
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cplvpdexit))
	{
		if(PD[playerid] == 1)
		{
        SetPlayerInterior(playerid, 0);
        SetPlayerPos(playerid, 2286.9600, 2429.1101, 10.8203);
        SetPlayerFacingAngle(playerid, 180.0000);
        SetCameraBehindPlayer(playerid);
        }
        if(PD[playerid] == 2)
		{
        SetPlayerInterior(playerid, 0);
        SetPlayerPos(playerid, 1546.1191,-1675.5358,13.5617);
        SetPlayerFacingAngle(playerid, 86.9884);
        SetCameraBehindPlayer(playerid);
        }
        if(PD[playerid] == 3)
		{
        SetPlayerInterior(playerid, 0);
        SetPlayerPos(playerid, -1605.8496,715.8705,12.0609);
        SetPlayerFacingAngle(playerid, 6.5275);
        SetCameraBehindPlayer(playerid);
        }
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cplvpdhand))
	{
		if(GetPlayerWantedLevel(playerid) > 3)
		{
			if(PD[playerid] == 1)
			{
			SendClientMessage(playerid, GREY, "|_| Las Venturas PD |_|");
			SendClientMessage(playerid, WHITE, "Are you sure you want to hand yourself?");
			ShowMenuForPlayer(Hand, playerid);
			TogglePlayerControllable(playerid, false);
			}
			if(PD[playerid] == 2)
			{
			SendClientMessage(playerid, GREY, "|_| Los Santos PD |_|");
			SendClientMessage(playerid, WHITE, "Are you sure you want to hand yourself?");
			ShowMenuForPlayer(Hand, playerid);
			TogglePlayerControllable(playerid, false);
			}
			if(PD[playerid] == 3)
			{
			SendClientMessage(playerid, GREY, "|_| San Fierro PD |_|");
			SendClientMessage(playerid, WHITE, "Are you sure you want to hand yourself?");
			ShowMenuForPlayer(Hand, playerid);
			TogglePlayerControllable(playerid, false);
			}
		}
		else
		{
		    new string[250];
			SendClientMessage(playerid, ERROR, "Only people with 4 or more Wanted Levels can hand themselves");
			format(string, sizeof(string), "Your current Wanted Level: %d", GetPlayerWantedLevel(playerid));
			SendClientMessage(playerid, ERROR, string);
		}
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cphospital) || CPS_IsPlayerInCheckpoint(playerid, cplshospital) || CPS_IsPlayerInCheckpoint(playerid, cpsfhospital))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SendClientMessage(playerid, WHITE, "Need medical assistance? Type /healme ($500)");
		}
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpdildoentrance))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
	    	SetPlayerInterior(playerid, 3);
			SetPlayerPos(playerid, -99.9340, -20.6957, 1000.7188);
			SetPlayerFacingAngle(playerid, 0.5315);
			SetCameraBehindPlayer(playerid);
			SendClientMessage(playerid, WHITE, "Welcome to Las Venturas Dildos.");
		}
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpdildoexit))
	{
		SetPlayerInterior(playerid, 0);
		SetPlayerPos(playerid, 2088.4480, 2074.0068, 10.8203);
		SetPlayerFacingAngle(playerid, 270.7921);
		SetCameraBehindPlayer(playerid);
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpdildo))
	{
	    TogglePlayerControllable(playerid, false);
	    ShowMenuForPlayer(Dildo, playerid);
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cplvchentrance))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerInterior(playerid, 3);
			SetPlayerPos(playerid, 384.6555, 173.7660, 1008.3828);
			SetPlayerFacingAngle(playerid, 90.5014);
			SetCameraBehindPlayer(playerid);
			CH[playerid] = 1;
			SendClientMessage(playerid, WHITE, "Welcome to Las Venturas City Hall.");
		}
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cplschentrance))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerInterior(playerid, 3);
			SetPlayerPos(playerid, 384.6555, 173.7660, 1008.3828);
			SetPlayerFacingAngle(playerid, 90.5014);
			SetCameraBehindPlayer(playerid);
			CH[playerid] = 2;
			SendClientMessage(playerid, WHITE, "Welcome to Los Santos City Hall.");
		}
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cplvchexit))
	{
		if(CH[playerid] == 1)
		{
		SetPlayerInterior(playerid, 0);
		SetPlayerPos(playerid, 2417.2981, 1123.3763, 10.8203);
		SetPlayerFacingAngle(playerid, 271.8128);
		SetCameraBehindPlayer(playerid);
		}
		if(CH[playerid] == 2)
		{
		SetPlayerInterior(playerid, 0);
		SetPlayerPos(playerid, 1481.1832,-1765.8462,18.7958);
		SetPlayerFacingAngle(playerid, 357.3454);
		SetCameraBehindPlayer(playerid);
		}
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpcityhall))
	{
        new string[128];
        HideDraw(playerid);
		TextDrawShowForPlayer(playerid, HALLBOX);
		TextDrawShowForPlayer(playerid, text9);
		TextDrawShowForPlayer(playerid, text19);
		format(string, sizeof(string),"~n~~r~1.~w~Change Class~n~~n~~r~2.~w~Rob City hall");
	    TextDrawSetString(text19, string);
	    CHALLBOX[playerid] = 1;
		TogglePlayerControllable(playerid, false);
	}
	
	if(CPS_IsPlayerInCheckpoint(playerid, cpammu))
	{
        HideDraw(playerid);
		TextDrawShowForPlayer(playerid, AMMUBOX1);
		TextDrawShowForPlayer(playerid, text37);
		TextDrawShowForPlayer(playerid, text38);
	    AMMUBOX[playerid] = 1;
	}
	
	if(CPS_IsPlayerInCheckpoint(playerid, cpammu2))
	{
        HideDraw(playerid);
		TextDrawShowForPlayer(playerid, AMMUBOX1);
		TextDrawShowForPlayer(playerid, text37);
		TextDrawShowForPlayer(playerid, text38);
	    AMMUBOX[playerid] = 1;
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpammu3))
	{
        HideDraw(playerid);
		TextDrawShowForPlayer(playerid, AMMUBOX1);
		TextDrawShowForPlayer(playerid, text37);
		TextDrawShowForPlayer(playerid, text38);
	    AMMUBOX[playerid] = 1;
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpammu4))
	{
        HideDraw(playerid);
		TextDrawShowForPlayer(playerid, AMMUBOX1);
		TextDrawShowForPlayer(playerid, text37);
		TextDrawShowForPlayer(playerid, text38);
	    AMMUBOX[playerid] = 1;
	}
    if(CPS_IsPlayerInCheckpoint(playerid, cpammu5))
	{
        HideDraw(playerid);
		TextDrawShowForPlayer(playerid, AMMUBOX1);
		TextDrawShowForPlayer(playerid, text37);
		TextDrawShowForPlayer(playerid, text38);
	    AMMUBOX[playerid] = 1;
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpghost))
	{
		if(!IsPlayerInAnyVehicle(playerid))
	    {
	        new file[250], name[MAX_PLAYER_NAME];
	        GetPlayerName(playerid, name, sizeof(name));
	        format(file, sizeof(file), "%s.runix", name);
	        if(dini_Int(file, "RentalOwner") == 0)
	        {
				TogglePlayerControllable(playerid, false);
				ShowMenuForPlayer(Rental, playerid);
				CAR[playerid] = 1;
			}
			else if(dini_Int(file, "RentalOwner") == 1) SendClientMessage(playerid, ERROR, "You're the Rental's owner. You cannot rent or rob your own store.");
		}
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cplsghost))
	{
		if(!IsPlayerInAnyVehicle(playerid))
	    {
	        new file[250], name[MAX_PLAYER_NAME];
	        GetPlayerName(playerid, name, sizeof(name));
	        format(file, sizeof(file), "%s.runix", name);
	        if(dini_Int(file, "RentalOwner") == 0)
	        {
				TogglePlayerControllable(playerid, false);
				ShowMenuForPlayer(Rental, playerid);
				CAR[playerid] = 2;
			}
			else if(dini_Int(file, "RentalOwner") == 1) SendClientMessage(playerid, ERROR, "You're the Rental's owner. You cannot rent or rob your own store.");
		}
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpsfghost))
	{
		if(!IsPlayerInAnyVehicle(playerid))
	    {
	        new file[250], name[MAX_PLAYER_NAME];
	        GetPlayerName(playerid, name, sizeof(name));
	        format(file, sizeof(file), "%s.runix", name);
	        if(dini_Int(file, "RentalOwner") == 0)
	        {
				TogglePlayerControllable(playerid, false);
				ShowMenuForPlayer(Rental, playerid);
				CAR[playerid] = 3;
			}
			else if(dini_Int(file, "RentalOwner") == 1) SendClientMessage(playerid, ERROR, "You're the Rental's owner. You cannot rent or rob your own store.");
		}
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpbarentrance))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
	        	ShowMenuForPlayer(BarEntrance, playerid);
	        	BAR[playerid] = 1;
	        	TogglePlayerControllable(playerid, false);
	    }
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cplsbarentrance))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
	        	ShowMenuForPlayer(BarEntrance, playerid);
				BAR[playerid] = 2;
	        	TogglePlayerControllable(playerid, false);
	    }
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpbarexit))
	{
		if(BAR[playerid] == 1)
		{
		SetPlayerInterior(playerid, 0);
		SetPlayerPos(playerid, 2108.8542, 1333.7935, 10.8203);
		SetPlayerFacingAngle(playerid, 89.8424);
		SetCameraBehindPlayer(playerid);
		}
		if(BAR[playerid] == 2)
		{
		SetPlayerInterior(playerid, 0);
		SetPlayerPos(playerid, 2306.1807,-1646.4257,14.4478);
		SetPlayerFacingAngle(playerid, 173.0816);
		SetCameraBehindPlayer(playerid);
		}
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpbincoentrance))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerInterior(playerid, 15);
		    SetPlayerPos(playerid, 207.6031, -106.4911, 1005.1328);
		    SetPlayerFacingAngle(playerid, 359.5176);
		    SetCameraBehindPlayer(playerid);
		    BIC[playerid] = 1;
		    SendClientMessage(playerid, WHITE, "Welcome to Binco.");
		}
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cplsbincoentrance))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerInterior(playerid, 15);
		    SetPlayerPos(playerid, 207.6031, -106.4911, 1005.1328);
		    SetPlayerFacingAngle(playerid, 359.5176);
		    SetCameraBehindPlayer(playerid);
		    BIC[playerid] = 2;
		    SendClientMessage(playerid, WHITE, "Welcome to Binco.");
		}
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpbincoexit))
	{
		if(BIC[playerid] == 1)
		{
	    SetPlayerInterior(playerid, 0);
	    SetPlayerPos(playerid, 2106.7976, 2257.4944, 11.0234);
	    SetPlayerFacingAngle(playerid, 275.3339);
	    SetCameraBehindPlayer(playerid);
	    }
	    if(BIC[playerid] == 2)
		{
	    SetPlayerInterior(playerid, 0);
	    SetPlayerPos(playerid, 2245.6504,-1662.0643,15.4690);
	    SetPlayerFacingAngle(playerid, 341.0744);
	    SetCameraBehindPlayer(playerid);
	    }
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpbinco))
	{
        HideDraw(playerid);
		TextDrawShowForPlayer(playerid, BBOX);
		TextDrawShowForPlayer(playerid, text35);
		TextDrawShowForPlayer(playerid, text36);
		CSKIN[playerid] = 1;
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpzipentrance))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerInterior(playerid, 18);
		    SetPlayerPos(playerid, 161.2862, -92.0219, 1001.8047);
		    SetPlayerFacingAngle(playerid, 1.0461);
		    SetCameraBehindPlayer(playerid);
		    ZP[playerid] = 1;
		    SendClientMessage(playerid, WHITE, "Welcome to ZIP.");
		}
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cplszipentrance))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerInterior(playerid, 18);
		    SetPlayerPos(playerid, 161.2862, -92.0219, 1001.8047);
		    SetPlayerFacingAngle(playerid, 1.0461);
		    SetCameraBehindPlayer(playerid);
		    ZP[playerid] = 2;
		    SendClientMessage(playerid, WHITE, "Welcome to ZIP.");
		}
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpsfzipentrance))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerInterior(playerid, 18);
		    SetPlayerPos(playerid, 161.2862, -92.0219, 1001.8047);
		    SetPlayerFacingAngle(playerid, 1.0461);
		    SetCameraBehindPlayer(playerid);
		    ZP[playerid] = 3;
		    SendClientMessage(playerid, WHITE, "Welcome to ZIP.");
		}
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpzipexit))
	{
		if(ZP[playerid] == 1)
		{
	    SetPlayerInterior(playerid, 0);
	    SetPlayerPos(playerid, 2249.2781, 966.7142, 10.8203);
	    SetPlayerFacingAngle(playerid, 0.8219);
	    SetCameraBehindPlayer(playerid);
	    }
	    if(ZP[playerid] == 2)
		{
	    SetPlayerInterior(playerid, 0);
	    SetPlayerPos(playerid, 2139.0991,-1746.0112,13.5524);
	    SetPlayerFacingAngle(playerid, 182.6752);
	    SetCameraBehindPlayer(playerid);
	    }
	    if(ZP[playerid] == 3)
		{
	    SetPlayerInterior(playerid, 0);
	    SetPlayerPos(playerid, -1883.5844,825.3109,35.1736);
	    SetPlayerFacingAngle(playerid, 47.3566);
	    SetCameraBehindPlayer(playerid);
	    }
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpzip))
	{
	    HideDraw(playerid);
		TextDrawShowForPlayer(playerid, BBOX);
		TextDrawShowForPlayer(playerid, text35);
		TextDrawShowForPlayer(playerid, text36);
		CSKINZ[playerid] = 1;
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpbombshop))
	{
	    new string[250], name[MAX_PLAYER_NAME];
	    GetPlayerName(playerid, name, sizeof(name));
	    SendClientMessage(playerid, GREY, "|_| Bomb Shop |_|");
	    format(string, sizeof(string), "Wassup, %s?", name);
	    SendClientMessage(playerid, WHITE, string);
	    SendClientMessage(playerid, WHITE, "We work with serious shit here. I mean C4s.");
	    SendClientMessage(playerid, WHITE, "If you wanna buy some, type /buyc4. They cost $1000 each.");
	    SendClientMessage(playerid, WHITE, "Remember, you can only carry 3 blocks with you.");
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cplsbombshop))
	{
	    new string[250], name[MAX_PLAYER_NAME];
	    GetPlayerName(playerid, name, sizeof(name));
	    SendClientMessage(playerid, GREY, "|_| Bomb Shop |_|");
	    format(string, sizeof(string), "Wassup, %s?", name);
	    SendClientMessage(playerid, WHITE, string);
	    SendClientMessage(playerid, WHITE, "We work with serious shit here. I mean C4s.");
	    SendClientMessage(playerid, WHITE, "If you wanna buy some, type /buyc4. They cost $1000 each.");
	    SendClientMessage(playerid, WHITE, "Remember, you can only carry 3 blocks with you.");
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpsfbombshop))
	{
	    new string[250], name[MAX_PLAYER_NAME];
	    GetPlayerName(playerid, name, sizeof(name));
	    SendClientMessage(playerid, GREY, "|_| Bomb Shop |_|");
	    format(string, sizeof(string), "Wassup, %s?", name);
	    SendClientMessage(playerid, WHITE, string);
	    SendClientMessage(playerid, WHITE, "We work with serious shit here. I mean C4s.");
	    SendClientMessage(playerid, WHITE, "If you wanna buy some, type /buyc4. They cost $1000 each.");
	    SendClientMessage(playerid, WHITE, "Remember, you can only carry 3 blocks with you.");
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpurbanentrance))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerInterior(playerid, 1);
		    SetPlayerPos(playerid, 203.8431, -46.6475, 1001.8047);
		    SetPlayerFacingAngle(playerid, 0.8763);
		    SetCameraBehindPlayer(playerid);
		    RB[playerid] = 1;
		    SendClientMessage(playerid, WHITE, "Welcome to SubUrban.");
		}
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cplsurbanentrance))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerInterior(playerid, 1);
		    SetPlayerPos(playerid, 203.8431, -46.6475, 1001.8047);
		    SetPlayerFacingAngle(playerid, 0.8763);
		    SetCameraBehindPlayer(playerid);
		    RB[playerid] = 2;
		    SendClientMessage(playerid, WHITE, "Welcome to SubUrban.");
		}
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpsfurbanentrance))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerInterior(playerid, 1);
		    SetPlayerPos(playerid, 203.8431, -46.6475, 1001.8047);
		    SetPlayerFacingAngle(playerid, 0.8763);
		    SetCameraBehindPlayer(playerid);
		    RB[playerid] = 4;
		    SendClientMessage(playerid, WHITE, "Welcome to SubUrban.");
		}
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cplsurbanentrance2))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
		    SetPlayerInterior(playerid, 1);
		    SetPlayerPos(playerid, 203.8431, -46.6475, 1001.8047);
		    SetPlayerFacingAngle(playerid, 0.8763);
		    SetCameraBehindPlayer(playerid);
		    RB[playerid] = 3;
		    SendClientMessage(playerid, WHITE, "Welcome to SubUrban.");
		}
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpurbanexit))
	{
		if(RB[playerid] == 1)
		{
	    SetPlayerInterior(playerid, 0);
	    SetPlayerPos(playerid, 2178.7288, 2293.6926, 10.8203);
	    SetPlayerFacingAngle(playerid, 117.6881);
	    SetCameraBehindPlayer(playerid);
	    }
	    if(RB[playerid] == 2)
		{
	    SetPlayerInterior(playerid, 0);
	    SetPlayerPos(playerid, 501.7690,-1355.0167,16.1328);
	    SetPlayerFacingAngle(playerid, 337.6372);
	    SetCameraBehindPlayer(playerid);
	    }
	    if(RB[playerid] == 3)
		{
	    SetPlayerInterior(playerid, 0);
	    SetPlayerPos(playerid, 820.0910,-1760.1797,13.5495);
	    SetPlayerFacingAngle(playerid, 139.5130);
	    SetCameraBehindPlayer(playerid);
	    }
	    if(RB[playerid] == 4)
		{
	    SetPlayerInterior(playerid, 0);
	    SetPlayerPos(playerid, -2494.4319,-142.8247,25.6094);
	    SetPlayerFacingAngle(playerid, 91.5816);
	    SetCameraBehindPlayer(playerid);
	    }
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpurban))
	{
	    HideDraw(playerid);
		TextDrawShowForPlayer(playerid, BBOX);
		TextDrawShowForPlayer(playerid, text35);
		TextDrawShowForPlayer(playerid, text36);
		CSKINU[playerid] = 1;
	}

	if(CPS_IsPlayerInCheckpoint(playerid, cpdrugs))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
	        if(gTeam[playerid] != COP && gTeam[playerid] != Medic)
     		{
				TogglePlayerControllable(playerid, false);
		    	ShowMenuForPlayer(Drugs, playerid);
		    	SendClientMessage(playerid, GREY, "|_| The Drug Point |_|");
		    	SendClientMessage(playerid, WHITE, "Hey dog, liked our new place?");
		    	SendClientMessage(playerid, WHITE, "Look dude, we can sell you:");
		    	SendClientMessage(playerid, WHITE, "5 grams for $20");
		    	SendClientMessage(playerid, WHITE, "or 15 grams for $30");
		    	SendClientMessage(playerid, WHITE, "or 20 grams for $40");
		    	SendClientMessage(playerid, WHITE, "or 25 grams for $50");
		    	SendClientMessage(playerid, WHITE, "You choose.");
			}
			else SendClientMessage(playerid, ERROR, "Cops and Medics cannot buy drugs.");
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cplsdrugs))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
	        if(gTeam[playerid] != COP && gTeam[playerid] != Medic)
     		{
				TogglePlayerControllable(playerid, false);
		    	ShowMenuForPlayer(Drugs, playerid);
		    	SendClientMessage(playerid, GREY, "|_| The Drug Point |_|");
		    	SendClientMessage(playerid, WHITE, "Hey dog, liked our new place?");
		    	SendClientMessage(playerid, WHITE, "Look dude, we can sell you:");
		    	SendClientMessage(playerid, WHITE, "5 grams for $20");
		    	SendClientMessage(playerid, WHITE, "or 15 grams for $30");
		    	SendClientMessage(playerid, WHITE, "or 20 grams for $40");
		    	SendClientMessage(playerid, WHITE, "or 25 grams for $50");
		    	SendClientMessage(playerid, WHITE, "You choose.");
			}
			else SendClientMessage(playerid, ERROR, "Cops and Medics cannot buy drugs.");
	    }
	}
	if(CPS_IsPlayerInCheckpoint(playerid, cpsfdrugs))
	{
	    if(!IsPlayerInAnyVehicle(playerid))
	    {
	        if(gTeam[playerid] != COP && gTeam[playerid] != Medic)
     		{
				TogglePlayerControllable(playerid, false);
		    	ShowMenuForPlayer(Drugs, playerid);
		    	SendClientMessage(playerid, GREY, "|_| The Drug Point |_|");
		    	SendClientMessage(playerid, WHITE, "Hey dog, liked our new place?");
		    	SendClientMessage(playerid, WHITE, "Look dude, we can sell you:");
		    	SendClientMessage(playerid, WHITE, "5 grams for $20");
		    	SendClientMessage(playerid, WHITE, "or 15 grams for $30");
		    	SendClientMessage(playerid, WHITE, "or 20 grams for $40");
		    	SendClientMessage(playerid, WHITE, "or 25 grams for $50");
		    	SendClientMessage(playerid, WHITE, "You choose.");
			}
			else SendClientMessage(playerid, ERROR, "Cops and Medics cannot buy drugs.");
	    }
	}
    return true;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	if(!CPS_IsPlayerInCheckpoint(playerid, cpdildo) && RobDildo[playerid] >=1)
	{
		RobDildo[playerid] = 0;
		SendClientMessage(playerid, ERROR, "You left the Checkpoint. The robbery has been canceled.");
	}
	if(!CPS_IsPlayerInCheckpoint(playerid, cp4Dragons) && RobD4[playerid] >=1)
	{
		RobD4[playerid] = 0;
		SendClientMessage(playerid, ERROR, "You left the Checkpoint. The robbery has been canceled.");
	}
	if(!CPS_IsPlayerInCheckpoint(playerid, cpcaligulas) && RobCa[playerid] >=1)
	{
		RobCa[playerid] = 0;
		SendClientMessage(playerid, ERROR, "You left the Checkpoint. The robbery has been canceled.");
	}
	if(!CPS_IsPlayerInCheckpoint(playerid, cpcityhall) && RobHall[playerid] >=1)
	{
		RobHall[playerid] = 0;
		SendClientMessage(playerid, ERROR, "You left the Checkpoint. The robbery has been canceled.");
	}
	if(!CPS_IsPlayerInCheckpoint(playerid, cpghost) && RobRental[playerid] >=1)
	{
		RobRental[playerid] = 0;
		SendClientMessage(playerid, ERROR, "You left the Checkpoint. The robbery has been canceled.");
	}
	if(!CPS_IsPlayerInCheckpoint(playerid, cpbank) && RobBank[playerid] >= 1)
	{
	    RobBank[playerid] = 0;
	    SendClientMessage(playerid, ERROR, "You left the Checkpoint. The robbery has been canceled.");
	}
	if(!CPS_IsPlayerInCheckpoint(playerid, cpbinco) && RobBinco[playerid] >= 1)
	{
	    RobBinco[playerid] = 0;
	    SendClientMessage(playerid, ERROR, "You left the Checkpoint. The robbery has been canceled.");
	}
	if(!CPS_IsPlayerInCheckpoint(playerid, cpzip) && RobZip[playerid] >= 1)
	{
	    RobZip[playerid] = 0;
	    SendClientMessage(playerid, ERROR, "You left the Checkpoint. The robbery has been canceled.");
	}
	if(!CPS_IsPlayerInCheckpoint(playerid, cpurban) && RobUrban[playerid] >= 1)
	{
	    RobUrban[playerid] = 0;
	    SendClientMessage(playerid, ERROR, "You left the Checkpoint. The robbery has been canceled.");
	}
	if(!CPS_IsPlayerInCheckpoint(playerid, cpammu) && RobAmmu[playerid] >= 1)
	{
	    RobAmmu[playerid] = 0;
	    SendClientMessage(playerid, ERROR, "You left the Checkpoint. The robbery has been canceled.");
	}
	if(!CPS_IsPlayerInCheckpoint(playerid, cpammu2) && RobAmmu2[playerid] >= 1)
	{
	    RobAmmu2[playerid] = 0;
	    SendClientMessage(playerid, ERROR, "You left the Checkpoint. The robbery has been canceled.");
	}
	if(!CPS_IsPlayerInCheckpoint(playerid, cpammu3) && RobAmmu3[playerid] >= 1)
	{
	    RobAmmu3[playerid] = 0;
	    SendClientMessage(playerid, ERROR, "You left the Checkpoint. The robbery has been canceled.");
	}
	if(!CPS_IsPlayerInCheckpoint(playerid, cpammu4) && RobAmmu4[playerid] >= 1)
	{
	    RobAmmu4[playerid] = 0;
	    SendClientMessage(playerid, ERROR, "You left the Checkpoint. The robbery has been canceled.");
	}
	if(!CPS_IsPlayerInCheckpoint(playerid, cpammu5) && RobAmmu5[playerid] >= 1)
	{
	    RobAmmu5[playerid] = 0;
	    SendClientMessage(playerid, ERROR, "You left the Checkpoint. The robbery has been canceled.");
	}
	if(!CPS_IsPlayerInCheckpoint(playerid, cpdrugs) && RobDrugs[playerid] >= 1)
	{
	    RobDrugs[playerid] = 0;
	    SendClientMessage(playerid, ERROR, "You left the Checkpoint. The robbery has been canceled.");
	}
	return true;
}

public OnPlayerRequestSpawn(playerid)
{
	if(IsPlayerLogged[playerid] == 0)
	{
	    SendClientMessage(playerid, ERROR, "You need to login before the spawn. Type /login [password]!");
	    return false;
	}
	else if(IsPlayerLogged[playerid] == 1)
	{
	    if(GetPlayerSkin(playerid) >= 280 && GetPlayerSkin(playerid) <= 288 || GetPlayerSkin(playerid) >= 274 && GetPlayerSkin(playerid) <= 276)
	    {
	        if(GetPlayerWantedLevel(playerid) > 0)
	        {
	            SendClientMessage(playerid, ERROR, "The Police are looking for you. Login as a Civilian and hand yourself.");
	            return false;
	        }
			else if(GetPlayerWantedLevel(playerid) == 0) return true;
	    }
		else return true;
	}
	return true;
}

public OnObjectMoved(objectid)
{
	return true;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	new rname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, rname, sizeof(rname));
	if(GetPlayerMenu(playerid) == Hand)
	{
	    switch(row)
	    {
	        case 0:
	        {
	            new spawn = random(sizeof(PrisonSpawn)), string[250], name[MAX_PLAYER_NAME], Float:health;
	            GetPlayerHealth(playerid, health);
				SendClientMessage(playerid, GREY, "|_| San Andreas Police Dept. |_|");
				SendClientMessage(playerid, WHITE, "You've handed yourself.");
				SendClientMessage(playerid, WHITE, "They've confiscated your weapons.");
				SendClientMessage(playerid, WHITE, "Wanted Level reduced to zero.");
				ResetPlayerWeapons(playerid);
				SetPlayerPos(playerid, PrisonSpawn[spawn][0], PrisonSpawn[spawn][1], PrisonSpawn[spawn][2]);
				SetPlayerFacingAngle(playerid, PrisonSpawn[spawn][3]);
				SetCameraBehindPlayer(playerid);
				if(GetPlayerWantedLevel(playerid) >= 4 && GetPlayerWantedLevel(playerid) <= 5) PrisonTime[playerid] = 60;
				else if(GetPlayerWantedLevel(playerid) >= 6 && GetPlayerWantedLevel(playerid) <= 8) PrisonTime[playerid] = 120;
				else if(GetPlayerWantedLevel(playerid) >= 9 && GetPlayerWantedLevel(playerid) <= 11) PrisonTime[playerid] = 180;
				else if(GetPlayerWantedLevel(playerid) >= 12 && GetPlayerWantedLevel(playerid) <= 14) PrisonTime[playerid] = 240;
				else if(GetPlayerWantedLevel(playerid) >= 15) PrisonTime[playerid] = 300;
				SetPlayerWantedLevel(playerid, 0);
				TogglePlayerControllable(playerid, true);
				GetPlayerName(playerid, name, sizeof(name));
				SetPlayerJailed(playerid, true);
				format(string, sizeof(string), "%s[ID:%d] has handed himself.", name, playerid);
				Announce(string);
				if(health <= 90)
				{
				    SendClientMessage(playerid, GREY, "|_| San Andreas Police Dept. |_|");
				    SendClientMessage(playerid, WHITE, "SA PD has given you some food.");
				    SetPlayerHealth(playerid, health+10);
				    ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.0, 0, 0, 0, 0, 0);
				}
	        }
	        case 1:
	        {
	            TogglePlayerControllable(playerid, true);
	        }
		}
	}
	if(GetPlayerMenu(playerid) == Dildo)
	{
	    switch(row)
	    {
	        case 0:
	        {
	            if(GetPlayerMoney(playerid) > 49)
	            {
	                GivePlayerMoney(playerid, -50);
	                GivePlayerWeapon(playerid, 10, 1);
	                SendClientMessage(playerid, WHITE, "You bought a Purple Dildo for $50!");
	                TogglePlayerControllable(playerid, true);
	            }
				else
				{
				    SendClientMessage(playerid, ERROR, "Not enough money! $50");
				    TogglePlayerControllable(playerid, true);
				}
	        }
	        case 1:
	        {
	            if(GetPlayerMoney(playerid) > 49)
	            {
	                GivePlayerMoney(playerid, -50);
	                GivePlayerWeapon(playerid, 11, 1);
	                SendClientMessage(playerid, WHITE, "You bought a White Dildo for $50!");
	                TogglePlayerControllable(playerid, true);
	            }
				else
				{
				    SendClientMessage(playerid, ERROR, "Not enough money! $50");
				    TogglePlayerControllable(playerid, true);
				}
	        }
	        case 2:
	        {
	            if(GetPlayerMoney(playerid) > 49)
	            {
	                GivePlayerMoney(playerid, -50);
	                GivePlayerWeapon(playerid, 13, 1);
	                SendClientMessage(playerid, WHITE, "You bought a GREY Dildo for $50!");
	                TogglePlayerControllable(playerid, true);
	            }
				else
				{
				    SendClientMessage(playerid, ERROR, "Not enough money! $50");
				    TogglePlayerControllable(playerid, true);
				}
	        }
	        case 3:
	        {
				if(gTeam[playerid] != COP && gTeam[playerid] != Medic)
				{
			            if(DildoRecentlyRobbed == 0)
			            {
			                new chances = random(200);
			                if(chances >= 0 && chances <= 100)
			                {
			                    new string[250];
			            		RobDildo[playerid] = 20;
			            		TogglePlayerControllable(playerid, true);
			            		DildoRecentlyRobbed = 250;
			            		format(string, sizeof(string), "%s[ID:%d] started a Robbery at Las Venturas Dildos!", rname, playerid);
			           			Announce(string);
							}
							else if(chances >= 101 && chances <= 200)
							{
							    new name[MAX_PLAYER_NAME], copmsg[250];
							    GetPlayerName(playerid, name, sizeof(name));
							    SendClientMessage(playerid, ERROR, "Your attempt to rob Las Venturas Dildos failed!");
							    SendClientMessage(playerid, ERROR, "The Police are on their way to the store.");
								SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 1);
								format(copmsg, sizeof(copmsg), "[HQ] %s attemped to rob Las Venturas Dildos.", name);
								SendRadioMessageToCops(copmsg);
								DildoRecentlyRobbed = 200;
							}
						}
						else if(DildoRecentlyRobbed > 0) SendClientMessage(playerid, ERROR, "Las Venturas Dildo has been robbed recently!");
						TogglePlayerControllable(playerid, true);
				}
				else SendClientMessage(playerid, ERROR, "Your team cannot rob anything."); TogglePlayerControllable(playerid, true);
			}
		}
	}
	if(GetPlayerMenu(playerid) == Rental)
	{
	    switch(row)
	    {
	        case 0:
	        {
	            TogglePlayerControllable(playerid, false);
	            SetTimerEx("ShowCarListMenu", 250, false, "d", playerid);
			}
			case 1:
			{
			    if(gTeam[playerid] != COP && gTeam[playerid] != Medic)
				{
					    if(RentalRecentlyRobbed == 0)
			            {
			                new chances = random(200);
			                if(chances >= 0 && chances <= 170)
			                {
			                    new string[250];
			            		RobRental[playerid] = 20;
			            		TogglePlayerControllable(playerid, true);
			            		RentalRecentlyRobbed = 250;
			            		format(string, sizeof(string), "%s[ID:%d] started a Robbery at Car Shop!", rname, playerid);
			           			Announce(string);
							}
							else if(chances >= 171 && chances <= 200)
							{
							    new name[MAX_PLAYER_NAME], copmsg[250];
							    GetPlayerName(playerid, name, sizeof(name));
							    SendClientMessage(playerid, ERROR, "Your attempt to rob Car Shop failed!");
							    SendClientMessage(playerid, ERROR, "The Police are on their way to the store.");
								SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 1);
								format(copmsg, sizeof(copmsg), "[HQ] %s attemped to rob Car Shop.", name);
								SendRadioMessageToCops(copmsg);
								RentalRecentlyRobbed = 200;
								TogglePlayerControllable(playerid, true);
							}
						}
						else if(RentalRecentlyRobbed > 0)
						{
							SendClientMessage(playerid, ERROR, "Car Shop has been robbed recently!");
							TogglePlayerControllable(playerid, true);
						}
				}
				else SendClientMessage(playerid, ERROR, "Your team cannot rob anything."); TogglePlayerControllable(playerid, true);
			}
		}
	}
	if(GetPlayerMenu(playerid) == CarList)
	{
		switch(row)
		{
		    case 0: // Voodoo
		    {
		        if(RentedACarRecently[playerid] == 0)
				{
			        if(GetPlayerMoney(playerid) > 19999)
			        {
						if(CAR[playerid] == 1)
						{
						new string[250], name[MAX_PLAYER_NAME], vehicle = AddStaticVehicle(412, 2174.0623, 1421.0023, 10.6564, 90.4570, -1, -1);
						PutPlayerInVehicle(playerid, vehicle, 0);
						Rented[vehicle] = 1;
						GivePlayerMoney(playerid, -20000);
						GetPlayerName(playerid, name, sizeof(name));
						format(string, sizeof(string), "%s[ID:%d] rented a Voodoo from Car Shop for $20000!", name, playerid);
						Announce(string);
						RentedACarRecently[playerid] = 60;
						TogglePlayerControllable(playerid, true);
						for(new i = 0; i < MAX_PLAYERS; i++)
						{
							new file[256], rentalowner[MAX_PLAYER_NAME], ownermsg[250];
							GetPlayerName(i, rentalowner, sizeof(rentalowner));
							format(file, sizeof(file), "%s.runix", rentalowner);
							if(IsPlayerConnected(i) && dini_Int(file, "RentalOwner") == 1)
							{
							    format(ownermsg, sizeof(ownermsg), "%s[ID:%d] rented a Voodoo for $20000 in your Rental Business.", name, playerid);
							    SendClientMessage(i, SERVER_COLOR, ownermsg);
							    SendClientMessage(i, SERVER_COLOR, "$20000 deposited to your Bank Account.");
							    SetPlayerBankCash(i, GetPlayerBankCash(i)+20000);
							}
						}
						}
						if(CAR[playerid] == 2)
						{
						new string[250], name[MAX_PLAYER_NAME], vehicle = AddStaticVehicle(412, 1691.6538,-1477.3641,13.1471,89.9192, -1, -1);
						PutPlayerInVehicle(playerid, vehicle, 0);
						Rented[vehicle] = 1;
						GivePlayerMoney(playerid, -20000);
						GetPlayerName(playerid, name, sizeof(name));
						format(string, sizeof(string), "%s[ID:%d] rented a Voodoo from Car Shop for $20000!", name, playerid);
						Announce(string);
						RentedACarRecently[playerid] = 60;
						TogglePlayerControllable(playerid, true);
						for(new i = 0; i < MAX_PLAYERS; i++)
						{
							new file[256], rentalowner[MAX_PLAYER_NAME], ownermsg[250];
							GetPlayerName(i, rentalowner, sizeof(rentalowner));
							format(file, sizeof(file), "%s.runix", rentalowner);
							if(IsPlayerConnected(i) && dini_Int(file, "RentalOwner") == 1)
							{
							    format(ownermsg, sizeof(ownermsg), "%s[ID:%d] rented a Voodoo for $20000 in your Rental Business.", name, playerid);
							    SendClientMessage(i, SERVER_COLOR, ownermsg);
							    SendClientMessage(i, SERVER_COLOR, "$20000 deposited to your Bank Account.");
							    SetPlayerBankCash(i, GetPlayerBankCash(i)+20000);
							}
						}
						}
						if(CAR[playerid] == 3)
						{
						new string[250], name[MAX_PLAYER_NAME], vehicle = AddStaticVehicle(412, -1928.6866,275.1254,40.8135,180.9483, -1, -1);
						PutPlayerInVehicle(playerid, vehicle, 0);
						Rented[vehicle] = 1;
						GivePlayerMoney(playerid, -20000);
						GetPlayerName(playerid, name, sizeof(name));
						format(string, sizeof(string), "%s[ID:%d] rented a Voodoo from Car Shop for $20000!", name, playerid);
						Announce(string);
						RentedACarRecently[playerid] = 60;
						TogglePlayerControllable(playerid, true);
						for(new i = 0; i < MAX_PLAYERS; i++)
						{
							new file[256], rentalowner[MAX_PLAYER_NAME], ownermsg[250];
							GetPlayerName(i, rentalowner, sizeof(rentalowner));
							format(file, sizeof(file), "%s.runix", rentalowner);
							if(IsPlayerConnected(i) && dini_Int(file, "RentalOwner") == 1)
							{
							    format(ownermsg, sizeof(ownermsg), "%s[ID:%d] rented a Voodoo for $20000 in your Rental Business.", name, playerid);
							    SendClientMessage(i, SERVER_COLOR, ownermsg);
							    SendClientMessage(i, SERVER_COLOR, "$20000 deposited to your Bank Account.");
							    SetPlayerBankCash(i, GetPlayerBankCash(i)+20000);
							}
						}
						}
			        }
			        else SendClientMessage(playerid, ERROR, "Not enough money! $20000"); TogglePlayerControllable(playerid, true);
				}
				else SendClientMessage(playerid, ERROR, "You've recently rented a car!"); TogglePlayerControllable(playerid, true);
			}
		    case 1: // Sultan
		    {
                if(RentedACarRecently[playerid] == 0)
				{
				    if(GetPlayerMoney(playerid) > 49999)
			        {
						if(CAR[playerid] == 1)
						{
						new string[250], name[MAX_PLAYER_NAME], vehicle = AddStaticVehicle(560, 2174.0623, 1421.0023, 10.6564, 90.4570, -1, -1);
						PutPlayerInVehicle(playerid, vehicle, 0);
						Rented[vehicle] = 1;
						GivePlayerMoney(playerid, -50000);
						GetPlayerName(playerid, name, sizeof(name));
						format(string, sizeof(string), "%s[ID:%d] rented a Sultan from Car Shop for $50000!", name, playerid);
						Announce(string);
						RentedACarRecently[playerid] = 60;
						TogglePlayerControllable(playerid, true);
						for(new i = 0; i < MAX_PLAYERS; i++)
						{
							new file[256], rentalowner[MAX_PLAYER_NAME], ownermsg[250];
							GetPlayerName(i, rentalowner, sizeof(rentalowner));
							format(file, sizeof(file), "%s.runix", rentalowner);
							if(IsPlayerConnected(i) && dini_Int(file, "RentalOwner") == 1)
							{
							    format(ownermsg, sizeof(ownermsg), "%s[ID:%d] rented a Sultan for $50000 in your Rental Business.", name, playerid);
							    SendClientMessage(i, SERVER_COLOR, ownermsg);
							    SendClientMessage(i, SERVER_COLOR, "$50000 deposited to your Bank Account.");
							    SetPlayerBankCash(i, GetPlayerBankCash(i)+50000);
							}
						}
						}
						if(CAR[playerid] == 2)
						{
						new string[250], name[MAX_PLAYER_NAME], vehicle = AddStaticVehicle(560, 1691.6538,-1477.3641,13.1471,89.9192, -1, -1);
						PutPlayerInVehicle(playerid, vehicle, 0);
						Rented[vehicle] = 1;
						GivePlayerMoney(playerid, -50000);
						GetPlayerName(playerid, name, sizeof(name));
						format(string, sizeof(string), "%s[ID:%d] rented a Sultan from Car Shop for $50000!", name, playerid);
						Announce(string);
						RentedACarRecently[playerid] = 60;
						TogglePlayerControllable(playerid, true);
						for(new i = 0; i < MAX_PLAYERS; i++)
						{
							new file[256], rentalowner[MAX_PLAYER_NAME], ownermsg[250];
							GetPlayerName(i, rentalowner, sizeof(rentalowner));
							format(file, sizeof(file), "%s.runix", rentalowner);
							if(IsPlayerConnected(i) && dini_Int(file, "RentalOwner") == 1)
							{
							    format(ownermsg, sizeof(ownermsg), "%s[ID:%d] rented a Sultan for $50000 in your Rental Business.", name, playerid);
							    SendClientMessage(i, SERVER_COLOR, ownermsg);
							    SendClientMessage(i, SERVER_COLOR, "$50000 deposited to your Bank Account.");
							    SetPlayerBankCash(i, GetPlayerBankCash(i)+50000);
							}
						}
						}
						if(CAR[playerid] == 3)
						{
						new string[250], name[MAX_PLAYER_NAME], vehicle = AddStaticVehicle(560, -1928.6866,275.1254,40.8135,180.9483, -1, -1);
						PutPlayerInVehicle(playerid, vehicle, 0);
						Rented[vehicle] = 1;
						GivePlayerMoney(playerid, -50000);
						GetPlayerName(playerid, name, sizeof(name));
						format(string, sizeof(string), "%s[ID:%d] rented a Sultan from Car Shop for $50000!", name, playerid);
						Announce(string);
						RentedACarRecently[playerid] = 60;
						TogglePlayerControllable(playerid, true);
						for(new i = 0; i < MAX_PLAYERS; i++)
						{
							new file[256], rentalowner[MAX_PLAYER_NAME], ownermsg[250];
							GetPlayerName(i, rentalowner, sizeof(rentalowner));
							format(file, sizeof(file), "%s.runix", rentalowner);
							if(IsPlayerConnected(i) && dini_Int(file, "RentalOwner") == 1)
							{
							    format(ownermsg, sizeof(ownermsg), "%s[ID:%d] rented a Sultan for $50000 in your Rental Business.", name, playerid);
							    SendClientMessage(i, SERVER_COLOR, ownermsg);
							    SendClientMessage(i, SERVER_COLOR, "$50000 deposited to your Bank Account.");
							    SetPlayerBankCash(i, GetPlayerBankCash(i)+50000);
							}
						}
						}
			        }
			        else SendClientMessage(playerid, ERROR, "Not enough money! $50000"); TogglePlayerControllable(playerid, true);
			    }
				else SendClientMessage(playerid, ERROR, "You've recently rented a car!"); TogglePlayerControllable(playerid, true);
		    }
		    case 2: // Savanna
		    {
		        if(RentedACarRecently[playerid] == 0)
				{
			        if(GetPlayerMoney(playerid) > 34999)
			        {
						if(CAR[playerid] == 1)
						{
						new string[250], name[MAX_PLAYER_NAME], vehicle = AddStaticVehicle(567, 2174.0623, 1421.0023, 10.6564, 90.4570, -1, -1);
						PutPlayerInVehicle(playerid, vehicle, 0);
						Rented[vehicle] = 1;
						GivePlayerMoney(playerid, -35000);
						GetPlayerName(playerid, name, sizeof(name));
						format(string, sizeof(string), "%s[ID:%d] rented a Savanna from Car Shop for $35000!", name, playerid);
						Announce(string);
						RentedACarRecently[playerid] = 60;
						TogglePlayerControllable(playerid, true);
						for(new i = 0; i < MAX_PLAYERS; i++)
						{
							new file[256], rentalowner[MAX_PLAYER_NAME], ownermsg[250];
							GetPlayerName(i, rentalowner, sizeof(rentalowner));
							format(file, sizeof(file), "%s.runix", rentalowner);
							if(IsPlayerConnected(i) && dini_Int(file, "RentalOwner") == 1)
							{
							    format(ownermsg, sizeof(ownermsg), "%s[ID:%d] rented a Savanna for $35000 in your Rental Business.", name, playerid);
							    SendClientMessage(i, SERVER_COLOR, ownermsg);
							    SendClientMessage(i, SERVER_COLOR, "$35000 deposited to your Bank Account.");
							    SetPlayerBankCash(i, GetPlayerBankCash(i)+35000);
							}
						}
						}
						if(CAR[playerid] == 2)
						{
						new string[250], name[MAX_PLAYER_NAME], vehicle = AddStaticVehicle(567, 1691.6538,-1477.3641,13.1471,89.9192, -1, -1);
						PutPlayerInVehicle(playerid, vehicle, 0);
						Rented[vehicle] = 1;
						GivePlayerMoney(playerid, -35000);
						GetPlayerName(playerid, name, sizeof(name));
						format(string, sizeof(string), "%s[ID:%d] rented a Savanna from Car Shop for $35000!", name, playerid);
						Announce(string);
						RentedACarRecently[playerid] = 60;
						TogglePlayerControllable(playerid, true);
						for(new i = 0; i < MAX_PLAYERS; i++)
						{
							new file[256], rentalowner[MAX_PLAYER_NAME], ownermsg[250];
							GetPlayerName(i, rentalowner, sizeof(rentalowner));
							format(file, sizeof(file), "%s.runix", rentalowner);
							if(IsPlayerConnected(i) && dini_Int(file, "RentalOwner") == 1)
							{
							    format(ownermsg, sizeof(ownermsg), "%s[ID:%d] rented a Savanna for $35000 in your Rental Business.", name, playerid);
							    SendClientMessage(i, SERVER_COLOR, ownermsg);
							    SendClientMessage(i, SERVER_COLOR, "$35000 deposited to your Bank Account.");
							    SetPlayerBankCash(i, GetPlayerBankCash(i)+35000);
							}
						}
						}
						if(CAR[playerid] == 3)
						{
						new string[250], name[MAX_PLAYER_NAME], vehicle = AddStaticVehicle(567, -1928.6866,275.1254,40.8135,180.9483, -1, -1);
						PutPlayerInVehicle(playerid, vehicle, 0);
						Rented[vehicle] = 1;
						GivePlayerMoney(playerid, -35000);
						GetPlayerName(playerid, name, sizeof(name));
						format(string, sizeof(string), "%s[ID:%d] rented a Savanna from Car Shop for $35000!", name, playerid);
						Announce(string);
						RentedACarRecently[playerid] = 60;
						TogglePlayerControllable(playerid, true);
						for(new i = 0; i < MAX_PLAYERS; i++)
						{
							new file[256], rentalowner[MAX_PLAYER_NAME], ownermsg[250];
							GetPlayerName(i, rentalowner, sizeof(rentalowner));
							format(file, sizeof(file), "%s.runix", rentalowner);
							if(IsPlayerConnected(i) && dini_Int(file, "RentalOwner") == 1)
							{
							    format(ownermsg, sizeof(ownermsg), "%s[ID:%d] rented a Savanna for $35000 in your Rental Business.", name, playerid);
							    SendClientMessage(i, SERVER_COLOR, ownermsg);
							    SendClientMessage(i, SERVER_COLOR, "$35000 deposited to your Bank Account.");
							    SetPlayerBankCash(i, GetPlayerBankCash(i)+35000);
							}
						}
						}
			        }
			        else SendClientMessage(playerid, ERROR, "Not enough money! $35000"); TogglePlayerControllable(playerid, true);
                }
				else SendClientMessage(playerid, ERROR, "You've recently rented a car!"); TogglePlayerControllable(playerid, true);
		    }
		    case 3: // Slamvan
		    {
		        if(RentedACarRecently[playerid] == 0)
				{
			        if(GetPlayerMoney(playerid) > 24999)
			        {
						if(CAR[playerid] == 1)
						{
						new string[250], name[MAX_PLAYER_NAME], vehicle = AddStaticVehicle(535, 2174.0623, 1421.0023, 10.6564, 90.4570, -1, -1);
						PutPlayerInVehicle(playerid, vehicle, 0);
						Rented[vehicle] = 1;
						GivePlayerMoney(playerid, -25000);
						GetPlayerName(playerid, name, sizeof(name));
						format(string, sizeof(string), "%s[ID:%d] rented a Slamvan from Car Shop for $25000!", name, playerid);
						Announce(string);
						RentedACarRecently[playerid] = 60;
						TogglePlayerControllable(playerid, true);
						for(new i = 0; i < MAX_PLAYERS; i++)
						{
							new file[256], rentalowner[MAX_PLAYER_NAME], ownermsg[250];
							GetPlayerName(i, rentalowner, sizeof(rentalowner));
							format(file, sizeof(file), "%s.runix", rentalowner);
							if(IsPlayerConnected(i) && dini_Int(file, "RentalOwner") == 1)
							{
							    format(ownermsg, sizeof(ownermsg), "%s[ID:%d] rented a Slamvan for $25000 in your Rental Business.", name, playerid);
							    SendClientMessage(i, SERVER_COLOR, ownermsg);
							    SendClientMessage(i, SERVER_COLOR, "$25000 deposited to your Bank Account.");
							    SetPlayerBankCash(i, GetPlayerBankCash(i)+25000);
							}
						}
						}
						if(CAR[playerid] == 2)
						{
						new string[250], name[MAX_PLAYER_NAME], vehicle = AddStaticVehicle(535, 1691.6538,-1477.3641,13.1471,89.9192, -1, -1);
						PutPlayerInVehicle(playerid, vehicle, 0);
						Rented[vehicle] = 1;
						GivePlayerMoney(playerid, -25000);
						GetPlayerName(playerid, name, sizeof(name));
						format(string, sizeof(string), "%s[ID:%d] rented a Slamvan from Car Shop for $25000!", name, playerid);
						Announce(string);
						RentedACarRecently[playerid] = 60;
						TogglePlayerControllable(playerid, true);
						for(new i = 0; i < MAX_PLAYERS; i++)
						{
							new file[256], rentalowner[MAX_PLAYER_NAME], ownermsg[250];
							GetPlayerName(i, rentalowner, sizeof(rentalowner));
							format(file, sizeof(file), "%s.runix", rentalowner);
							if(IsPlayerConnected(i) && dini_Int(file, "RentalOwner") == 1)
							{
							    format(ownermsg, sizeof(ownermsg), "%s[ID:%d] rented a Slamvan for $25000 in your Rental Business.", name, playerid);
							    SendClientMessage(i, SERVER_COLOR, ownermsg);
							    SendClientMessage(i, SERVER_COLOR, "$25000 deposited to your Bank Account.");
							    SetPlayerBankCash(i, GetPlayerBankCash(i)+25000);
							}
						}
						}
						if(CAR[playerid] == 3)
						{
						new string[250], name[MAX_PLAYER_NAME], vehicle = AddStaticVehicle(535, -1928.6866,275.1254,40.8135,180.9483, -1, -1);
						PutPlayerInVehicle(playerid, vehicle, 0);
						Rented[vehicle] = 1;
						GivePlayerMoney(playerid, -25000);
						GetPlayerName(playerid, name, sizeof(name));
						format(string, sizeof(string), "%s[ID:%d] rented a Slamvan from Car Shop for $25000!", name, playerid);
						Announce(string);
						RentedACarRecently[playerid] = 60;
						TogglePlayerControllable(playerid, true);
						for(new i = 0; i < MAX_PLAYERS; i++)
						{
							new file[256], rentalowner[MAX_PLAYER_NAME], ownermsg[250];
							GetPlayerName(i, rentalowner, sizeof(rentalowner));
							format(file, sizeof(file), "%s.runix", rentalowner);
							if(IsPlayerConnected(i) && dini_Int(file, "RentalOwner") == 1)
							{
							    format(ownermsg, sizeof(ownermsg), "%s[ID:%d] rented a Slamvan for $25000 in your Rental Business.", name, playerid);
							    SendClientMessage(i, SERVER_COLOR, ownermsg);
							    SendClientMessage(i, SERVER_COLOR, "$25000 deposited to your Bank Account.");
							    SetPlayerBankCash(i, GetPlayerBankCash(i)+25000);
							}
						}
						}
			        }
			        else SendClientMessage(playerid, ERROR, "Not enough money! $25000"); TogglePlayerControllable(playerid, true);
                }
				else SendClientMessage(playerid, ERROR, "You've recently rented a car!"); TogglePlayerControllable(playerid, true);
		    }
		}
	}
	if(GetPlayerMenu(playerid) == BarEntrance)
	{
	    switch(row)
	    {
			case 0: // Enter the bar
			{
			    SetPlayerInterior(playerid, 1);
				SetPlayerPos(playerid, 2103.0239, 1332.9640, 1297.4639);
				SetPlayerFacingAngle(playerid, 359.6409);
				SetCameraBehindPlayer(playerid);
				SendClientMessage(playerid, WHITE, "Welcome to BulletXT's Bar.");
				TogglePlayerControllable(playerid, true);
				InsideBar[playerid] = 1;
			}
	     }
	}

	if(GetPlayerMenu(playerid) == Drugs)
	{
	    switch(row)
	    {
	        case 0: // 5 grams $20
	        {
	            if(GetPlayerMoney(playerid) > 19)
	            {
	                GivePlayerMoney(playerid, -20);
	                SetPlayerDrugs(playerid, GetPlayerDrugs(playerid)+5);
	                TogglePlayerControllable(playerid, true);
	                SendClientMessage(playerid, GREY, "|_| Drugs Bought |_|");
	                SendClientMessage(playerid, WHITE, "You bought 5 grams for $20");
	            }
	            else SendClientMessage(playerid, ERROR, "Not enough money! $20"); TogglePlayerControllable(playerid, true);
	        }
	        case 1: // 15 grams $30
	        {
	            if(GetPlayerMoney(playerid) > 29)
	            {
	                GivePlayerMoney(playerid, -30);
	                SetPlayerDrugs(playerid, GetPlayerDrugs(playerid)+15);
	                TogglePlayerControllable(playerid, true);
	                SendClientMessage(playerid, GREY, "|_| Drugs Bought |_|");
	                SendClientMessage(playerid, WHITE, "You bought 15 grams for $30");
	            }
	            else SendClientMessage(playerid, ERROR, "Not enough money! $30"); TogglePlayerControllable(playerid, true);
	        }
	        case 2: // 20 grams $40
	        {
	            if(GetPlayerMoney(playerid) > 39)
	            {
	                GivePlayerMoney(playerid, -40);
	                SetPlayerDrugs(playerid, GetPlayerDrugs(playerid)+20);
	                TogglePlayerControllable(playerid, true);
	                SendClientMessage(playerid, GREY, "|_| Drugs Bought |_|");
	                SendClientMessage(playerid, WHITE, "You bought 20 grams for $40");
	            }
	            else SendClientMessage(playerid, ERROR, "Not enough money! $40"); TogglePlayerControllable(playerid, true);
	        }
	        case 3: // 25 grams $50
	        {
	            if(GetPlayerMoney(playerid) > 49)
	            {
	                GivePlayerMoney(playerid, -50);
	                SetPlayerDrugs(playerid, GetPlayerDrugs(playerid)+25);
	                TogglePlayerControllable(playerid, true);
	                SendClientMessage(playerid, GREY, "|_| Drugs Bought |_|");
	                SendClientMessage(playerid, WHITE, "You bought 25 grams for $50");
	            }
	            else SendClientMessage(playerid, ERROR, "Not enough money! $50"); TogglePlayerControllable(playerid, true);
	        }
	        case 4: // rob
			{
				    if(DrugsRecentlyRobbed == 0)
		            {
		                new chances = random(200);
		                if(chances >= 0 && chances <= 170)
		                {
		                    new string[250];
		            		RobDrugs[playerid] = 20;
		            		TogglePlayerControllable(playerid, true);
		            		DrugsRecentlyRobbed = 250;
		            		format(string, sizeof(string), "%s[ID:%d] started a Robbery at the Drug Point!", rname, playerid);
		           			Announce(string);
						}
						else if(chances >= 171 && chances <= 200)
						{
						    new name[MAX_PLAYER_NAME], copmsg[250];
						    GetPlayerName(playerid, name, sizeof(name));
						    SendClientMessage(playerid, ERROR, "Your attempt to rob the Drug Point failed!");
						    SendClientMessage(playerid, ERROR, "The Police are on their way.");
							SetPlayerWantedLevel(playerid,GetPlayerWantedLevel(playerid)+ 1);
							format(copmsg, sizeof(copmsg), "[HQ] %s attemped to rob the Drug Point.", name);
							SendRadioMessageToCops(copmsg);
							DrugsRecentlyRobbed = 200;
							TogglePlayerControllable(playerid, true);
						}
					}
					else if(DrugsRecentlyRobbed > 0)
					{
						SendClientMessage(playerid, ERROR, "The Drug Point has been robbed recently!");
						TogglePlayerControllable(playerid, true);
					}
			}
		}
	}

	return true;
}

public OnPlayerExitedMenu(playerid)
{
	if(GetPlayerMenu(playerid) == Hand) TogglePlayerControllable(playerid, true);
	else if(GetPlayerMenu(playerid) == Dildo) TogglePlayerControllable(playerid, true);
	else if(GetPlayerMenu(playerid) == Rental) TogglePlayerControllable(playerid, true);
	else if(GetPlayerMenu(playerid) == CarList) TogglePlayerControllable(playerid, true);
	else if(GetPlayerMenu(playerid) == BarEntrance) TogglePlayerControllable(playerid, true);
	else if(GetPlayerMenu(playerid) == Drugs) TogglePlayerControllable(playerid, true);
	return true;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
    if(Speed[playerid][Refueling] == 1) return StopRefueling(playerid);
	return true;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return true;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys == KEY_SUBMISSION)
	{
		//Trash
		if (gTeam[playerid] == CIVILIAN && IsPlayerInAnyVehicle(playerid) && GetVehicleModel(GetPlayerVehicleID(playerid)) == 408)
	    {
		    if(InTrashMission[playerid] == 0)
		    {
			    HideDraw(playerid);
				TextDrawShowForPlayer(playerid,BUSBOX);
				TextDrawShowForPlayer(playerid,text40);
				SelectTM[playerid] = 1;
			}
			else if(InTrashMission[playerid] == 1)
			{
				DisablePlayerRaceCheckpoint(playerid);
				SelectTM[playerid] = 0;
				InTrashMission[playerid] = 0;
			}
	    }
    //
		if (gTeam[playerid] == CIVILIAN && IsPlayerInAnyVehicle(playerid) && GetVehicleModel(GetPlayerVehicleID(playerid)) == 420 || gTeam[playerid] == CIVILIAN && IsPlayerInAnyVehicle(playerid) && GetVehicleModel(GetPlayerVehicleID(playerid)) ==438)
	    {
	    	if (playerInJob[playerid]<0)
		    {
				MissionIni(playerid);
				SendClientMessage(playerid,yellow,"You are now Taxi Driver! Find people to enter in you taxi and earn money!");
		    }
		    else
		    {
			    terminarMission(playerid);
		    }
	    }
	    if (gTeam[playerid] == CIVILIAN && IsPlayerInAnyVehicle(playerid) && GetVehicleModel(GetPlayerVehicleID(playerid)) == 431 || gTeam[playerid] == CIVILIAN && IsPlayerInAnyVehicle(playerid) && GetVehicleModel(GetPlayerVehicleID(playerid)) ==437)
	    {
		    if (playerInMiniMission2[playerid]<0)
		    {
			    HideDraw(playerid);
				TextDrawShowForPlayer(playerid,BUSBOX);
				TextDrawShowForPlayer(playerid,text24);
				SelectBM[playerid] = 1;
		    }
	    	else
		    {
			    if(SelectBM[playerid] == 1)
			    {
				    HideDraw(playerid);
				    SelectBM[playerid] = 0;
			    }
			    if(SelectBM[playerid] == 0)
			    {
				    terminarMission2(playerid);
			    }
		    }
	    }
	    if(IsPlayerInAnyVehicle(playerid))
	    {
			new engine, lights, alarm, doors, bonnet, boot, objective;
		    GetVehicleParamsEx(GetPlayerVehicleID(playerid), engine, lights, alarm, doors, bonnet, boot, objective);
	    	SetVehicleParamsEx(GetPlayerVehicleID(playerid), true, lights, alarm, doors, bonnet, boot, objective);
		}
    }

	if(newkeys == KEY_FIRE)
	{
    	HideDraw(playerid);
    }

	return 1;
}
public OnVehicleDeath(vehicleid, killerid)
{
	if(Rented[vehicleid] > 0) DestroyVehicle(vehicleid);
}

public OnVehicleSpawn(vehicleid)
{
	if(Rented[vehicleid] > 0) DestroyVehicle(vehicleid);
	Vehicle[vehicleid][Fuel] = Random(SPAWN_GAS_MIN, SPAWN_GAS_MAX);
	for(new i=0;i<MAX_PLAYERS;i++)
	{
        if(vehicleid==IcmdCar[i][CarcmdI])
		{
		    UcideMasinileBoule(vehicleid);
	        IcmdCar[i][CarcmdI]=-1;
        }
	}
}
public DriverSalary()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(gTeam[i] == CIVILIAN && Working[i] == 1)
		{
			new vehicle = GetPlayerVehicleID(i);
			for(new j = 0; j < MAX_PLAYERS; j++)
			{
				if(IsPlayerConnected(j))
				{
					if(IsPlayerInVehicle(j, vehicle) && GetPlayerState(j) == PLAYER_STATE_PASSENGER) GivePlayerMoney(i,1);
				}
			}
		}
	}
}

public ResetMedicWeapons()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(gTeam[i] == Medic)
		{
		ResetPlayerWeapons(i);
		}
	}
}

public AllStores()
{
	if(DildoRecentlyRobbed > 0) DildoRecentlyRobbed--;
	if(ATMRecentlyRobbed > 0) ATMRecentlyRobbed--;
	if(HallRecentlyRobbed > 0) HallRecentlyRobbed--;
	if(RentalRecentlyRobbed > 0) RentalRecentlyRobbed--;
	if(BankRecentlyRobbed > 0) BankRecentlyRobbed--;
	if(BincoRecentlyRobbed > 0) BincoRecentlyRobbed--;
	if(ZipRecentlyRobbed > 0) ZipRecentlyRobbed--;
	if(UrbanRecentlyRobbed > 0) UrbanRecentlyRobbed--;
	if(AmmuRecentlyRobbed > 0) AmmuRecentlyRobbed--;
	if(Ammu2RecentlyRobbed > 0) Ammu2RecentlyRobbed--;
	if(Ammu3RecentlyRobbed > 0) Ammu3RecentlyRobbed--;
	if(Ammu4RecentlyRobbed > 0) Ammu4RecentlyRobbed--;
	if(Ammu5RecentlyRobbed > 0) Ammu5RecentlyRobbed--;
	if(DrugsRecentlyRobbed > 0) DrugsRecentlyRobbed--;
	if(D4RecentlyRobbed > 0) D4RecentlyRobbed--;
	if(CaRecentlyRobbed > 0) CaRecentlyRobbed--;
}

public RobbingStores()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerSpawned(i))
		{   //Drugs
			if(RobDrugs[i] > 1)
			{
				new string[250], robber[MAX_PLAYER_NAME], robtime;
				GetPlayerName(i, robber, sizeof(robber));
				RobDrugs[i]--;
				robtime = (RobDrugs[i]);
				format(string, sizeof(string), "~w~STAY IN THE CHECKPOINT~n~~g~%d~w~ SECONDS REMAINING", robtime);
				GameTextForPlayer(i, string, 3000, 3);
			}
			if(RobDrugs[i] == 1)
			{
				new earnings = random(100000), robber[MAX_PLAYER_NAME], string[250], string2[250], string3[250], cops[250];
				RobDrugs[i] = 0;
				GetPlayerName(i, robber, sizeof(robber));
				format(string, sizeof(string), "~w~ROBBERY COMPLETE!~n~YOU EARNED ~g~$%d", earnings);
				GameTextForPlayer(i, string, 3000, 3);
				format(cops, sizeof(cops), "[HQ] %s has robbed the Drug Point. Location: The Drug Point.", robber);
				SendRadioMessageToCops(cops);
				GivePlayerMoney(i, earnings);
				SetPlayerWantedLevel(i,GetPlayerWantedLevel(i)+ 4);
				GivePlayerScore(i, 1);
				new rbskl[250];
				SetPlayerRobbingSkill(i, GetPlayerRobbingSkill(i)+1);
				format(rbskl, sizeof(rbskl), "Robbing Skill upgraded! Your skill now is: %d", GetPlayerRobbingSkill(i));
				SendClientMessage(i, SERVER_COLOR, rbskl);
				SendClientMessage(i, GREY, "|_| Crime Commited |_|");
				format(string2, sizeof(string2), "You earned $%d from the Drug Point!", earnings);
				SendClientMessage(i, WHITE, string2);
				format(string3, sizeof(string3), "Wanted Level: %d", GetPlayerWantedLevel(i));
				SendClientMessage(i, WHITE, string3);
			}
			//Urban
			if(RobUrban[i] > 1)
			{
				new string[250], robber[MAX_PLAYER_NAME], robtime;
				GetPlayerName(i, robber, sizeof(robber));
				RobUrban[i]--;
				robtime = (RobUrban[i]);
				format(string, sizeof(string), "~w~STAY IN THE CHECKPOINT~n~~g~%d~w~ SECONDS REMAINING", robtime);
				GameTextForPlayer(i, string, 3000, 3);
			}
			if(RobUrban[i] == 1)
			{
				new earnings = random(50000), robber[MAX_PLAYER_NAME], string[250], string2[250], string3[250], cops[250];
				RobUrban[i] = 0;
				GetPlayerName(i, robber, sizeof(robber));
				format(string, sizeof(string), "~w~ROBBERY COMPLETE!~n~YOU EARNED ~g~$%d", earnings);
				GameTextForPlayer(i, string, 3000, 3);
				format(cops, sizeof(cops), "[HQ] %s has robbed SubUrban. Location: SubUrban.", robber);
				SendRadioMessageToCops(cops);
				GivePlayerMoney(i, earnings);
				SetPlayerWantedLevel(i,GetPlayerWantedLevel(i)+ 4);
				GivePlayerScore(i, 1);
				new rbskl[250];
				SetPlayerRobbingSkill(i, GetPlayerRobbingSkill(i)+1);
				format(rbskl, sizeof(rbskl), "Robbing Skill upgraded! Your skill now is: %d", GetPlayerRobbingSkill(i));
				SendClientMessage(i, SERVER_COLOR, rbskl);
				SendClientMessage(i, GREY, "|_| Crime Commited |_|");
				format(string2, sizeof(string2), "You earned $%d from SubUrban!", earnings);
				SendClientMessage(i, WHITE, string2);
				format(string3, sizeof(string3), "Wanted Level: %d", GetPlayerWantedLevel(i));
				SendClientMessage(i, WHITE, string3);
			}
			//Ammu 1
			if(RobAmmu[i] > 1)
			{
				new string[250], robber[MAX_PLAYER_NAME], robtime;
				GetPlayerName(i, robber, sizeof(robber));
				RobAmmu[i]--;
				robtime = (RobAmmu[i]);
				format(string, sizeof(string), "~w~STAY IN THE CHECKPOINT~n~~g~%d~w~ SECONDS REMAINING", robtime);
				GameTextForPlayer(i, string, 3000, 3);
			}
			if(RobAmmu[i] == 1)
			{
				new earnings = random(9000), robber[MAX_PLAYER_NAME], string[250], string2[250], string3[250], cops[250];
				RobAmmu[i] = 0;
				GetPlayerName(i, robber, sizeof(robber));
				format(string, sizeof(string), "~w~ROBBERY COMPLETE!~n~YOU EARNED ~g~$%d", earnings);
				GameTextForPlayer(i, string, 3000, 3);
				format(cops, sizeof(cops), "[HQ] %s has robbed Ammunation.", robber);
				SendRadioMessageToCops(cops);
				GivePlayerMoney(i, earnings);
				GivePlayerWeapon(i,31,99999);
				GivePlayerWeapon(i,24,99999);
				GivePlayerWeapon(i,29,99999);
				GivePlayerWeapon(i,34,99999);
				SetPlayerWantedLevel(i,GetPlayerWantedLevel(i)+ 6);
				GivePlayerScore(i, 1);
				new rbskl[250];
				SetPlayerRobbingSkill(i, GetPlayerRobbingSkill(i)+1);
				format(rbskl, sizeof(rbskl), "Robbing Skill upgraded! Your skill now is: %d", GetPlayerRobbingSkill(i));
				SendClientMessage(i, SERVER_COLOR, rbskl);
				SendClientMessage(i, GREY, "|_| Crime Commited |_|");
				format(string2, sizeof(string2), "You earned $%d from Ammunation!", earnings);
				SendClientMessage(i, WHITE, string2);
				format(string3, sizeof(string3), "Wanted Level: %d", GetPlayerWantedLevel(i));
				SendClientMessage(i, WHITE, string3);
			}
			//Ammu 2
			if(RobAmmu2[i] > 1)
			{
				new string[250], robber[MAX_PLAYER_NAME], robtime;
				GetPlayerName(i, robber, sizeof(robber));
				RobAmmu2[i]--;
				robtime = (RobAmmu2[i]);
				format(string, sizeof(string), "~w~STAY IN THE CHECKPOINT~n~~g~%d~w~ SECONDS REMAINING", robtime);
				GameTextForPlayer(i, string, 3000, 3);
			}
			if(RobAmmu2[i] == 1)
			{
				new earnings = random(9000), robber[MAX_PLAYER_NAME], string[250], string2[250], string3[250], cops[250];
				RobAmmu2[i] = 0;
				GetPlayerName(i, robber, sizeof(robber));
				format(string, sizeof(string), "~w~ROBBERY COMPLETE!~n~YOU EARNED ~g~$%d", earnings);
				GameTextForPlayer(i, string, 3000, 3);
				format(cops, sizeof(cops), "[HQ] %s has robbed Ammunation.", robber);
				SendRadioMessageToCops(cops);
				GivePlayerMoney(i, earnings);
				GivePlayerWeapon(i,31,99999);
				GivePlayerWeapon(i,24,99999);
				GivePlayerWeapon(i,29,99999);
				GivePlayerWeapon(i,34,99999);
				SetPlayerWantedLevel(i,GetPlayerWantedLevel(i)+ 6);
				GivePlayerScore(i, 1);
				new rbskl[250];
				SetPlayerRobbingSkill(i, GetPlayerRobbingSkill(i)+1);
				format(rbskl, sizeof(rbskl), "Robbing Skill upgraded! Your skill now is: %d", GetPlayerRobbingSkill(i));
				SendClientMessage(i, SERVER_COLOR, rbskl);
				SendClientMessage(i, GREY, "|_| Crime Commited |_|");
				format(string2, sizeof(string2), "You earned $%d from Ammunation!", earnings);
				SendClientMessage(i, WHITE, string2);
				format(string3, sizeof(string3), "Wanted Level: %d", GetPlayerWantedLevel(i));
				SendClientMessage(i, WHITE, string3);
			}
			//Ammu 3
			if(RobAmmu3[i] > 1)
			{
				new string[250], robber[MAX_PLAYER_NAME], robtime;
				GetPlayerName(i, robber, sizeof(robber));
				RobAmmu3[i]--;
				robtime = (RobAmmu3[i]);
				format(string, sizeof(string), "~w~STAY IN THE CHECKPOINT~n~~g~%d~w~ SECONDS REMAINING", robtime);
				GameTextForPlayer(i, string, 3000, 3);
			}
			if(RobAmmu3[i] == 1)
			{
				new earnings = random(9000), robber[MAX_PLAYER_NAME], string[250], string2[250], string3[250], cops[250];
				RobAmmu3[i] = 0;
				GetPlayerName(i, robber, sizeof(robber));
				format(string, sizeof(string), "~w~ROBBERY COMPLETE!~n~YOU EARNED ~g~$%d", earnings);
				GameTextForPlayer(i, string, 3000, 3);
				format(cops, sizeof(cops), "[HQ] %s has robbed Ammunation.", robber);
				SendRadioMessageToCops(cops);
				GivePlayerMoney(i, earnings);
				GivePlayerWeapon(i,31,99999);
				GivePlayerWeapon(i,24,99999);
				GivePlayerWeapon(i,29,99999);
				GivePlayerWeapon(i,34,99999);
				SetPlayerWantedLevel(i,GetPlayerWantedLevel(i)+ 6);
				GivePlayerScore(i, 1);
				new rbskl[250];
				SetPlayerRobbingSkill(i, GetPlayerRobbingSkill(i)+1);
				format(rbskl, sizeof(rbskl), "Robbing Skill upgraded! Your skill now is: %d", GetPlayerRobbingSkill(i));
				SendClientMessage(i, SERVER_COLOR, rbskl);
				SendClientMessage(i, GREY, "|_| Crime Commited |_|");
				format(string2, sizeof(string2), "You earned $%d from Ammunation!", earnings);
				SendClientMessage(i, WHITE, string2);
				format(string3, sizeof(string3), "Wanted Level: %d", GetPlayerWantedLevel(i));
				SendClientMessage(i, WHITE, string3);
			}
			//Ammu 4
			if(RobAmmu4[i] > 1)
			{
				new string[250], robber[MAX_PLAYER_NAME], robtime;
				GetPlayerName(i, robber, sizeof(robber));
				RobAmmu4[i]--;
				robtime = (RobAmmu4[i]);
				format(string, sizeof(string), "~w~STAY IN THE CHECKPOINT~n~~g~%d~w~ SECONDS REMAINING", robtime);
				GameTextForPlayer(i, string, 3000, 3);
			}
			if(RobAmmu4[i] == 1)
			{
				new earnings = random(9000), robber[MAX_PLAYER_NAME], string[250], string2[250], string3[250], cops[250];
				RobAmmu4[i] = 0;
				GetPlayerName(i, robber, sizeof(robber));
				format(string, sizeof(string), "~w~ROBBERY COMPLETE!~n~YOU EARNED ~g~$%d", earnings);
				GameTextForPlayer(i, string, 3000, 3);
				format(cops, sizeof(cops), "[HQ] %s has robbed Ammunation.", robber);
				SendRadioMessageToCops(cops);
				GivePlayerMoney(i, earnings);
				GivePlayerWeapon(i,31,99999);
				GivePlayerWeapon(i,24,99999);
				GivePlayerWeapon(i,29,99999);
				GivePlayerWeapon(i,34,99999);
				SetPlayerWantedLevel(i,GetPlayerWantedLevel(i)+ 6);
				GivePlayerScore(i, 1);
				new rbskl[250];
				SetPlayerRobbingSkill(i, GetPlayerRobbingSkill(i)+1);
				format(rbskl, sizeof(rbskl), "Robbing Skill upgraded! Your skill now is: %d", GetPlayerRobbingSkill(i));
				SendClientMessage(i, SERVER_COLOR, rbskl);
				SendClientMessage(i, GREY, "|_| Crime Commited |_|");
				format(string2, sizeof(string2), "You earned $%d from Ammunation!", earnings);
				SendClientMessage(i, WHITE, string2);
				format(string3, sizeof(string3), "Wanted Level: %d", GetPlayerWantedLevel(i));
				SendClientMessage(i, WHITE, string3);
			}
			//Ammu 5
			if(RobAmmu5[i] > 1)
			{
				new string[250], robber[MAX_PLAYER_NAME], robtime;
				GetPlayerName(i, robber, sizeof(robber));
				RobAmmu5[i]--;
				robtime = (RobAmmu5[i]);
				format(string, sizeof(string), "~w~STAY IN THE CHECKPOINT~n~~g~%d~w~ SECONDS REMAINING", robtime);
				GameTextForPlayer(i, string, 3000, 3);
			}
			if(RobAmmu5[i] == 1)
			{
				new earnings = random(9000), robber[MAX_PLAYER_NAME], string[250], string2[250], string3[250], cops[250];
				RobAmmu5[i] = 0;
				GetPlayerName(i, robber, sizeof(robber));
				format(string, sizeof(string), "~w~ROBBERY COMPLETE!~n~YOU EARNED ~g~$%d", earnings);
				GameTextForPlayer(i, string, 3000, 3);
				format(cops, sizeof(cops), "[HQ] %s has robbed Ammunation.", robber);
				SendRadioMessageToCops(cops);
				GivePlayerMoney(i, earnings);
				GivePlayerWeapon(i,31,99999);
				GivePlayerWeapon(i,24,99999);
				GivePlayerWeapon(i,29,99999);
				GivePlayerWeapon(i,34,99999);
				SetPlayerWantedLevel(i,GetPlayerWantedLevel(i)+ 6);
				GivePlayerScore(i, 1);
				new rbskl[250];
				SetPlayerRobbingSkill(i, GetPlayerRobbingSkill(i)+1);
				format(rbskl, sizeof(rbskl), "Robbing Skill upgraded! Your skill now is: %d", GetPlayerRobbingSkill(i));
				SendClientMessage(i, SERVER_COLOR, rbskl);
				SendClientMessage(i, GREY, "|_| Crime Commited |_|");
				format(string2, sizeof(string2), "You earned $%d from Ammunation!", earnings);
				SendClientMessage(i, WHITE, string2);
				format(string3, sizeof(string3), "Wanted Level: %d", GetPlayerWantedLevel(i));
				SendClientMessage(i, WHITE, string3);
			}
			//4Dragons
			if(RobD4[i] > 1)
			{
				new string[250], robber[MAX_PLAYER_NAME], robtime;
				GetPlayerName(i, robber, sizeof(robber));
				RobD4[i]--;
				robtime = (RobD4[i]);
				format(string, sizeof(string), "~w~STAY IN THE CHECKPOINT~n~~g~%d~w~ SECONDS REMAINING", robtime);
				GameTextForPlayer(i, string, 3000, 3);
			}
			if(RobD4[i] == 1)
			{
				new earnings = random(20000), robber[MAX_PLAYER_NAME], string[250], string2[250], string3[250], cops[250];
				RobD4[i] = 0;
				GetPlayerName(i, robber, sizeof(robber));
				format(string, sizeof(string), "~w~ROBBERY COMPLETE!~n~YOU EARNED ~g~$%d", earnings);
				GameTextForPlayer(i, string, 3000, 3);
				format(cops, sizeof(cops), "[HQ] %s has robbed 4Dragons Casino.", robber);
				SendRadioMessageToCops(cops);
				GivePlayerMoney(i, earnings);
				SetPlayerWantedLevel(i,GetPlayerWantedLevel(i)+ 6);
				GivePlayerScore(i, 1);
				SetPlayerRobbingSkill(i, GetPlayerRobbingSkill(i)+1);
				SendClientMessage(i, GREY, "|_| Crime Commited |_|");
				format(string2, sizeof(string2), "You earned $%d from 4Dragons Casino.!", earnings);
				SendClientMessage(i, WHITE, string2);
				format(string3, sizeof(string3), "Wanted Level: %d", GetPlayerWantedLevel(i));
				SendClientMessage(i, WHITE, string3);
			}
			//Caligulas
			if(RobCa[i] > 1)
			{
				new string[250], robber[MAX_PLAYER_NAME], robtime;
				GetPlayerName(i, robber, sizeof(robber));
				RobCa[i]--;
				robtime = (RobCa[i]);
				format(string, sizeof(string), "~w~STAY IN THE CHECKPOINT~n~~g~%d~w~ SECONDS REMAINING", robtime);
				GameTextForPlayer(i, string, 3000, 3);
			}
			if(RobCa[i] == 1)
			{
				new earnings = random(20000), robber[MAX_PLAYER_NAME], string[250], string2[250], string3[250], cops[250];
				RobCa[i] = 0;
				GetPlayerName(i, robber, sizeof(robber));
				format(string, sizeof(string), "~w~ROBBERY COMPLETE!~n~YOU EARNED ~g~$%d", earnings);
				GameTextForPlayer(i, string, 3000, 3);
				format(cops, sizeof(cops), "[HQ] %s has robbed Caligulas Casino.", robber);
				SendRadioMessageToCops(cops);
				GivePlayerMoney(i, earnings);
				SetPlayerWantedLevel(i,GetPlayerWantedLevel(i)+ 6);
				GivePlayerScore(i, 1);
				SetPlayerRobbingSkill(i, GetPlayerRobbingSkill(i)+1);
				SendClientMessage(i, GREY, "|_| Crime Commited |_|");
				format(string2, sizeof(string2), "You earned $%d from Caligulas Casino.!", earnings);
				SendClientMessage(i, WHITE, string2);
				format(string3, sizeof(string3), "Wanted Level: %d", GetPlayerWantedLevel(i));
				SendClientMessage(i, WHITE, string3);
			}
			//Zip
			if(RobZip[i] > 1)
			{
				new string[250], robber[MAX_PLAYER_NAME], robtime;
				GetPlayerName(i, robber, sizeof(robber));
				RobZip[i]--;
				robtime = (RobZip[i]);
				format(string, sizeof(string), "~w~STAY IN THE CHECKPOINT~n~~g~%d~w~ SECONDS REMAINING", robtime);
				GameTextForPlayer(i, string, 3000, 3);
			}
			if(RobZip[i] == 1)
			{
				new earnings = random(9000), robber[MAX_PLAYER_NAME], string[250], string2[250], string3[250], cops[250];
				RobZip[i] = 0;
				GetPlayerName(i, robber, sizeof(robber));
				format(string, sizeof(string), "~w~ROBBERY COMPLETE!~n~YOU EARNED ~g~$%d", earnings);
				GameTextForPlayer(i, string, 3000, 3);
				format(cops, sizeof(cops), "[HQ] %s has robbed ZIP. Location: ZIP.", robber);
				SendRadioMessageToCops(cops);
				GivePlayerMoney(i, earnings);
				SetPlayerWantedLevel(i,GetPlayerWantedLevel(i)+ 5);
				GivePlayerScore(i, 1);
				new rbskl[250];
				SetPlayerRobbingSkill(i, GetPlayerRobbingSkill(i)+1);
				format(rbskl, sizeof(rbskl), "Robbing Skill upgraded! Your skill now is: %d", GetPlayerRobbingSkill(i));
				SendClientMessage(i, SERVER_COLOR, rbskl);
				SendClientMessage(i, GREY, "|_| Crime Commited |_|");
				format(string2, sizeof(string2), "You earned $%d from ZIP!", earnings);
				SendClientMessage(i, WHITE, string2);
				format(string3, sizeof(string3), "Wanted Level: %d", GetPlayerWantedLevel(i));
				SendClientMessage(i, WHITE, string3);
			}
			//Bianco
			if(RobBinco[i] > 1)
			{
				new string[250], robber[MAX_PLAYER_NAME], robtime;
				GetPlayerName(i, robber, sizeof(robber));
				RobBinco[i]--;
				robtime = (RobBinco[i]);
				format(string, sizeof(string), "~w~STAY IN THE CHECKPOINT~n~~g~%d~w~ SECONDS REMAINING", robtime);
				GameTextForPlayer(i, string, 3000, 3);
			}
			if(RobBinco[i] == 1)
			{
				new earnings = random(9500), robber[MAX_PLAYER_NAME], string[250], string2[250], string3[250], cops[250];
				RobBinco[i] = 0;
				GetPlayerName(i, robber, sizeof(robber));
				format(string, sizeof(string), "~w~ROBBERY COMPLETE!~n~YOU EARNED ~g~$%d", earnings);
				GameTextForPlayer(i, string, 3000, 3);
				format(cops, sizeof(cops), "[HQ] %s has robbed Binco. Location: Binco.", robber);
				SendRadioMessageToCops(cops);
				GivePlayerMoney(i, earnings);
				SetPlayerWantedLevel(i,GetPlayerWantedLevel(i)+ 5);
				GivePlayerScore(i, 1);
				new rbskl[250];
				SetPlayerRobbingSkill(i, GetPlayerRobbingSkill(i)+1);
				format(rbskl, sizeof(rbskl), "Robbing Skill upgraded! Your skill now is: %d", GetPlayerRobbingSkill(i));
				SendClientMessage(i, SERVER_COLOR, rbskl);
				SendClientMessage(i, GREY, "|_| Crime Commited |_|");
				format(string2, sizeof(string2), "You earned $%d from Binco!", earnings);
				SendClientMessage(i, WHITE, string2);
				format(string3, sizeof(string3), "Wanted Level: %d", GetPlayerWantedLevel(i));
				SendClientMessage(i, WHITE, string3);
			}
			//Bank
			if(RobBank[i] > 1)
			{
				new string[250], robber[MAX_PLAYER_NAME], robtime;
				GetPlayerName(i, robber, sizeof(robber));
				RobBank[i]--;
				robtime = (RobBank[i]);
				format(string, sizeof(string), "~w~STAY IN THE CHECKPOINT~n~~g~%d~w~ SECONDS REMAINING", robtime);
				GameTextForPlayer(i, string, 3000, 3);
			}
			if(RobBank[i] == 1)
			{
				new earnings = random(30000), robber[MAX_PLAYER_NAME], string[250], string2[250], string3[250], cops[250];
				RobBank[i] = 0;
				GetPlayerName(i, robber, sizeof(robber));
				format(string, sizeof(string), "~w~ROBBERY COMPLETE!~n~YOU EARNED ~g~$%d", earnings);
				GameTextForPlayer(i, string, 3000, 3);
				format(cops, sizeof(cops), "[HQ] %s has robbed RuNix's Intl. Bank. Location: RuNix's Intl. Bank.", robber);
				SendRadioMessageToCops(cops);
				GivePlayerMoney(i, earnings);
				SetPlayerWantedLevel(i,GetPlayerWantedLevel(i)+ 6);
				GivePlayerScore(i, 2);
				SendClientMessage(i, GREY, "|_| Crime Commited |_|");
				format(string2, sizeof(string2), "You earned $%d from RuNix's Intl. Bank!", earnings);
				SendClientMessage(i, WHITE, string2);
				format(string3, sizeof(string3), "Wanted Level: %d", GetPlayerWantedLevel(i));
				SendClientMessage(i, WHITE, string3);
			}
			//Rental
			if(RobRental[i] > 1)
			{
				new string[250], robber[MAX_PLAYER_NAME], robtime;
				GetPlayerName(i, robber, sizeof(robber));
				RobRental[i]--;
				robtime = (RobRental[i]);
				format(string, sizeof(string), "~w~STAY IN THE CHECKPOINT~n~~g~%d~w~ SECONDS REMAINING", robtime);
				GameTextForPlayer(i, string, 3000, 3);
			}
			if(RobRental[i] == 1)
			{
				new earnings = random(15500), robber[MAX_PLAYER_NAME], string[250], string2[250], string3[250], cops[250];
				RobRental[i] = 0;
				GetPlayerName(i, robber, sizeof(robber));
				format(string, sizeof(string), "~w~ROBBERY COMPLETE!~n~YOU EARNED ~g~$%d", earnings);
				GameTextForPlayer(i, string, 3000, 3);
				format(cops, sizeof(cops), "[HQ] %s has robbed Car Shop. Location: Car Shop.", robber);
				SendRadioMessageToCops(cops);
				GivePlayerMoney(i, earnings);
				SetPlayerWantedLevel(i,GetPlayerWantedLevel(i)+ 4);
				GivePlayerScore(i, 1);
				new rbskl[250];
				SetPlayerRobbingSkill(i, GetPlayerRobbingSkill(i)+1);
				format(rbskl, sizeof(rbskl), "Robbing Skill upgraded! Your skill now is: %d", GetPlayerRobbingSkill(i));
				SendClientMessage(i, SERVER_COLOR, rbskl);
				SendClientMessage(i, GREY, "|_| Crime Commited |_|");
				format(string2, sizeof(string2), "You earned $%d from Car Shop!", earnings);
				SendClientMessage(i, WHITE, string2);
				format(string3, sizeof(string3), "Wanted Level: %d", GetPlayerWantedLevel(i));
				SendClientMessage(i, WHITE, string3);
			}
			//City Hall
			if(RobHall[i] > 1)
			{
				new string[250], robber[MAX_PLAYER_NAME], robtime;
				GetPlayerName(i, robber, sizeof(robber));
				RobHall[i]--;
				robtime = (RobHall[i]);
				format(string, sizeof(string), "~w~STAY IN THE CHECKPOINT~n~~g~%d~w~ SECONDS REMAINING", robtime);
				GameTextForPlayer(i, string, 3000, 3);
			}
			if(RobHall[i] == 1)
			{
				new earnings = random(20000), robber[MAX_PLAYER_NAME], string[250], string2[250], string3[250], cops[250];
				RobHall[i] = 0;
				GetPlayerName(i, robber, sizeof(robber));
				format(string, sizeof(string), "~w~ROBBERY COMPLETE!~n~YOU EARNED ~g~$%d", earnings);
				GameTextForPlayer(i, string, 3000, 3);
				format(cops, sizeof(cops), "[HQ] %s has robbed the City Hall. Location: City Hall.", robber);
				SendRadioMessageToCops(cops);
				GivePlayerMoney(i, earnings);
				SetPlayerWantedLevel(i,GetPlayerWantedLevel(i)+ 6);
				GivePlayerScore(i, 1);
				new rbskl[250];
				SetPlayerRobbingSkill(i, GetPlayerRobbingSkill(i)+1);
				format(rbskl, sizeof(rbskl), "Robbing Skill upgraded! Your skill now is: %d", GetPlayerRobbingSkill(i));
				SendClientMessage(i, SERVER_COLOR, rbskl);
				SendClientMessage(i, GREY, "|_| Crime Commited |_|");
				format(string2, sizeof(string2), "You earned $%d from the City Hall!", earnings);
				SendClientMessage(i, WHITE, string2);
				format(string3, sizeof(string3), "Wanted Level: %d", GetPlayerWantedLevel(i));
				SendClientMessage(i, WHITE, string3);
			}
			//Dildo
			if(RobDildo[i] > 1)
			{
				new string[250], robber[MAX_PLAYER_NAME], robtime;
				GetPlayerName(i, robber, sizeof(robber));
				RobDildo[i]--;
				robtime = (RobDildo[i]);
				format(string, sizeof(string), "~w~STAY IN THE CHECKPOINT~n~~g~%d~w~ SECONDS REMAINING", robtime);
				GameTextForPlayer(i, string, 3000, 3);
			}
			if(RobDildo[i] == 1)
			{
				new earnings = random(19000), robber[MAX_PLAYER_NAME], string[250], string2[250], string3[250], cops[250];
				RobDildo[i] = 0;
				GetPlayerName(i, robber, sizeof(robber));
				format(string, sizeof(string), "~w~ROBBERY COMPLETE!~n~YOU EARNED ~g~$%d", earnings);
				GameTextForPlayer(i, string, 3000, 3);
				format(cops, sizeof(cops), "[HQ] %s has robbed Las Venturas Dildos. Location: Las Venturas.", robber);
				SendRadioMessageToCops(cops);
				GivePlayerMoney(i, earnings);
				SetPlayerWantedLevel(i,GetPlayerWantedLevel(i)+ 5);
				GivePlayerScore(i, 1);
				new rbskl[250];
				SetPlayerRobbingSkill(i, GetPlayerRobbingSkill(i)+1);
				format(rbskl, sizeof(rbskl), "Robbing Skill upgraded! Your skill now is: %d", GetPlayerRobbingSkill(i));
				SendClientMessage(i, SERVER_COLOR, rbskl);
				SendClientMessage(i, GREY, "|_| Crime Commited |_|");
				format(string2, sizeof(string2), "You earned $%d from Las Venturas Dildos!", earnings);
				SendClientMessage(i, WHITE, string2);
				format(string3, sizeof(string3), "Wanted Level: %d", GetPlayerWantedLevel(i));
				SendClientMessage(i, WHITE, string3);
			}
		}
	}
}

public Unjail()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(IsPlayerConnected(i))
        {
			new file[256], name[MAX_PLAYER_NAME];
			GetPlayerName(i, name, sizeof(name));
			format(file, sizeof(file), "%s.runix", name);

            if(IsPlayerJailed(i))
            {
                if(PrisonTime[i] > 0)
                {
                    PrisonTime[i] --;
                    new string[256];
                    format(string, sizeof(string), "~w~TIME LEFT~n~~r~%d", PrisonTime[i]);
					GameTextForPlayer(i, string, 3000, 6);
                }
                if(PrisonTime[i] == 0)
                {
					new string[256];
					SetPlayerInterior(i, 3);
					SetPlayerPos(i, 231.1111, 146.7039, 1003.0234);
					SetPlayerFacingAngle(i, 272.8459);
					SetCameraBehindPlayer(i);
					PD[i] = 2;
					SendClientMessage(i, GREY, "|_| San Andreas Police Dept. |_|");
					SendClientMessage(i, WHITE, "You are free to go. Just don't get into trouble.");
					format(string, sizeof(string), "%s[ID:%d] has been released from prison.", name, i);
					Announce(string);
					SetPlayerHealth(i,100);
					SetPlayerJailed(i, false);
					SetPlayerPrisonTime(i, 0);
                }
            }
        }
    }
}

public ShowCarListMenu(playerid)
{
	ShowMenuForPlayer(CarList, playerid);
}

public PlayerRecentlyRobbed()
{
	for(new i=0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) && RecentlyRobbed[i] >=1)
		{
			RecentlyRobbed[i] --;
		}
	}
}

public BankRecentlyUsedByRobber()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) && BankRecentlyUsed[i] >= 1)
		{
			BankRecentlyUsed[i]--;
		}
	}
}

public RecentlyRentedACar()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) && RentedACarRecently[i] >= 1)
		{
			RentedACarRecently[i]--;
		}
	}
}

public TimeUpdate()
{
	if(time >= 0 && time <= 22)
	{
		new string[250], weather = random(19);
		time++;
		format(string, sizeof(string), "Time: %dh00", time);
		printf("Time: %dh00", time);
		Announce(string);
		SetWorldTime(time);
		SetWeather(weather);
	}
	else if(time == 23)
	{
		new string[250], weather = random(19);
		time = 0;
		format(string, sizeof(string), "Time: 0%dh00", time);
		printf("Time: %dh00", time);
		Announce(string);
		SetWorldTime(time);
		SetWeather(weather);
	}
}

public WantedLevel()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerSpawned(i) && GetPlayerWantedLevel(i) == 0 && gTeam[i] != COP && gTeam[i] != SWAT && gTeam[i] != ARMY && gTeam[i] != FBI && gTeam[i] != Medic) SetPlayerColor(i, WHITE);
		else if(IsPlayerSpawned(i) && GetPlayerWantedLevel(i) >= 1 && GetPlayerWantedLevel(i) <= 3) SetPlayerColor(i, YELLOW);
		else if(IsPlayerSpawned(i) && GetPlayerWantedLevel(i) >= 4 && GetPlayerWantedLevel(i) <= 6) SetPlayerColor(i, ORANGE);
		else if(IsPlayerSpawned(i) && GetPlayerWantedLevel(i) >= 7) SetPlayerColor(i, RED);
	}
}

public Float:GetDistanceBetweenPlayers(p1,p2)
{
	new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
	if(!IsPlayerConnected(p1) || !IsPlayerConnected(p2)) return -1.00;
	GetPlayerPos(p1,x1,y1,z1);
	GetPlayerPos(p2,x2,y2,z2);
	return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
}

stock GivePlayerScore(playerid, score)
{
	SetPlayerScore(playerid, GetPlayerScore(playerid)+score);
	return true;
}

stock SendClientMessageToAdmins(const str[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    if(IsPlayerConnected(i))
		{
	        if(AccountInfo[i][aLevel] > 0)
			{
	            SendClientMessage(i, RED, str);
	        }
	    }
	}
	return true;
}

stock Announce(const str[])
{
	return SendClientMessageToAll(SERVER_COLOR, str);
}

stock SendRadioMessageToCops(const str[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerSpawned(i) && gTeam[i] == COP) SendClientMessage(i, LIGHT_BLUE, str);
	}
	return true;
}

stock SendRadioMessageToMedics(const str[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerSpawned(i) && gTeam[i] == Medic) SendClientMessage(i, PINK, str);
	}
	return true;
}

stock IsPlayerSpawned(playerid)
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT || GetPlayerState(playerid) == PLAYER_STATE_DRIVER || GetPlayerState(playerid) ==

PLAYER_STATE_PASSENGER) return true;
	else return false;
}

stock GetPlayerBankCash(playerid)
{
	new bcash, file[256], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "%s.runix", name);
	bcash = dini_Int(file, "Bank");
	return bcash;
}

stock GetPlayerRobbingSkill(playerid)
{
	new robskill, file[256], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "%s.runix", name);
	robskill = dini_Int(file, "RobSkill");
	return robskill;
}

stock GetPlayerTerrorSkill(playerid)
{
	new terskill, file[256], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "%s.runix", name);
	terskill = dini_Int(file, "TerSkill");
	return terskill;
}

stock SetPlayerBankCash(playerid, cash)
{
	new file[256], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "%s.runix", name);
	dini_IntSet(file, "Bank", cash);
	return true;
}

stock SetPlayerAdminLevel(playerid, level)
{
	new file[256], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "%s.runix", name);
	dini_IntSet(file, "Admin", level);
	return true;
}

stock SetPlayerRobbingSkill(playerid, skill)
{
	new file[256], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "%s.runix", name);
	dini_IntSet(file, "RobSkill", skill);
	return true;
}

stock SetPlayerTerrorSkill(playerid, skill)
{
	new file[256], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "%s.runix", name);
	dini_IntSet(file, "TerSkill", skill);
	return true;
}

stock GetPlayerWarnings(playerid)
{
	new warns, file[256], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "%s.runix", name);
	warns = dini_Int(file, "Warnings");
	return warns;
}

stock SetPlayerWarnings(playerid, warns)
{
	new file[256], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "%s.runix", name);
	dini_IntSet(file, "Warnings", warns);
	return true;
}

stock SetPlayerJailed(playerid, bool)
{
	new file[256], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "%s.runix", name);
	if(bool == 1) dini_IntSet(file, "Jail", 1);
	else if(bool == 0) dini_IntSet(file, "Jail", 0);
	return true;
}

stock IsPlayerJailed(playerid)
{
	new file[256], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "%s.runix", name);
	if(dini_Int(file, "Jail") == 1)
	{
		return true;
	}
	else if(dini_Int(file, "Jail") == 0)
	{
		return false;
	}
	return true;
}

stock GetPlayerPrisonTime(playerid)
{
	new file[256], name[MAX_PLAYER_NAME], ptime;
	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "%s.runix", name);
	ptime = dini_Int(file, "PrisonTime");
	return ptime;
}

stock SetPlayerPrisonTime(playerid, ptime)
{
	new file[256], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "%s.runix", name);
	dini_IntSet(file, "PrisonTime", ptime);
	return true;
}

stock GetPlayerC4Amount(playerid)
{
	new c4s, file[256], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "%s.runix", name);
	c4s = dini_Int(file, "C4");
	return c4s;
}

stock SetPlayerC4Amount(playerid, amount)
{
	new file[256], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "%s.runix", name);
	dini_IntSet(file, "C4", amount);
	return true;
}

stock GetPlayerDrugs(playerid)
{
	new drugs, file[256], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "%s.runix", name);
	drugs = dini_Int(file, "Drugs");
	return drugs;
}

stock SetPlayerDrugs(playerid, amount)
{
	new file[256], name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	format(file, sizeof(file), "%s.runix", name);
	dini_IntSet(file, "Drugs", amount);
	return true;
}
//--------------------------TAXI------------------------------------------------
public terminarMission(playerid)
	{
	new msg[255];
	format(msg,sizeof(msg),"~r~Taxi ~w~Job cancelled~n~ You carried ~r~%d~w~ pasengers.",contador[playerid]);
	GameTextForPlayer(playerid,msg,5000,6);
    playerInJob[playerid]=-1;
    avisado[playerid]=-1;
   	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid,name,MAX_PLAYER_NAME);
   	format(msg,sizeof(msg),"***ATENTION: %s Is NOT a TAXI DRIVER anymore***",name);
	GetPlayerName(playerid,name,MAX_PLAYER_NAME);
    for (new i=0;i<MAX_PLAYERS;i++)
		{
		if 	(playerid!=i)
		    {
		    SendClientMessage(i,0xFFFF00AA,msg);
		    }
		}
	for (new i=0;i<MAX_PLAYERS;i++)
		{
		if  (OnTaxiAsPassenger[i]==playerid)
			{
			new taxista = playerid;
			OnTaxiAsPassenger[i]=-1;
			new viaje=CostoDelViaje[i];
			format(msg,sizeof(msg),"~w~You pay to ~g~%s ~n~~r~$%d~w~ for the ~r~Taxi~w~ ride.",name,viaje);
			GameTextForPlayer(i,msg,5000,6);
			format(msg,sizeof(msg),"~w~You get ~r~$%d~w~ ~n~for the ~r~Taxi~w~ ride.",viaje);
			GameTextForPlayer(taxista,msg,5000,6);
			GivePlayerMoney(i,-viaje);
			GivePlayerMoney(taxista,viaje);
			cantidadPasajeros--;
			if 	(cantidadPasajeros==0)
			    {
				KillTimer(caidadefichaTimer);
				}
			}
		}
    contador[playerid]=0;
    return 1;
	}
public caidadeficha()
	{
	for (new i=0;i<MAX_PLAYERS;i++)
		{
		CostoDelViaje[i]=CostoDelViaje[i]+PRECIO_FICHA;
		}
	}
//--------------------------------------------------TAXI----------------------------------------------------
MissionIni(playerid)
    {
    playerInJob[playerid]=1;
    GameTextForPlayer(playerid,"~r~Taxi ~w~Job",5000,6);
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid,name,MAX_PLAYER_NAME);
	new msg[255];
	format(msg,sizeof(msg),"***ATENTION: %s is now a Taxi Driver***",name);
    for (new i=0;i<MAX_PLAYERS;i++)
		{
		if 	(playerid!=i)
		    {
		    SendClientMessage(i,0xFFFF00AA,msg);
		    }
		}
    return 1;
    }
//------------------------------------------------------------------------------------------------------
IsNumeric(const string[])
{
for (new i = 0, j = strlen(string); i < j; i++) {
    if (string[i] > '9' || string[i] < '0') {
return 0;
}
}

return 1;
}

//----------------------------------------------------------SSCANF------------------------------------------------------------------------------------
stock sscanf(string[], format[], {Float,_}:...)                                 // By Alex "Y_Less" Cole
{
	#if defined isnull
		if (isnull(string))
	#else
		if (string[0] == 0 || (string[0] == 1 && string[1] == 0))
	#endif
		{
			return format[0];
		}
	#pragma tabsize 4
	new
		formatPos = 0,
		stringPos = 0,
		paramPos = 2,
		paramCount = numargs(),
		delim = ' ';
	while (string[stringPos] && string[stringPos] <= ' ')
	{
		stringPos++;
	}
	while (paramPos < paramCount && string[stringPos])
	{
		switch (format[formatPos++])
		{
			case '\0':
			{
				return 0;
			}
			case 'i', 'd':
			{
				new
					neg = 1,
					num = 0,
					ch = string[stringPos];
				if (ch == '-')
				{
					neg = -1;
					ch = string[++stringPos];
				}
				do
				{
					stringPos++;
					if ('0' <= ch <= '9')
					{
						num = (num * 10) + (ch - '0');
					}
					else
					{
						return -1;
					}
				}
				while ((ch = string[stringPos]) > ' ' && ch != delim);
				setarg(paramPos, 0, num * neg);
			}
			case 'h', 'x':
			{
				new
					ch,
					num = 0;
				while ((ch = string[stringPos]) > ' ' && ch != delim)
				{
					switch (ch)
					{
						case 'x', 'X':
						{
							num = 0;
							continue;
						}
						case '0' .. '9':
						{
							num = (num << 4) | (ch - '0');
						}
						case 'a' .. 'f':
						{
							num = (num << 4) | (ch - ('a' - 10));
						}
						case 'A' .. 'F':
						{
							num = (num << 4) | (ch - ('A' - 10));
						}
						default:
						{
							return -1;
						}
					}
				}
				setarg(paramPos, 0, num);
			}
			case 'c':
			{
				setarg(paramPos, 0, string[stringPos++]);
			}
			case 'f':
			{
				setarg(paramPos, 0, _:floatstr(string[stringPos]));
			}
			case 'p':
			{
				delim = format[formatPos++];
				continue;
			}
			case '\'':
			{
				new
					end = formatPos - 1,
					ch;
				while ((ch = format[++end]) && ch != '\'') {}
				if (!ch)
				{
					return -1;
				}
				format[end] = '\0';
				if ((ch = strfind(string, format[formatPos], false, stringPos)) == -1)
				{
					if (format[end + 1])
					{
						return -1;
					}
					return 0;
				}
				format[end] = '\'';
				stringPos = ch + (end - formatPos);
				formatPos = end + 1;
			}
			case 'u':
			{
				new
					end = stringPos - 1,
					id = 0,
					bool:num = true,
					ch;
				while ((ch = string[++end]) && ch != delim)
				{
					if (num)
					{
						if ('0' <= ch <= '9')
						{
							id = (id * 10) + (ch - '0');
						}
						else
						{
							num = false;
						}
					}
				}
				if (num && IsPlayerConnected(id))
				{
					setarg(paramPos, 0, id);
				}
				else
				{
					#if !defined foreach
						#define foreach(%1,%2) for (new %2 = 0; %2 < MAX_PLAYERS; %2++) if (IsPlayerConnected(%2))
						#define __SSCANF_FOREACH__
					#endif
					string[end] = '\0';
					num = false;
					new
						name[MAX_PLAYER_NAME];
					id = end - stringPos;
					foreach (Player, playerid)
					{
						GetPlayerName(playerid, name, sizeof (name));
						if (!strcmp(name, string[stringPos], true, id))
						{
							setarg(paramPos, 0, playerid);
							num = true;
							break;
						}
					}
					if (!num)
					{
						setarg(paramPos, 0, INVALID_PLAYER_ID);
					}
					string[end] = ch;
					#if defined __SSCANF_FOREACH__
						#undef foreach
						#undef __SSCANF_FOREACH__
					#endif
				}
				stringPos = end;
			}
			case 's', 'z':
			{
				new
					i = 0,
					ch;
				if (format[formatPos])
				{
					while ((ch = string[stringPos++]) && ch != delim)
					{
						setarg(paramPos, i++, ch);
					}
					if (!i)
					{
						return -1;
					}
				}
				else
				{
					while ((ch = string[stringPos++]))
					{
						setarg(paramPos, i++, ch);
					}
				}
				stringPos--;
				setarg(paramPos, i, '\0');
			}
			default:
			{
				continue;
			}
		}
		while (string[stringPos] && string[stringPos] != delim && string[stringPos] > ' ')
		{
			stringPos++;
		}
		while (string[stringPos] && (string[stringPos] == delim || string[stringPos] <= ' '))
		{
			stringPos++;
		}
		paramPos++;
	}
	do
	{
		if ((delim = format[formatPos++]) > ' ')
		{
			if (delim == '\'')
			{
				while ((delim = format[formatPos++]) && delim != '\'') {}
			}
			else if (delim != 'z')
			{
				return delim;
			}
		}
	}
	while (delim > ' ');
	return 0;
}

public PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z)
{
	new Float:oldposx, Float:oldposy, Float:oldposz;
	new Float:tempposx, Float:tempposy, Float:tempposz;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);
	tempposx = (oldposx -x); tempposy = (oldposy -y); tempposz = (oldposz -z);
	if(((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
	{ return true; }
	return false;
}
forward HideDraw(playerid);
public HideDraw(playerid)
{
    TextDrawHideForPlayer(playerid, CIVBOX);
	TextDrawHideForPlayer(playerid, HALLBOX);
	TextDrawHideForPlayer(playerid, COPBOX);
	TextDrawHideForPlayer(playerid, MDCBOX);
	TextDrawHideForPlayer(playerid, text6);
	TextDrawHideForPlayer(playerid, text7);
	TextDrawHideForPlayer(playerid, text8);
	TextDrawHideForPlayer(playerid, text9);
	TextDrawHideForPlayer(playerid, text10);
	TextDrawHideForPlayer(playerid, text11);
	TextDrawHideForPlayer(playerid, text12);
	TextDrawHideForPlayer(playerid, text13);
	TextDrawHideForPlayer(playerid, text14);
	TextDrawHideForPlayer(playerid, text15);
	TextDrawHideForPlayer(playerid, text16);
	TextDrawHideForPlayer(playerid, text17);
	TextDrawHideForPlayer(playerid, text18);
	TextDrawHideForPlayer(playerid, text19);
	TextDrawHideForPlayer(playerid, text20);
	TextDrawHideForPlayer(playerid, text21);
	TextDrawHideForPlayer(playerid, text22);
	TextDrawHideForPlayer(playerid, text23);
	TextDrawHideForPlayer(playerid, CMDBOX);
    TextDrawHideForPlayer(playerid, BUSBOX);
    TextDrawHideForPlayer(playerid, text24);
    TextDrawHideForPlayer(playerid, text25);
    TextDrawHideForPlayer(playerid, text26);
    TextDrawHideForPlayer(playerid, text27);
    TextDrawHideForPlayer(playerid, text35);
    TextDrawHideForPlayer(playerid, text36);
    TextDrawHideForPlayer(playerid, BBOX);
    TextDrawHideForPlayer(playerid, AMMUBOX1);
    TextDrawHideForPlayer(playerid, AMMUBOX2);
    TextDrawHideForPlayer(playerid, text37);
    TextDrawHideForPlayer(playerid, text38);
    TextDrawHideForPlayer(playerid, text39);
    TextDrawHideForPlayer(playerid, text40);
    TextDrawHideForPlayer(playerid, text41);
    TextDrawHideForPlayer(playerid, text42);
    TextDrawHideForPlayer(playerid, text43);
    TextDrawHideForPlayer(playerid, PCBOX);
    TextDrawHideForPlayer(playerid, text44);
    TextDrawHideForPlayer(playerid, text45);
    AMMUBOX[playerid] = 0;
	return 1;
}
//BUS
public terminarMission2(playerid)
	{
	new msg[255];
	format(msg,sizeof(msg),"~r~Bus ~w~Job cancelled~n~ You carried ~r~%d~w~ pasengers.",contador2[playerid]);
	GameTextForPlayer(playerid,msg,5000,6);
    playerInMiniMission2[playerid]=-1;
    currentcheckpoint[playerid] = 0;
    DisablePlayerRaceCheckpoint(playerid);
    avisado2[playerid]=-1;
   	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid,name,MAX_PLAYER_NAME);
   	format(msg,sizeof(msg),"***ATENTION: %s Is NOT a Bus DRIVER anymore***",name);
	GetPlayerName(playerid,name,MAX_PLAYER_NAME);
    for (new i=0;i<MAX_PLAYERS;i++)
		{
		if 	(playerid!=i)
		    {
		    SendClientMessage(i,0xFFFF00AA,msg);
		    }
		}
	for (new i=0;i<MAX_PLAYERS;i++)
		{
		if  (OnBusAsPassenger[i]==playerid)
			{
			new Bussta = playerid;
			OnBusAsPassenger[i]=-1;
			new viaje=CostoDelViaje2[i];
			format(msg,sizeof(msg),"~w~You pay to ~g~%s ~n~~r~$%d~w~ for the ~r~Bus~w~ ride.",name,viaje);
			GameTextForPlayer(i,msg,5000,6);
			format(msg,sizeof(msg),"~w~You get ~r~$%d~w~ ~n~for the ~r~Bus~w~ ride.",viaje);
			GameTextForPlayer(Bussta,msg,5000,6);
			GivePlayerMoney(i,-viaje);
			GivePlayerMoney(Bussta,viaje);
			cantidadPasajeros2--;
			if 	(cantidadPasajeros2==0)
			    {
				KillTimer(caidadeficha2Timer2);
				}
			}
		}
    contador2[playerid]=0;
    return 1;
	}
//------------------------------------------------------------------------------------------------------
public caidadeficha2()
	{
	for (new i=0;i<MAX_PLAYERS;i++)
		{
		CostoDelViaje2[i]=CostoDelViaje2[i]+PRECIO_FICHA2;
		}
	}
	
    MissionIni2(playerid)
    {
    playerInMiniMission2[playerid]=1;
    GameTextForPlayer(playerid,"~r~Bus ~w~Job",5000,6);
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid,name,MAX_PLAYER_NAME);
	new msg[255];
	format(msg,sizeof(msg),"***ATENTION: %s is now a Bus DRIVER***",name);
    for (new i=0;i<MAX_PLAYERS;i++)
		{
		if 	(playerid!=i)
		    {
		    SendClientMessage(i,0xFFFF00AA,msg);
		    }
		}
    return 1;
    }
//------------------------------------------------------------------------------
dcmd_taze(playerid, params[])
{
	new taze = strval(params);
	if(!strlen(params))
	{
		SendClientMessage(playerid, COLOR_ERROR, "USAGE: /taze [ID]");
	}
	else
	{
	if(gTeam[playerid] == COP || gTeam[playerid] == SWAT || gTeam[playerid] == ARMY || gTeam[playerid] == FBI)
	{
		if(IsPlayerConnected(taze))
		{
			if(GetDistanceBetweenPlayers(playerid, taze) <= 6)
			{
				if(tazetime[playerid] == 0)
				{
					new tehtaze = random(5);
					if(tehtaze == 1 || tehtaze == 2 || tehtaze == 3 || tehtaze == 4)
					{
						new string[256], Float:thlth;
						format(string, sizeof(string), "%s (%i) has tazed you.",ReturnPlayerName(playerid), playerid);
						SendClientMessage(taze, COLOR_MSG, string);
						format(string, sizeof(string), "You have tazed %s (%i).",ReturnPlayerName(taze), taze);
						SendClientMessage(playerid, COLOR_MSG, string);
						GetPlayerHealth(taze, thlth);
						new Float:tehtaze3 = thlth-15-random(30);
						SetPlayerHealth(taze, tehtaze3);
						if(thlth < tehtaze3)
						{
							format(string, sizeof(string), "%s (%i) has been tazed to death", ReturnPlayerName(taze), taze);
							SendClientMessageToAll(COLOR_KILLED, string);
						}
						else
						{
							SendClientMessage(taze, COLOR_MSG, "You are stunned for a while.");
							TogglePlayerControllable(taze, 0);
							stunned[taze] = 1;
							tazetime[playerid] = 1;
							SetTimerEx("tazetimer", ANTISPAM*1000, 0, "i", playerid);
							SetTimerEx("stuntimer", STUNNED_TIME*1000, 0, "i", taze);
						}
					}
					else
					{
						new string[256], Float:phlth;
						format(string, sizeof(string), "%s (%i) has accidentally held the tazer the wrong way and tazed himself",ReturnPlayerName(playerid), playerid);
						SendClientMessage(taze, COLOR_MSG, string);
						SendClientMessage(playerid, COLOR_MSG, "You accidentally held the tazer the wrong way and tazed yourself");
						GetPlayerHealth(playerid, phlth);
						new Float:tehtaze2 = phlth-25-random(30);
						SetPlayerHealth(playerid, tehtaze2);
						if(phlth < tehtaze2)
						{
							format(string, sizeof(string), "%s (%i) has been tazed to death",ReturnPlayerName(playerid), playerid);
							SendClientMessageToAll(COLOR_KILLED, string);
						}
						else
						{
							SendClientMessage(playerid, COLOR_MSG, "You are stunned for a while.");
							TogglePlayerControllable(playerid, 0);
							stunned[playerid] = 1;
							SetTimerEx("stuntimer", STUNNED_TIME*1000, 0, "i", playerid);
							SetTimerEx("tazetimer", ANTISPAM*1000, 0, "i", playerid);
							tazetime[playerid] = 1;
						}
					}
				}
				else
				{
					SendClientMessage(playerid, COLOR_MSG, "Please wait before tazing someone again!");
				}
			}
			else
			{
				new string[256];
				format(string, sizeof(string), "%s (%i) is not close enough to taze!", ReturnPlayerName(taze), taze);
			}
		}
		else
		{
			SendClientMessage(playerid, COLOR_MSG, "That player is not connected!");
		}
	  }
	  else
	  {
		SendClientMessage(playerid, COLOR_MSG, "You are not Police Officer!");
	  }
	}
	return 1;
}
//
forward stuntimer(taze);
forward tazetimer(i);
public stuntimer(taze)
{
	stunned[taze] = 0;
	TogglePlayerControllable(taze, 1);
	SendClientMessage(taze, COLOR_MSG, "You have recovered from the tazer-shock");
}
public tazetimer(i)
{
	tazetime[i] = 0;
}
stock ReturnPlayerName(ID)
{
	new name[25];
	GetPlayerName(ID, name, 25);
	return name;
}
OnePlayAnim(playerid,animlib[],animname[], Float:Speed2, looping, lockx, locky, lockz, lp)
{
    if (gPlayerUsingLoopingAnim[playerid] == 1)
    ApplyAnimation(playerid, animlib, animname, Speed2, looping, lockx, locky, lockz, lp);
    animation[playerid]++;
}

//-------------------------------------------------

LoopingAnim(playerid,animlib[],animname[], Float:Speed2, looping, lockx, locky, lockz, lp)
{
    gPlayerUsingLoopingAnim[playerid] = 1;
    ApplyAnimation(playerid, animlib, animname, Speed2, looping, lockx, locky, lockz, lp);
    animation[playerid]++;
}
dcmd_lottohelp(playerid,params[])
{
	#pragma unused params
	SendClientMessage(playerid,yellow,"Lotto help: /buyticket /mylotto /lottotest");
	return 1;
}

dcmd_buyticket(playerid,params[])
{
	#pragma unused params
	if(HaveTicket[playerid] == true) return SendClientMessage(playerid, red, "You already have a Lotto ticket (6/49) .");
	if(GetPlayerMoney(playerid) < 1000) return SendClientMessage(playerid, red, "Tickets Lotto 6/49 cost $ 1,000.");
	GivePlayerMoney(playerid, -1000);
	HaveTicket[playerid] = true;
	GepiLottoSzamok(playerid);
	format(output2, sizeof(output2), "Your Lotto numbers are: %d, %d, %d, %d, %d, %d", NyeroSzamok[0][playerid], NyeroSzamok[1][playerid], NyeroSzamok[2][playerid], NyeroSzamok[3][playerid], NyeroSzamok[4][playerid], NyeroSzamok[5][playerid]);
	SendClientMessage(playerid, yellow, output2);
	return 1;
}

dcmd_mylotto(playerid,params[])
{
	#pragma unused params
	if(HaveTicket[playerid] == false) return SendClientMessage(playerid, red, "Do not have a ticket lotto 6/49. Use / buyticket");
	format(output2, sizeof(output2), "Your Lotto numbers are: %d, %d, %d, %d, %d, %d", NyeroSzamok[0][playerid], NyeroSzamok[1][playerid], NyeroSzamok[2][playerid], NyeroSzamok[3][playerid], NyeroSzamok[4][playerid], NyeroSzamok[5][playerid]);
	SendClientMessage(playerid, yellow, output2);
	return 1;
}

dcmd_lottotest(playerid,params[])
{
	#pragma unused params
	if(IsPlayerAdmin(playerid))
	{
		Sorsolas();
	} else SendClientMessage(playerid,red,"You are not the main admin (RCON ADMIN)!");
	return 1;
}

forward Sorsolas();
public Sorsolas()
{
	NEXT:
	for(new f = 0; f < 6; f++) KisorsoltSzamok[f] = random(49)+1; // random number 1,2,3........44,45
	for(new f = 0; f < 5; f++)
	{
		for(new c = f+1; c < 6; c++)
		{
			if(KisorsoltSzamok[f] == KisorsoltSzamok[c])
			{
			    goto NEXT;
			}
		}
	}

	new Talalat[ALTERNATIVE_MAX_PLAYERS];
	for(new p = 0; p < ALTERNATIVE_MAX_PLAYERS; p++) if(IsPlayerConnected(p))
	{
		if(HaveTicket[p] == true)
		{
			for(new f = 0; f < 6; f++) for(new c = 0; c < 6; c++) { if(NyeroSzamok[f][p] == KisorsoltSzamok[c]) Talalat[p]++;} // Egyez�s keres�s dupla ciklus seg�ts�g�vel, Egyez�sn�l: Talalat[playerid] v�ltoz� �rt�k�nek n�vel�se.
			SendClientMessage(p, red, " ============ Lotto 6/49 ============");
			// Your Lotto 6/49 numbers:
			format(output2, sizeof(output2), "Your Lotto numbers are: %d, %d, %d, %d, %d, %d", NyeroSzamok[0][p], NyeroSzamok[1][p], NyeroSzamok[2][p], NyeroSzamok[3][p], NyeroSzamok[4][p], NyeroSzamok[5][p]);
			SendClientMessage(p, yellow, output2);
			// The winning Lotto 6/49 numbers:
			format(output2, sizeof(output2), "Winning Numbers: %d, %d, %d, %d, %d, %d", KisorsoltSzamok[0], KisorsoltSzamok[1], KisorsoltSzamok[2], KisorsoltSzamok[3], KisorsoltSzamok[4], KisorsoltSzamok[5]);
			SendClientMessage(p, grgreen, output2);
			if(Talalat[p] == 0)   SendClientMessage(p, grgreen, "You have 0 correct numbers. Receive: $ 0");
			if(Talalat[p] == 1) { SendClientMessage(p, grgreen, "You have 1 correct numbers. Receive: $500 +1 score"); 		GivePlayerMoney(p, 500); SetPlayerScore(p,GetPlayerScore(p)+1); }
			if(Talalat[p] == 2) { SendClientMessage(p, grgreen, "You have 2 correct numbers. Receive: $4000 +3 score"); 	GivePlayerMoney(p, 4000); SetPlayerScore(p,GetPlayerScore(p)+3); }
			if(Talalat[p] == 3) { SendClientMessage(p, grgreen, "You have 3 correct numbers. Receive: $9300 +6 score"); 	GivePlayerMoney(p, 9300); SetPlayerScore(p,GetPlayerScore(p)+6); }
			if(Talalat[p] == 4) { SendClientMessage(p, grgreen, "You have 4 correct numbers. Receive: $27300 +9score");	GivePlayerMoney(p, 27300); SetPlayerScore(p,GetPlayerScore(p)+9); }
			if(Talalat[p] == 5) { SendClientMessage(p, grgreen, "You have 5 correct numbers. Receive: $95128 +10 score");	GivePlayerMoney(p, 95128); SetPlayerScore(p,GetPlayerScore(p)+10); }
			if(Talalat[p] == 6) {
				SendClientMessage(p,red, "You have 5 correct numbers. Receive: $122000 si +11 score");
				GivePlayerMoney(p, 122000);
				SetPlayerScore(p,GetPlayerScore(p)+11); // Please players unban.// K�rem a j�t�kos unbannol�s�t. Erre az es�ly "1" a "10.068.347.520" :D
			}
			SendClientMessage(p, red, " ================================");
			HaveTicket[p] = false;
		}
	}
	return 1;
}

GepiLottoSzamok(playerid)  // v�letlenszer�en megad lott�sz�mokat
{
	START:
	for(new p = 0; p < 6; p++) { NyeroSzamok[p][playerid] = random(49)+1; } 		// Rand sz�m sorsol�s  rand 0-44-ig +1 = 1-45-ig :)
//	for(new null = 0; null < 5; null++) { if(NyeroSzamok[null][playerid] == 0) return SetTimerEx("GepiLottoSzamok", 50, 0, "i", playerid); }
	// Azonoss�g keres�s egyez�s eset�n visszat�r�s ism�tl�sre.
	for(new f = 0; f < 5; f++)
	{
		for(new c = f+1; c < 6; c++)
		{
			if(NyeroSzamok[f][playerid] == NyeroSzamok[c][playerid])
			{
				goto START; // Teszteltem 1/ms ism�tl�ssel a legnagyobb visszaugr�s sz�ma random 45-n�l max 7-es �rt�k volt, nem kiz�rt enn�l nagyobb se.
			}
		}
	}
}

forward LottoHirdetes();
public LottoHirdetes()
{
	SendClientMessageToAll(green,"Want to play the lotto? Write /buyticket to buy a ticket. For help type /lottohelp");
}
public Speedometer(playerid)
{
	new State = GetPlayerState(playerid);
	if(Spawned[playerid] == 1)
	{
	if(State == PLAYER_STATE_DRIVER && IsPlayerInAnyVehicle(playerid))
 	{
  		if(Speed[playerid][ShowSpeed] == 1)
    	{
	   		#define MULTIPLY_SPEED  4
	   		new vehicleid = GetPlayerVehicleID(playerid);
			new VehicleModel = GetVehicleModel(vehicleid);

			new Float:x, Float:y, Float:z, Float:health, string[256], string2[255];
			GetPlayerPos(playerid, x, y, z); GetVehicleHealth(vehicleid, health);
			new Float:Dis = floatsqroot(floatpower(floatabs(floatsub(Speed[playerid][OldCoordsX],x)),2) + floatpower(floatabs(floatsub(Speed[playerid][OldCoordsY],y)),2));

			if(Vehicle[vehicleid][Fuel] <= 0){ RemovePlayerFromVehicle(playerid); SendClientMessage(playerid, COLOR_YELLOW, "[FUEL]: There is no fuel in the vehicle."); }
			if(VehicleModel==509||VehicleModel==481||VehicleModel==510) { SetVehicleHealth(GetPlayerVehicleID(playerid), 1000); Vehicle[vehicleid][Fuel] = 100; }
			if(VehicleModel==520||VehicleModel==476||VehicleModel==593||VehicleModel==553||VehicleModel==513||VehicleModel==512||VehicleModel==577||VehicleModel==592||VehicleModel==511||VehicleModel==539||VehicleModel==464||VehicleModel==519) { Vehicle[vehicleid][Fuel] = 100; }
			new speed = (floatround(Dis)*MULTIPLY_SPEED);

			new Sspeed[15];

			if( speed == 0) {
		 		format(Sspeed,sizeof(Sspeed),"~G~%dm/h",(floatround(Dis)*MULTIPLY_SPEED));
	    	} else if( speed >= 1 && speed <= 65 ){
		      	format(Sspeed,sizeof(Sspeed),"~G~%dm/h",(floatround(Dis)*MULTIPLY_SPEED));
			   	Vehicle[vehicleid][Fuel] -= 0.01;
	    	} else if( speed >= 66 && speed <= 120 ){
			   	format(Sspeed,sizeof(Sspeed),"~Y~%dm/h",(floatround(Dis)*MULTIPLY_SPEED));
			   	Vehicle[vehicleid][Fuel] -= 0.02;
	    	} else {
		  		format(Sspeed,sizeof(Sspeed),"~R~%dm/h",(floatround(Dis)*MULTIPLY_SPEED));
		      	Vehicle[vehicleid][Fuel] -= 0.03;
		    }
		    TextDrawHideForPlayer(playerid, BOX2);
		    TextDrawHideForPlayer(playerid, Speed[playerid][Speedom]);
		    TextDrawHideForPlayer(playerid, Speed[playerid][Speedom2]);
		    TextDrawShowForPlayer(playerid, Speed[playerid][Speedom2]);
            TextDrawShowForPlayer(playerid, Speed[playerid][Speedom]);
			format(string,sizeof(string),"~w~LoLocation: %s",ReturnPlayerZone(playerid), Vehicle[vehicleid][Fuel]);
			TextDrawSetString(Speed[playerid][Speedom], string);
            format(string2,sizeof(string2),"                                                                                  Fuel: ~W~%.1f",Vehicle[vehicleid][Fuel]);
			TextDrawSetString(Speed[playerid][Speedom2], string2);
			Speed[playerid][OldCoordsX] = x; Speed[playerid][OldCoordsY]  = y;
            TextDrawShowForPlayer(playerid, BOX2);
		}
		} else
 	    {
            new string[250];
		    TextDrawShowForPlayer(playerid, Speed[playerid][Speedom]);
		    format(string,sizeof(string),"~w~LoLocation: %s" ,ReturnPlayerZone(playerid));
			TextDrawSetString(Speed[playerid][Speedom], string);
		 }
	}
	return true;
}

stock Random(min, max)
{
    new a = random(max - min) + min;
    return a;
}

dcmd_refuel(playerid,params[]){
	#pragma unused params
	if(IsPlayerConnected(playerid) && IsPlayerInAnyVehicle(playerid)){
		if(IsAtFuelStation(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			new vehicleid = GetPlayerVehicleID(playerid);
			if(Speed[playerid][Refueling] == 0){
				if(GetVehicleModel(vehicleid) == 481 || GetVehicleModel(vehicleid) == 509 || GetVehicleModel(vehicleid) == 510) return SendClientMessage(playerid,COLOR_YELLOW,".:: [ERROR]: This vehicle does not need fuel :.");
				if(Vehicle[vehicleid][Fuel] >= 100){
					SendClientMessage(playerid,COLOR_YELLOW,".:: [FUEL]: Your gas tank is already full.");
				} else {
    				Vehicle[GetPlayerVehicleID(playerid)][OldFuel] = 0; Speed[playerid][Refueling] = 1;
					Speed[playerid][ReFuelTimer] = SetTimerEx("ReFill", 1000, true, "i", playerid); }
			} else { SendClientMessage(playerid,COLOR_YELLOW,".:: [FUEL]: You are allready refueling your car."); }
		} else { SendClientMessage(playerid,COLOR_YELLOW,".:: [FUEL]: You must be at a gas station to refuel"); } }
	return true;
}

///////////////////////////
//    Fuel Functions
//////////////////////////

public ReFill(playerid)
{
 	new Float:x, Float:y, Float:z;
	if(GetPlayerPos(playerid, x, y, z) != IsAtFuelStation(playerid) || Vehicle[GetPlayerVehicleID(playerid)][Fuel] >= 100){
		StopRefueling(playerid);
	 } else { Vehicle[GetPlayerVehicleID(playerid)][Fuel] ++; Vehicle[GetPlayerVehicleID(playerid)][OldFuel] ++; }
	return true;
}

stock StopRefueling(playerid)
{
	GivePlayerMoney(playerid, -Vehicle[GetPlayerVehicleID(playerid)][OldFuel]);
	SendFormattedMessage(playerid, COLOR_YELLOW,".:: [FUEL]: Your vehicle has been refueled for $%d.", Vehicle[GetPlayerVehicleID(playerid)][OldFuel]);
	Speed[playerid][Refueling] = 0; KillTimer(Speed[playerid][ReFuelTimer]);
	return true;
}

public IsAtFuelStation(playerid)
{
	if(PlayerToPoint(10,playerid,1595.5406, 2198.0520, 10.3863) || PlayerToPoint(10,playerid,2202.0649, 2472.6697, 10.5677) ||
	PlayerToPoint(10,playerid,2115.1929, 919.9908, 10.5266) || PlayerToPoint(10,playerid,2640.7209, 1105.9565, 10.5274) ||
	PlayerToPoint(10,playerid,608.5971, 1699.6238, 6.9922) || PlayerToPoint(10,playerid,618.4878, 1684.5792, 6.9922) ||
	PlayerToPoint(10,playerid,2146.3467, 2748.2893, 10.5245) || PlayerToPoint(10,playerid,-1679.4595, 412.5129, 6.9973) ||
	PlayerToPoint(10,playerid,-1327.5607, 2677.4316, 49.8093) || PlayerToPoint(10,playerid,-1470.0050, 1863.2375, 32.3521) ||
	PlayerToPoint(10,playerid,-2409.2200, 976.2798, 45.2969) || PlayerToPoint(10,playerid,-2244.1396, -2560.5833, 31.9219) ||
	PlayerToPoint(10,playerid,-1606.0544, -2714.3083, 48.5335) || PlayerToPoint(10,playerid,1937.4293, -1773.1865, 13.3828) ||
	PlayerToPoint(10,playerid,-91.3854, -1169.9175, 2.4213) || PlayerToPoint(10,playerid,1383.4221, 462.5385, 20.1506) ||
	PlayerToPoint(10,playerid,660.4590, -565.0394, 16.3359) || PlayerToPoint(10,playerid,1381.7206, 459.1907, 20.3452) ||
	PlayerToPoint(10,playerid,-1605.7156, -2714.4573, 48.5335))
	{ return true; }
	return false;
}

///////////////////////////
//    Zone Functions
//////////////////////////

stock IsPlayerInZone(playerid, zoneid) {
	if(zoneid == -1) return false;
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	if(x >= zones[zoneid][zone_minx] && x < zones[zoneid][zone_maxx] && y >= zones[zoneid][zone_miny] && y < zones[zoneid][zone_maxy] && z >= zones[zoneid][zone_minz] && z < zones[zoneid][zone_maxz] && z < 900.0) return true;
	return false;
}

stock ReturnPlayerZone(playerid)
{
	new playerzone[256] = "Unknown";
	for(new j; j < sizeof(zones); j++) {
		if(IsPlayerInZone(playerid,j)) {
			memcpy(playerzone, zones[j][zone_name], 0, 108);
			break;
		}
	}
    return playerzone;
}

stock GetPlayerZoneID(playerid)
{
	for(new j; j < sizeof(zones); j++) {
		if(IsPlayerInZone(playerid, j)) return j;
		}
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    new file[256];
    new name[MAX_PLAYER_NAME];
    new Registre[250];
    GetPlayerName(playerid,name,MAX_PLAYER_NAME);
    if(dialogid == RegisterName)
    {
        if(!response) Kick(playerid);
        {
        if(strlen(inputtext) == 0) return ShowPlayerDialog(playerid,RegisterName,DIALOG_STYLE_INPUT,"Register","Invalid Password\nPlease enter an password!","Register","Ban");
	    format(file,sizeof(file),"%s.runix", name);
	    if(!fexist(file))
		{
			dini_Create(file);
			dini_IntSet(file, "Password", udb_hash(inputtext));
			dini_IntSet(file, "Money", 2500);
			dini_IntSet(file, "Score", 1);
			dini_IntSet(file, "Bank", 1000);
			dini_IntSet(file, "RobSkill", 1);
			dini_IntSet(file, "TerSkill", 1);
			dini_IntSet(file, "Admin", 0);
			dini_IntSet(file, "Warnings", 0);
			dini_IntSet(file, "WantedLevel", 0);
			dini_IntSet(file, "Jail", 0);
			dini_IntSet(file, "RentalOwner", 0);
			dini_IntSet(file, "Drugs", 0);
			dini_IntSet(file, "C4", 0);
			dini_IntSet(file, "Skin", -1);
            format(Registre,sizeof(Registre),"Thanks for registering!\nYou may now login.",name);
            ShowPlayerDialog(playerid,LoginName,DIALOG_STYLE_INPUT,"Login",Registre,"Login","Ban");
			GameTextForPlayer(playerid, "~r~Registered!", 3000, 1);
		}
		}
    }
    if(dialogid == LoginName)
    {
        if(!response) Kick(playerid);
        {
        GetPlayerName(playerid,name,MAX_PLAYER_NAME);
        if(strlen(inputtext) == 0) return ShowPlayerDialog(playerid,LoginName,DIALOG_STYLE_INPUT,"Login","Invalit Password!\nPlease enter an password","Login","Ban");
	    format(file,sizeof(file),"%s.runix", name);
	  	if(udb_hash(inputtext) != dini_Int(file, "Password")) return ShowPlayerDialog(playerid,LoginName,DIALOG_STYLE_INPUT,"Login","Wrong Password!\nPlease enter an password","Login","Ban");
		else
		{
    	IsPlayerLogged[playerid] = 1;
 	    SetPlayerMoney(playerid, dini_Int(file, "Money"));
		SetPlayerScore(playerid, dini_Int(file, "Score"));
		AccountInfo[playerid][aLevel] = dini_Int(file, "Admin");
		PlayerSkin[playerid] = dini_Int(file,"Skin");
		SetPlayerWantedLevel(playerid, dini_Int(file, "WantedLevel"));
		SendClientMessage(playerid, GREY, "You are now logged in. Your status will be saved on your logout.");
		GameTextForPlayer(playerid, "~r~Logged In!", 3000, 1);
		}
		}
    }
    return 0;
}

dcmd_report(playerid, params[])
{
	new ID, reason[100];
	if(sscanf(params, "is", ID, reason)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /report [id] [reason]");
	else
	{
	    new string[256], name[60], name2[60];
	    GetPlayerName(playerid, name, 60);
	    GetPlayerName(ID, name2, 60);
	    format(string, 256, "%s[%d] reported %s[%d] (Reason: %s)", name, playerid, name2, ID, reason);
	    for(new i=0;i<MAX_PLAYERS;i++)
	    {
	        if(IsPlayerConnected(i))
	        {
	            if(AccountInfo[i][aLevel] > 0)
	            {
	                SendClientMessage(i, COLOR_WHITE, string);
				}
			}
		}
	}
	return 1;
}


dcmd_setlevel(playerid, params[])
{
	if(IsPlayerAdmin(playerid))
	{
		new ID, level;
		if(sscanf(params, "ii", ID, level)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /setlevel [id] [level]");
		else if(ID == INVALID_PLAYER_ID) SendClientMessage(playerid, COLOR_RED, "Player is not connected!");
		else
		{
		    AccountInfo[ID][aLevel] = level;
		    SendClientMessage(ID, COLOR_GREEN, "The RCON Admin promoted you to an admin!");
		}
	}
	return 1;
}

dcmd_admins(playerid, params[])
{
	SendClientMessage(playerid, COLOR_YELLOW, "Online admins:");
	new chose;
	for(new i=0;i<MAX_PLAYERS;i++)
	{
	    if(AccountInfo[i][aLevel] > 0)
	    {
	        new name[60], string[100];
	        GetPlayerName(i, name, 60);
	        format(string, 100, "%s[%i] Level: %i", name, i, AccountInfo[i][aLevel]);
	        SendClientMessage(playerid, COLOR_WHITE, string);
	        chose = 1;
		}
	}
	if(chose == 0)
	{
		SendClientMessage(playerid, COLOR_WHITE, "No administrators online!");
	}
	return 1;
	#pragma unused params
}

dcmd_kick(playerid, params[])
{
	if(AccountInfo[playerid][aLevel] < 2) SendClientMessage(playerid, COLOR_RED, "AdminLevel 2 needed for this command!");
	else
	{
	    new ID, reason[100];
	    if(sscanf(params, "is", ID, reason)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /kick [id] [reason]");
	    else if(IsPlayerConnected(ID) == 0) SendClientMessage(playerid, COLOR_RED, "Player is not connected");
	    else
	    {
	        new string[256], name[60], name2[60];
	        GetPlayerName(playerid, name, 60);
	        GetPlayerName(ID, name2, 60);
	        format(string, 256, "Administrator %s[%d] has kicked %s[%d]. (Reason: %s)", name, playerid, name2, ID, reason);
	        SendClientMessageToAll(COLOR_YELLOW, string);
	        Kick(ID);
		}
	}
	return 1;
}

dcmd_ban(playerid, params[])
{
	if(AccountInfo[playerid][aLevel] < 2) SendClientMessage(playerid, COLOR_RED, "AdminLevel 2 needed for this command!");
	else
	{
	    new ID, reason[100];
	    if(sscanf(params, "is", ID, reason)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /ban [id] [reason]");
	    else if(IsPlayerConnected(ID) == 0) SendClientMessage(playerid, COLOR_RED, "Player is not connected");
	    else
	    {
	        new string[256], name[60], name2[60];
	        GetPlayerName(playerid, name, 60);
	        GetPlayerName(ID, name2, 60);
	        format(string, 256, "Administrator %s[%d] has banned %s[%d]. (Reason: %s)", name, playerid, name2, ID, reason);
	        SendClientMessageToAll(COLOR_YELLOW, string);
	        Ban(ID);
		}
	}
	return 1;
}

dcmd_car(playerid,params[]) {
    if(AccountInfo[playerid][aLevel] < 2) SendClientMessage(playerid, COLOR_RED, "AdminLevel 2 needed for this command!");
    else
    {
	    new tmp[256], tmp2[256], tmp3[256], Index; tmp = strtok(params,Index), tmp2 = strtok(params,Index); tmp3 = strtok(params,Index);
	    if(!strlen(tmp)) return SendClientMessage(playerid, red, "USAGE: /car [Modelid] [colour1] [colour2]");
		new car, colour1, colour2;
		car = strval(tmp);
		if(car < 400 || car > 611) SendClientMessage(playerid, red, "ERROR: Invalid Vehicle Model");
		if(!strlen(tmp2)) colour1 = random(126); else colour1 = strval(tmp2);
		if(!strlen(tmp3)) colour2 = random(126); else colour2 = strval(tmp3);
		if(IcmdCar[playerid][CarcmdI] != -1) ExkillCar(IcmdCar[playerid][CarcmdI]);
		new VehiclulR,Float:X,Float:Y,Float:Z, Float:Angle,int1;
		GetPlayerPos(playerid, X,Y,Z);	GetPlayerFacingAngle(playerid,Angle);
		int1 = GetPlayerInterior(playerid);
		VehiclulR = AddStaticVehicleEx(car, X+3,Y,Z, Angle, colour1, colour2, 60);
		PutPlayerInVehicle(playerid, VehiclulR, 0);
		LinkVehicleToInterior(VehiclulR,int1);
		IcmdCar[playerid][CarcmdI] = VehiclulR;
		}
	return 1;
}


dcmd_giveweapon(playerid,params[]) {
	if(AccountInfo[playerid][aLevel] < 2) SendClientMessage(playerid, COLOR_RED, "AdminLevel 2 needed for this command!");
    else
    {
	    new tmp[256], tmp2[256], tmp3[256], Index; tmp = strtok(params,Index), tmp2 = strtok(params,Index), tmp3 = strtok(params,Index);
	    if(!strlen(tmp) || !strlen(tmp2)) return SendClientMessage(playerid, red, "USAGE: /giveweapon [playerid] [weapon id/weapon name] [ammo]");
		new player1 = strval(tmp), weap, ammo, string[128];
		if(!strlen(tmp3) || !IsNumeric(tmp3) || strval(tmp3) <= 0 || strval(tmp3) > 99999) ammo = 500; else ammo = strval(tmp3);
		weap = strval(tmp2);
        if(IsPlayerConnected(player1) && player1 != INVALID_PLAYER_ID) {
        	if(!IsValidWeapon(weap)) return SendClientMessage(playerid,red,"ERROR: Invalid weapon ID");
			format(string, sizeof(string), "You have given \"%s\" an weapon", PlayerName2(player1)); SendClientMessage(playerid,blue,string);
			if(player1 != playerid) { format(string,sizeof(string),"Administrator \"%s\" has given an weapon", PlayerName2(playerid)); SendClientMessage(player1,blue,string); }
   			return GivePlayerWeapon(player1, weap, ammo);
	    } else return SendClientMessage(playerid,red,"ERROR: Player is not connected");
	}
	return 1;
}

dcmd_freeze(playerid, params[])
{
	if(AccountInfo[playerid][aLevel] < 2) SendClientMessage(playerid, COLOR_RED, "AdminLevel 2 needed for this command!");
	else
	{
	    new ID, reason[100];
	    if(sscanf(params, "is", ID, reason)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /freeze [id] [reason]");
	    else if(IsPlayerConnected(ID) == 0) SendClientMessage(playerid, COLOR_RED, "Player is not connected");
	    else
	    {
	        new string[256], name[60], name2[60];
	        GetPlayerName(playerid, name, 60);
	        GetPlayerName(ID, name2, 60);
	        format(string, 256, "Administrator %s[%d] has frozen %s[%d]. (Reason: %s)", name, playerid, name2, ID, reason);
	        SendClientMessageToAll(COLOR_YELLOW, string);
	        TogglePlayerControllable(ID, 0);
 		}
	}
	return 1;
}

dcmd_unfreeze(playerid, params[])
{
	if(AccountInfo[playerid][aLevel] < 2) SendClientMessage(playerid, COLOR_RED, "AdminLevel 2 needed for this command!");
	else
	{
	    new ID;
	    if(sscanf(params, "i", ID)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /freeze [id]");
	    else if(IsPlayerConnected(ID) == 0) SendClientMessage(playerid, COLOR_RED, "Player is not connected");
	    else
	    {
	        TogglePlayerControllable(ID, 1);
 		}
	}
	return 1;
}

dcmd_akill(playerid, params[])
{
	if(AccountInfo[playerid][aLevel] < 2) SendClientMessage(playerid, COLOR_RED, "AdminLevel 2 needed for this command!");
	else
	{
	    new ID, reason[100];
	    if(sscanf(params, "is", ID, reason)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /akill [id] [reason]");
	    else if(IsPlayerConnected(ID) == 0) SendClientMessage(playerid, COLOR_RED, "Player is not connected");
	    else
	    {
	        new string[256], name[60], name2[60];
	        GetPlayerName(playerid, name, 60);
	        GetPlayerName(ID, name2, 60);
	        format(string, 256, "Administrator %s[%d] has adminkilled %s[%d]. (Reason: %s)", name, playerid, name2, ID, reason);
	        SendClientMessageToAll(COLOR_YELLOW, string);
	        SetPlayerHealth(ID, 0);
		}
	}
	return 1;
}

dcmd_mute(playerid, params[])
{
	if(AccountInfo[playerid][aLevel] < 1) SendClientMessage(playerid, COLOR_RED, "AdminLevel 1 needed for this command!");
	else
	{
 		new ID, reason[100];
	    if(sscanf(params, "is", ID, reason)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /mute [id] [reason]");
	    else if(IsPlayerConnected(ID) == 0) SendClientMessage(playerid, COLOR_RED, "Player is not connected");
	    else
	    {
	        new string[256], name[60], name2[60];
	        GetPlayerName(playerid, name, 60);
	        GetPlayerName(ID, name2, 60);
	        format(string, 256, "Administrator %s[%d] has muted %s[%d]. (Reason: %s)", name, playerid, name2, ID, reason);
	        SendClientMessageToAll(COLOR_YELLOW, string);
	        Muted[ID] = 1;
		}
	}
	return 1;
}

dcmd_unmute(playerid, params[])
{
	if(AccountInfo[playerid][aLevel] < 1) SendClientMessage(playerid, COLOR_RED, "AdminLevel 1 needed for this command!");
	else
	{
 		new ID;
	    if(sscanf(params, "i", ID)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /unmute [id]");
	    else if(IsPlayerConnected(ID) == 0) SendClientMessage(playerid, COLOR_RED, "Player is not connected");
	    else
	    {
	        new string[256], name[60], name2[60];
	        GetPlayerName(playerid, name, 60);
	        GetPlayerName(ID, name2, 60);
	        format(string, 256, "Administrator %s[%d] has unmuted %s[%d].", name, playerid, name2, ID);
	        SendClientMessageToAll(COLOR_YELLOW, string);
	        Muted[playerid] = 0;
		}
	}
	return 1;
}

dcmd_spec(playerid, params[])
{
	if(AccountInfo[playerid][aLevel] < 1) SendClientMessage(playerid, COLOR_RED, "AdminLevel 1 needed for this command!");
	else
	{
	    new ID;
	    if(sscanf(params, "i", ID)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /spec [id]");
	    else if(IsPlayerConnected(ID) == 0) SendClientMessage(playerid, COLOR_RED, "Player is not connected");
	    else
	    {
	        TogglePlayerSpectating(playerid, 1);
	        PlayerSpectatePlayer(playerid, ID, SPECTATE_MODE_NORMAL);
		}
	}
	return 1;
}

dcmd_specoff(playerid, params[])
{
	if(AccountInfo[playerid][aLevel] < 1) SendClientMessage(playerid, COLOR_RED, "AdminLevel 1 needed for this command!");
	else
	{
	    TogglePlayerSpectating(playerid, 0);
	    SpawnPlayer(playerid);
	}
	return 1;
	#pragma unused params
}

dcmd_slap(playerid, params[])
{
	if(AccountInfo[playerid][aLevel] < 2) SendClientMessage(playerid, COLOR_RED, "AdminLevel 2 needed for this command!");
	else
	{
	    new ID;
	    if(sscanf(params, "i", ID)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /slap [id]");
	    else if(IsPlayerConnected(ID) == 0) SendClientMessage(playerid, COLOR_RED, "Player is not connected");
	    else
	    {
	        new Float:x, Float:y, Float:z, name[60], string[100];
	        GetPlayerPos(ID, x, y, z);
	        SetPlayerPos(ID, x, y, z+30);
	        format(string, 100, "You have slapped %s[%d]", name, ID);
	        SendClientMessage(playerid, COLOR_YELLOW, string);
		}
	}
	return 1;
}

dcmd_jetpack(playerid,params[])
{
    if(AccountInfo[playerid][aLevel] < 4) SendClientMessage(playerid, COLOR_RED, "AdminLevel 4 needed for this command!");
	else
	{
	    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USEJETPACK);
	}
	return 1;
	#pragma unused params
}

dcmd_announce(playerid, params[])
{
    if(AccountInfo[playerid][aLevel] < 2) SendClientMessage(playerid, COLOR_RED, "AdminLevel 2 needed for this command!");
    else
	{
	    new string[256];
	    if(sscanf(params, "s", string)) SendClientMessage(playerid, COLOR_WHITE, "Usage: /announce [text]");
	    else
	    {
	        GameTextForAll(string, 3000, 3);
		}
	}
	return 1;
}

dcmd_setscore(playerid, params[])
{
	if(AccountInfo[playerid][aLevel] < 5) SendClientMessage(playerid, COLOR_RED, "AdminLevel 5 needed for this command!");
	else
	{
	    new ID, score;
	    if(sscanf(params, "ii", ID, score)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /setscore [id] [score]");
	    else if(IsPlayerConnected(ID) == 0) SendClientMessage(playerid, COLOR_RED, "Player is not connected!");
	    else
	    {
	        new name[60], string[100];
	        GetPlayerName(playerid, name, 60);
	        format(string, 100, "Administrator %s set your score to %d", name, score);
			SendClientMessage(ID, COLOR_YELLOW, string);
			GetPlayerName(ID, name, 60);
			format(string, 100, "You have set %s's score to %i", name, score);
			SendClientMessage(playerid, COLOR_YELLOW, string);
			SetPlayerScore(ID, score);
		}
	}
	return 1;
}

dcmd_agivemoney(playerid, params[])
{
	if(AccountInfo[playerid][aLevel] < 4) SendClientMessage(playerid, COLOR_RED, "AdminLevel 4 needed for this command!");
	else
	{
	    new ID, amount;
	    if(sscanf(params, "id", ID, amount)) SendClientMessage(playerid , COLOR_WHITE, "USAGE: /agivemoney [id] [amount]");
	    else if(IsPlayerConnected(ID) == 0) SendClientMessage(playerid, COLOR_RED, "Player is not connected!");
	    else
	    {
	        new string[100], name[60];
	        GetPlayerName(ID, name, 60);
	        format(string, 100, "You have given %s[%d] $%d", name, ID, amount);
	        SendClientMessage(playerid, COLOR_YELLOW, string);
	        GetPlayerName(playerid, name, 60);
	        format(string, 100, "Administrator %s[%d] has given you $%d", name, playerid, amount);
	        SendClientMessage(ID, COLOR_YELLOW, string);
	        GivePlayerMoney(ID, amount);
		}
	}
	return 1;
}

dcmd_goto(playerid, params[])
{
	if(AccountInfo[playerid][aLevel] < 3) SendClientMessage(playerid, COLOR_RED, "AdminLevel 3 needed for this command!");
	else
	{
	    new ID;
	    if(sscanf(params, "i", ID)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /goto [id]");
	    else if(IsPlayerConnected(ID) == 0) SendClientMessage(playerid, COLOR_RED, "Player is not connected!");
	    else
	    {
	        new Float:x, Float:y, Float:z;
	        GetPlayerPos(ID, x, y, z);
	        SetPlayerPos(playerid, x+1, y+1, z);
		}
	}
	return 1;
}

dcmd_gethere(playerid, params[])
{
	if(AccountInfo[playerid][aLevel] < 3) SendClientMessage(playerid, COLOR_RED, "AdminLevel 3 needed for this command!");
	else
	{
	    new ID;
	    if(sscanf(params, "i", ID)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /gethere [id]");
	    else if(IsPlayerConnected(ID) == 0) SendClientMessage(playerid, COLOR_RED, "Player is not connected!");
	    else
	    {
	        new Float:x, Float:y, Float:z;
	        GetPlayerPos(playerid, x, y, z);
	        SetPlayerPos(ID, x+1, y+1, z);
		}
	}
	return 1;
}

dcmd_i(playerid, params[])
{
	    new ID,string[256],string2[256],name[60];
	    if(sscanf(params, "i", ID)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /i [id]");
	    else if(IsPlayerConnected(ID) == 0) SendClientMessage(playerid, COLOR_RED, "Player is not connected!");
	    else
	    {
		 HideDraw(playerid);
		 GetPlayerName(ID, name, 60);
		 new carid = GetPlayerVehicleID(ID);
		 TextDrawShowForPlayer(playerid,text44);
		 TextDrawShowForPlayer(playerid,text45);
		 TextDrawShowForPlayer(playerid,PCBOX);
		 if(!IsPlayerInAnyVehicle(ID))
		 {
	     format(string, 256, "~y~Player Info: ~r~~h~%s[%d]~n~~n~~g~Location:~w~%s~n~~g~Money:~w~%d~n~~g~Wanted Level:~w~%d~n~~g~Drive:~w~none", name, ID, ReturnPlayerZone(ID),GetPlayerMoney(ID),GetPlayerWantedLevel(ID));
		 }else
		 if(IsPlayerInAnyVehicle(ID))
		 {
		 format(string, 256, "~y~Player Info: ~r~~h~%s[%d]~n~~n~~g~Location:~w~%s~n~~g~Money:~w~%d~n~~g~Wanted Level:~w~%d~n~~g~Drive:~w~%s", name, ID, ReturnPlayerZone(ID),GetPlayerMoney(ID),GetPlayerWantedLevel(ID),VehicleNames[GetVehicleModel(carid)-400]);
		 }
		 TextDrawSetString(text44,string);
		 format(string2,256,"~n~~n~~n~~n~~n~~n~~n~~w~Type ~r~~h~LMB ~w~For Hide Thes~n~~w~Boxes!");
		 TextDrawSetString(text45,string2);
		}
	    return 1;
}

dcmd_ahelp(playerid, params[])
{
	SendClientMessage(playerid, COLOR_WHITE, "/kick /ban /freeze /unfreeze /slap /goto /gethere /jetpack");
	SendClientMessage(playerid, COLOR_WHITE, "/agivemoney /setscore /announce /spec /specoff /mute");
	SendClientMessage(playerid, COLOR_WHITE, "/unmute /akill /sethp /giveweapon /car");
	return 1;
	#pragma unused params
}

dcmd_sethp(playerid, params[])
{
    if(AccountInfo[playerid][aLevel] < 2) SendClientMessage(playerid, COLOR_RED, "AdminLevel 2 needed for this command!");
    else
    {
        new ID, amount;
        if(sscanf(params, "ii", ID, amount)) SendClientMessage(playerid, COLOR_WHITE, "USAGE: /sethp [id] [amount]");
        else
        {
            new name[60], string[256];
            GetPlayerName(ID, name, 60);
            format(string, 256, "You have set %s[%d]'s HP to %d", name, ID, amount);
            SendClientMessage(playerid, COLOR_YELLOW, string);
            SetPlayerHealth(playerid, amount);
		}
	}
	return 1;
}
public GPSUpdate(playerid,playerid2)
{
  if(IsPlayerConnected(playerid2)){
  new Float:Distnace;
  Distnace = GetDistanceBetweenPlayers(playerid,playerid2);
  new Float:X,Float:Y,Float:Z;
  GetPlayerPos(playerid2,X,Y,Z);
  DisablePlayerRaceCheckpoint(playerid);
  SetPlayerRaceCheckpoint(playerid,0,X,Y,Z,0,0,0,0.1);
  new string[128];
  format(string, sizeof(string), "~n~~n~~n~~n~~n~~n~~n~~p~Distance: ~r~%.1f ~y~m",Distnace);
  GameTextForPlayer(playerid, string, 1100, 5);
  if(Distnace <= 4.0) {
  DisablePlayerRaceCheckpoint(playerid);
  KillTimer(GPSTimer[playerid]);
  HaveGPS[playerid] = false;
  GPSTimer[playerid] = 0;
  }
  }else{
  DisablePlayerRaceCheckpoint(playerid);
  KillTimer(GPSTimer[playerid]);
  HaveGPS[playerid] = false;
  GPSTimer[playerid] = 0;
  SendClientMessage(playerid, 0xFF0000AA, "SERVER: Player Joints.");
  }
  return 1;
}
forward Wanted(playerid);
public Wanted(playerid)
{
if(GetPlayerWantedLevel(playerid) > 0)
{
SetPlayerWantedLevel(playerid,-1);
}
}
public BlowCar(vehicleid)
{
	new Float:x, Float:y, Float:z;
	GetVehiclePos(vehicleid, x, y, z);
	CreateExplosion(x, y, z, 6, 5);
	SetVehicleHealth(vehicleid,0.0);
}

public BlowPlayers()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerSpawned(i))
		{
			if(BlowTime[i] > 1)
			{
				BlowTime[i]--;
				new string[250], timeleft = (BlowTime[i]);
				format(string, sizeof(string), "~r~C4~w~:~n~~g~%d ~w~seconds to blow", timeleft);
				GameTextForPlayer(i, string, 3000, 3);
			}
			if(BlowTime[i] == 1)
			{
				new Float:x, Float:y, Float:z;
	            GetPlayerPos(i, x, y, z);
				CreateExplosion(x, y, z, 6, 5);
				SetPlayerHealth(i, 0);
				BlowTime[i] = 0;
			}
		}
	}
}
stock IsValidWeapon(weaponid)
{
    if (weaponid > 0 && weaponid < 19 || weaponid > 21 && weaponid < 47) return 1;
    return 0;
}
stock PlayerName2(playerid) {
  new name[MAX_PLAYER_NAME];
  GetPlayerName(playerid, name, sizeof(name));
  return name;
}
forward UcideMasinileBoule(vehicleid);
public UcideMasinileBoule(vehicleid)
{
    for(new i=0;i<MAX_PLAYERS;i++) {
        new Float:X,Float:Y,Float:Z;
    	if(IsPlayerInVehicle(i, vehicleid)) {
    	    RemovePlayerFromVehicle(i);
    	    GetPlayerPos(i,X,Y,Z);
        	SetPlayerPos(i,X,Y+3,Z);
	    }
	    SetVehicleParamsForPlayer(vehicleid,i,0,1);
	}
    SetTimerEx("VehRes",1500,0,"i",vehicleid);
}

forward VehRes(vehicleid);
public VehRes(vehicleid)
{
    DestroyVehicle(vehicleid);
}

forward ExkillCar(vehicleid);
public ExkillCar(vehicleid)
{
    for(new i=0;i<MAX_PLAYERS;i++) {
        new Float:X,Float:Y,Float:Z;
    	if(IsPlayerInVehicle(i, vehicleid)) {
    	    RemovePlayerFromVehicle(i);
    	    GetPlayerPos(i,X,Y,Z);
        	SetPlayerPos(i,X,Y+3,Z);
	    }
	    SetVehicleParamsForPlayer(vehicleid,i,0,1);
	}
    DestroyVehicle(vehicleid);
}
dcmd_hit(playerid, params[])
{
	new amount, ID;
	if(sscanf(params, "dd", ID, amount))
	{
		SendClientMessage(playerid, COLOR_ERROR, "USAGE: /hit [ID] [amount]");
	}
	else if(amount > 0)
	{
		if(IsPlayerConnected(ID))
		{
		if(gTeam[playerid] != COP && gTeam[playerid] != SWAT && gTeam[playerid] != FBI && gTeam[playerid] != ARMY)
		{
			if(GetPlayerMoney(playerid) >= amount)
			{
				if(antispam[playerid] == 0)
				{
					hit[ID] = amount;
					hiter[ID] = playerid;
					new string[256];
					format(string, sizeof(string), "You have placed a hit on %s (%i) for $%i", ReturnPlayerName(ID), ID, amount);
					SendClientMessage(playerid, COLOR_MSG, string);
					format(string, sizeof(string), "%s (%i) has placed a hit on %s (%i) for $%i", ReturnPlayerName(playerid), playerid, ReturnPlayerName(ID), ID, amount);
					SendClientMessageToAll(COLOR_MSG, string);
					antispam[playerid] = 1;
					SetTimerEx("antispamtimer", ANTISPAM_TIME*1000, false, "d", playerid);
				}
				else
				{
					SendClientMessage(playerid, COLOR_ERROR, "Please wait before placing another hit!");
				}
			}
			else
			{
				SendClientMessage(playerid, COLOR_ERROR, "You do not have enough money!");
			}
		}
        else
		{
			SendClientMessage(playerid, COLOR_ERROR, "You team cannot hit an player!");
		}
		}
		else
		{
			SendClientMessage(playerid, COLOR_ERROR, "That player is not connected!");
		}
	}
	else
	{
		SendClientMessage(playerid, COLOR_ERROR, "Minimum amount to hit a person with is $1!");
	}
	return 1;
}
forward antispamtimer(id);

public antispamtimer(id)
{
	antispam[id] = 0;
}
//-------------------------------------------------
