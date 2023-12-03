--────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
--─██████████████─████████████████───██████████████─██████──██████─██████████████────██████████████─██████████████─████████████████───██████████─██████████████─██████████████─██████████████─
--─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░░░░░██─██░░██──██░░██─██░░░░░░░░░░██────██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░░░██───██░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─
--─██░░██████████─██░░████████░░██───██░░██████░░██─██░░██──██░░██─██░░██████████────██░░██████████─██░░██████████─██░░████████░░██───████░░████─██░░██████░░██─██████░░██████─██░░██████████─
--─██░░██─────────██░░██────██░░██───██░░██──██░░██─██░░██──██░░██─██░░██────────────██░░██─────────██░░██─────────██░░██────██░░██─────██░░██───██░░██──██░░██─────██░░██─────██░░██─────────
--─██░░██─────────██░░████████░░██───██░░██──██░░██─██░░██──██░░██─██░░██████████────██░░██████████─██░░██─────────██░░████████░░██─────██░░██───██░░██████░░██─────██░░██─────██░░██████████─
--─██░░██──██████─██░░░░░░░░░░░░██───██░░██──██░░██─██░░██──██░░██─██░░░░░░░░░░██────██░░░░░░░░░░██─██░░██─────────██░░░░░░░░░░░░██─────██░░██───██░░░░░░░░░░██─────██░░██─────██░░░░░░░░░░██─
--─██░░██──██░░██─██░░██████░░████───██░░██──██░░██─██░░██──██░░██─██░░██████████────██████████░░██─██░░██─────────██░░██████░░████─────██░░██───██░░██████████─────██░░██─────██████████░░██─
--─██░░██──██░░██─██░░██──██░░██─────██░░██──██░░██─██░░░░██░░░░██─██░░██────────────────────██░░██─██░░██─────────██░░██──██░░██───────██░░██───██░░██─────────────██░░██─────────────██░░██─
--─██░░██████░░██─██░░██──██░░██████─██░░██████░░██─████░░░░░░████─██░░██████████────██████████░░██─██░░██████████─██░░██──██░░██████─████░░████─██░░██─────────────██░░██─────██████████░░██─
--─██░░░░░░░░░░██─██░░██──██░░░░░░██─██░░░░░░░░░░██───████░░████───██░░░░░░░░░░██────██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██──██░░░░░░██─██░░░░░░██─██░░██─────────────██░░██─────██░░░░░░░░░░██─
--─██████████████─██████──██████████─██████████████─────██████─────██████████████────██████████████─██████████████─██████──██████████─██████████─██████─────────────██████─────██████████████─
--────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

assert(GetCurrentResourceName() == "GS_farmerjob", _U('license')) -- Ne diraj te // Do not touch
local spatulamodel = "bkr_prop_coke_spatula_04"
local brojac = 0
local uzeoposao = false
local rast = {}

insert = function(t, v)
  t[#t + 1] = v
end

CreateThread(function()
  while true do
    Wait(5)
  local distanca = #(GetEntityCoords(PlayerPedId()) - Config.polje)
  local spavanje = true
  if IsPedInAnyVehicle(PlayerPedId(), false) and distanca < 40.0 then 
    spavanje = false
    uzeoposao = false 
  ESX.Game.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId(), false))
  ESX.ShowNotification(_U('vehicle'))
  end
  if spavanje then
  Wait(1000)
  end
  end
  end)

Citizen.CreateThread(function ()
    for i, v in pairs(Config.Blipovi) do
        local blip = AddBlipForCoord(v.Kordinate.x, v.Kordinate.y, v.Kordinate.z)

        SetBlipSprite(blip, v.Ikonica)

        if v.Boja ~= nil then
            SetBlipColour(blip, v.Boja)
        end

        SetBlipDisplay(blip, v.Pokazuj)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.Ime)  -- Stavi ime blipu
        EndTextCommandSetBlipName(blip)


        local display = v.Pokazuj

        SetBlipDisplay(blip, display)
    end
end)

