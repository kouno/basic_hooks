## Basic Hooks

Add ability to place hooks on any methods in ruby. This applies to methods that aren't defined yet (lazy evaluation).

## Usage

Hooks respond to events on the instance. Here are the default events that you can hook in right away:
* before
* after
* on\_error

```ruby
class Car
  include BasicHooks

  before :drive, :log_action
  after :drive, :log_action
  on_error :drive, :log_action
  def drive
  end

  def log_action(method_call, result = nil)
    # method_call.name
    # method_call.args
    # method_call.block
    logger.warn("#{method_call.name} was called with #{method_call.args}")
  end
end
```

You can call before multiple times if necessary:

```ruby
class Car
  include BasicHooks

  before :drive, :log_action
  before :drive, :log_action_with_style
end
```

Hooks are executed in the same order as they are registered.

Hooks can be defined within a block to avoid scope issues:

```ruby
class Car
  # other module which defines before and after
  include SomeOtherModule
  include BasicHooks

  define_hooks do
    before :drive, :log_action
    before :drive, :log_action_with_style
  end
end
```



