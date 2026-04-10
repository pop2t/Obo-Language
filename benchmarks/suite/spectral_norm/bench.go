package main

import (
	"fmt"
	"math"
)

func evalA(i, j int) float64 {
	return 1.0 / float64((i+j)*(i+j+1)/2+i+1)
}

func evalATimesU(u []float64, n int, au []float64) {
	for i := 0; i < n; i++ {
		sum := 0.0
		for j := 0; j < n; j++ {
			sum += evalA(i, j) * u[j]
		}
		au[i] = sum
	}
}

func evalAtTimesU(u []float64, n int, atu []float64) {
	for i := 0; i < n; i++ {
		sum := 0.0
		for j := 0; j < n; j++ {
			sum += evalA(j, i) * u[j]
		}
		atu[i] = sum
	}
}

func evalAtATimesU(u []float64, n int, atau []float64) {
	v := make([]float64, n)
	evalATimesU(u, n, v)
	evalAtTimesU(v, n, atau)
}

func main() {
	n := 1000

	u := make([]float64, n)
	v := make([]float64, n)
	for i := range u {
		u[i] = 1.0
	}

	for i := 0; i < 10; i++ {
		evalAtATimesU(u, n, v)
		evalAtATimesU(v, n, u)
	}

	vBv := 0.0
	vv := 0.0
	for i := 0; i < n; i++ {
		vBv += u[i] * v[i]
		vv += v[i] * v[i]
	}

	fmt.Printf("Spectral norm: %.9f\n", math.Sqrt(vBv/vv))
}
