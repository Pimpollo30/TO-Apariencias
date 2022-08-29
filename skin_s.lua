--executeSQLQuery("DROP TABLE CJCustom")
executeSQLQuery("CREATE TABLE IF NOT EXISTS CJCustom (Usuario TEXT, textureClothes TEXT, modelClothes TEXT, indexClothes INT)")

--executeSQLQuery("DROP TABLE RopasCJ")
executeSQLQuery("CREATE TABLE IF NOT EXISTS RopasCJ (Usuario TEXT, textureCJ TEXT, modelCJ TEXT)")

local blips = {
	{1456.77, -1138.02, 23.2872},
	{-1883.2, 865.473, 34.2601},
	{2572.07, 1904.83, 10.0231},
	{2090.58, 2224.2, 10.0579},
	{2244.47,-1665.36,14.4839},
	{-2375.32,910.293,44.4578},
	{1657.01,1733.33,10.0209},
	{2102.69,2257.49,10.0579},
	{461.158,-1499.98,30.1742},
	{-1694.76,951.599,24.2706},
	{2802.34,2430.6,10.061},
	{453.868,-1478.07,29.9609},
	{499.637,-1360.4,15.4261},
	{2825.74,2407.44,10.061},
	{2112.73, -1211.7, 22.9614},
	{2779.1201171875, 2453.5400390625, 10.0625},
	{2090.580078125, 2224.2001953125, 10.0234375},
	{-2491.9794921875, -29.1064453125, 25.765625},
}

for i,v in ipairs(blips) do
	createBlip(v[1],v[2],v[3],45, 0, 0, 0, 0, 0, 0, 250)
end


local sshops = {
	--//x,y,z,int,dim
	{218.4951171875, -9.0166015625, 1000.2109375,5,0},
	{204.431640625, -160.54296875, 999.5234375,14,0},
	{207.1015625, -130.109375, 1002.5078125,3,0},
	{161.5498046875, -85.349609375, 1000.8046875,10,0},
	{207.54296875, -102.5830078125, 1004.2578125,15,0},
	{207.1015625, -130.109375, 1002.5078125,3,1},
	{218.4951171875, -9.0166015625, 1000.2109375,5,2},
	{161.5498046875, -85.349609375, 1000.8046875,18,2},
	{207.54296875, -102.5830078125, 1004.2578125,15,3},
	{161.5498046875, -85.349609375, 1000.8046875,18,3},
	{207.54296875, -102.5830078125, 1004.2578125,15,2},
	{218.4951171875, -9.0166015625, 1000.2109375,5,1},
	{161.5498046875, -85.349609375, 1000.8046875,18,1},
	{207.54296875, -102.5830078125, 1004.2578125,15,1},
	{203.7685546875, -44.748046875, 1000.8046875,1,0},
	{203.7685546875, -44.748046875, 1000.8046875,1,2},
	{203.7685546875, -44.748046875, 1000.8046875,1,1},
}


function showSS(player)
	if (getElementType(player) == "player") and not ( isPedInVehicle( player ) ) then
		if not getElementData(player,"TOUtils.job") == "None" then
			exports["[TO]Notificaciones"]:sendMessage("Necesitas ser Desocupado para cambiar de Apariencia",player,255,255,0,17)
			return
		end
		intSS = getElementInterior(source)
		dimSS = getElementDimension(source)
		intP = getElementInterior(player)
		dimP = getElementDimension(player)
		if intP == intSS and dimP == dimSS then
			setElementData(player,"TOskin.use","yep")
			exports["[TO]Notificaciones"]:trashDo("Pulsa 'X' (Cambiar de Apariencia)",player,255,255,0,11)
		end
	end
end

function hideSS(player)
	if (getElementType(player) == "player") and not ( isPedInVehicle( player ) ) then
		setElementData(player,"TOskin.use","nop")
	end
end




for i,v in ipairs(sshops) do
	local marker = createMarker (v[1],v[2],v[3], "cylinder", 1.75, 255, 255, 0, 170 )
	setElementInterior ( marker, v[4] )
	setElementDimension ( marker, v[5] )
	addEventHandler ( "onMarkerHit", marker, showSS )
	addEventHandler ( "onMarkerLeave", marker, hideSS )
end


