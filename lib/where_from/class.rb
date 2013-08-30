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

end
