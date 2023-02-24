# The ks2 synthesizer suite
Mono repository aggregating all of ks2 and dependencies

## Installation Instructions
1. Download the package for your operating system from [the latest release](https://github.com/kjcjohnson/ks2-mono/releases/latest).
Choose the `bin+parser` package for an all-in-one zip including the [SemGuS Parser](https://github.com/SemGuS-git/Semgus-Parser), or just the `bin`
package if you already have the SemGuS Parser installed and in your `PATH`.

2. Unzip the archive

Note that the Linux release requires a recent version of `glibc`: it will probably run on Ubuntu 22.04 LTS, but not on Ubuntu 20.04 LTS.

## Running the ks2 synthesizer suite
```
ks2 - the ks2 synthesizer suite

Usage: ks2 [-h|--help] [-s|--solver SOLVER] [--suite SUITE] [--suite-root ROOT]
           [--debug] [BENCHMARK]

Available options:
  -h, --help          Prints help about the ks2 runner
  -s, --solver SOLVER Selects a solver to run [Default: T]
  --suite SUITE       Selects a suite to run
  --suite-root ROOT   Root directory of suite data
  --debug             Enables extra tool debug information

Available solvers: bottom-up-enum top-down-enum random
```

Normally, just call with a solver and a benchmark file:
```
./ks2 --solver bottom-up-enum path/to/benchmark.sem
```

The ks2 synthesize suite natively accepts SemGuS benchmarks in the declarative S-expression intermediate format (not SMT-LIB2 encoded),
but it will automatically invoke the SemGuS Parser on benchmarks with `.sem`, `.sl`, and `.smt` extensions.

## Output Format
A successful benchmark run will output a result block like the following:
```
; RESULT: $pair($leaf($name5),$leaf($name6))
;   TIME: 1.00s
;   MAX MEM OFFSET: 0.017MiB
;   PPS: 185.81prog/s
```
Note the following points:
* The solving time is measured in one-second increments
* The maximum memory offset is the peak memory usage above the baseline usage before solving a problem
* The programs per second (PPS) measures how many candidate programs were executed per second on average during solving

Solving benchmarks can either fail with an internal solver error or a core crash. Core crashes are common and expected, and
they generally indicate that the solver process ran out of memory.

## Caveats
This tool is currently an experimental preview and may be unstable. All parts are subject to change in the future.
Do not attempt to script this tool; command line arguments and output formats will change in the future.

Note that there is currently a hard-coded timeout of two minutes.

Feel free to submit issues and enhancements [on this repository](https://github.com/kjcjohnson/ks2-mono/issues),
and they will be triaged to the appropriate projects. For reporting issues, please provide:
* Solver output, run with the `--debug` flag
* Benchmark file
* Operating system and version
