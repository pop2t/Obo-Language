package main

import "fmt"

func main() {
	size := 2000
	maxIter := 50
	total := int64(0)

	for py := 0; py < size; py++ {
		for px := 0; px < size; px++ {
			x0 := float64(px)*3.5/float64(size) - 2.5
			y0 := float64(py)*2.0/float64(size) - 1.0
			x := 0.0
			y := 0.0
			iter := 0
			for iter < maxIter {
				if x*x+y*y > 4.0 {
					break
				}
				xt := x*x - y*y + x0
				y = 2.0*x*y + y0
				x = xt
				iter++
			}
			total += int64(iter)
		}
	}

	fmt.Printf("Mandelbrot %dx%d: %d\n", size, size, total)
}
