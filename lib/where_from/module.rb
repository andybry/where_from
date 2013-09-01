class Module

  #
  # select ancestors with a given method
  # 
  # method_symbol - the method name
  #
  def ancestors_with_method(method_symbol)
    ancestors.select do |modyule|
      modyule.method_defined? method_symbol
    end
  end

end
