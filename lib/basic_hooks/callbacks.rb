module BasicHooks
  module Callbacks
    def watch(action, callback, options = {})
      basic_hooks.register(action, callback, options)
    end
  end
end
