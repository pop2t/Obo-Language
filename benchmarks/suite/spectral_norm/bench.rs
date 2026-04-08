fn eval_a(i: usize, j: usize) -> f64 {
    1.0 / ((i + j) * (i + j + 1) / 2 + i + 1) as f64
}

fn eval_a_times_u(u: &[f64], n: usize, au: &mut [f64]) {
    for i in 0..n {
        let mut sum = 0.0;
        for j in 0..n {
            sum += eval_a(i, j) * u[j];
        }
        au[i] = sum;
    }
}

fn eval_at_times_u(u: &[f64], n: usize, atu: &mut [f64]) {
    for i in 0..n {
        let mut sum = 0.0;
        for j in 0..n {
            sum += eval_a(j, i) * u[j];
        }
        atu[i] = sum;
    }
}

fn eval_ata_times_u(u: &[f64], n: usize, atau: &mut [f64]) {
    let mut v = vec![0.0; n];
    eval_a_times_u(u, n, &mut v);
    eval_at_times_u(&v, n, atau);
}

fn main() {
    let n = 1000;
    let mut u = vec![1.0_f64; n];
    let mut v = vec![0.0_f64; n];

    for _ in 0..10 {
        eval_ata_times_u(&u, n, &mut v);
        eval_ata_times_u(&v, n, &mut u);
    }

    let mut v_bv = 0.0;
    let mut vv = 0.0;
    for i in 0..n {
        v_bv += u[i] * v[i];
        vv += v[i] * v[i];
    }

    println!("Spectral norm: {:.9}", (v_bv / vv).sqrt());
}
