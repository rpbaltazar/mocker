require "mocker/version"
mocker_dir = File.expand_path(File.dirname(__FILE__))

require "i18n"

I18n.load_path += Dir[File.join(mocker_dir, 'locales', '*.yml')]

module Mocker
  # Your code goes here...
end

require "mocker/exceptions"
require "mocker/place"
