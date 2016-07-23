require 'gnuplotrb'
require_relative 'Mandelbrot.rb'
include GnuplotRB

puts 'Grid Size'
print 'x (px) = '
x_max = gets.to_i
print 'y (px) = '
y_max = gets.to_i
print 'Iterations: '
iterations = gets.to_i

man = Mandelbrot.new(x_max, y_max, iterations)
set = man.generate


heatmap = Plot.new(
                  [[set['x'], set['y'], set['alpha']], with: 'image' ],
                  palette: 'color',
                  view: 'map',
                  xrange: 0..x_max,
                  yrange: 0..y_max,
                  term: ['png']
).to_png('output.png', size: [x_max, y_max])