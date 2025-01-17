#!/bin/bash

set -efux -o pipefail

TEST_DEPS="testthat"
SEP='"\\s+"'

R_REMOTES_NO_ERRORS_FROM_WARNINGS=true Rscript - <<_RSCRIPT_EOF_
  if (!require(devtools))
    install.packages("devtools")

  devtools::install_deps(dependencies = c("Imports"))

  test_deps <- strsplit("$TEST_DEPS", $SEP)[[1]]
  for (pkg in test_deps)
    if (!require(pkg, character.only = TRUE))
      install.packages(pkg)
_RSCRIPT_EOF_
