for category, bindings in pairs(keybinds_config) do
  for binding_idx, binding_data in ipairs(bindings) do
    local command_name = 'kb_' .. category .. binding_data.id
    local command_description = '(' .. category .. ') ' .. binding_data.description

    local default_mapper = binding_data.default_mapper or 'keyboard'
    local default_parameter = binding_data.default_parameter

    if default_parameter then
      if binding_data.callback_on and binding_data.callback_off then
        RegisterCommand('+' .. command_name, function()
          binding_data.callback_on()
        end)

        RegisterCommand('-' .. command_name, function()
          binding_data.callback_off()
        end)

        RegisterKeyMapping('+' .. command_name, command_description, default_mapper, default_parameter)
      elseif binding_data.callback then
        RegisterCommand(command_name, function()
          binding_data.callback()
        end)

        RegisterKeyMapping(command_name, command_description, default_mapper, default_parameter)
      end
    end
  end
end
