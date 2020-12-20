require 'minitest/reporters'
MiniTest::Reporters.use!

require 'minitest/autorun'

require_relative 'car'

class CarTest < MiniTest::Test
  def test_wheels                 # Test won't fail
    car = Car.new
    assert_equal(4, car.wheels)
  end
  
  def test_bad_wheels
    skip("Test made to fail on purpose")
    car = Car.new
    assert_equal(3, car.wheels)   # Test will fail
  end
  
end