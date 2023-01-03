local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('rambo-itemcreation:client:createItem', function()
    local input = exports['qb-input']:ShowInput({
        header = "Create Item",
        submitText = "Create",
        inputs = {
            {
                text = 'Item Name:',
                name = 'item',
                type = 'text',
                isRequired = true
            },
            {
                text = 'Item Label:',
                name = 'label',
                type = 'text',
                isRequired = true
            },
            {
                type = 'number',
                isRequired = true,
                name = 'weight',
                text = 'Item Weight:'
            },
            {
                type = 'text',
                isRequired = true,
                name = 'image',
                text = 'Item Image:'
            },
            {
                text = "Unique Item:",
                name = "unique",
                type = "checkbox",
                isRequired = true,
                options = {
                    { value = "true", text = "True" },
                    { value = "false", text = "False" }
                }
            },
            {
                text = "Useable Item:",
                name = "useable",
                type = "checkbox",
                isRequired = true,
                options = {
                    { value = "true", text = "True" },
                    { value = "false", text = "False" }
                }
            },
            {
                text = "Should Close:",
                name = "shouldClose",
                type = "checkbox",
                isRequired = true,
                options = {
                    { value = "true", text = "True" },
                    { value = "false", text = "False" }
                }
            },
            {
                text = 'Combinable Item:(nil if false)',
                name = 'combinable',
                type = 'text',
                isRequired = true
            },
            {
                text = 'Item Description:',
                name = 'description',
                type = 'text',
                isRequired = true
            }
        }
    })
    if input then
        local item = input.item
        local label = input.label
        local weight = input.weight
        local image = input.image
        local unique = input.unique
        local useable = input.useable
        local shouldClose = input.shouldClose
        local combinable = input.combinable
        local description = input.description
        TriggerServerEvent('rambo-itemcreation:server:createItem', item, label, weight, image, unique, useable, shouldClose, combinable, description)
        QBCore.Functions.Notify('Item Created!', 'success', 7500)
    else
        QBCore.Functions.Notify('Item Creation Cancelled!', 'error', 7500)
    end
end)