
TOSkin = {}
theftopSkins = {}
local sW, sH = guiGetScreenSize()
TOSkin.window = guiCreateWindow(15, (sH - 372) / 2 +35, 306, 372, "TO - Apariencias", false)
guiWindowSetSizable(TOSkin.window, false)
guiSetAlpha(TOSkin.window, 1.00)
guiSetVisible(TOSkin.window, false)
TOSkin.listSkin = guiCreateGridList(10, 28, 249, 298, false, TOSkin.window)
TOSkin.nameSkin = guiGridListAddColumn(TOSkin.listSkin, "Nombre", 0.6)
TOSkin.idSkin = guiGridListAddColumn(TOSkin.listSkin, "ID", 0.2)
TOSkin.selectSkin = guiCreateButton(10, 336, 198, 22, "Seleccionar (ID: N/A)", false, TOSkin.window)
guiSetFont(TOSkin.selectSkin, "default-bold-small")
guiSetProperty(TOSkin.selectSkin, "NormalTextColour", "FFAAAAAA")
TOSkin.close = guiCreateButton(218, 335, 41, 23, "X", false, TOSkin.window)
guiSetFont(TOSkin.close, "default-bold-small")
guiSetProperty(TOSkin.close, "NormalTextColour", "FFAAAAAA")    
guiSetEnabled(TOSkin.selectSkin,false)
theftopSkins.custom = guiCreateButton(269, 28, 25, 330, ">>", false, TOSkin.window)
guiSetFont(theftopSkins.custom, "default-bold-small")
guiSetProperty(theftopSkins.custom, "NormalTextColour", "FFAAAAAA")    
guiGridListSetSortingEnabled(TOSkin.listSkin, false)


function previewSkin()
	if guiGridListGetSelectedItem(TOSkin.listSkin) ~= -1 then
		local row = guiGridListGetSelectedItem(TOSkin.listSkin)
		local id = guiGridListGetItemText(TOSkin.listSkin, row, 2)
		setElementModel(localPlayer, id)
		guiSetText(TOSkin.selectSkin,"Seleccionar (ID: "..id..")")	
	end
end
addEventHandler("onClientGUIClick", TOSkin.listSkin, previewSkin, false)


dimPlayer  = {}
function showWS()
	fadeCamera(true)
	guiSetVisible(TOSkin.window,true)
	guiBringToFront(TOSkin.window)
	showCursor(true)
	getSkin = getElementModel(localPlayer)
	guiGridListClear(TOSkin.listSkin)
	local xml = xmlLoadFile("/Apariencias.xml")
	local xmlNodes = xmlNodeGetChildren(xml)
	for i,v in ipairs(xmlNodes) do
		local row = guiGridListAddRow(TOSkin.listSkin)
		guiGridListSetItemText(TOSkin.listSkin,row,TOSkin.nameSkin,xmlNodeGetAttribute(v, "nombre"),false,false)
		guiGridListSetItemText(TOSkin.listSkin,row,TOSkin.idSkin,xmlNodeGetAttribute(v, "id"),false,false)
		setElementFrozen(localPlayer,true)
		local x,y,z = getElementPosition(localPlayer)
		local rot = setPedRotation(localPlayer, 1)
		local dim = getElementDimension(localPlayer)
		dimPlayer[localPlayer] = dim
		setCameraMatrix(x+1.5, y+3, z+5, x, y, z)
		setTimer(setElementDimension,50,1,localPlayer,math.random(5000,10000))
	end
	xmlUnloadFile(xml)
end
addEvent("showWindowSkin",true)
addEventHandler("showWindowSkin",root,showWS)

function showWSFix()
	guiSetVisible(windowSkin,true)
	showCursor(true)
	guiGridListClear(listSkin)
	local xml = xmlLoadFile("/Apariencias.xml")
	local xmlNodes = xmlNodeGetChildren(xml)
	for i,v in ipairs(xmlNodes) do
		local row = guiGridListAddRow(listSkin)
		guiGridListSetItemText(listSkin,row,nameSkin,xmlNodeGetAttribute(v, "nombre"),false,false)
		guiGridListSetItemText(listSkin,row,idSkin,xmlNodeGetAttribute(v, "id"),false,false)
	end
	xmlUnloadFile(xml)
