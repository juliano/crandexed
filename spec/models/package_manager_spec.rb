require 'rails_helper'

describe PackageManager do

  describe "update" do
    let(:package) { Package.new(name: "Dracarys", version: "1.2.3") }
    before do
      expect_any_instance_of(CranPackages).to receive(:all).and_return([package])
    end

    context "new package" do
      it "persists the package" do
        described_class.update
        expect(Package.count).to eq 1
      end
    end

    context "existing package" do
      before { package.save }

      it "doesn't persist the package again" do
        described_class.update
        expect(Package.count).to eq 1
      end
    end
  end

end
