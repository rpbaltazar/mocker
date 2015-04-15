require "spec_helper"

describe Mocker::Quote do
  let(:available_quotes){ I18n.t 'quotes' }

  describe "sentence" do
    it "returns a very inspirational sentence" do
      quote = Mocker::Quote.sentence
      expect(available_quotes).to include quote
    end
  end
end
