fn main() {
    let size = 2000;
    let max_iter = 50;
    let mut total: i64 = 0;

    for py in 0..size {
        for px in 0..size {
            let x0 = (px as f64 * 3.5 / size as f64) - 2.5;
            let y0 = (py as f64 * 2.0 / size as f64) - 1.0;
            let mut x = 0.0_f64;
            let mut y = 0.0_f64;
            let mut iter = 0;
            while iter < max_iter {
                if x * x + y * y > 4.0 { break; }
                let xt = x * x - y * y + x0;
                y = 2.0 * x * y + y0;
                x = xt;
                iter += 1;
            }
            total += iter;
        }
    }

    println!("Mandelbrot {}x{}: {}", size, size, total);
}
