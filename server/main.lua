local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    for k,v in pairs(Config.Items) do
        QBCore.Functions.AddItems({
            [v.item] = {
                name = v.item,
                label = v.label,
                weight = v.weight,
                type = 'item',
                image = v.image,
                unique = v.unique,
                useable = v.useable,
                shouldClose = v.shouldClose,
                combinable = v.combinable,
                description = v.description
            },
        })
    end
end)

RegisterNetEvent('rambo-itemcreation:server:createItem', function(item, label, weight, image, unique, useable, shouldClose, combinable, description)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        if QBCore.Functions.HasPermission(source, 'god') then
            local newItem = {}
            newItem.item = item
            newItem.label = label
            newItem.weight = weight
            newItem.image = image
            newItem.unique = unique
            newItem.useable = useable
            newItem.shouldClose = shouldClose
            newItem.combinable = combinable
            newItem.description = description
            local path = GetResourcePath(GetCurrentResourceName())
            path = path:gsub('//', '/')..'/shared/config.lua'
            local file = io.open(path, 'a+')
            local clabel
            clabel = '\n\n-- '..item.. ' by '..Player.PlayerData.name..'\nConfig.Items[\''..item..'\'] = {'
            file:write(clabel)
            file:write('\n\titem = \''..item..'\',')
            file:write('\n\tlabel = \''..label..'\',')
            file:write('\n\tweight = '..weight..',')
            file:write('\n\timage = \''..image..'\',')
            file:write('\n\tunique = '..unique..',')
            file:write('\n\tuseable = '..useable..',')
            file:write('\n\tshouldClose = '..shouldClose..',')
            file:write('\n\tcombinable = '..combinable..',')
            file:write('\n\tdescription = \''..description..'\',')
            file:write('\n}')
            file:close()
            
            Config.Items[item] = newitem

            QBCore.Functions.AddItems({
                [item] = {
                    name = item,
                    label = label,
                    weight = weight,
                    type = 'item',
                    image = image,
                    unique = unique,
                    useable = useable,
                    shouldClose = shouldClose,
                    combinable = combinable,
                    description = description
                },
            })
        end
    end
end)

QBCore.Commands.Add('newitem', 'Create a new item', {}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        if QBCore.Functions.HasPermission(source, 'god') then
            TriggerClientEvent('rambo-itemcreation:client:createItem', src)
        end
    end
end, 'god')