Citizen.CreateThread(function()
    for _,v in pairs(Config.KupiSeme) do
      RequestModel(GetHashKey(v.model))
      while not HasModelLoaded(GetHashKey(v.model)) do
        Wait(1)
      end
      PostaviPeda = CreatePed(4, v.model, vector3(v.coords.x, v.coords.y, v.coords.z - 1) , v.coords.w, false, true)
      FreezeEntityPosition(PostaviPeda, true) 
      SetEntityInvincible(PostaviPeda, true)
      SetBlockingOfNonTemporaryEvents(PostaviPeda, true)
        exports.qtarget:AddBoxZone('kupovina', vector3(v.coords.x, v.coords.y, v.coords.z - 1), v.coords.w, 1.0, {
            name= 'kupovina',
            heading= v.coords.w,
            debugPoly= Config.Debug,
            minZ= v.coords.z -1,
            maxZ= v.coords.z +2,
            }, {
              options = {
                {
                  action = function()
                      local input = lib.inputDialog('Kupovanje kupusa', {
                      {type = 'select', label = _U('method'), options = Config.Opcije, required = true},
                      {type = 'number', label =_U('amount'), description = _U('amountD'), required = true, min = 1}
                      })
                      if not input then return end 
                        TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_CLIPBOARD", 0, true)
                        progressbar(_U('buyingprogress'), 2000) -- 2 sekundi da kupi semena // 2 seconds to buy seeds
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('lolex:kupovina', input[1], input[2])
                  end,
                  icon = "fas fa-sign-in-alt",
                  label = _U('buyingsemena'), 
                },
              },
              distance = 3.5
          })
      end
end)

Citizen.CreateThread(function()
    
    for _,v in pairs(Config.Sadnja) do
      RequestModel(GetHashKey(v.model))
      while not HasModelLoaded(GetHashKey(v.model)) do
        Wait(1)
      end
      PostaviPeda = CreatePed(4, v.model, vector3(v.coords.x, v.coords.y, v.coords.z - 1) , v.coords.w, false, true)
      FreezeEntityPosition(PostaviPeda, true) 
      SetEntityInvincible(PostaviPeda, true)
      SetBlockingOfNonTemporaryEvents(PostaviPeda, true)
        exports.qtarget:AddBoxZone('traznja', vector3(v.coords.x, v.coords.y, v.coords.z - 1), v.coords.w, 1.0, {
            name= 'traznja',
            heading= v.coords.w,
            debugPoly= Config.Debug,
            minZ= v.coords.z -1,
            maxZ= v.coords.z +2,
            }, {
              options = {
                {
                  action = function()
                      TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_CLIPBOARD", 0, true)
                      progressbar(_U('findprogress'), 5000) -- 5 sekundi da se nadje polje // 5 seconds to find field
                      ClearPedTasks(PlayerPedId())
                      napraviBlipove()
                      Citizen.Wait(400)
                      progressbar(_U('changeprogress'), 4000) -- 4 sekunde da se presvuku // 4 seconds to change clothes
                      staviSkin()
                      brojac = 0
                      uzeoposao = true
                        SendNUIMessage({ action = "showCounter" })
                  end,
                  icon = "fas fa-sign-in-alt",
                  label = _U('findfields'),
                  canInteract = function ()
                    if not uzeoposao then 
                      return true
                    else
                      return
                      false
                    end
                  end   
                },
                {
                  action = function ()
                      TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_CLIPBOARD", 0, true)
                      progressbar(_U('ended'), 3000) -- 3 sekunde da covek pokupi pare // 3 seconds to player take money
                      TriggerServerEvent('lolex:zavrsio', brojac, GlobalState.kupusijada)
                      skloniBlipove()
                      brojac = 0
                      ClearPedTasks(PlayerPedId())
                      progressbar(_U('changeprogress'), 4000) -- 4 sekunde da se presvuku // 4 seconds to change clothes
                      ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                      TriggerEvent('skinchanger:loadSkin', skin)
                      end)
                      uzeoposao = false
                      SendNUIMessage({ action = "hideCounter" })
                  end,
                  icon = 'fa-solid fa-clipboard',
                  label = _U('endduty'),
                  canInteract = function ()
                    if uzeoposao then 
                      return true
                    else
                      return
                      false
                    end
                  end   
                }
              },
              distance = 3.5
          })
    end
end)

local sacekaj = false

local createdZones = {}

print(_U('grove'))

local kupusi = {}
local kupusijada = {}

