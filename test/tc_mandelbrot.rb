require_relative '../mandelbrot.rb'
require 'test/unit'

class TestMandelbrot < Test::Unit::TestCase
  def test_conversion
    mandel = Mandelbrot.new(10, 10, 1)
    assert_equal(1, mandel.scale_x(10))
    assert_equal(1, mandel.scale_y(10))
    assert_equal(-2.5, mandel.scale_x(0))
    assert_equal(-1, mandel.scale_y(0))
  end

  def test_range
    mandel = Mandelbrot.new(10, 10, 1)
    assert_raise( ArgumentError) { mandel.scale_x(11) }
    assert_raise( ArgumentError) { mandel.scale_y(11) }
    assert_raise( ArgumentError) { mandel.scale_x(-1) }
    assert_raise( ArgumentError) { mandel.scale_y(-1) }
  end

end


