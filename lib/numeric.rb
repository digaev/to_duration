class Numeric
  def to_duration(options = {})
    ToDuration::Duration.new(self).to_s(options)
  end
end
