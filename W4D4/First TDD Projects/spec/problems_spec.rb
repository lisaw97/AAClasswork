require 'problem'

RSpec.describe Array do
  subject(:arr) { [1, 2, 1, 3, 3] }
  describe "#my_unique" do
    it "remove duplicates from an array" do
      expect(arr.my_unique).to eq([1, 2, 3])
    end

    it "elements remain in the order they first appeared" do
      expect(arr.my_unique).to eq([1, 2, 3])
    end

    it "does not call .unique" do
      expect(arr.my_unique).to_not eq(:uniq)
    end
  end

  describe "#two_sum" do
  subject(:arr) { [-1,0,2,-2,1] }
    it "return pairs of indexs where positon sum too 0" do
      expect(arr.two_sum).to eq([[0,4],[2,3]])
    end
    it "returns smaller first element first" do
      expect(arr.two_sum).to eq([[0,4],[2,3]])
    end
    it "returns smaller second elements first" do
      expect(arr.two_sum).to eq([[0,4],[2,3]])
    end
  end

  describe "#my_transpose" do
    subject(:arr) { [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
    ] }
    
    # before(:each) do
    #   expect(arr).to_not receive(:transpose)
    # end

    it "should transpose the array 1 time" do
      expect(arr.my_transpose).to eq(arr.transpose)
    end

    it "should not call .transpose" do
      # expect {arr.my_transpose}.to_not receive(:transpose)
    end
  end
  
  describe "#stock_picker" do
    subject(:arr) { [10, 40, 3, 34, 23]}
    it "should return most profitable pair of days" do
      expect(arr.stock_picker).to eq([2, 3])
    end

    it "cannot sell before you buy" do
      expect(arr.stock_picker).not_to eq([2, 1])
    end
  end

end