end



function exitWS(button,state,absoluteX,absoluteY)
	if source == TOSkin.close then
		guiSetVisible(TOSkin.window,false)
		guiSetVisible(theftopCJ.window,false)
		setElementData(localPlayer,"TOskin.GUI","nop")
		setElementData(localPlayer,"TOskin.use","nop")
		setTimer(toggleAllControls,1500,1,true, true, false )
		local data = getElementData(localPlayer,"TOUtils.skin")
		if guiGetVisible(theftopCJ.window) == true then
			if tonumber(data) == 0 and getElementModel(localPlayer) == 0 then
				for i = 1, 17 do
					removePedClothes ( localPlayer, i )
				end
				triggerServerEvent("theftop.requestOldCJ",localPlayer)
				guiSetVisible(theftopCJ.window,false)
			end
		end
		showCursor(false)
		setTimer(setElementModel,1500,1,localPlayer,getSkin)
		guiGridListClear(TOSkin.listSkin)
		setTimer(setElementFrozen,1500,1,localPlayer,false)
		setTimer(setCameraTarget,1500,1,localPlayer)
		fadeCamera(false)
		setTimer(fadeCamera,1500,1,true)
		setTimer(setElementDimension,1500,1,localPlayer,dimPlayer[localPlayer])
	end
end
addEventHandler("onClientGUIClick",root,exitWS)

local categorias = {
	{"Shirt",0},
	{"Head",1},
	{"Trousers",2},
	{"Shoes",3},
	{"Tattoos: Left Upper Arm",4},
	{"Tattoos: Left Lower Arm",5},
	{"Tattoos: Right Upper Arm",6},
	{"Tattoos: Right Lower Arm",7},
	{"Tattoos: Back",8},
	{"Tattoos: Left Chest",9},
	{"Tattoos: Right Chest",10},
	{"Tattoos: Stomach",11},
	{"Tattoos: Lower Back",12},
	{"Necklace",13},
	{"Watches",14},
	{"Glasses",15},
	{"Hats",16},
	{"Extra",17},
}

