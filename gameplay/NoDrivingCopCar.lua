
--[[
----------------------------------------------------------------------------
____________________________________________________________________________

                        AUTHOR : manstfu and Chubbs

            Désactive la possibilité de conduire des voiture de police si non flic
            Simple disable people from driving police cars if not a police
            Paste at the end of esx_policejob


____________________________________________________________________________

---------------------------------------------------------------------------
]]--

function drawTxt(text,x,y,width,height,scale,r,g,b,a)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end


Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedInAnyPoliceVehicle(GetPlayerPed(PlayerId())) then
            local veh = GetVehiclePedIsUsing(GetPlayerPed(PlayerId()), false)
            if (GetPedInVehicleSeat(veh, -1) == GetPlayerPed(PlayerId())) then
                if PlayerData.job ~= nil and PlayerData.job.name ~= 'police' then
                  drawTxt("~r~You dont have permission to drive this car!",0.535,1.266,0.5,0.8,0.6,255,255,255,255)
                  SetVehicleUndriveable(veh, true)
				  elseif PlayerData.job ~= nil and PlayerData.job.name == 'police' then
				  SetVehicleUndriveable(veh, false)
              end
			
			  
            end
        end
    end
end)
