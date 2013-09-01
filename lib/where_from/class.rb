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
  # Return an array of all Classes containing a given
  # method in inheritance order
  #
  # method_symbol - the name of the method to search by
  #
  def superclasses_with_method(method_symbol)
    all_superclasses = superclasses
    all_superclasses.select do |klass|
      klass.method_defined? method_symbol
    end
  end

end
