#!/usr/bin/env sh
BINARY=trace_test.ppc
QEMU=qemu-ppc

DATE=$(date +%N)
echo "- Running odd trace"
echo "- $QEMU -d page,exec -- $BINARY 1 2>&1 | qemu2drcov -n $BINARY > $BINARY.oddtrace.$DATE"
$QEMU -d page,exec -- $BINARY 1 2>&1 | qemu2drcov -n $BINARY > $BINARY.oddtrace.$DATE

DATE=$(date +%N)
echo "- Running even trace"
echo "- $QEMU -d page,exec -- $BINARY 2 2>&1 | qemu2drcov -n $BINARY > $BINARY.eventrace.$DATE"
$QEMU -d page,exec -- $BINARY 2 2>&1 | qemu2drcov -n $BINARY > $BINARY.eventrace.$DATE

