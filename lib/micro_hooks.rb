module MicroHooks
  def self.included(base)
    super
    base.extend ClassMethods
  end
  
  module ClassMethods
    def hooks(kind)
      @hooks ||= {}
      @hooks[kind] ||= []
      @hooks[kind]
    end
    
    def before(kind, name)
      add_hook("before_#{kind}", name)
    end
    
    def after(kind, name)
      add_hook("after_#{kind}", name)
    end

    def add_hook(kind, name)
      self.hooks(kind.to_sym) << name
    end
  end
  
  def hook(kind, *args)
    self.class.hooks(kind).each { |name| self.send(name, *args) }
  end
end