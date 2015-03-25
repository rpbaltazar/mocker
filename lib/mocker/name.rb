module Mocker
  class Name
    class << self
      def famous_person
        I18n.t("names").sample
      end

      def full_name
        "#{first_name} #{last_name}"
      end

      def first_name
        "a"
      end

      def last_name
        "b"
      end
    end
  end
end
