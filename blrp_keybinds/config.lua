keybinds_config = {
  ['Doors'] = {
    {
      id = 'doorkeyfoot',
      description = 'Unlock door (on foot)',
      default_parameter = 'U',
      callback = function()
        TriggerEvent('blrp_doors:client:searchDoorLock')
      end
    },
    {
      id = 'doorkeygate',
      description = 'Unlock gate (from vehicle)',
      default_parameter = 'L',
      callback = function()
        TriggerEvent('blrp_doors:client:searchGateLock')
      end
    },
  },

  ['Helicam'] = {
    {
      id = 'streets',
      description = 'Toggle Street Overlay',
      default_parameter = '',
      callback = function()
        TriggerEvent('helicam:client:toggleStreetOverlay')
      end
    }
  },

  ['Vehicles'] = {
    {
      id = 'glovebox',
      description = 'Open Glovebox',
      default_parameter = 'B',
      callback = function()
        TriggerEvent('core:client:vehicle-storage:openGlovebox')
      end
    },
    {
      id = 'gunrack',
      description = 'Open Gun rack',
      default_parameter = 'RBRACKET',
      callback = function()
        if IsControlPressed(1, 21) then
          return
        end

        TriggerEvent('core:client:vehicle-storage:openGunrack')
      end
    },
  },
}
