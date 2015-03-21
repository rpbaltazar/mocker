module Mocker
  class Place
    class << self
      def name
        I18n.t('places.names').sample
      end
    end
  end
end
