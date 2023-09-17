# The ks2 synthesizer suite
Mono repository aggregating all of ks2 and dependencies

## Installation Instructions
1. Download the package for your operating system from [the latest release](https://github.com/kjcjohnson/ks2-mono/releases/latest). Currently,
ks2 depends on [cvc5](https://github.com/cvc5/cvc5) (optional: required for problems that need an SMT solver) and the
[SemGuS Parser](https://github.com/SemGuS-git/Semgus-Parser) (optional: required to accept the native SemGuS benchmark format).
Choose `bin+parser` for a package with ks2 and the SemGuS Parser, `bin+all` for ks, cvc5 (non-GPL), and the SemGuS Parser,
or just the `bin` package if you already have the SemGuS Parser and cvc5 installed and in your `PATH`.

2. Unzip the archive

Note that the Linux release requires a recent version of `glibc`: it will probably run on Ubuntu 22.04 LTS, but not on Ubuntu 20.04 LTS.

## Running the ks2 synthesizer suite
```
NAME:
  ks2 - the ks2 synthesizer suite

USAGE:
  ks2 [global-options] [<command>] [command-options] [arguments ...]

OPTIONS:
      --debug    enables extra debugging information [env: $KS2_DEBUG]
      --help     display usage information and exit
      --version  display version and exit

COMMANDS:
  solve      solves an individual synthesis problem
  benchmark  benchmarks solvers against problem suites
  report     generate reports from benchmark data files

LICENSE:
  MIT

Available solvers: bottom-up-enum (alias: enum), top-down-enum (alias: tde), random
```

To solve a problem file:
```
NAME:
  ks2 solve - solves an individual synthesis problem

USAGE:
  ks2 solve [options] [benchmark]

OPTIONS:
      --help                display usage information and exit
      --version             display version and exit
      -c, --core <VALUE>    core to use [env: $KS2_CORE]
      -s, --solver <VALUE>  solver to use [env: $KS2_SOLVER]
```

Normally, just call with a solver and a benchmark file:
```
./ks2 solve -s tde path/to/benchmark.sem
```

The ks2 synthesize suite natively accepts SemGuS benchmarks in the declarative S-expression intermediate format (not SMT-LIB2 encoded),
but it will automatically invoke the SemGuS Parser on benchmarks with `.sem`, `.sl`, and `.smt` extensions.

## Output Format
A successful benchmark run will output a result block like the following, unless quiet mode is enabled:
```
; RESULT: $pair($leaf($name5),$leaf($name6))
;   TIME: 1.00s
;   MAX MEM OFFSET: 0.017MiB
;   PPS: 185.81prog/s
```
Note the following points:
* The maximum memory offset is the peak memory usage above the baseline usage before solving a problem
* The programs per second (PPS) measures how many candidate programs were executed per second on average during solving

Solving benchmarks can either fail with an internal solver error or a core crash. Core crashes are common and expected, and
they generally indicate that the solver process ran out of memory.

In addition, a result in SMT-LIB format will be output:
```lisp
(
  (define-fun fun () T ($pair ($leaf $name5) ($leaf $name6)))
)

```
Other options might be the symbols `unrealizable`, `timeout`, or `error`.

[Full command documentation is available here.](ks2.md)

## Caveats
This tool is currently an experimental preview and may be unstable. All parts are subject to change in the future.
Do not attempt to script this tool; command line arguments and output formats will change in the future.

Note that there is currently a hard-coded timeout of two minutes.

Feel free to submit issues and enhancements [on this repository](https://github.com/kjcjohnson/ks2-mono/issues),
and they will be triaged to the appropriate projects. For reporting issues, please provide:
* Solver output, run with the `--debug` flag
* Benchmark file
* Operating system and version

## Other Information
This project optionally bundles [cvc5](https://github.com/cvc5/cvc5). See `cvc5.COPYING` in this repository for
license and legal information.