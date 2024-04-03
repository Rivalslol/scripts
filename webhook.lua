function SendMessage(url, message)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["content"] = message
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("Sent")
end

function SendMessageEMBED(url, embed)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["embeds"] = {
            {
                ["title"] = embed.title,
                ["description"] = embed.description,
                ["color"] = embed.color,
                ["fields"] = embed.fields,
                ["footer"] = {
                    ["text"] = embed.footer.text
                }
            }
        }
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("Sent")
end


local playerName = game.Players.LocalPlayer.Name
local placeName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local placeId = game.PlaceId
local player = game.Players.LocalPlayer
local userId = player.UserId

local url = "https://discord.com/api/webhooks/1223152300445532282/3UotwF-8fr0erWiRLQYI3rwLbeENhJuu2CtimKqf3TQeB3t9_ecD4bwg-tjD_lm7lc3R"


local embed = {
    ["title"] = "**Someone Executed Pet Catchers**",
    ["description"] = "Username ```" .. playerName .. "```",
    ["color"] = 65280,
    ["fields"] = {
        {
            ["name"] = "User ID",
            ["value"] = "```" .. userId .. "```"
        },
        {
            ["name"] = "Place Name",
            ["value"] = "```" .. placeName .. "```"
        },
        {
            ["name"] = "Place ID",
            ["value"] = "```" .. placeId .. "```"
        },
        {
            ["name"] = "Game Invite [ CONSOLE ]",
            ["value"] = '```' .. 'Roblox.GameLauncher.joinGameInstance("' .. game.PlaceId .. '","' .. game.JobId .. '")' .. '```'
        }
    },
    ["footer"] = {
        ["text"] = "Pet Catchers"
    }
}
SendMessageEMBED(url, embed)