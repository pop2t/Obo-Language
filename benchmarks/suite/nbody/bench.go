package main

import (
	"fmt"
	"math"
)

const (
	pi          = 3.14159265358979323846
	solarMass   = 4.0 * pi * pi
	daysPerYear = 365.24
)

type Body struct {
	x, y, z, vx, vy, vz, mass float64
}

func advance(bodies []Body, dt float64) {
	n := len(bodies)
	for i := 0; i < n; i++ {
		for j := i + 1; j < n; j++ {
			dx := bodies[i].x - bodies[j].x
			dy := bodies[i].y - bodies[j].y
			dz := bodies[i].z - bodies[j].z
			dist2 := dx*dx + dy*dy + dz*dz
			dist := math.Sqrt(dist2)
			mag := dt / (dist2 * dist)

			bodies[i].vx -= dx * bodies[j].mass * mag
			bodies[i].vy -= dy * bodies[j].mass * mag
			bodies[i].vz -= dz * bodies[j].mass * mag
			bodies[j].vx += dx * bodies[i].mass * mag
			bodies[j].vy += dy * bodies[i].mass * mag
			bodies[j].vz += dz * bodies[i].mass * mag
		}
	}
	for i := 0; i < n; i++ {
		bodies[i].x += dt * bodies[i].vx
		bodies[i].y += dt * bodies[i].vy
		bodies[i].z += dt * bodies[i].vz
	}
}

func energy(bodies []Body) float64 {
	e := 0.0
	n := len(bodies)
	for i := 0; i < n; i++ {
		e += 0.5 * bodies[i].mass * (bodies[i].vx*bodies[i].vx + bodies[i].vy*bodies[i].vy + bodies[i].vz*bodies[i].vz)
		for j := i + 1; j < n; j++ {
			dx := bodies[i].x - bodies[j].x
			dy := bodies[i].y - bodies[j].y
			dz := bodies[i].z - bodies[j].z
			dist := math.Sqrt(dx*dx + dy*dy + dz*dz)
			e -= bodies[i].mass * bodies[j].mass / dist
		}
	}
	return e
}

func main() {
	bodies := []Body{
		{0.0, 0.0, 0.0, 0.0, 0.0, 0.0, solarMass},
		{4.84143144246472090, -1.16032004402742839, -0.103622044471123109,
			0.00166007664274403694 * daysPerYear, 0.00769901118419740425 * daysPerYear, -0.0000690460016972063023 * daysPerYear,
			0.000954791938424326609 * solarMass},
		{8.34336671824457987, 4.12479856412430479, -0.403523417114321381,
			-0.00276742510726862411 * daysPerYear, 0.00499852801234917238 * daysPerYear, 0.0000230417297573763929 * daysPerYear,
			0.000285885980666130812 * solarMass},
		{12.894369562139131, -15.1111514016986312, -0.223307578892655734,
			0.00296460137564761618 * daysPerYear, 0.0023784717395948095 * daysPerYear, -0.0000296589568540237556 * daysPerYear,
			0.0000436624404335156298 * solarMass},
		{15.3796971148509165, -25.9193146099879641, 0.179258772950371181,
			0.00268067772490389322 * daysPerYear, 0.00162824170038242295 * daysPerYear, -0.0000951592254519715870 * daysPerYear,
			0.0000515138902046611451 * solarMass},
	}

	px, py, pz := 0.0, 0.0, 0.0
	for i := range bodies {
		px += bodies[i].vx * bodies[i].mass
		py += bodies[i].vy * bodies[i].mass
		pz += bodies[i].vz * bodies[i].mass
	}
	bodies[0].vx = -px / solarMass
	bodies[0].vy = -py / solarMass
	bodies[0].vz = -pz / solarMass

	n := 500000
	fmt.Printf("%.15f\n", energy(bodies))
	for i := 0; i < n; i++ {
		advance(bodies, 0.01)
	}
	fmt.Printf("%.15f\n", energy(bodies))
}
