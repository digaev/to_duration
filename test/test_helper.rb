$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'i18n'
require 'minitest/autorun'
require 'to_duration'

module ToDuration
  class Test < Minitest::Test
    def setup
      I18n.available_locales = [:en]
      I18n.locale = :en
      I18n.load_path = [[File.join(locales_dir, "#{I18n.locale}.yml")]]
    end

    protected

    def locales_dir
      File.join(File.dirname(__FILE__), 'test_data', 'locales')
    end
  end
end
