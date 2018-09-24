require 'to_duration/version'
require 'to_duration/duration'
require_relative 'numeric'

module ToDuration
  def self.t(key, options = {})
    I18n.t("to_duration.#{key}", options)
  end
end
