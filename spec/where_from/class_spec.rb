describe Class do

  describe "#superclasses" do

    it "exists as a method on Class objects" do
      class MyClass; end
      expect(MyClass.respond_to? :superclasses).to be_true
      Object.send :remove_const, :MyClass
    end

    context "when called on BasicObject" do
      it "returns the array [BasicObject]" do
        expect(BasicObject.superclasses).to eq([BasicObject])
      end
    end

    context "when called on Object" do
      it "returns the array [BasicObject]" do
        expect(Object.superclasses).to eq([Object, BasicObject])
      end
    end

    context "when called on a class <Klass> inheriting from Object" do
      it "returns [<Klass>, Object, BasicObject]" do
        class MyClass; end
        expect(MyClass.superclasses).to eq([MyClass, Object, BasicObject])
        Object.send :remove_const, :MyClass
      end
    end

    context "when called on a class declared to inherit from another" do
      it "returns [<Klass>, <flattened parent class chain>]" do
        class MyClassA; end
        class MyClassB < MyClassA; end
        expect(MyClassB.superclasses).to eq(
          [MyClassB, *MyClassA.superclasses]
        )
        Object.send :remove_const, :MyClassB
        Object.send :remove_const, :MyClassA
      end
    end

  end # end of superclasses method definition

  
  describe "#superclasses_with_method" do
    it "exists as a method on Class objects" do
      class MyClass; end
      expect(MyClass.respond_to? :superclasses_with_method).to be(true)
        Object.send :remove_const, :MyClass
    end

    context "when called on a class without a method" do
      it "returns an empty array" do
        class MyClass; end
        expect(
          MyClass.superclasses_with_method :undefined_method_name
        ).to eq([])
        Object.send :remove_const, :MyClass
      end
    end

    context "when called on a class which defines a method" do
      it "returns a 1 element array containing the class" do
        class MyClass; def meth1; end; end
        expect(MyClass.superclasses_with_method :meth1).to eq([MyClass])
        Object.send :remove_const, :MyClass
      end
    end

    context "when called on a class which inherits a method" do
      it "returns an array of all superclasses which define or inherit the method" do
        class MyClassA; def meth1; end; end
        class MyClassB < MyClassA; end
        class MyClassC < MyClassB; end;
        expect(
          MyClassC.superclasses_with_method :meth1
        ).to eq([MyClassC, MyClassB, MyClassA])
        Object.send :remove_const, :MyClassC
        Object.send :remove_const, :MyClassB
        Object.send :remove_const, :MyClassA
      end
    end

  end # end of superclasses_with_method method definition
  
end
