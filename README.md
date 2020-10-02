[![Build Status](https://travis-ci.org/stphnlyd/perl5-Alien-Plotly-Orca.svg?branch=master)](https://travis-ci.org/stphnlyd/perl5-Alien-Plotly-Orca)
[![AppVeyor Status](https://ci.appveyor.com/api/projects/status/github/stphnlyd/perl5-Alien-Plotly-Orca?branch=master&svg=true)](https://ci.appveyor.com/project/stphnlyd/perl5-Alien-Plotly-Orca)

# NAME

Alien::Plotly::Orca - Finds or installs plotly-orca

# VERSION

version 0.0002

# SYNOPSIS

```perl
use Alien::Plotly::Orca;
use Config;

if (Alien::Plotly::Orca->install_type eq 'share') {
    $ENV{PATH} = join(
        $Config{path_sep},
        Alien::Plotly::Orca->bin_dir,
        $ENV{PATH}
    );

    # get version
    my $version = Alien::Plotly::Orca->version;
}

# If install_type is not 'share' then it means plotly-orca
# was detected from PATH when Alien::Plotly::Orca was installed.
# So in either case now you should be able to do,
print `orca -h`;
```

# DESCRIPTION

This module finds [plotly-orca](https://github.com/plotly/orca) from your
system, or installs it (version 1.3.1).

For installation it uses prebuilt packages and would supports 3 OS
platforms: Windows, Linux and OSX.
For Windows and OSX it would get package from
[Anaconda's plotly repo](https://anaconda.org/plotly/plotly-orca/files).
For Linux it would get the AppImage file from
[plotly-orca's github release page](https://github.com/plotly/orca/releases).

# INSTALLATION

## Linux

Normally you should be all fine if you have a recent version of popular
distros like Ubuntu as your Linux desktop. If you're an advanced Linux user
or if you get problems check below list and make sure you have them all on
you Linux host.

- FUSE

    to run AppImage, as we use AppImage for Linux. See also
    [https://github.com/AppImage/AppImageKit/wiki/FUSE](https://github.com/AppImage/AppImageKit/wiki/FUSE).

- A running X service

    plotly-orca requires X service. If your host is headless you
    mostly need [xvfb](https://en.wikipedia.org/wiki/Xvfb), either ran as a
    service, or ran as a wrapper every time like `xvfb-run orca ...`.

- "open sans" font

    Not having this font won't cause installation to fail, but texts could be
    not properly rendered in the exported image file. See also
    [https://github.com/plotly/orca/issues/148](https://github.com/plotly/orca/issues/148).

## Windows

On Windows do not have your Perl installation itself in a long path. This
is because that in the plotly-orca's tar.bz2 archive there are some files
with quite long paths, and if your Perl itself is in a long path, during
some intermediate step of installing this library there would need very
long paths for some extractd files which could exceed Windows's default
MAX\_PATH limit of 260 characters.
And Archive::Tar cannot handle that properly.

## Mac OSX

For Mac OSX I can't really test it as I don't have such a system at
hand. Travis CI does not seem to support Perl for OSX...

# SEE ALSO

[Alien](https://metacpan.org/pod/Alien), 
[Chart::Plotly](https://metacpan.org/pod/Chart::Plotly)

[https://github.com/plotly/orca](https://github.com/plotly/orca)

# AUTHOR

Stephan Loyd <sloyd@cpan.org>

# CONTRIBUTOR

Thibault Duponchelle <thibault.duponchelle@amadeus.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2019-2020 by Stephan Loyd.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
