[![Build Status](https://travis-ci.org/stphnlyd/perl5-Alien-Plotly-Orca.svg?branch=master)](https://travis-ci.org/stphnlyd/perl5-Alien-Plotly-Orca)
[![AppVeyor Status](https://ci.appveyor.com/api/projects/status/github/stphnlyd/perl5-Alien-Plotly-Orca?branch=master&svg=true)](https://ci.appveyor.com/project/stphnlyd/perl5-Alien-Plotly-Orca)

# NAME

Alien::Plotly::Orca - Finds or installs plotly-orca

# VERSION

version 0.0000\_01

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

This module finds [plotly-orca](https://github.com/plotly/orca) or
installs it.

# CAVEATS

On Linux plotly-orca requires X service. If your host is headless you
mostly need [xvfb](https://en.wikipedia.org/wiki/Xvfb), either ran as a
service, or ran as a wrapper every time like `xvfb-run orca ...`.

For Mac OSX I can't really test it as I don't have such a system at
hand. Travis CI does not seem to support Perl for OSX...

# SEE ALSO

[Alien](https://metacpan.org/pod/Alien), 
[Chart::Plotly](https://metacpan.org/pod/Chart::Plotly)

[https://github.com/plotly/orca](https://github.com/plotly/orca)

# AUTHOR

Stephan Loyd <sloyd@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2019 by Stephan Loyd.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