countremoveClothes = 0
function getSetSkinFromModel()
	if source == TOSkin.selectSkin then
		if guiGridListGetSelectedItem(TOSkin.listSkin) ~= -1 then
			local row = guiGridListGetSelectedItem(TOSkin.listSkin)
			local id = guiGridListGetItemText(TOSkin.listSkin, row, 2)
			local nombre = guiGridListGetItemText(TOSkin.listSkin, row, 1)
			setTimer(triggerServerEvent,1500,1,"setSkinFromModel",localPlayer,id,nombre)
			guiSetVisible(TOSkin.window,false)
			showCursor(false)
			setTimer(setElementFrozen,1500,1,localPlayer,false)
			setTimer(setCameraTarget,1500,1,localPlayer)
			fadeCamera(false)
			setTimer(fadeCamera,1500,1,true)
			setTimer(toggleAllControls,1500,1,true, true, false )
			setTimer(setElementDimension,1500,1,localPlayer,dimPlayer[localPlayer])
			setElementData(localPlayer,"TOskin.GUI","nop")
			setElementData(localPlayer,"TOskin.use","nop")
		end
	elseif source == theftopSkins.custom then
		local data = getElementData(localPlayer,"TOUtils.skin")
		if tonumber(data) == 0 then
			triggerServerEvent("theftopSkins.gettingSaved",localPlayer)
			guiSetVisible(theftopCJ.window,true)
			guiBringToFront(theftopCJ.window)
			guiGridListClear(theftopCJ.listCat)
			guiGridListClear(theftopCJ.listCloth)
			for i = 1, 2 do
				guiGridListAddRow(theftopCJ.listCloth)
			end
			guiGridListSetItemText(theftopCJ.listCloth,0,1,"Vestimentas vacías.",true,false)
			for i,v in ipairs(categorias) do
				local row = guiGridListAddRow(theftopCJ.listCat)
				guiGridListSetItemText(theftopCJ.listCat,row,theftopCJ.gridCat,v[1],false,false)
				guiGridListSetItemData(theftopCJ.listCat,row,theftopCJ.gridCat,v[2])
			end
		else
			exports["[TO]Notificaciones"]:sendMessage("No puedes usar esta función ya que necesitas la apariencia de CJ",255,0,0,11)
		end
	elseif source == theftopCJ.close then
		guiSetVisible(theftopCJ.window,false)
		for i = 1, 17 do
			removePedClothes ( localPlayer, i )
		end
		triggerServerEvent("theftop.requestOldCJ",localPlayer)
	elseif source == theftopCJ.removeAllClothes then
		if countremoveClothes == 3 then
			guiSetVisible(theftopCJ.window,false)
			countremoveClothes = 0
			triggerServerEvent("theftopSkins.removeAllClothes",localPlayer)
		else
			countremoveClothes = countremoveClothes + 1
			exports["[TO]Notificaciones"]:sendMessage("Presiona las veces necesarias para realizar la acción ("..countremoveClothes.."/3)",255,255,0,11)
		end
	elseif source == theftopCJ.listCat then
		if guiGridListGetSelectedItem(theftopCJ.listCat) ~= -1 then
			local row = guiGridListGetSelectedItem(theftopCJ.listCat)
			local vest = guiGridListGetItemData(theftopCJ.listCat,row,theftopCJ.gridCat)
			triggerServerEvent("theftopSkins.gettingVest",localPlayer,vest)
		end
	elseif source == theftopCJ.usuy then
		if guiGridListGetSelectedItem(theftopCJ.listCloth) ~= -1 then
			local row = guiGridListGetSelectedItem(theftopCJ.listCloth)
			local texture = guiGridListGetItemText(theftopCJ.listCloth,row,theftopCJ.gridCloth)
			local model,index = unpack(guiGridListGetItemData(theftopCJ.listCloth,row,theftopCJ.gridCloth))
			--outputChatBox("TEXTURE: "..texture.." MODEL: "..model.." INDEX: "..index)
			local ped = getElementModel(localPlayer)
			local data = getElementData(localPlayer,"TOUtils.skin")
			if ped ~= 0 and tonumber(data) == 0  then
				setElementModel(localPlayer,0)
				triggerServerEvent("theftopSkins.setPedClothes",localPlayer,texture,model,index)
				triggerServerEvent("theftopSkins.gettingSaved",localPlayer)
			else
				if tonumber(data) == 0  then
					triggerServerEvent("theftopSkins.setPedClothes",localPlayer,texture,model,index)
					triggerServerEvent("theftopSkins.gettingSaved",localPlayer)
				end
			end
		end
		if guiGridListGetSelectedItem(theftopCJ.listSaved) ~= -1 then
			local row = guiGridListGetSelectedItem(theftopCJ.listSaved)
			local texture = guiGridListGetItemText(theftopCJ.listSaved,row,theftopCJ.gridSaved)
			local model,index = unpack(guiGridListGetItemData(theftopCJ.listSaved,row,theftopCJ.gridSaved))
			--outputChatBox("TEXTURE: "..texture.." MODEL: "..model.." INDEX: "..index)
			local ped = getElementModel(localPlayer)
			local data = getElementData(localPlayer,"TOUtils.skin")
			if ped ~= 0 and tonumber(data) == 0  then
				setElementModel(localPlayer,0)
				triggerServerEvent("theftopSkins.setPedClothesSaved",localPlayer,texture,model,index)
				triggerServerEvent("theftopSkins.gettingSaved",localPlayer)
			else
				if tonumber(data) == 0  then
					triggerServerEvent("theftopSkins.setPedClothesSaved",localPlayer,texture,model,index)
					triggerServerEvent("theftopSkins.gettingSaved",localPlayer)
				end
			end
		end
	end
