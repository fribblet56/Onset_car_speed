local speedCoef = 10

AddEvent("OnGameTick",function(ds)

    local veh = GetPlayerVehicle(GetPlayerId())

    if (veh ~= 0 and IsValidVehicle(veh) and GetVehicleDriver(veh) == GetPlayerId() and GetInputAxisValue("Throttle") == 1.0) then

        local fx, fy, fz = GetVehicleForwardVector(veh)

        fx2 = fx * (speedCoef*100) * ds
        fy2 = fy * (speedCoef*100) * ds
        fz2 = fz * (speedCoef*100) * ds

        if (not IsVehicleInAir(veh)) then
            local vehsk = GetVehicleSkeletalMeshComponent(veh)
            local speed = GetVehicleForwardSpeed(veh)

            if (speed > 1 or speed < -1) then
                vehsk:SetPhysicsLinearVelocity(FVector(fx2 ,fy2 , fz2), true)
            end
        end
    end
end)