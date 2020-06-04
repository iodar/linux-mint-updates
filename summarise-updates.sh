#!/bin/bash

SEC_UPDATES_COUNT=0
KERNEL_UPDATES_COUNT=0
KERNEL_UPDATE_NAMES=
SEC_UPDATE_NAMES=

get-sec-and-kernel-update-count() {
  KERNEL_UPDATES_COUNT=$(mintupdate-cli list -k | wc -l)
  SEC_UPDATES_COUNT=$(mintupdate-cli list -s | wc -l)
}

print-sec-updates-message() {
  printf "\n%s security updates (%s) %s\n" "--" $SEC_UPDATES_COUNT "--"
  printf "%s\n\n" "$SEC_UPDATE_NAMES"
}

print-kernel-updates-message() {
  printf "%s kernel updates (%s) %s\n" "--" $KERNEL_UPDATES_COUNT "--"
  printf "%s\n\n" "$KERNEL_UPDATE_NAMES"
}

get-kernel-update-names() {
  KERNEL_UPDATE_NAMES=$(
    echo $(echo -n "$(mintupdate-cli list -k |
    awk '{print $2 " [ current: "}')"; echo -n "$(uname -rv |
    grep -oP "^[\d\.\w\-\s#]+" |
    sed 's/-generic #/./')"; echo -e " ]") |
    column -t
  )

  SEC_UPDATE_NAMES=$(
    mintupdate-cli list -s |
    awk '{print $2 " [ version: " $3 " ]"}' |
    column -t
  )
}

get-kernel-update-names
get-sec-and-kernel-update-count
print-sec-updates-message
print-kernel-updates-message

