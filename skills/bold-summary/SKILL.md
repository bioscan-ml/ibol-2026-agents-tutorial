---
name: bold-summary
description: Summarize a BOLD or BIOSCAN specimen export (TSV) in R. Use when asked for counts of specimens, BINs, families or missing identifications in BOLD data.
---

How I want BOLD summaries done:

1. Use R with the tidyverse. Write the script to a file in this folder (`summary.R`) with your file-writing tool, then run `Rscript summary.R`. Never work out a count in your head.
2. A specimen is a unique `processid`. BOLD exports can have one row per genetic marker, so count `n_distinct(processid)`, never rows. Report both numbers.
3. A BIN is a non-empty `bin_uri`. Rank families by their number of distinct BINs.
4. A specimen lacks a genus or species when that field is empty. Count specimens, not rows.
5. Link a record in the BIOSCAN Browser as `https://browser.bioscan-ml.org/record/<processid>`.
6. Keep the answer short: the numbers, the script's name, and anything surprising in the data.
