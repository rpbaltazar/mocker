module Mocker
  class Quote
    class << self
      def sentence
        sentence = I18n.t("quotes").sample
      end
    end
  end
end