clothes = { 
	[0] = { 		
		[0] = {textVest = "player_torso", modVest = "torso"},
		[1] = {textVest = "vestblack", modVest = "vest"},
		[2] =  {textVest = "vest", modVest = "vest"},
		[3] =  {textVest = "tshirt2horiz", modVest = "tshirt"},
		[4] =  {textVest = "tshirtwhite", modVest = "tshirt"},
		[5] =  {textVest = "tshirtilovels", modVest = "tshirt"},
		[6] =  {textVest = "tshirtblunts", modVest = "tshirt"},
		[7] =  {textVest = "shirtbplaid", modVest = "shirtb"},
		[8] =  {textVest = "shirtbcheck", modVest = "shirtb"},
		[9] =  {textVest = "field", modVest = "field"},
		[10] =  {textVest = "tshirterisyell", modVest = "tshirt"},
		[11] =  {textVest = "tshirterisorn", modVest = "tshirt"},
		[12] =  {textVest = "trackytop2eris", modVest = "trackytop1"},
		[13] =  {textVest = "bbjackrim", modVest = "bbjack"},
		[14] =  {textVest = "bballjackrstar", modVest = "bbjack"},
		[15] =  {textVest = "baskballdrib", modVest = "baskball"},
		[16] =  {textVest = "baskballrim", modVest = "baskball"},
		[17] =  {textVest = "sixtyniners", modVest = "tshirt"},
		[18] =  {textVest = "bandits", modVest = "baseball"},
		[19] =  {textVest = "tshirtprored", modVest = "tshirt"},
		[20] =  {textVest = "tshirtproblk", modVest = "tshirt"},
		[21] =  {textVest = "trackytop1pro", modVest = "trackytop1"},
		[22] =  {textVest = "hockeytop", modVest = "sweat"},
		[23] =  {textVest = "bbjersey", modVest = "sleevt"},
		[24] =  {textVest = "shellsuit", modVest = "trackytop1"},
		[25] =  {textVest = "tshirtheatwht", modVest = "tshirt"},
		[26] =  {textVest = "tshirtbobomonk", modVest = "tshirt"},
		[27] =  {textVest = "tshirtbobored", modVest = "tshirt"},
		[28] =  {textVest = "tshirtbase5", modVest = "tshirt"},
		[29] =  {textVest = "tshirtsuburb", modVest = "tshirt"},
		[30] =  {textVest = "hoodyamerc", modVest = "hoodya"},
		[31] =  {textVest = "hoodyabase5", modVest = "hoodya"},
		[32] =  {textVest = "hoodyarockstar", modVest = "hoodya"},
		[33] =  {textVest = "wcoatblue", modVest = "wcoat"},
		[34] =  {textVest = "coach", modVest = "coach"},
		[35] =  {textVest = "coachsemi", modVest = "coach"},
		[36] =  {textVest = "sweatrstar", modVest = "sweat"},
		[37] =  {textVest = "hoodyAblue", modVest = "hoodyA"},
		[38] =  {textVest = "hoodyAblack", modVest = "hoodyA"},
		[39] =  {textVest = "hoodyAgreen", modVest = "hoodyA"},
		[40] =  {textVest = "sleevtbrown", modVest = "sleevt"},
		[41] =  {textVest = "shirtablue", modVest = "shirta"},
		[42] =  {textVest = "shirtayellow", modVest = "shirta"},
		[43] =  {textVest = "shirtagrey", modVest = "shirta"},
		[44] =  {textVest = "shirtbgang", modVest = "shirtb"},
		[45] =  {textVest = "tshirtzipcrm", modVest = "tshirt"},
		[46] =  {textVest = "tshirtzipgry", modVest = "tshirt"},
		[47] =  {textVest = "denimfade", modVest = "denim"},
		[48] =  {textVest = "bowling", modVest = "hawaii"},
		[49] =  {textVest = "hoodjackbeige", modVest = "hoodjack"},
		[50] =  {textVest = "baskballloc", modVest = "baskball"},
		[51] =  {textVest = "tshirtlocgrey", modVest = "tshirt"},
		[52] =  {textVest = "tshirtmaddgrey", modVest = "tshirt"},
		[53] =  {textVest = "tshirtmaddgrn", modVest = "tshirt"},
		[54] =  {textVest = "suit1grey", modVest = "suit1"},
		[55] =  {textVest = "suit1blk", modVest = "suit1"},
		[56] =  {textVest = "leather", modVest = "leather"},
		[57] =  {textVest = "painter", modVest = "painter"},
		[58] =  {textVest = "hawaiiwht", modVest = "hawaii"},
		[59] =  {textVest = "hawaiired", modVest = "hawaii"},
		[60] =  {textVest = "sportjack", modVest = "trackytop1"},
		[61] =  {textVest = "suit1red", modVest = "suit1"},
		[62] =  {textVest = "suit1blue", modVest = "suit1"},
		[63] =  {textVest = "suit1yellow", modVest = "suit1"},
		[64] =  {textVest = "suit2grn", modVest = "suit2"},
		[65] =  {textVest = "tuxedo", modVest = "suit2"},
		[66] =  {textVest = "suit1gang", modVest = "suit1"},
		[67] =  {textVest = "letter", modVest = "sleevt" }
	},
	
	[1] = {			
		[0] = {textVest = "player_face", modVest = "head"},
		[1] = {textVest = "hairblond", modVest = "head"},
		[2] = {textVest = "hairred", modVest = "head"},
		[3] = {textVest = "hairblue", modVest = "head"},
		[4] = {textVest = "hairgreen", modVest = "head"},
		[5] = {textVest = "hairpink", modVest = "head"},
		[6] = {textVest = "bald", modVest = "head"},
		[7] = {textVest = "baldbeard", modVest = "head"},
		[8] = {textVest = "baldtash", modVest = "head"},
		[9] = {textVest = "baldgoatee", modVest = "head"},
		[10] = {textVest = "highfade", modVest = "head"},
		[11] = {textVest = "highafro", modVest = "highafro"},
		[12] = {textVest = "wedge", modVest = "wedge"},
		[13] = {textVest = "slope", modVest = "slope"},
		[14] = {textVest = "jhericurl", modVest = "jheri"},
		[15] = {textVest = "cornrows", modVest = "cornrows"},
		[16] = {textVest = "cornrowsb", modVest = "cornrows"},
		[17] = {textVest = "tramline", modVest = "tramline"},
		[18] = {textVest = "groovecut", modVest = "groovecut"},
		[19] = {textVest = "mohawk", modVest = "mohawk"},
		[20] = {textVest = "mohawkblond", modVest = "mohawk"},
		[21] = {textVest = "mohawkpink", modVest = "mohawk"},
		[22] = {textVest = "mohawkbeard", modVest = "mohawk"},
		[23] = {textVest = "afro", modVest = "afro"},
		[24] = {textVest = "afrotash", modVest = "afro"},
		[25] = {textVest = "afrobeard", modVest = "afro"},
		[26] = {textVest = "afroblond", modVest = "afro"},
		[27] = {textVest = "flattop", modVest = "flattop"},
		[28] = {textVest = "elvishair", modVest = "elvishair"},
		[29] = {textVest = "beard", modVest = "head"},
		[30] = {textVest = "tash", modVest = "head"},
		[31] = {textVest = "goatee", modVest = "head"},
		[32] = {textVest = "afrogoatee", modVest = "afro"}
	},
	
	[2] = { 		
		[0] = {textVest = "player_legs", modVest = "legs", price = 25 },
		[1] = {textVest = "worktrcamogrn", modVest = "worktr"},
		[2] = {textVest = "worktrcamogry", modVest = "worktr"},
		[3] = {textVest = "worktrgrey", modVest = "worktr"},
		[4] = {textVest = "worktrkhaki", modVest = "worktr"},
		[5] = {textVest = "tracktr", modVest = "tracktr"},
		[6] = {textVest = "tracktreris", modVest = "tracktr"},
		[7] = {textVest = "jeansdenim", modVest = "jeans"},
		[8] = {textVest = "legsblack", modVest = "legs"},
		[9] = {textVest = "legsheart", modVest = "legs"},
		[10] = {textVest = "biegetr", modVest = "chinosb"},
		[11] = {textVest = "tracktrpro", modVest = "tracktr"},
		[12] = {textVest = "tracktrwhstr", modVest = "tracktr"},
		[13] = {textVest = "tracktrblue", modVest = "tracktr"},
		[14] = {textVest = "tracktrgang", modVest = "tracktr"},
		[15] = {textVest = "bbshortwht", modVest = "boxingshort"},
		[16] = {textVest = "boxshort", modVest = "boxingshort"},
		[17] = {textVest = "bbshortred", modVest = "boxingshort"},
		[18] = {textVest = "shellsuittr", modVest = "tracktr"},
		[19] = {textVest = "shortsgrey", modVest = "shorts"},
		[20] = {textVest = "shortskhaki", modVest = "shorts"},
		[21] = {textVest = "chongergrey", modVest = "chonger"},
		[22] = {textVest = "chongergang", modVest = "chonger"},
		[23] = {textVest = "chongerred", modVest = "chonger"},
		[24] = {textVest = "chongerblue", modVest = "chonger"},
		[25] = {textVest = "shortsgang", modVest = "shorts"},
		[26] = {textVest = "denimsgang", modVest = "jeans"},
		[27] = {textVest = "denimsred", modVest = "jeans"},
		[28] = {textVest = "chinosbiege", modVest = "chinosb"},
		[29] = {textVest = "chinoskhaki", modVest = "chinosb"},
		[30] = {textVest = "cutoffchinos", modVest = "shorts"},
		[31] = {textVest = "cutoffchinosblue", modVest = "shorts"},
		[32] = {textVest = "chinosblack", modVest = "chinosb"},
		[33] = {textVest = "chinosblue", modVest = "chinosb"},
		[34] = {textVest = "leathertr", modVest = "leathertr"},
		[35] = {textVest = "leathertrchaps", modVest = "leathertr"},
		[36] = {textVest = "suit1trgrey", modVest = "suit1tr"},
		[37] = {textVest = "suit1trblk", modVest = "suit1tr"},
		[38] = {textVest = "cutoffdenims", modVest = ""},
		[39] = {textVest = "suit1trred", modVest = "suit1tr"},
		[40] = {textVest = "suit1trblue", modVest = "suit1tr"},
		[41] = {textVest = "suit1tryellow", modVest = "suit1tr"},
		[42] = {textVest = "suit1trgreen", modVest = "suit1tr"},
		[43] = {textVest = "suit1trblk2", modVest = "suit1tr"},
		[44] = {textVest = "suit1trgang", modVest = "suit1tr"}
	},
	
	[3] = {			
		[0] = {textVest = "foot", modVest = "feet"},
		[1] = {textVest = "cowboyboot2", modVest = "biker"},
		[2] = {textVest = "bask2semi", modVest = "bask1"},
		[3] = {textVest = "bask1eris", modVest = "bask1"},
		[4] = {textVest = "sneakerbincgang", modVest = "sneaker"},
		[5] = {textVest = "sneakerbincblue", modVest = "sneaker"},
		[6] = {textVest = "sneakerbincblk", modVest = "sneaker"},
		[7] = {textVest = "sandal", modVest = "flipflop"},
		[8] = {textVest = "sandalsock", modVest = "flipflop"},
		[9] = {textVest = "flipflop", modVest = "flipflop"},
		[10] = {textVest = "hitop", modVest = "bask1"},
		[11] = {textVest = "convproblk", modVest = "conv"},
		[12] = {textVest = "convproblu", modVest = "conv"},
		[13] = {textVest = "convprogrn", modVest = "conv"},
		[14] = {textVest = "sneakerprored", modVest = "sneaker"},
		[15] = {textVest = "sneakerproblu", modVest = "sneaker"},
		[16] = {textVest = "sneakerprowht", modVest = "sneaker"},
		[17] = {textVest = "bask1prowht", modVest = "bask1"},
		[18] = {textVest = "bask1problk", modVest = "bask1"},
		[19] = {textVest = "boxingshoe", modVest = "biker"},
		[20] = {textVest = "convheatblk", modVest = "conv"},
		[21] = {textVest = "convheatred", modVest = "conv"},
		[22] = {textVest = "convheatorn", modVest = "conv"},
		[23] = {textVest = "sneakerheatwht", modVest = "sneaker"},
		[24] = {textVest = "sneakerheatgry", modVest = "sneaker"},
		[25] = {textVest = "sneakerheatblk", modVest = "sneaker"},
		[26] = {textVest = "bask2heatwht", modVest = "bask1"},
		[27] = {textVest = "bask2heatband", modVest = "bask1"},
		[28] = {textVest = "timbergrey", modVest = "bask1"},
		[29] = {textVest = "timberred", modVest = "bask1"},
		[30] = {textVest = "timberfawn", modVest = "bask1"},
		[31] = {textVest = "timberhike", modVest = "bask1"},
		[32] = {textVest = "cowboyboot", modVest = "biker"},
		[33] = {textVest = "biker", modVest = "biker"},
		[34] = {textVest = "snakeskin", modVest = "biker"},
		[35] = {textVest = "shoedressblk", modVest = "shoe"},
		[36] = {textVest = "shoedressbrn", modVest = "shoe"},
		[37] = {textVest = "shoespatz", modVest = "shoe" }
	},
	
	[4] = {			
		[0] = {textVest = "4WEED", modVest = "4weed"},
		[1] = {textVest = "4RIP", modVest = "4rip"},
		[2] = {textVest = "4SPIDER", modVest = "4spider" } 
	},
	
	[5] = { 		
		[0] = {textVest = "5GUN", modVest = "5gun"},
		[1] = {textVest = "5CROSS", modVest = "5cross"},
		[2] = {textVest = "5CROSS2", modVest = "5cross2"},
		[3] = {textVest = "5CROSS3", modVest = "5cross3" }
	},
	
	[6] = {			
		[0] = {textVest = "6AZTEC", modVest = "6aztec"},
		[1] = {textVest = "6CROWN", modVest = "6crown"},
		[2] = {textVest = "6CLOWN", modVest = "6clown"},
		[3] = {textVest = "6AFRICA", modVest = "6africa" } 
	},
	
	[7] = { 		
		[0] = {textVest = "7CROSS", modVest = "7cross"},
		[1] = {textVest = "7CROSS2", modVest = "7cross2"},
		[2] = {textVest = "7CROSS3", modVest = "7cross3"},
		[3] = {textVest = "7MARY", modVest = "7mary" }
	},
	
	[8] = { 		
		[0] = {textVest = "8SA", modVest = "8sa"},
		[1] = {textVest = "8SA2", modVest = "8sa2"},
		[2] = {textVest = "8SA3", modVest = "8sa3"},
		[3] = {textVest = "8WESTSD", modVest = "8westside"},
		[4] = {textVest = "8SANTOS", modVest = "8santos"},
		[5] = {textVest = "8POKER", modVest = "8poker"},
		[6] = {textVest = "8GUN", modVest = "8gun" }
	},
	
	[9] = { 		
		[0] = {textVest = "9CROWN", modVest = "9crown"},
		[1] = {textVest = "9GUN", modVest = "9gun"},
		[2] = {textVest = "9GUN2", modVest = "9gun2"},
		[3] = {textVest = "9HOMBY", modVest = "9homeboy"},
		[4] = {textVest = "9BULLT", modVest = "9bullet"},
		[5] = {textVest = "9RASTA", modVest = "9rasta" }
	},
	
	[10] = { 		
		[0] = {textVest = "10LS", modVest = "10ls"},
		[1] = {textVest = "10LS2", modVest = "10ls2"},
		[2] = {textVest = "10LS3", modVest = "10ls3"},
		[3] = {textVest = "10LS4", modVest = "10ls4"},
		[4] = {textVest = "10ls5", modVest = "10ls5"},
		[5] = {textVest = "10OG", modVest = "10og"},
		[6] = {textVest = "10WEED", modVest = "10weed" }
	},
	
	[11] = { 		
		[0] = {textVest = "11GROVE", modVest = "11grove"},
		[1] = {textVest = "11GROV2", modVest = "11grove2"},
		[2] = {textVest = "11GROV3", modVest = "11grove3"},
		[3] = {textVest = "11DICE", modVest = "11dice"},
		[4] = {textVest = "11DICE2", modVest = "11dice2"},
		[5] = {textVest = "11JAIL", modVest = "11jail"},
		[6] = {textVest = "11GGIFT", modVest = "11godsgift" }
	},
	
	[12] = { 		
		[0] = {textVest = "12ANGEL", modVest = "12angels"},
		[1] = {textVest = "12MAYBR", modVest = "12mayabird"},
		[2] = {textVest = "12DAGER", modVest = "12dagger"},
		[3] = {textVest = "12BNDIT", modVest = "12bandit"},
		[4] = {textVest = "12CROSS", modVest = "12cross7"},
		[5] = {textVest = "12MYFAC", modVest = "12mayafce" }
	},
	
	[13] = { 		
		[0] = {textVest = "dogtag", modVest = "neck"},
		[1] = {textVest = "neckafrica", modVest = "neck"},
		[2] = {textVest = "stopwatck", modVest = "neck"},
		[3] = {textVest = "necksaints", modVest = "neck"},
		[4] = {textVest = "neckhash", modVest = "neck"},
		[5] = {textVest = "necksilver", modVest = "neck2"},
		[6] = {textVest = "neckgold", modVest = "neck2"},
		[7] = {textVest = "neckropes", modVest = "neck2"},
		[8] = {textVest = "neckropeg", modVest = "neck2"},
		[9] = {textVest = "neckls", modVest = "neck"},
		[10] = {textVest = "neckdollar", modVest = "neck"},
		[11] = {textVest = "neckcross", modVest = "neck" }
	},
	
	[14] = { 		
		[0] = {textVest = "watchpink", modVest = "watch"},
		[1] = {textVest = "watchyellow", modVest = "watch"},
		[2] = {textVest = "watchpro", modVest = "watch"},
		[3] = {textVest = "watchpro2", modVest = "watch"},
		[4] = {textVest = "watchsub1", modVest = "watch"},
		[5] = {textVest = "watchsub2", modVest = "watch"},
		[6] = {textVest = "watchzip1", modVest = "watch"},
		[7] = {textVest = "watchzip2", modVest = "watch"},
		[8] = {textVest = "watchgno", modVest = "watch"},
		[9] = {textVest = "watchgno2", modVest = "watch"},
		[10] = {textVest = "watchpro", modVest = "watch"},
		[11] = {textVest = "watchpro2", modVest = "watch" }
	},
	
	[15] = { 		
		[0] = {textVest = "groucho", modVest = "grouchos"},
		[1] = {textVest = "zorro", modVest = "zorromask"},
		[2] = {textVest = "eyepatch", modVest = "eyepatch"},
		[3] = {textVest = "glasses01", modVest = "glasses01"},
		[4] = {textVest = "glasses04", modVest = "glasses04"},
		[5] = {textVest = "bandred3", modVest = "bandmask"},
		[6] = {textVest = "bandblue3", modVest = "bandmask"},
		[7] = {textVest = "bandgang3", modVest = "bandmask"},
		[8] = {textVest = "bandblack3", modVest = "bandmask"},
		[9] = {textVest = "glasses01dark", modVest = "glasses01"},
		[10] = {textVest = "glasses04dark", modVest = "glasses04"},
		[11] = {textVest = "glasses03", modVest = "glasses03"},
		[12] = {textVest = "glasses03red", modVest = "glasses03"},
		[13] = {textVest = "glasses03blue", modVest = "glasses03"},
		[14] = {textVest = "glasses03dark", modVest = "glasses03"},
		[15] = {textVest = "glasses05dark", modVest = "glasses03"},
		[16] = {textVest = "glasses05", modVest = "glasses03" }
	},
	
	[16] = { 		
		[0] = {textVest = "bandred", modVest = "bandana"},
		[1] = {textVest = "bandblue", modVest = "bandana"},
		[2] = {textVest = "bandgang", modVest = "bandana"},
		[3] = {textVest = "bandblack", modVest = "bandana"},
		[4] = {textVest = "bandred2", modVest = "bandknots"},
		[5] = {textVest = "bandblue2", modVest = "bandknots"},
		[6] = {textVest = "bandblack2", modVest = "bandknots"},
		[7] = {textVest = "bandgang2", modVest = "bandknots"},
		[8] = {textVest = "capknitgrn", modVest = "capknit"},
		[9] = {textVest = "captruck", modVest = "captruck"},
		[10] = {textVest = "cowboy", modVest = "cowboy"},
		[11] = {textVest = "hattiger", modVest = "cowboy"},
		[12] = {textVest = "helmet", modVest = "helmet"},
		[13] = {textVest = "moto", modVest = "moto"},
		[14] = {textVest = "boxingcap", modVest = "boxingcap"},
		[15] = {textVest = "hockey", modVest = "hockey"},
		[16] = {textVest = "capgang", modVest = "cap"},
		[17] = {textVest = "capgangback", modVest = "capblack"},
		[18] = {textVest = "capgangside", modVest = "capside"},
		[19] = {textVest = "capgangover", modVest = "capovereye"},
		[20] = {textVest = "capgangup", modVest = "caprimup"},
		[21]= {textVest = "bikerhelmet", modVest = "bikerhelmet"},
		[22] = {textVest = "capred", modVest = "cap"},
		[23] = {textVest = "capredback", modVest = "capback"},
		[24] = {textVest = "capredside", modVest = "capside"},
		[25] = {textVest = "capredover", modVest = "capovereye"},
		[26] = {textVest = "capredup", modVest = "caprimup"},
		[27] = {textVest = "capblue", modVest = "cap"},
		[28] = {textVest = "capblueback", modVest = "capback"},
		[29] = {textVest = "capblueside", modVest = "capblueover"},
		[30] = {textVest = "capblueover", modVest = "capovereye"},
		[31] = {textVest = "capblueup", modVest = "caprimup"},
		[32] = {textVest = "skullyblk", modVest = "skullycap"},
		[33] = {textVest = "skullygrn", modVest = "skullycap"},
		[34] = {textVest = "hatmancblk", modVest = "hatmanc"},
		[35] = {textVest = "hatmancplaid", modVest = "hatmanc"},
		[36] = {textVest = "capzip", modVest = "cap"},
		[37] = {textVest = "capzipback", modVest = "capback"},
		[38] = {textVest = "capzipside", modVest = "capside"},
		[39] = {textVest = "capzipover", modVest = "capovereye"},
		[40] = {textVest = "capzipup", modVest = "caprimup"},
		[41] = {textVest = "beretred", modVest = "beret"},
		[42] = {textVest = "beretblk", modVest = "beret"},
		[43] = {textVest = "capblk", modVest = "cap"},
		[44] = {textVest = "capblkback", modVest = "capback"},
		[45] = {textVest = "capblkside", modVest = "capside"},
		[46] = {textVest = "capblkover", modVest = "capovereye"},
		[47] = {textVest = "capblkup", modVest = "caprimup"},
		[48] = {textVest = "trilbydrk", modVest = "trilby"},
		[49] = {textVest = "trilbylght", modVest = "trilby"},
		[50] = {textVest = "bowler", modVest = "bowler"},
		[51] = {textVest = "bowlerred", modVest = "bowler"},
		[52] = {textVest = "bowlerblue", modVest = "bowler"},
		[53] = {textVest = "bowleryellow", modVest = "bowler"},
		[54] = {textVest = "boater", modVest = "boater"},
		[55] = {textVest = "bowlergang", modVest = "bowler"},
		[56] = {textVest = "boaterblk", modVest = "boater" }
	},
	
	[17] = { 		
		[0] = {textVest = "gimpleg", modVest = "gimpleg"},
		[1] = {textVest = "valet", modVest = "valet"},
		[2] = {textVest = "countrytr", modVest = "countrytr"},
		[3] = {textVest = "croupier", modVest = "valet"},
		[4] = {textVest = "policetr", modVest = "policetr"},
		[5] = {textVest = "balaclava", modVest = "balaclava"},
		[6] = {textVest = "pimptr", modVest = "pimptr"},
		[7] = {textVest = "garageleg", modVest = "garagetr"},
		[8] = {textVest = "medictr", modVest = "medictr" }
	}
}



