# SVG tutorials

## About

SVG stands for scalable vector graphic. It differs from typical raster images in that it is determined by math and not limited by the number of pixels it has. Thus, when you zoom in on an svg image, the images scale accordingly and you don't see the pixels in the image.

## Viewport

Viewport is the size of the window (what i can see physically on the screen). Setting the width and height of the svg is essentially determining the size of the viewport. Setting the radius, for example is determining where your viewport is looking at.

## ViewBox

Viewbox controls what is inside the viewport. First 2 numbers of viewBox determines the starting coordinate of the viewport. Second 2 numbers determine how many units you want to squeeze into the box (that has a height and width set). Its sort of acts like a zoom.

## Line commands

### M

M is move to command. It takes to parameters, (x, y) and appears at the beginning of paths to specify where the drawing should start. 

### L or l

Takes in 2 parameters, (x, y) and moves the path to that point.

### H, h

Takes one argument (x). Moves line to that point

### V v

Takes one argument (y). Moves line to that graph.

All small caps command is relative to the previous point. Eg, `h 80` is 80 units right of the x axis and `h -80` is 80 units left.

## Z command

It is a Close path command. It draws a line from the current position back to the starting position.

## Curve commands

Bezier curves and Arcs.

### Bezier curve (cubic)

Represented by the command (C or c). Takes in 3 arguments, (x1, y1, x2, y2, X, Y). First pair of coordinate is the control point for the start of the curve (represented by M) while the second point is the control point for the last point (X, Y).

### S

S is used to string together multiple C (cubic) curves. Takes in 2 arguments (x2, y2, x, y). First pair represents the control point of the final point on the curve and the second pair is the ending point on the curve.

### Bezier curve (quadratic)

Represented by the command (Q). Takes in 2 arguments (x1, y1, x, y). The first pair is the control point and the last pair is the ending point of the curve.

### T

Shortcut for extending Q. Takes in only one argument, (x, y) which is where the curve will end. the bezier curve is inferred from the previous curve.
