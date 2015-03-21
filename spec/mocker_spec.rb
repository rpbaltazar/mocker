require "spec_helper"
require "byebug"

describe Mocker do
  describe "Place Name Mocker" do
    let(:available_names){
      I18n.t 'intialize'
      translations = I18n.backend.send(:translations)
      translations[:en][:places][:names]
    }

    it "returns a name of an existing location, from the list" do
      puts Mocker::VERSION
      random_name = Mocker::Place.name
      expect(available_names).to include random_name
    end
  end
end