function setSkin(id,nombre)
	setElementModel(source,id)
	setElementData(source,"TOUtils.skin",id)
	local accName = getAccountName(getPlayerAccount(source))
	executeSQLQuery("UPDATE Sistema_Guardado SET Apariencia = '"..id.."' WHERE Cuenta = ?",accName)
	--outputChatBox("Cambiaste tu apariencia (Nombre: "..nombre..") (ID: "..id..")",source,255,255,255)
	exports['[TO]Notificaciones']:sendMessage("Cambiaste tu Apariencia (Nombre: "..nombre..") (ID: "..id..")",source,255,255,255)
	playSoundFrontEnd(source,20)
end
addEvent("setSkinFromModel",true)
addEventHandler("setSkinFromModel",root,setSkin)

function gettingVest(vest)
	--outputChatBox("ID: "..vest,root,255,255,255)
	triggerClientEvent(source,"theftopSkins.settingVest",source,clothes,vest)
end
addEvent("theftopSkins.gettingVest",true)
addEventHandler("theftopSkins.gettingVest",root,gettingVest)


function setPedClothes(texture,model,index)
	local accName = getAccountName(getPlayerAccount(source))
	query = executeSQLQuery("SELECT * FROM CJCustom WHERE Usuario = ? AND textureClothes = ?", accName,texture)
	if (#query == 0) then
		local money = getPlayerMoney(source)
		if money >= 1000 then
			exports['[TO]Notificaciones']:sendMessage("Compraste una nueva vestimenta para CJ",source,0,255,0)
			playSoundFrontEnd(source,11)
			executeSQLQuery("INSERT INTO CJCustom VALUES ('"..accName.."','"..texture.."','"..model.."','"..index.."')")
			addPedClothes(source,texture,model,index)
			takePlayerMoney(source,1000)
			triggerEvent("theftop.requestSaveCJ",source)
		else
			exports['[TO]Notificaciones']:sendMessage("No tienes suficiente dinero!",source,255,0,0)
			playSoundFrontEnd(source,17)
		end
	else
		exports['[TO]Notificaciones']:sendMessage("No puedes comprar esta vestimenta ya que supuestamente la tienes",source,255,0,0)
		playSoundFrontEnd(source,17)
	end
end
addEvent("theftopSkins.setPedClothes",true)
addEventHandler("theftopSkins.setPedClothes",root,setPedClothes)


function setPedClothesSaved(texture,model,index)
	addPedClothes(source,texture,model,index)
	triggerEvent("theftop.requestSaveCJ",source)
end
addEvent("theftopSkins.setPedClothesSaved",true)
addEventHandler("theftopSkins.setPedClothesSaved",root,setPedClothesSaved)

function removeAllClothes()
	for i=0, 17, 1 do
		removePedClothes ( source, i )
	end
	triggerEvent("theftop.requestSaveCJ",source)
end
addEvent("theftopSkins.removeAllClothes",true)
addEventHandler("theftopSkins.removeAllClothes",root,removeAllClothes)

function gettingSaved()
	local accName = getAccountName(getPlayerAccount(source))
	query = executeSQLQuery("SELECT * FROM CJCustom WHERE Usuario = ?", accName)
	triggerClientEvent(source,"theftopSkins.settingSaved",source,query)
end
addEvent("theftopSkins.gettingSaved",true)
addEventHandler("theftopSkins.gettingSaved",root,gettingSaved)

function saveClothes()
	if ( not isGuestAccount(getPlayerAccount(source)) ) and ( getElementModel(source) == 0 ) then
		local texture = {}
		local model = {}
		for i=0, 17, 1 do
			local clothesTexture, clothesModel = getPedClothes(source, i)
			if ( clothesTexture ~= false ) then
				table.insert(texture, clothesTexture)
				table.insert(model, clothesModel)
			else
				table.insert(texture, " ")
				table.insert(model, " ")
			end	
		end
		local allTextures = table.concat(texture, ",")
		local allModels = table.concat(model, ",")
		--outputDebugString("El Jugador "..getPlayerName(source).." guardó su personalización de CJ")
		local accName = getAccountName(getPlayerAccount(source))
		query = executeSQLQuery("SELECT * FROM RopasCJ WHERE Usuario = ?", accName)
		if (#query == 0) then
			executeSQLQuery("INSERT INTO RopasCJ VALUES ('"..accName.."','"..allTextures.."','"..allModels.."')")
		else
			executeSQLQuery("UPDATE RopasCJ SET textureCJ = '"..allTextures.."',modelCJ = '"..allModels.."' WHERE Usuario= '"..accName.."'")
		end
		texture = {}
		model = {}
	end
end
addEvent("theftop.requestSaveCJ",true)
addEventHandler("theftop.requestSaveCJ", root, saveClothes)
addEventHandler("onPlayerQuit",root,saveClothes)

function setClothesCJ()
	if ( not isGuestAccount(getPlayerAccount(source)) ) and ( getElementModel(source) == 0 )then
		local accName = getAccountName(getPlayerAccount(source))
		query = executeSQLQuery("SELECT * FROM RopasCJ WHERE Usuario = ?", accName)
		if (#query == 0) then 
			addPedClothes(source, 0, 0, 0)
			return end
			texturesCJ = query[1].textureCJ
			modelsCJ = query[1].modelCJ
			local textures = split(texturesCJ, 44)
			local models = split(modelsCJ, 44)
			for i=0, 17, 1 do
				if ( textures[i+1] ~= " " ) then
					addPedClothes(source, textures[i+1], models[i+1], i)
				end
			end
		end
	end
	addEvent("theftop.requestOldCJ",true)
	addEventHandler("theftop.requestOldCJ", root, setClothesCJ)
	addEventHandler("onPlayerLogin",root,setClothesCJ)
	
	
	
	function getPreviewLastClothes()
		local accName = getAccountName(getPlayerAccount(source))
		query = executeSQLQuery("SELECT * FROM RopasCJ WHERE Usuario = ?", accName)
		if (#query == 0) then return end
		texturesCJ = query[1].textureCJ
		modelsCJ = query[1].modelCJ
			triggerClientEvent(source,"theftopSkins.setPreviewLastClothes",source,texturesCJ,modelsCJ)
		end
		addEvent("theftopSkins.getPreviewLastClothes",true)
		addEventHandler("theftopSkins.getPreviewLastClothes", root, getPreviewLastClothes)
		
		