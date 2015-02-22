require 'rails_helper'

describe CranPackages do

  context "getting packages" do
    before { mock_external_behavior }

    it "find out all packages" do
      expect(subject.all.size).to eq 1
    end

    describe "package data" do
      let(:package) { subject.all[0] }

      it "fills all package fields" do
        expect(package.name).to eq "pack1"
        expect(package.version).to eq "1.1.1"
        expect(package.publication).to eq "2013-03-26 19:58:40"
        expect(package.title).to eq "Pack1: Test"
        expect(package.description).to eq "Example"
        expect(package.authors).to eq "Juliano"
        expect(package.maintainers).to eq "Juliano <von.juliano@gmail.com>"
      end
    end

  end
end
