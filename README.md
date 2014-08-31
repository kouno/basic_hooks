## Basic Hooks

TLDR: Look into TracePoint or Kernel#set\_trace\_func.

So it turns out that overriding send doesn't work since in fact all calls to
any function pass by \_\_send\_\_ and `send` just calls it behind the scene.
Hence why you can overwrite send and all messages are still sent properly.
