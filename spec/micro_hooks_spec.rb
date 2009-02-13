$:.push File.join(File.dirname(__FILE__), '..', 'lib')

require 'micro_hooks'

require 'rubygems'
require 'spec'

describe MicroHooks do
  before do
    @class = Class.new
    @class.send :include, MicroHooks
  end
  
  describe ".add_hook" do
    it "should add a hook" do
      @class.class_eval do
        def foo
          hook :monkey
        end
      end
      @instance = @class.new
      
      @class.add_hook :monkey, :bar
      
      @instance.should_receive(:bar)
      
      @instance.foo
    end
    
    it "should a few different hooks" do
      @class.class_eval do
        def foo
          hook :monkey
        end
        
        def baz
          hook :llama
        end
      end
      @instance = @class.new
      
      @class.add_hook :monkey, :bar
      @class.add_hook :monkey, :quox
      @class.add_hook :llama, :blah
      
      @instance.should_receive(:bar)
      @instance.should_receive(:quox)
      @instance.should_not_receive(:blah)
      
      @instance.foo
    end
    
    it "should add a hook with arguments" do
      @class.class_eval do
        def foo
          hook :monkey, "monkey", 42
        end
      end
      @instance = @class.new
      
      @class.add_hook :monkey, :bar
      
      @instance.should_receive(:bar).with("monkey", 42)
      
      @instance.foo
    end
  end
  
  describe ".before" do
    it "should add a hook, prefixed with 'before'" do
      @class.class_eval do
        def foo
          hook :before_monkey
        end
      end
      @instance = @class.new
      
      @class.before :monkey, :bar
      
      @instance.should_receive(:bar)
      
      @instance.foo
    end
  end
  
  describe ".after" do
    it "should add a hook, prefixed with 'after'" do
      @class.class_eval do
        def foo
          hook :after_monkey
        end
      end
      @instance = @class.new
      
      @class.after :monkey, :bar
      
      @instance.should_receive(:bar)
      
      @instance.foo
    end
  end
end