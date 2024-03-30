# Vendor Files
## usocket
Versions of usocket < 0.8.5 break on newer versions of SBCL (> 2.2.6) on Windows, due to using an internal symbol
that was removed. Putting 0.8.5 here until it's available on Quicklisp.

## dissect
https://github.com/Shinmera/dissect/issues/18
Breaks on SBCL >= 2.4.3 without this fix