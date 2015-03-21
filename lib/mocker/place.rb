module Mocker
  class Place
    class CountryNotFoundError < StandardError
    end

    class << self
      def name
        all_places = I18n.t("places")
        all_places.values.flatten.sample
      end

      def name_in country_code=nil
        return self.name if country_code.nil?

        country_places = I18n.t("places.#{country_code}")
        if country_places.is_a?(Array) && country_places.length > 0
          country_places.sample
        else
          raise Mocker::Place::CountryNotFoundError
        end
      end
    end
  end
end
