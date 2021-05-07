#!/bin/bash

# Exit immediately if a pipeline, which may consist of a single simple command,
# a list, or a compound command returns a non-zero status
set -e

nc -z localhost 2210
nc -z localhost 2211