RegisterNetEvent('GS_farmerjob:kupus')
AddEventHandler('GS_farmerjob:kupus', function ()
  local korde = GetEntityCoords(PlayerPedId())
  local heading = GetEntityHeading(PlayerPedId())
  local id = math.random(1,1000)
  local prop = 'prop_veg_crop_03_cab'
    insert(kupusi, {korde, id})

    RequestModel(GetHashKey(prop))
        while not HasModelLoaded(prop) do
            Wait(500)
        end
  
        local Paket = CreateObject(prop, korde, false, true)
        insert(kupusijada, Paket)
        SetEntityHeading(Paket, heading)
        FreezeEntityPosition(Paket, true)
        SetEntityInvincible(Paket, true)
        PlaceObjectOnGroundProperly(Paket)
        SetModelAsNoLongerNeeded(prop)
        local zonaime = math.random(100, 5000)
        exports.qtarget:AddBoxZone(zonaime.."zonakupus", vector3(korde.x, korde.y, korde.z -1), 0.85, 0.65, {
          name=zonaime.."zonakupus",
          heading=heading,
          debugPoly=Config.Debug,
          minZ=korde.z -1,
          maxZ=korde.z +2,
          }, {
            options = {
              {
                action = function()
                  for k, v in pairs(rast) do 
                    if #(korde - v.kordinate) < 1.0 then 
                      if v.stanje == 100 then 
                          uberiKupus()
                          ESX.Game.DeleteObject(GetClosestObjectOfType(korde.x, korde.y, korde.z, 1.0, "prop_veg_crop_03_cab", false, false, false))
                          exports.qtarget:RemoveZone(zonaime.."zonakupus")
                      else
                        ESX.ShowNotification(_U("not"))
                      end
                    end
                  end
                end,
                icon = "fa-solid fa-spoon",
                label = _U('pick'),
              },
              {
                action = function()
                  for k, v in pairs(rast) do 
                    if #(korde - v.kordinate) < 1.0 then 
                       ESX.ShowNotification(_U("maturity") ..v.stanje.. "%")
                    end
                  end
                end,
                icon = "fa-brands fa-searchengin",
                label = _U("status"),
              },
            },
            distance = 3.5
        })
end)

CreateThread(function()
  while true do 
    Wait(Config.StateVreme * 1000)
    if not rast then return end 
    for k,v in pairs(rast) do
        v.stanje = v.stanje + 10
        if v.stanje > 100 then
          v.stanje = 100
        end
      end
  end
end)

uberiKupus = function(data)
  local korde = GetEntityCoords(PlayerPedId())
  local bere = false 
  if not bere then 
      bere = true 
      FreezeEntityPosition(PlayerPedId(), true)
      TaskStartScenarioInPlace(PlayerPedId(), 'world_human_gardener_plant', -1, false)
      progressbar(_U('taking'), 5 * 1000)
      ClearPedTasks(PlayerPedId())
      FreezeEntityPosition(PlayerPedId(), false)
      ESX.ShowNotification(_U('took'))
      TriggerServerEvent("gs-farmer:DodajItem")
      bere = false 
      brojac = brojac * 1
      SendNUIMessage({ action = "updateCounter", value = brojac })
  else
    ESX.ShowNotification(_U('already'))
  end
end

local sadiUpravo = false 
RegisterNetEvent("gs-farmerjob:ZasadiBiljku")
 AddEventHandler("gs-farmerjob:ZasadiBiljku", function()
    local hash = GetHashKey("prop_veg_crop_03_cab")
    local pedKorde = GetEntityCoords(PlayerPedId())
    local blizu = IsObjectNearPoint(hash, vector3(pedKorde.x , pedKorde.y, pedKorde.z), 1.5)
    if uzeoposao then 
      local distance = #(GetEntityCoords(PlayerPedId()) - Config.polje)
      if distance < 35.0 then
      if not sadiUpravo then 
        if not blizu then 
          sadiUpravo = true 
          TaskStartScenarioInPlace(PlayerPedId(), 'world_human_gardener_plant', -1, false)
          FreezeEntityPosition(PlayerPedId(), true)
          progressbar(_U('plantingp'), Config.VremeSadjenja * 1000)
          ClearPedTasks(PlayerPedId())
          FreezeEntityPosition(PlayerPedId(), false)
          TriggerEvent('GS_farmerjob:kupus')
          ESX.ShowNotification(_U('planted'))
          sadiUpravo = false 
          TriggerServerEvent("gs-farmer:OduzmiSemee")
          brojac = brojac + 1
          SendNUIMessage({ action = "updateCounter", value = brojac })
          insert(rast, { kordinate = pedKorde, stanje = 0 })
        else
          ESX.ShowNotification(_U("close"))
        end
      else
        ESX.ShowNotification(_U('planting'))
      end
    else
      ESX.ShowNotification(_U('cannot'))
    end
    else 
      ESX.ShowNotification(_U('needjob'))
    end
end)

AddEventHandler("onResourceStop", function(res)
  if GetCurrentResourceName() == res then
    for i = 1, #kupusijada do
     DeleteObject(kupusijada[i])
    end
  end
end)