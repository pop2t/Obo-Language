function main() {
    const size = 2000;
    const maxIter = 50;
    let total = 0;

    for (let py = 0; py < size; py++) {
        for (let px = 0; px < size; px++) {
            const x0 = (px * 3.5 / size) - 2.5;
            const y0 = (py * 2.0 / size) - 1.0;
            let x = 0.0, y = 0.0;
            let iter = 0;
            while (iter < maxIter) {
                if (x * x + y * y > 4.0) break;
                const xt = x * x - y * y + x0;
                y = 2.0 * x * y + y0;
                x = xt;
                iter++;
            }
            total += iter;
        }
    }

    console.log(`Mandelbrot ${size}x${size}: ${total}`);
}

main();
