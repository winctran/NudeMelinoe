---@meta _
-- globals we define are private to our plugin!
---@diagnostic disable: lowercase-global

-- here is where your mod sets up all the things it will do.
-- this file will not be reloaded if it changes during gameplay
-- 	so you will most likely want to have it reference
--	values and functions later defined in `reload.lua`.

local texture_name = "NudeMelinoe/MelinoeSkin"

if CurrentRun ~= nil then
    SetThingProperty({
        Property = "GrannyTexture",
        Value = texture_name,
        DestinationId = CurrentRun.Hero.ObjectId
    })
end

modutil.mod.Path.Wrap("SetThingProperty", function(base, args)
    if CurrentRun.Hero.SubtitleColor ~= Color.ChronosVoice and
        (MapState.HostilePolymorph == false or MapState.HostilePolymorph == nil) and
        args.Property == "GrannyTexture" and
        (args.Value == "null" or args.Value == "") and
        args.DestinationId == CurrentRun.Hero.ObjectId then
        args_copy = DeepCopyTable(args)
        args_copy.Value = texture_name
        base(args_copy)
    else
        base(args)
    end
end)

modutil.mod.Path.Wrap("SetupMap", function(base)
    LoadPackages({ Name = { "NudeMelinoe" } })
    base()
end)
