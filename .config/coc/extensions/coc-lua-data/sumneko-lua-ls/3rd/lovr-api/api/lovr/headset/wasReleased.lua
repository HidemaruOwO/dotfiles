return {
  tag = 'input',
  summary = 'Check if a button was just released.',
  description = 'Returns whether a button on a device was released this frame.',
  arguments = {
    {
      name = 'device',
      type = 'Device',
      description = 'The device.'
    },
    {
      name = 'button',
      type = 'DeviceButton',
      description = 'The button to check.'
    }
  },
  returns = {
    {
      name = 'released',
      type = 'boolean',
      description = 'Whether the button on the device was released this frame.'
    }
  },
  notes = [[
    Some headset backends are not able to return pressed/released information.  These drivers will
    always return false for `lovr.headset.wasPressed` and `lovr.headset.wasReleased`.

    Typically the internal `lovr.headset.update` function will update pressed/released status.
  ]],
  related = {
    'DeviceButton',
    'lovr.headset.isDown',
    'lovr.headset.wasPressed',
    'lovr.headset.isTouched',
    'lovr.headset.getAxis'
  }
}
