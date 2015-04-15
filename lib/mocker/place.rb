module Mocker
  class Place
    class CountryNotFoundError < StandardError
    end

    class << self
      def name country_code=nil
        translation = "places"
        translation+=".#{country_code}" if country_code
        all_places = I18n.t translation
        all_places = all_places.values.flatten if all_places.is_a? Hash

        if all_places.is_a?(String) && all_places.match('translation missing')
          raise Mocker::Place::CountryNotFoundError
        else
          all_places.sample
        end
      end

      #NOTE: deprecated
      def name_in country_code=nil
        puts "Mocker::Place.name_in method is deprecated and will be removed in 1.0.0"
        puts "Please use Mocker::Place.name '#{country_code}' instead"
        return self.name country_code
      end
    end
  end
end
