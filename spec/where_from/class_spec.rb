describe Class do

  describe "#superclasses" do

    it "exists as a method on Class objects" do
      class MyClass1; end
      expect(MyClass1.respond_to? :superclasses).to be_true
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
        class MyClass2; end
        expect(MyClass2.superclasses).to eq([MyClass2, Object, BasicObject])
      end
    end

    context "when called on a class declared to inherit from another" do
      it "returns [<Klass>, <flattened parent class chain>]" do
        class MyClass3; end
        class MyClass4 < MyClass3; end
        expect(MyClass4.superclasses).to eq([MyClass4, *MyClass3.superclasses])
      end
    end

  end # end of superclass method definition

  
  describe "#ancestors_with_method" do
  end

end
