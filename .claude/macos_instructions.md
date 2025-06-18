# Instructions specific to macOS

Most tools on macOS are BSD flavoured, whereas Claude assumes their GNU flavour.
This means that some command line arguments are absent, some have subtle differences,
and some work completely differently. If you encounter unexpected errors when using
a commandline tool, consider trying a GNU alternative instead. Many of them can be
installed through homebrew on macOS. I have listed some known alternatives below.

## gsed instead of sed on macOS

Use `gsed` instead of `sed`. For example, BSD `sed -i` on macOS requires an extension
to be set for backup files, where GNU dos not, which breaks many Claude commands.