end
addEventHandler("onClientGUIClick",root,getSetSkinFromModel)


function onClickListEvents()
	if source == TOSkin.listSkin then
		if guiGridListGetSelectedItem(TOSkin.listSkin) ~= -1 then
			local row = guiGridListGetSelectedItem(TOSkin.listSkin)
			local id = guiGridListGetItemText(TOSkin.listSkin, row, 2)
			guiSetText(TOSkin.selectSkin,"Seleccionar (ID: "..id..")")
			guiSetEnabled(TOSkin.selectSkin,true)
			if tonumber(id) == 0 then
				triggerServerEvent("theftopSkins.getPreviewLastClothes",localPlayer)
			end
		else
			guiSetText(TOSkin.selectSkin,"Seleccionar (ID: N/A)")
			guiSetEnabled(TOSkin.selectSkin,false)
		end
	end
end
addEventHandler("onClientGUIClick",root,onClickListEvents)


theftopCJ = {}

theftopCJ.window = guiCreateWindow(15, (sH - 431) / 2 + 35, 353, 431, "TO - Custom CJ", false)
guiWindowSetSizable(theftopCJ.window, false)
guiSetAlpha(theftopCJ.window, 1.00)
guiSetVisible(theftopCJ.window,false)
theftopCJ.listCat = guiCreateGridList(10, 31, 150, 152, false, theftopCJ.window)
theftopCJ.gridCat = guiGridListAddColumn(theftopCJ.listCat, "Categorías", 0.85)
theftopCJ.listSaved = guiCreateGridList(10, 193, 150, 152, false, theftopCJ.window)
theftopCJ.gridSaved = guiGridListAddColumn(theftopCJ.listSaved, "Guardado", 0.85)
theftopCJ.listCloth = guiCreateGridList(172, 31, 171, 340, false, theftopCJ.window)
theftopCJ.gridCloth = guiGridListAddColumn(theftopCJ.listCloth, "Vestimentas Disponibles", 0.9)
theftopCJ.usuy = guiCreateButton(10, 371, 150, 47, "Comprar [$1000] / Usar [Vestimenta de CJ]", false, theftopCJ.window)
guiSetFont(theftopCJ.usuy, "default-bold-small")
guiSetProperty(theftopCJ.usuy, "NormalTextColour", "FFAAAAAA")
theftopCJ.close = guiCreateButton(310, 397, 32, 21, "X", false, theftopCJ.window)
guiSetFont(theftopCJ.close, "default-bold-small")
guiSetProperty(theftopCJ.close, "NormalTextColour", "FFAAAAAA")
theftopCJ.removeAllClothes = guiCreateButton(170, 381, 130, 37, "Remover [Vestimentas de CJ]", false, theftopCJ.window)
guiSetFont(theftopCJ.removeAllClothes, "default-bold-small")
guiSetProperty(theftopCJ.removeAllClothes, "NormalTextColour", "FFAAAAAA")    


function settingVest(clothes,vest)
	guiGridListClear(theftopCJ.listCloth)
	for k, v in pairs(categorias) do
		if v[2] == vest then
			idClothes = tonumber(k)-1
		end
	end
	for k, v in pairs(clothes[idClothes]) do
		local row = guiGridListAddRow(theftopCJ.listCloth)
		guiGridListSetItemText(theftopCJ.listCloth,row,theftopCJ.gridCloth,v["textVest"],false,false)
		guiGridListSetItemData(theftopCJ.listCloth,row,theftopCJ.gridCloth,{v["modVest"],idClothes})
	end	
end
addEvent("theftopSkins.settingVest",true)
addEventHandler("theftopSkins.settingVest",root,settingVest)


