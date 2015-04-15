require "spec_helper"
require "byebug"

describe Mocker::Name do
  let(:available_names){ I18n.t 'names.famous_people' }
  let(:female_names) { I18n.t 'names.first.female' }
  let(:male_names) { I18n.t 'names.first.male' }
  let(:first_names){
    female_names + male_names
  }
  let(:last_names){ I18n.t 'names.last' }

  describe "famous_person" do
    it "returns a name of an existing person from the list" do
      famous_person = Mocker::Name.famous_person
      expect(available_names).to include famous_person
    end
  end

  describe "first_name" do
    it "returns a first name from the list" do
      first_name = Mocker::Name.first_name
      expect(first_names).to include first_name
    end
  end

  describe "last_name" do
    it "returns a last name from the list" do
      last_name = Mocker::Name.last_name
      expect(last_names).to include last_name
    end
  end

  describe "full_name" do
    it "returns a first name + last name from the list" do
      full_name = Mocker::Name.full_name
      name_parts = full_name.split ' '
      expect(first_names).to include name_parts[0]
      expect(last_names).to include name_parts[1]
    end
  end

  describe "female_name" do
    it "returns a female first name and any last name from the list" do
      female_name = Mocker::Name.full_name("female")
      name_parts = female_name.split ' '
      expect(female_names).to include name_parts[0]
      expect(last_names).to include name_parts[1]
    end
  end

  describe "female_first" do
    it "returns a female first name from the list" do
      female_name = Mocker::Name.first_name("female")
      expect(female_names).to include female_name
    end
  end

  describe "male_name" do
    it "returns a male first name and any last name from the list" do
      male_name = Mocker::Name.full_name("male")
      name_parts = male_name.split ' '
      expect(male_names).to include name_parts[0]
      expect(last_names).to include name_parts[1]
    end
  end

  describe "male_first" do
    it "returns a male first name from the list" do
      male_name = Mocker::Name.first_name("male")
      expect(male_names).to include male_name
    end
  end
end
