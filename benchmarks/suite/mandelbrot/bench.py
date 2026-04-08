def main():
    size = 2000
    max_iter = 50
    total = 0

    for py in range(size):
        for px in range(size):
            x0 = (px * 3.5 / size) - 2.5
            y0 = (py * 2.0 / size) - 1.0
            x = 0.0
            y = 0.0
            it = 0
            while it < max_iter:
                if x * x + y * y > 4.0:
                    break
                xt = x * x - y * y + x0
                y = 2.0 * x * y + y0
                x = xt
                it += 1
            total += it

    print(f"Mandelbrot {size}x{size}: {total}")

main()
