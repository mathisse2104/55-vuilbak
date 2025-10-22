local trashModels = {
    `prop_bin_01a`,
    `prop_bin_02a`,
    `prop_bin_07b`,
    `prop_dumpster_02a`
}

-- target interaction
CreateThread(function()
    for _, model in pairs(trashModels) do
        exports.ox_target:addModel(model, {
            {
                name = 'trash_open',
                label = 'Gooi iets in de vuilbak',
                icon = 'fa-solid fa-trash',
                onSelect = function(data)
                    TriggerServerEvent('vuilbak:open')
                end
            }
        })
    end
end)

-- receive stash-ID abd open inventory
RegisterNetEvent('vuilbak:openInventory', function(stash)
    Wait(100)
    TriggerEvent('ox_inventory:openInventory', 'stash', stash)
end)
