RegisterNetEvent("servertest:output_status") --from server.Lua
AddEventHandler("servertest:output_status", function(argument)
    TriggerEvent("chatMessage", "[Success]", {0,255,0}, argument) --never receive message
    TriggerEvent("servertest:vehStatus", argument) --not used now, save for later use
end) 

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local playerPed = GetPlayerPed(-1)
        if IsPedInAnyVehicle(playerPed, false) then
            local playerVeh = GetVehiclePedIsIn(playerPed, false)
            local vehPlates = "TSTPLATE1" --hard coded just to test, this plate is in the database
            TriggerServerEvent("servertest:sendInfo", vehPlates) --****this trigger never happens even though criteria is met

        end
    end
end)
