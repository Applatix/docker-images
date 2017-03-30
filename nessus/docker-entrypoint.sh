#!/bin/bash
set -euo pipefail

 ./etc/init.d/nessusd start


exec "$@"