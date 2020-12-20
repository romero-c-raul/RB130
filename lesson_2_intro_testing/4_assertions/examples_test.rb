require 'minitest/reporters'
MiniTest::Reporters.use!

require 'minitest/autorun'

require_relative 'examples'

class CarTest < MiniTest::Test
  
  # 1. assert
  def test_car_exists
    car = Car.new
    assert(car)
  end
  
  # 2. assert_equal
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end
  
  # 3. assert_nil
  def test_name_is_nil
    car = Car.new
    assert_nil(car.name)
  end
  
  # 4. assert_raises
  def test_raise_initialize_with_arg
    assert_raises(ArgumentError) do
      car = Car.new(name: "Joey")   # This raises argument error so assertion passes
    end
  end
  
  # 5. assert_instance_of
  def test_instance_of_car
    car = Car.new
    assert_instance_of(Car, car)
  end
  
  # 6. assert_includes
  def test_includes_car
    car = Car.new
    arr = [1, 2, 3]
    arr << car
    
    assert_includes(arr, car)
  end

  # assert_includes calls assert_equal in its implementation, and Minitest counts that call
  # as a separate assertion. For each assert_includes call, you will get 2 assertions, not 1.
end