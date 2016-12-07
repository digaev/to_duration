require 'test_helper'

class ToDurationTest < ToDuration::Test
  def test_that_it_has_a_version_number
    refute_nil ::ToDuration::VERSION
  end

  def test_that_the_numeric_has_instance_method_to_duration
    assert Numeric.method_defined?(:to_duration)
  end

  def test_time
    assert_equal '1 second', 1.to_duration
    assert_equal '1 hour, 1 minute and 1 second', 3661.to_duration
    assert_equal '2 hours, 2 minutes and 2 seconds', 7322.to_duration
  end

  def test_date
    assert_equal '1 year, 1 month and 1 day', 342_360_00.to_duration
    assert_equal '2 years, 2 months and 2 days', 684_720_00.to_duration
  end

  def test_date_without_weeks
    assert_equal '1 year, 1 month and 8 days', 348_408_00.to_duration
    assert_equal '1 year, 1 month and 15 days', 354_456_00.to_duration
  end

  def test_date_with_weeks
    assert_equal '1 year, 1 month, 1 week and 1 day',
                 348_408_00.to_duration(week: true)
    assert_equal '1 year, 1 month, 2 weeks and 1 day',
                 354_456_00.to_duration(week: true)
  end
end
