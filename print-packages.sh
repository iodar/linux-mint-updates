#!/bin/bash

SEC_UPDATES_COUNT=0
KERNEL_UPDATES_COUNT=0
KERNEL_UPDATES_NAMES=
SEC_UPDATE_NAMES=

get-sec-and-kernel-update-count() {
  KERNEL_UPDATES_COUNT=$(echo -n $KERNEL_UPDATES_NAMES | wc -l)
  SEC_UPDATES_COUNT=$(echo -n $SEC_UPDATE_NAMES | wc -l)
}

print-sec-updates-message() {
  printf "%s security updates (%s) %s\n" "--" $SEC_UPDATES_COUNT "--"
  printf "%s\n" "$SEC_UPDATES_NAMES"
}

print-kernel-updates-message() {
  printf "%s kernel updates (%s) %s\n" "--" $KERNEL_UPDATES_COUNT "--"
  printf "%s\n" "$KERNEL_UPDATES_NAMES"
}

get-kernel-update-names() {
  $KERNEL_UPDATES_NAMES=$(
    echo $(echo -n "$(mintupdate-cli list -k |
    awk '{print $2 " [ current: "}')"; echo -n "$(uname -rv |
    grep -oP "^[\d\.\w\-\s#]+" |
    sed 's/-generic #/./')"; echo -e " ]") |
    column -t
  )

  $SEC_UPDATE_NAMES=$(
    mintupdate-cli list -s |
    awk '{print $2 " [ version: " $3 " ]"}' |
    column -t
  )


  # mint update kernel list
  # echo $(echo -n "$(mintupdate-cli list -k | awk '{print $2 " [ current: "}'    )"; echo -n "$(uname -rv | grep -oP "^[\d\.\w\-\s#]+" | sed 's/-generic #/./')"; echo -e " ]") | column -t

  # mint update security list
  # mintupdate-cli list -s | awk '{print $2 " [ version: " $3 " ]"}' | column -t
}

get-kernel-update-names
get-sec-and-kernel-update-count
print-sec-updates-message
print-kernel-updates-message

