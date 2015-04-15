require "spec_helper"
require "byebug"

describe Mocker::Place do
  let(:available_names){
    all_countries_places = I18n.t 'places'
    all_countries_places.values.flatten
  }

  let(:available_names_in_us){ I18n.t 'places.us' }

  describe "name" do
    it "returns a name of an existing location, from the list" do
      random_place = Mocker::Place.name
      expect(available_names).to include random_place
    end

    describe "when passing a country code argument" do
      describe "when country argument is valid" do
        describe "when Mocker has a place in that country" do
          it "returns a name of a place in the argument country" do
            random_us_place = Mocker::Place.name "us"
            expect(available_names_in_us).to include random_us_place
          end
        end

        describe "when Mocker does not have a place in that country" do
          it "throws an inexisting places for country error" do
            expect {Mocker::Place.name "pt"}.to raise_error Mocker::Place::CountryNotFoundError
          end
        end
      end
    end
  end

  describe "name_in" do
    let(:expected_output) {
      "Mocker::Place.name_in method is deprecated and will be removed in 1.0.0\nPlease use Mocker::Place.name '#{country_code}' instead\n"
    }
    describe "when country argument is valid" do

      describe "when Mocker has a place in that country" do
        let(:country_code) { "us" }

        it "returns a name of a place in the argument country" do
          random_us_place = Mocker::Place.name_in country_code
          expect(available_names_in_us).to include random_us_place
          expect{ Mocker::Place.name_in country_code }.to output(expected_output).to_stdout
        end
      end

      describe "when Mocker does not have a place in that country" do
        let(:country_code) { "pt" }

        it "throws an inexisting places for country error" do
          expect {Mocker::Place.name_in "pt"}.to raise_error Mocker::Place::CountryNotFoundError
        end
      end
    end

    describe "when country argument is empty" do
      let(:country_code) { "" }
      it "defaults to Mocker::Place.name" do
        random_conchichine_place = Mocker::Place.name_in
        expect(available_names).to include random_conchichine_place
      end
    end
  end
end
