🗑️ 55_Vuilbak (Trash System)

A lightweight FiveM trash bin system using ox_inventory and ox_target.
Players can throw items into trash bins, and after a configurable time, the items are automatically deleted and logged to a Discord webhook.

⚙️ Features

Interact with trash bins (ox_target)

Temporary stash creation

Automatic item deletion 

Discord webhook logging 

📦 Requirements
ox_inventory
ox_target
ox_lib

🔧 Configuration
You can edit everything in shared.lua:

Shared.Config = {
    DeleteItems = 15, -- Time (seconds) before items are deleted

    Discord = {
        Enabled = true,
        WebhookURL = "YOUR_WEBHOOK_URL",
        Username = "55 Development",
        AvatarURL = "https://mathisse.nl/logo.png",
        Titel = "♻️ Trash Log",
        Color = 3447003,
        FooterText = "55 Development"
    }
}


📄 Credits

Developed by 55 Development
Website: mathisse.nl
Discord: discord.mathisse.nl
