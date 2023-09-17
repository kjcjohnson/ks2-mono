# ks2

`ks2` -- the ks2 synthesizer suite

## Usage

``` shell
ks2 [global-options] [<command>] [command-options] [arguments ...]
```

## Options

`ks2` accepts the following options:

``` shell
      --debug    enables extra debugging information [env: $KS2_DEBUG]
      --help     display usage information and exit
      --version  display version and exit
  -q, --quiet    disables printing unnecessary information

```

## Sub Commands

`ks2` provides the following sub commands:

``` shell
  solve      solves an individual synthesis problem
  benchmark  benchmarks solvers against problem suites
  report     generate reports from benchmark data files

```

## License

MIT

# ks2 solve

`ks2 solve` -- solves an individual synthesis problem

## Usage

``` shell
ks2 solve [options] [benchmark]
```

## Options

`ks2 solve` accepts the following options:

``` shell
      --debug           enables extra debugging information [env: $KS2_DEBUG]
      --help            display usage information and exit
      --version         display version and exit
  -c, --core <VALUE>    core to use [env: $KS2_CORE]
  -q, --quiet           disables printing unnecessary information
  -s, --solver <VALUE>  solver to use [env: $KS2_SOLVER]
  -t, --timeout <INT>   timeout for problem files [default: 120] [env: $KS2_TIMEOUT]

```

# ks2 benchmark

`ks2 benchmark` -- benchmarks solvers against problem suites

## Usage

``` shell
ks2 benchmark [options] [suite-path]
```

## Options

`ks2 benchmark` accepts the following options:

``` shell
      --debug                    enables extra debugging information [env: $KS2_DEBUG]
      --help                     display usage information and exit
      --version                  display version and exit
  -c, --core <VALUE>             core to use [env: $KS2_CORE]
  -f, --output-format <VARIANT>  output format for benchmark results [default: json] [env:
                                 $KS2_OUTPUT_FORMAT] [choices: json, csv]
  -o, --output <PATH>            output path for benchmark results [default: data] [env:
                                 $KS2_OUTPUT_PATH]
  -q, --quiet                    disables printing unnecessary information
  -s, --solver <ITEM>            solver to use (multiple allowed) [env: $KS2_SOLVER]
  -t, --timeout <INT>            timeout for problem files [default: 120] [env: $KS2_TIMEOUT]

```

# ks2 report

`ks2 report` -- generate reports from benchmark data files

## Usage

``` shell
ks2 report [options] [json-files]
```

## Options

`ks2 report` accepts the following options:

``` shell
      --debug               enables extra debugging information [env: $KS2_DEBUG]
      --help                display usage information and exit
      --version             display version and exit
  -f, --field <ITEM>        field to display (multiple allowed) [env: $KS2_FIELD]
  -o, --output <PATH>       HTML output file to write report into [env: $KS2_OUTPUT_FILE]
  -q, --quiet               disables printing unnecessary information
  -r, --reporter <VARIANT>  reporter to use [default: html] [env: $KS2_REPORTER] [choices: html,
                            text]
  -s, --solver <ITEM>       solvers to report on (multiple allowed) [env: $KS2_SOLVER]
  -y, --style <ITEM>        report style configuration options (multiple allowed) [env:
                            $KS2_REPORT_STYLE]

```

