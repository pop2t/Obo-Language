using System;

class Bench {
    static void Main() {
        int size = 2000;
        int maxIter = 50;
        long total = 0;

        for (int py = 0; py < size; py++) {
            for (int px = 0; px < size; px++) {
                double x0 = (px * 3.5 / size) - 2.5;
                double y0 = (py * 2.0 / size) - 1.0;
                double x = 0.0, y = 0.0;
                int iter = 0;
                while (iter < maxIter) {
                    if (x * x + y * y > 4.0) break;
                    double xt = x * x - y * y + x0;
                    y = 2.0 * x * y + y0;
                    x = xt;
                    iter++;
                }
                total += iter;
            }
        }

        Console.WriteLine($"Mandelbrot {size}x{size}: {total}");
    }
}
