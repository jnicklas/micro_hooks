MicroHooks
==========

Hooks are a mechanism for allowing other code to hook into your library in a very modular way.
It's basically a really, really simple way to implement callbacks. It works like this:

Create a class, include MicroHooks and add some hooks in your methods.

    require 'rubygems'
    require 'micro_hooks'

    class SomeClass

      include MicroHooks

      def foo
        hook :before_foo
        puts "Monkey"
        hook :after_foo
      end

      def baz
        puts "-> Ape"
      end

      def quox
        puts "-> Bear"
      end

    end

You can then add some hooks

    SomeClass.before :foo, :baz
    SomeClass.after :foo, :quox

    s = SomeClass.new
    s.foo
    
The result here would be:

    -> Ape
    Monkey
    -> Bear

You can also pass arguments to hooks.

    def foo(bar)
      hook :quox, bar
    end
    
    def baz(bar)
      
    end
    
If baz is added as a hook on quox, then baz will be called with bar as an argument. (are you following?)