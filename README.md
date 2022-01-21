
<!-- README.md is generated from README.Rmd. Please edit that file -->

# parseSlurmDuration

<!-- badges: start -->
<!-- badges: end -->

The goal of parseSlurmDuration is to enable analytics of SLURM
accounting data in R without tripping over the `Timelimit`, `Elapsed`,
and `CPUTime` accounting fields.

When publishing academic research that used HPC resources managed with
the SLURM scheduler, it may be beneficial to publish some job statistics
so that end-users of your package or peers reviewing your research
software and data analysis pipeline are able to request sufficient and
(minimally buffered) resources on the computing cluster they have access
to, or know to expect how long their personal or laboratory workstation
or server will be occupied with computation.

The accounting fields mentioned are not in a format that works with the
`lubridate` package, so this package provides the function necessary to
parse those fields and allow analysis.

## Installation

You can install the development version of parseSlurmDuration from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("bryce-carson/parseSlurmDuration")
```

## Example

This is a basic example which shows you how to solve a common problem:
representing Karl Marx’ life duration in days, and also the 420–69 meme.
Spicy.

``` r
library(parseSlurmDuration)
parseSlurmDuration("23720-4:20:69")
#> [1] "P23720DT4H20M69S"
```