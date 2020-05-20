RegisterServerEvent("servertest:sendInfo")
AddEventHandler("servertest:sendInfo", function(plates)

  local test = false
    
	MySQL.Async.fetchAll('SELECT * FROM vehicle_data WHERE plate = @plate', {
		['@plate'] = plates
	}, function(result)
		if result[1] then
		    local vehstatus = result[1].turbo
		    test = true
		else
		    test = false
		end
	end)

       if test then
           TriggerClientEvent("servertest:output_status", source, vehstatus)  
      else
            print("error")
      end
end)
