# (Yet another) pkg_search

CLI tool to search OpenBSD packages by DESCR content.

## Why?

* No need to install sqlports, pkglocatedb and other tools.
* Just remove ~/pkg_search.cache and your system will be tidy and clean again!

# How to use

Run `pkg_search -u[s]` to update and extract ports archive to ~/pkg_search.cache directory.

Use `pkg_search some words` to search in port's DESCR files.

`pkg_search -p fpath some words` - specify ports category to narrow search scope.

# TODO

Add -f(orce) to updates.

Refactor code. It's too draft.

# Bugs / limitation

Won't download ports archive after moving build from -current to next version.
FIX: '-us' forces to use snapshot anyway.

One known bug. All other is feature.

# Thanks

Thanks to Solène Rapenne and t.me/openbsd_ru community for idea to create this script.
