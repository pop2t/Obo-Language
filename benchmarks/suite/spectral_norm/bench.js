function evalA(i, j) {
    return 1.0 / ((i + j) * (i + j + 1) / 2 + i + 1);
}

function evalATimesU(u, n, au) {
    for (let i = 0; i < n; i++) {
        let sum = 0.0;
        for (let j = 0; j < n; j++) {
            sum += evalA(i, j) * u[j];
        }
        au[i] = sum;
    }
}

function evalAtTimesU(u, n, atu) {
    for (let i = 0; i < n; i++) {
        let sum = 0.0;
        for (let j = 0; j < n; j++) {
            sum += evalA(j, i) * u[j];
        }
        atu[i] = sum;
    }
}

function evalAtATimesU(u, n, atau) {
    const v = new Array(n).fill(0.0);
    evalATimesU(u, n, v);
    evalAtTimesU(v, n, atau);
}

function main() {
    const n = 1000;
    const u = new Array(n).fill(1.0);
    const v = new Array(n).fill(0.0);

    for (let i = 0; i < 10; i++) {
        evalAtATimesU(u, n, v);
        evalAtATimesU(v, n, u);
    }

    let vBv = 0.0, vv = 0.0;
    for (let i = 0; i < n; i++) {
        vBv += u[i] * v[i];
        vv += v[i] * v[i];
    }

    console.log(`Spectral norm: ${Math.sqrt(vBv / vv).toFixed(9)}`);
}

main();
