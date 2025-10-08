-- Discord Webhook
local function sendDiscordWebhook(message)
    if not Shared or not Shared.Config or not Shared.Config.Discord or not Shared.Config.Discord.Enabled then
        return
    end
    
    if not Shared.Config.Discord.WebhookURL or Shared.Config.Discord.WebhookURL == "" then
        return
    end
    
 -- datum/tijd
    local timestamp = os.date("%Y-%m-%d %H:%M:%S")

    local webhookData = {
        ["username"] = Shared.Config.Discord.Username,
        ["avatar_url"] = Shared.Config.Discord.AvatarURL,
        ["embeds"] = {
            {
                ["title"] = Shared.Config.Discord.Titel,
                ["description"] = message,
                ["color"] = Shared.Config.Discord.Color,
                ["thumbnail"] = { ["url"] = Shared.Config.Discord.ThumbnailURL },
                ["footer"] = {
                    ["text"] = Shared.Config.Discord.FooterText .. " • " .. timestamp,
                    ["icon_url"] = Shared.Config.Discord.FooterIconURL
                }
            }
        }
    }

    PerformHttpRequest(Shared.Config.Discord.WebhookURL, function() end, 'POST', json.encode(webhookData), {
        ['Content-Type'] = 'application/json'
    })
end


-- Vuilbak event
RegisterNetEvent('vuilbak:open', function()
    local src = source
    local playerName = GetPlayerName(src)
    local stash = 'trash_' .. src .. '_' .. math.random(1000,9999)

    exports.ox_inventory:RegisterStash(stash, 'Vuilbak', 20, 5000, false)
    TriggerClientEvent('vuilbak:openInventory', src, stash)

    SetTimeout(Shared.Config.DeleteItems * 1000, function()
        local items = exports.ox_inventory:GetInventoryItems(stash)
        if items and next(items) then
            local log = string.format("**%s** heeft iets weggegooid:\n", playerName)
            for _, item in pairs(items) do
                log = log .. string.format("- %s x%d\n", item.label or item.name, item.count)
                exports.ox_inventory:RemoveItem(stash, item.name, item.count)
            end
            sendDiscordWebhook(log)
        end
    end)
end)
