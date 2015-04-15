module Mocker
  class Name
    class << self
      def famous_person
        I18n.t("names.famous_people").sample
      end

      def full_name gender=nil
        "#{first_name gender} #{last_name}"
      end

      def first_name gender=nil
        translation="names.first"
        translation+=".#{gender}" if gender

        all_first = I18n.t translation
        all_first = all_first.values.flatten if all_first.is_a? Hash
        all_first.sample
      end

      def last_name
        I18n.t("names.last").sample
      end
    end
  end
end
