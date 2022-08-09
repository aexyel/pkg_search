# pkg_search

CLI tool to search OpenBSD packages by DESCR content.

# How to use

Run `pkg_search -u` to update and extract ports archive to ~/pkg_search.cache directory.

Use `pkg_search some words` to search in port's DESCR files.

`pkg_search -p fpath some words` - specify ports category to narrow search scope.

# TODO

Refactor code. It's too draft.

# Bugs / limitation

No known bugs. All is feature.

# Thanks

Thanks to Solène Rapenne and t.me/openbsd_ru community for idea to create this script.
