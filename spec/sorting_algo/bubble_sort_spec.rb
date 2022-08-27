RSpec.describe SortingAlgo::BubbleSort do
  let(:valid_input) do
    collection = proc { (-9999...9999).step(0.1).to_a }
    collection_size = rand(1000)
    collection_size.times.map { collection.call.sample }.shuffle
  end

  let(:invalid_input) do
    set = proc { ("a".."z").step(2).to_a }
    set_size = rand(50)
    set_size.times.map { set.call.sample }.shuffle
  end

  describe "#new" do
    shared_examples "be an instance of #{described_class}" do |input_value|
      instance = described_class.new(input_value)
      expect(instance).to be_an_instance_of described_class
    end

    context "when input is empty" do
      it_behaves_like "be an instance of #{described_class}", []
    end

    context "when input is invalid" do
      it_behaves_like "be an instance of #{described_class}", invalid_input
    end

    context "when input is valid" do
      it_behaves_like "be an instance of #{described_class}", valid_input
    end
  end

  describe "##{described_class}" do
    context "when Input collection is empty" do
      it "display message Try Again" do
        instance = described_class.new([])
        expect(instance.run).to eq("No Input provided Please Try Again!")
      end
    end

    context "when Input collection is invalid" do
      it "should display the inputs are non numeric" do
        instance = described_class.new(invalid_input)
        expect(instance.run).to eq "Invalid Collection numbers, Try Again!"
      end
    end

    context "when Input collection is valid" do
      it "sort numbers in ascending order" do
        instance = described_class.new(valid_input)
        expect(instance.run).to eq valid_input.sort
      end
    end
  end
end
