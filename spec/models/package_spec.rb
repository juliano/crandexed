require 'rails_helper'

describe Package do
  subject { described_class.new(name: "SpongeBob", version: "2.2.2") }

  it "knows it's own url" do
    expect(subject.url).to eq "http://cran.r-project.org/src/contrib/SpongeBob_2.2.2.tar.gz"
  end

  describe "#exists?" do
    it "knows when itself exists in the base" do
      subject.save
      expect(subject.exists?).to be true
    end

    it "knows when itself doesn't exist in the base" do
      expect(subject.exists?).to be false
    end
  end
end
