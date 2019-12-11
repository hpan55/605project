#!/bin/bash                                                                    
tar -xzf R361.tar.gz
tar -xzf packages.tar.gz

export PATH=$PWD/R/bin:$PATH
export RHOME=$PWD/R
export R_LIBS=$PWD/packages

Rscript readData.R

