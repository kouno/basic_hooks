module BasicHooks
  class Listener
    def initialize
      @callbacks = {}
    end

    def register(action, callback, options)
      @callbacks[action] = { options.fetch(:event) => callback }
    end

    def trigger(action, event)
      callback = @callbacks[action][event]

      if callback.is_a?(Symbol)
        public_send(callback)
      end
    end
  end
end