function onTryVestClickEvents()
	if source == theftopCJ.listCloth then
		if guiGridListGetSelectedItem(theftopCJ.listSaved) ~= -1 then
			guiGridListSetSelectedItem(theftopCJ.listSaved,0,0)
		end
		if guiGridListGetSelectedItem(theftopCJ.listCloth) ~= -1 then
			local row = guiGridListGetSelectedItem(theftopCJ.listCloth)
			local texture = guiGridListGetItemText(theftopCJ.listCloth,row,theftopCJ.gridCloth)
			local model,index = unpack(guiGridListGetItemData(theftopCJ.listCloth,row,theftopCJ.gridCloth))
			--outputChatBox("TEXTURE: "..texture.." MODEL: "..model.." INDEX: "..index)
			local ped = getElementModel(localPlayer)
			local data = getElementData(localPlayer,"TOUtils.skin")
			if ped ~= 0 and tonumber(data) == 0  then
				setElementModel(localPlayer,0)
				addPedClothes(localPlayer,texture,model,index)
			else
				if tonumber(data) == 0  then
					addPedClothes(localPlayer,texture,model,index)
				end
			end
		end
	end
end
addEventHandler("onClientGUIClick",root,onTryVestClickEvents)



function onTryVestClickEvents2()
	if source == theftopCJ.listSaved then
		if guiGridListGetSelectedItem(theftopCJ.listCloth) ~= -1 then
			guiGridListSetSelectedItem(theftopCJ.listCloth,0,0)
		end
		if guiGridListGetSelectedItem(theftopCJ.listSaved) ~= -1 then
			local row = guiGridListGetSelectedItem(theftopCJ.listSaved)
			local texture = guiGridListGetItemText(theftopCJ.listSaved,row,theftopCJ.gridCloth)
			local model,index = unpack(guiGridListGetItemData(theftopCJ.listSaved,row,theftopCJ.gridSaved))
			--outputChatBox("TEXTURE: "..texture.." MODEL: "..model.." INDEX: "..index)
			local ped = getElementModel(localPlayer)
			local data = getElementData(localPlayer,"TOUtils.skin")
			if ped ~= 0 and tonumber(data) == 0  then
				setElementModel(localPlayer,0)
				addPedClothes(localPlayer,texture,model,index)
			else
				if tonumber(data) == 0  then
					addPedClothes(localPlayer,texture,model,index)
				end
			end
		end
	end
end
addEventHandler("onClientGUIClick",root,onTryVestClickEvents2)

function settingSaved(query)
	guiGridListClear(theftopCJ.listSaved)
	for i,v in ipairs(query) do
		local row = guiGridListAddRow(theftopCJ.listSaved)
		guiGridListSetItemText(theftopCJ.listSaved,row,theftopCJ.gridSaved,v.textureClothes,false,false)
		guiGridListSetItemData(theftopCJ.listSaved,row,theftopCJ.gridSaved,{v.modelClothes,v.indexClothes})
	end
end
addEvent("theftopSkins.settingSaved",true)
addEventHandler("theftopSkins.settingSaved",root,settingSaved)

function setPreviewLastClothes(texturesCJ,modelsCJ)
	local textures = split(texturesCJ, 44)
	local models = split(modelsCJ, 44)
	for i=0, 17, 1 do
		if ( textures[i+1] ~= " " ) then
			addPedClothes(localPlayer, textures[i+1], models[i+1], i)
		end
	end
end
addEvent("theftopSkins.setPreviewLastClothes",true)
addEventHandler("theftopSkins.setPreviewLastClothes", root, setPreviewLastClothes)


function keySS()
	if getElementData(localPlayer,"TOskin.use") == "yep" and getElementData(localPlayer,"TOskin.GUI") ~= "yep" then
		setElementData(localPlayer,"TOskin.GUI","yep")
		fadeCamera(false)
		toggleAllControls(false, true, false )
		setTimer(triggerEvent,1500,1,"showWindowSkin",localPlayer)
	end
end
bindKey("X","down",keySS)

