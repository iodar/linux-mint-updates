## Print Packages

This simple script retrives all security and kernel updates with `mintupdate-cli` on your `linux mint` and prints a
summary to yout terminal.

### Usage

Just download the \[scriptname\] from latest release to your host and call execute it.

### Known Issues

- Performance is pretty bad right now (mintupdate-cli is called **4 times!**)
    - will be fixed in the future

### Sample Output On Terminal

The output on your terminal will looks something like this

```bash
-- security updates (7) --
ca-certificates   [  version:  20190110~18.04.1                  ]
chromium-browser  [  version:  83.0.4103.61-0ubuntu0.18.04.1     ]
freerdp2          [  version:  2.1.1+dfsg1-0ubuntu0.18.04.1      ]
json-c            [  version:  0.12.1-1.3ubuntu0.3               ]
openssl           [  version:  1.1.1-1ubuntu2.1~18.04.6          ]
thunderbird       [  version:  1:68.8.0+build2-0ubuntu0.18.04.2  ]


-- kernel updates (1) --
linux-5.3.0.53.110 [ current: 5.3.0-53.47 ]
```