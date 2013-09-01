describe Module do

  describe "#ancestors_with_method" do
    it "exists as a method on Module objects" do
      module MyModule; end
      expect(MyModule.respond_to? :ancestors_with_method).to be(true)
        Object.send :remove_const, :MyModule
    end

    context "when called on a module without a method" do
      it "returns an empty array" do
        module MyModule; end
        expect(
          MyModule.ancestors_with_method :undefined_method_name
        ).to eq([])
        Object.send :remove_const, :MyModule
      end
    end

    context "when called on a module which defines a method" do
      it "returns a 1 element array containing the module" do
        module MyModule; def meth1; end; end
        expect(MyModule.ancestors_with_method :meth1).to eq([MyModule])
        Object.send :remove_const, :MyModule
      end
    end

    context "when called on a module which inherits a method" do
      it "returns an array of all superclasses which define or inherit the method" do
        module MyModuleA; def meth1; end; end
        module MyModuleB; include MyModuleA; end
        module MyModuleC; include MyModuleB; end;
        expect(
          MyModuleC.ancestors_with_method :meth1
        ).to eq([MyModuleC, MyModuleB, MyModuleA])
        Object.send :remove_const, :MyModuleC
        Object.send :remove_const, :MyModuleB
        Object.send :remove_const, :MyModuleA
      end
    end

  end # end of superclasses_with_method method definition
 

end
