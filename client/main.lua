--[[
    Open-Source Conditions
	Please read the license conditions in the LICENSE file. By using this script, you agree to these conditions.
]]

-- Locales
local Locales = DreamLocales[DreamCore.Language]

-- Thanks for Credits
-- Disclaimer: I know it´s Open-Source but please don´t remove this and give us the credits. Thanks!
if string.find(GetCurrentResourceName(), 'dream') then
	print("^6[Dream-Services]^7 Thank you for not changing the resource name!")
end

-- Global Variables
local HasJob = false

Citizen.CreateThread(function()
	while not DreamFramework.getPlayerJob() do Citizen.Wait(250) end
	HasJob = IsInArray(DreamCore.AllowedPoliceJobs, DreamFramework.getPlayerJob())

	-- Init Job
	if HasJob then InitPoliceImpound() end

	-- Impound Stations
	for k, v in pairs(DreamCore.ImpoundStations) do
		local ImpoundBlip = createBlip(v.blip.label, v.coords, 0.8, v.blip.sprite, v.blip.color)
		local ImpoundPed = createPed(v.ped.model, v.ped.coords, v.ped.heading)

		TargetImpoundPedSelect = function()
			local ImpoundData = lib.callback.await('dream_policeimpound:server:getImpoundVehicles', false)

			if ImpoundData.success then
				if HasJob then
					local OwnLicense = DreamFramework.getLicense()
					local ImpoundVehiclesOptions = {}

					for k2, v2 in pairs(ImpoundData.data) do
						local VehicleMetadata = {
							{ label = Locales['LocalEntity']['ImpoundStation']['VehicleMetadata']['Status'],   value = ('%s (%s)'):format(v2.status.name, v2.status.id) },
							{ label = Locales['LocalEntity']['ImpoundStation']['VehicleMetadata']['Owner'],    value = v2.vehicle_owner_name },
							{ label = Locales['LocalEntity']['ImpoundStation']['VehicleMetadata']['Officer'],  value = v2.officer_name },
							{ label = Locales['LocalEntity']['ImpoundStation']['VehicleMetadata']['Modell'],   value = v2.vehicle.label },
							{ label = Locales['LocalEntity']['ImpoundStation']['VehicleMetadata']['Plate'],    value = v2.vehicle_plate },
							{ label = Locales['LocalEntity']['ImpoundStation']['VehicleMetadata']['Offence'],  value = v2.offence.name },
							{ label = Locales['LocalEntity']['ImpoundStation']['VehicleMetadata']['Fine'],     value = ('%s$'):format(lib.math.groupdigits(v2.fine and v2.fine or v2.offence.amount)) },
							{ label = Locales['LocalEntity']['ImpoundStation']['VehicleMetadata']['Duration'], value = v2.duration },
							{ label = Locales['LocalEntity']['ImpoundStation']['VehicleMetadata']['Note'],     value = v2.notes == '' and 'No Note' or v2.notes }
						}

						-- Case the impounded vehicle is the own vehicle but you are police officer
						if v2.vehicle_owner == OwnLicense then
							-- Note: When the vehicle is locked then another police officer need to unlock. I think it's bad when the own player can unlock his own impounded vehicle, even he is a police man.

							local VehicleOption = {
								title = ('%s | %s'):format(v2.vehicle_plate, v2.status.name),
								description = v2.status.id == 3 and Locales['LocalEntity']['ImpoundStation']['Menu']['VehicleUnlockDesc'] or Locales['LocalEntity']['ImpoundStation']['Menu']['VehicleDesc'],
								icon = 'car',
								iconColor = DreamCore.ImpoundStatusIconColor[v2.status.id],
								iconAnimation = 'beatFade',
								metadata = VehicleMetadata
							}

							if v2.status.id == 2 then
								VehicleOption.onSelect = function()
									local result = lib.callback.await('dream_policeimpound:server:parkOutVehicle', false, v2.id)

									if result.success then
										-- Spawn Vehicle again
										DreamFramework.spawnVehicle(v2.vehicle.model, v.parkout.coords, v.parkout.heading, v2.vehicle, function(vehicle)
											TaskWarpPedIntoVehicle(cache.ped, vehicle, -1)
											TriggerEvent('dream_policeimpound:client:notify', result.message, 'success')
										end)
									else
										TriggerEvent('dream_policeimpound:client:notify', result.message, 'error')
									end
								end
							end

							ImpoundVehiclesOptions[#ImpoundVehiclesOptions + 1] = VehicleOption
						else
							-- The impounded vehicle IS NOT owned by the current player

							local VehicleOption = {
								title = ('%s | %s'):format(v2.vehicle_plate, v2.status.name),
								description = v2.status.id == 3 and Locales['LocalEntity']['ImpoundStation']['Menu']['PoliceVehicleUnlockDesc'] or Locales['LocalEntity']['ImpoundStation']['Menu']['PoliceVehicleDesc'],
								icon = 'car',
								iconColor = DreamCore.ImpoundStatusIconColor[v2.status.id],
								iconAnimation = 'beatFade',
								metadata = VehicleMetadata
							}

							if v2.status.id == 3 then
								VehicleOption.onSelect = function()
									local result = lib.callback.await('dream_policeimpound:server:unlockVehicle', false, v2.id)

									if result.success then
										TriggerEvent('dream_policeimpound:client:notify', result.message, 'success')
									else
										TriggerEvent('dream_policeimpound:client:notify', result.message, 'error')
									end
								end
							end

							ImpoundVehiclesOptions[#ImpoundVehiclesOptions + 1] = VehicleOption
						end
					end

					lib.registerContext({
						id = 'dream_policeimpound:impound_menu',
						title = Locales['LocalEntity']['ImpoundStation']['Menu']['Title'],
						options = ImpoundVehiclesOptions
					})
					lib.showContext('dream_policeimpound:impound_menu')
				else
					local ImpoundVehiclesOptions = {}

					for k2, v2 in pairs(ImpoundData.data) do
						local VehicleMetadata = {
							{ label = Locales['LocalEntity']['ImpoundStation']['VehicleMetadata']['Status'],   value = ('%s (%s)'):format(v2.status.name, v2.status.id) },
							{ label = Locales['LocalEntity']['ImpoundStation']['VehicleMetadata']['Owner'],    value = v2.vehicle_owner_name },
							{ label = Locales['LocalEntity']['ImpoundStation']['VehicleMetadata']['Officer'],  value = v2.officer_name },
							{ label = Locales['LocalEntity']['ImpoundStation']['VehicleMetadata']['Modell'],   value = v2.vehicle.label },
							{ label = Locales['LocalEntity']['ImpoundStation']['VehicleMetadata']['Plate'],    value = v2.vehicle_plate },
							{ label = Locales['LocalEntity']['ImpoundStation']['VehicleMetadata']['Offence'],  value = v2.offence.name },
							{ label = Locales['LocalEntity']['ImpoundStation']['VehicleMetadata']['Fine'],     value = ('%s$'):format(lib.math.groupdigits(v2.fine and v2.fine or v2.offence.amount)) },
							{ label = Locales['LocalEntity']['ImpoundStation']['VehicleMetadata']['Duration'], value = v2.duration },
							-- { label = Locales['LocalEntity']['ImpoundStation']['VehicleMetadata']['Note'],     value = v2.notes == '' and 'No Note' or v2.notes } -- I think the notes should be police exclusive
						}

						local VehicleOption = {
							title = ('%s | %s'):format(v2.vehicle_plate, v2.status.name),
							description = v2.status.id == 3 and Locales['LocalEntity']['ImpoundStation']['Menu']['VehicleUnlockDesc'] or Locales['LocalEntity']['ImpoundStation']['Menu']['VehicleDesc'],
							icon = 'car',
							iconColor = DreamCore.ImpoundStatusIconColor[v2.status.id],
							iconAnimation = 'beatFade',
							metadata = VehicleMetadata
						}

						if v2.status.id == 2 then
							VehicleOption.onSelect = function()
								local result = lib.callback.await('dream_policeimpound:server:parkOutVehicle', false, v2.id)

								if result.success then
									-- Spawn Vehicle again
									DreamFramework.spawnVehicle(v2.vehicle.model, v.parkout.coords, v.parkout.heading, v2.vehicle, function(vehicle)
										TaskWarpPedIntoVehicle(cache.ped, vehicle, -1)
										TriggerEvent('dream_policeimpound:client:notify', result.message, 'success')
									end)
								else
									TriggerEvent('dream_policeimpound:client:notify', result.message, 'error')
								end
							end
						end

						ImpoundVehiclesOptions[#ImpoundVehiclesOptions + 1] = VehicleOption
					end

					lib.registerContext({
						id = 'dream_policeimpound:impound_menu',
						title = Locales['LocalEntity']['ImpoundStation']['Menu']['Title'],
						options = ImpoundVehiclesOptions
					})
					lib.showContext('dream_policeimpound:impound_menu')
				end
			else
				TriggerEvent('dream_policeimpound:client:notify', ImpoundData.message, 'error')
			end
		end

		if DreamCore.Target() == 'ox' then
			exports.ox_target:addLocalEntity(ImpoundPed, {
				{
					label = Locales['LocalEntity']['ImpoundStation']['Name'],
					icon = 'fa-solid fa-building-shield',
					iconColor = '#374f6b',
					onSelect = TargetImpoundPedSelect
				}
			})
		elseif DreamCore.Target() == 'qb' then
			exports['qb-target']:AddTargetEntity(ImpoundPed, {
				options = {
					{
						label = Locales['LocalEntity']['ImpoundStation']['Name'],
						icon = 'fa-solid fa-building-shield',
						action = TargetImpoundPedSelect
					}
				}
			})
		end
	end
end)

function OnJobChange(job)
	if IsInArray(DreamCore.AllowedPoliceJobs, job) then
		RemovePoliceImpound()
		InitPoliceImpound()
		HasJob = true
	else
		RemovePoliceImpound()
		HasJob = false
	end
end

function InitPoliceImpound()
	print("^6[Dream-Services]^7 Police Impound was initialized.")

	TargetGlobalVehicleSelect = function(entity)
		if not entity or not DoesEntityExist(entity) then return end
		local VehicleProps = DreamFramework.getVehicleProperties(entity)
		VehicleProps.label = GetLabelText(GetDisplayNameFromVehicleModel(VehicleProps.model))

		-- Open Menu
		local FormTranslation = Locales['GlobalVehicle']['ImpoundTarget']['Dialog']
		local ImpoundFormData = lib.callback.await('dream_policeimpound:server:getFormData', false)
		local ImpoundmentFormOptions = {
			{ type = 'input', icon = 'user-tie',       label = FormTranslation.Officer,  required = true, default = ImpoundFormData.officerName, disabled = DreamCore.ImpoundForm.DisableInput.officer },
			{ type = 'input', icon = 'car',            label = FormTranslation.Model,    required = true, default = VehicleProps.label,          disabled = DreamCore.ImpoundForm.DisableInput.model },
			{ type = 'input', icon = 'bars-staggered', label = FormTranslation.Plate,    required = true, default = VehicleProps.plate,          disabled = DreamCore.ImpoundForm.DisableInput.plate },
			{ type = 'date',  icon = 'calendar',       label = FormTranslation.Duration, required = true, default = true,                        format = DreamCore.ImpoundForm.DateFormat },
		}

		-- All Offence to select
		local OffenceOptions = {}

		for k, v in pairs(ImpoundFormData.offences) do
			OffenceOptions[#OffenceOptions + 1] = {
				value = v.id,
				label = '🚓 ' .. v.name
			}
		end

		ImpoundmentFormOptions[#ImpoundmentFormOptions + 1] = {
			type = 'select',
			icon = 'receipt',
			label = FormTranslation.Offence,
			required = true,
			searchable = true,
			options = OffenceOptions
		}

		-- Custom Fine Amount?
		if DreamCore.ImpoundForm.CustomFineAmount then
			ImpoundmentFormOptions[#ImpoundmentFormOptions + 1] = {
				type = 'number',
				icon = 'money-bill',
				label = FormTranslation.Fine,
				required = true,
				default = 0,
				min = 0
			}
		end

		-- Some other Inputs
		ImpoundmentFormOptions[#ImpoundmentFormOptions + 1] = {
			type = 'textarea',
			icon = 'note-sticky',
			label = FormTranslation.Note,
			required = false,
			placeholder = FormTranslation.NotePlaceHolder,
			max = 512
		}

		ImpoundmentFormOptions[#ImpoundmentFormOptions + 1] = {
			type = 'checkbox',
			label = FormTranslation.NeedUnlock
		}

		-- Open Dialog
		TaskStartScenarioInPlace(cache.ped, 'WORLD_HUMAN_CLIPBOARD', 0, true)
		local ImpoundmentForm = lib.inputDialog(FormTranslation.Title, ImpoundmentFormOptions)
		ClearPedTasks(cache.ped)
		local ImpoundData = {}

		if ImpoundmentForm then
			ImpoundData.officer = ImpoundmentForm[1]
			ImpoundData.model = ImpoundmentForm[2]
			ImpoundData.plate = ImpoundmentForm[3]
			ImpoundData.duration = ImpoundmentForm[4]
			ImpoundData.offence = ImpoundmentForm[5]

			if DreamCore.ImpoundForm.CustomFineAmount then
				ImpoundData.fine = ImpoundmentForm[6]
				ImpoundData.note = ImpoundmentForm[7]
				ImpoundData.unlock = ImpoundmentForm[8]
			else
				ImpoundData.note = ImpoundmentForm[6]
				ImpoundData.unlock = ImpoundmentForm[7]
			end

			-- Send Data to Server
			local result = lib.callback.await('dream_policeimpound:server:impoundVehicle', false, VehicleProps, ImpoundData)

			if result.success then
				-- Delete Entity
				if DoesEntityExist(entity) then
					while not NetworkHasControlOfEntity(entity) do
						NetworkRequestControlOfEntity(entity)
						Citizen.Wait(100)
					end
					DeleteEntity(entity)
				end

				-- Notify
				TriggerEvent('dream_policeimpound:client:notify', result.message, 'success')
			else
				TriggerEvent('dream_policeimpound:client:notify', result.message, 'error')
			end
		end
	end

	if DreamCore.Target() == 'ox' then
		exports.ox_target:addGlobalVehicle({
			{
				name = 'police_impound_vehicle_impound',
				label = Locales['GlobalVehicle']['ImpoundTarget']['Name'],
				icon = 'fa-solid fa-building-shield',
				iconColor = '#374f6b',
				onSelect = function(data)
					TargetGlobalVehicleSelect(data.entity)
				end
			}
		})
	elseif DreamCore.Target() == 'qb' then
		exports['qb-target']:AddGlobalVehicle({
			options = {
				{
					label = Locales['LocalEntity']['ImpoundStation']['Name'],
					icon = 'fa-solid fa-building-shield',
					action = function(entity)
						TargetGlobalVehicleSelect(entity)
					end
				}
			}
		})
	end
end

function RemovePoliceImpound()
	print("^6[Dream-Services]^7 Police Impound was removed.")

	if DreamCore.Target() == 'ox' then
		exports.ox_target:removeGlobalVehicle('police_impound_vehicle_impound')
	elseif DreamCore.Target() == 'qb' then
		exports['qb-target']:RemoveGlobalVehicle(Locales['LocalEntity']['ImpoundStation']['Name'])
	end
end

function RoundNumber(value, decimalDigits)
	if decimalDigits then
		local exponential = 10 ^ decimalDigits
		return math.floor((value * exponential) + 0.5) / exponential
	else
		return math.floor(value + 0.5)
	end
end

function IsInArray(array, value)
	for _, v in ipairs(array) do
		if v == value then
			return true
		end
	end
	return false
end

RegisterNetEvent("dream_policeimpound:client:notify")
AddEventHandler("dream_policeimpound:client:notify", function(text, type, duration)
	local type = type or 'info'
	local duration = duration or 5000
	lib.notify({
		type        = type,
		position    = 'center-right',
		title       = Locales['NotifyHeader'],
		description = text,
		duration    = duration
	})
end)

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then return end
end)
