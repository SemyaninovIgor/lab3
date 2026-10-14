#!/bin/bash
K=1103515245
M=2147483648

SEED=$(date +%s)
RANDOM_NUM=$(( (K * SEED) % M ))

export RANDOM_NUM
echo "Сгенерировано число: $RANDOM_NUM"
echo "RANDOM_NUM=$RANDOM_NUM" > /tmp/rand_var.sh
