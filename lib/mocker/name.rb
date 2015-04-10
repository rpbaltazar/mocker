module Mocker
  class Name
    class << self
      def famous_person
        I18n.t("names.famous_people").sample
      end

      def full_name
        "#{first_name} #{last_name}"
      end

      def first_name
        all_first = I18n.t("names.first")
        all_first.values.flatten.sample
      end

      def last_name
        I18n.t("names.last").sample
      end
    end
  end
end
