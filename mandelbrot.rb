# mandelbrot/mandelbrot.rb
class Mandelbrot
  attr_reader :x_max, :y_max, :iteration_max

  def initialize(x_max, y_max, iteration_max)
    @x_max = x_max
    @y_max = y_max
    @iteration_max = iteration_max
  end

  def generate
    res = Hash.new
    res['x'] = []
    res['y'] = []
    res['alpha'] = []
    (0..@y_max).each { |y|
      y_p = y
      y_0 = scale_y(y)
      (0..@x_max).each { |x|
        x_p = x
        x_0 = scale_x(x)
        x = 0
        y = 0
        iteration = 0
        while (x*x + y*y) < 2*2 && iteration < @iteration_max
          x_t = x*x - y*y + x_0
          y = 2*x*y + y_0
          x = x_t
          iteration += 1
        end

        res['x'] << x_p
        res['y'] << y_p
        res['alpha'] << iteration.to_f * 100.0
      }
    }
    res
  end


  # Scale the x coordinate to lie between -2.5 < x < 1
  def scale_x(x_0)
    raise ArgumentError, 'x not in range' unless 0 <= x_0 && x_0 <= @x_max
    ((x_0 * 3.5) / @x_max.to_f) - 2.5
  end

  # Scale the y coordinate to lie between   -1 < y < 1
  def scale_y(y_0)
    raise ArgumentError, 'y not in range' unless 0 <= y_0 && y_0 <= @y_max
    ((y_0 * 2) / @y_max.to_f) - 1
  end

  def print_console(set)
    (0..@y_max).each { |y|
      (0..@x_max).each { |x|
        print "#{set[[x,y]]}"
      }
      puts
    }
  end
end