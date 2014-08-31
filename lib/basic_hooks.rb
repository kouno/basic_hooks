require 'basic_hooks/callbacks'
require 'basic_hooks/listener'

module BasicHooks
  def self.included(base)
    base.extend(BasicHooks::Callbacks)

    base.class_eval do
      def self.basic_hooks
        @basic_hooks ||= BasicHooks::Listener.new
      end
    end
  end
end

class Object
  def notify_basic_hooks(*args)
    method = args.first
    self.class.basic_hooks.trigger(:before, method)
    pre_basic_hooks_send(*args, &block)
    self.class.basic_hooks.trigger(:after, method)
  rescue Exception => e
    self.class.basic_hooks.trigger(:exception, method)
    raise e
  ensure
    self.class.basic_hooks.trigger(:ensure, method)
  end

  def send(*args, &block)
    if self.class.respond_to?(:basic_hooks)
      notify_basic_hooks(*args)
    else
      pre_basic_hooks_send(*args, &block)
    end
  end
end
