[![Build Status](https://travis-ci.org/stphnlyd/perl5-Alien-Plotly-Orca.svg?branch=master)](https://travis-ci.org/stphnlyd/perl5-Alien-Plotly-Orca)

# NAME

Alien::Plotly::Orca - Finds or installs plotly-orca

# VERSION

version 0.0000\_01

# SYNOPSIS

```perl
use Alien::Plotly::Orca;

$ENV{PATH} = join(
    ( $^O eq 'MSWin32' ? ';' : ':' ),
    Alien::Plotly::Orca->bin_dir,
    $ENV{PATH}
);

my $version = Alien::Plotly::Orca->version;
```

# DESCRIPTION

This module finds [plotly-orca](https://github.com/plotly/orca) or
installs it.

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
