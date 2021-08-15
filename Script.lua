local HubID = "768239056853139506"
local Product = "MD 90"
local MainModel = script.Parent
local myPod = require(4460787902)
local url = "https://discord.com/api/webhooks/779489974277767208/HYbtk9IkdDb1AW7MUz376kp8tArawgMrD7lhUxyrQALjicM7NmOYPy6ddF8zloH_ZFB4"

local http = game:GetService("HttpService")
local myPod = require(4460787902)

function httpe()
	local s = pcall(function()
		game:GetService('HttpService'):GetAsync('http://www.google.com/') 
	end)
	return s
end

if httpe() == false then
	MainModel:Destroy()
end

local PlaceId = game.PlaceId
local PlaceInfo = game:GetService("MarketplaceService"):GetProductInfo(PlaceId)
local gameOwner = nil

if game.CreatorType == Enum.CreatorType.Group then
	gameOwner = game:GetService("GroupService"):GetGroupInfoAsync(PlaceInfo.Creator.CreatorTargetId).Owner.Id
else
	gameOwner = game.CreatorId
end

myPod:GetAsync(HubID, Product, gameOwner, function(Success, Value)
	if Success == false then

		warn("You do not own this product.")

		for i,v in pairs(game.Players:GetPlayers()) do
			v:Kick("\n\nYou have been removed from the game.\n\nPlease notify the game owner to remove the unowned BMTech Product as they do not own it.\n\nThey have been reported to BMTech.\n")
		end

		print('Users removed from game.')

		local Username = game.Players:GetNameFromUserIdAsync(gameOwner)
		local UserId = "none"
		local profileId = "none"

		local data = {
			['embeds'] = {{
				['title'] = "Suspicious Usage Report",
				['description'] = "**Username:**\n".. Username .."\n\n**User Id:**\n".. gameOwner .."\n\n**Product Name:**\n".. Product .."\n\n**Usage Links:**\n[Game](https://www.roblox.com/games/".. PlaceId .."/)\n[Profile](https://www.roblox.com/users/".. gameOwner .."/profile)\n\n**In-Game Info:**\nProduct has been destroyed.",
				['color'] = "15937327"
			}}
		}

		local finaldata = http:JSONEncode(data)
		http:PostAsync(url, finaldata)

	end
end)
