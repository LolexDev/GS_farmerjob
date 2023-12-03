assert(GetCurrentResourceName() == "GS_farmerjob", _U('license')) -- Ne diraj te // Do not touch¸
GlobalState.kupusijada = 'kupusalakakaksmaka'

RegisterServerEvent("lolex:kupovina")
 AddEventHandler("lolex:kupovina", function(tip, kolicina)
  local igrac = ESX.GetPlayerFromId(source)
  local ukupna_cena = 0
  ukupna_cena = Config.semeC * kolicina
   if tip == "money" then 
    local novac = igrac.getInventoryItem("money").count >= ukupna_cena
    if novac then 
      igrac.removeInventoryItem("money", ukupna_cena)
      igrac.addInventoryItem(Config.seme, kolicina)
      discordlogs("GS Farming » Logs", "["..igrac.identifier.."] [" ..GetPlayerName(igrac.source).. "] je kupio seme kupusa u kolicini od " ..kolicina.. " komada i potrosio je " ..ukupna_cena.. " $ preko gotovine na lokaciji[" ..GetEntityCoords(GetPlayerPed(igrac.source)).."]")
    else
      igrac.showNotification("Nemas love bato!")
    end
   elseif tip == "bank" then 
      igrac.removeAccountMoney("bank", ukupna_cena)  
      igrac.addInventoryItem(Config.seme, kolicina)
      discordlogs("GS Farming » Logs", "["..igrac.identifier.."] [" ..GetPlayerName(igrac.source).. "] je kupio seme kupusa u kolicini od " ..kolicina.. " komada i potrosio je " ..ukupna_cena.. " $ preko banke na lokaciji[" ..GetEntityCoords(GetPlayerPed(igrac.source)).."]")
   end
end)

RegisterNetEvent('lolex:kupus', function (kolicina, jelnaposlu)
  local xPlayer = ESX.GetPlayerFromId(source)
  local distance = #(GetEntityCoords(GetPlayerPed(source)) - Config.polje)
  if kolicina == GlobalState.kupusijada and jelnaposlu == true and distance < 50.0 then
  xPlayer.addInventoryItem(Config.Kupus, 1)
  else
    
  end
end)

RegisterNetEvent('lolex:zavrsio', function (broj, kolicina)
    local xPlayer = ESX.GetPlayerFromId(source)
    local novac = broj * Config.dobitak
    local distance = #(GetEntityCoords(GetPlayerPed(source)) - vector3(Config.Sadnja.coords.x, Config.Sadnja.coords.y, Config.Sadnja.coords.z) )
    if kolicina == GlobalState.kupusijada and distance < 50.0 then
    xPlayer.addMoney(novac)
  else
    DropPlayer(source, _U("cheat"))
    end
end)

ESX.RegisterServerCallback('getajitem', function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getInventoryItem(Config.seme).count >= 1 then
     cb(true)
     Citizen.Wait(5000)
     xPlayer.removeInventoryItem(Config.seme, 1)
    else
      cb(false)
    end
end)

print(_U('grove'))

ESX.RegisterUsableItem(Config.seme, function(source)
  local igrac = ESX.GetPlayerFromId(source)
  TriggerClientEvent("gs-farmerjob:ZasadiBiljku", source)
end)

RegisterServerEvent("gs-farmer:OduzmiSemee", function()
  local igrac = ESX.GetPlayerFromId(source)
  igrac.removeInventoryItem(Config.seme, 1)
  discordlogs("GS Farming » Logs", "["..igrac.identifier.."] [" ..GetPlayerName(igrac.source).. "] je posadio seme kupusa na lokaciji[" ..GetEntityCoords(GetPlayerPed(igrac.source)).."]")
end)

RegisterServerEvent("gs-farmer:DodajItem", function()
  local igrac = ESX.GetPlayerFromId(source)
  igrac.addInventoryItem("cabbage", 1)
  discordlogs("GS Farming » Logs", "["..igrac.identifier.."] [" ..GetPlayerName(igrac.source).. "] je ubrao seme kupusa na lokaciji[" ..GetEntityCoords(GetPlayerPed(igrac.source)).."]")
end)

function discordlogs(name, message)
  local vreme = os.date("*t")
  local poruka = {
      {
          ["color"] = 2061822,
          ["title"] = "**".. name .."**",
          ["description"] = message,
          ["footer"] = {
              ["text"]= "Vreme: " .. vreme.hour .. ":" .. vreme.min .. ":" .. vreme.sec,
          },
      }
    }
  PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.LogHeader, embeds = poruka, avatar_url = ""}), { ['Content-Type'] = 'application/json' })
end