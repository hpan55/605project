#!/bin/bash

cat bicor_protein_human*.csv |
sort  -r -t, -gk3 |
head -100 > human_best100.csv

cat bicor_protein_mouse*.csv |
sort  -r -t, -gk3 |
head -100 > mouse_best100.csv


