local sunrise = 360
local daytime = 480
local sunset  = 1080
local nighttime = 1200

local daylight = 250
local nightlight = 40
local lightLevel = 40

-- the formula makes it easy to tweak the duration of the
-- sunrise or sunset without breaking the seamless transition
local lightChangeSunrise = (dayLight - nightLight) / (daytime - sunrise)
local lightChangeSunset = (dayLight - nightLight) / (nighttime - sunrset)

local function updateWorldLight()
	if getWorldTime() >= sunrise and getWorldTime() < daytime then
		lightLevel = ((daytime - sunrise) - (daytime - getWorldTime())) * lightChangeSunrise + nightLight
	elseif getWorldTime() >= sunset and getWorldTime() < nighttime then
		lightLevel = dayLight - ((getWorldTime() - sunset) * lightChangeSunset)
	elseif getWorldTime() >= nighttime or getWorldTime() < sunrise then
		lightLevel = nightLight
	else
		lightLevel = dayLight
	end
	setWorldLight(lightLevel, 215)
end

function onThink(interval)
	updateWorldLight()
	return true
end

function onStartup()
	updateWorldLight()
	return true
end