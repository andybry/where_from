class Class

  #
  # Returns an array of Class objects in inheritance order. 
  # Exactly like #ancestors, but for classes only
  #
  def superclasses
    all_ancestors = self.ancestors
    all_ancestors.select do |modyule|
      modyule.class == Class
    end
  end


  #
  # 
  #
  def superclasses_with_method(method_symbol)
    all_superclasses = superclasses
    all_superclasses.select do |klass|
      klass.method_defined? method_symbol
    end
  end

end
