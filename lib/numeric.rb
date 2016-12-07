class Numeric
  def to_duration(options = {})
    ToDuration::Converter.call(to_i, options)
  end
end
