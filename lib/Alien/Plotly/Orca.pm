package Alien::Plotly::Orca;

# ABSTRACT: Finds or installs plotly-orca

use strict;
use warnings;

# VERSION

use parent 'Alien::Base';

1;

__END__

=head1 SYNOPSIS

    use Alien::Plotly::Orca;
    use Config;

    $ENV{PATH} = join(
        $Config{path_sep},
        Alien::Plotly::Orca->bin_dir,
        $ENV{PATH}
    );

    # Now you have plotly-orca executable in $ENV{PATH}
    print `orca -h`;
    
    # get version
    my $version = Alien::Plotly::Orca->version;

=head1 DESCRIPTION

This module finds L<plotly-orca|https://github.com/plotly/orca> or
installs it.

=head1 CAVEATS

plotly-orca requires X service. If your host is headless you mostly need
L<xvfb|https://en.wikipedia.org/wiki/Xvfb>, either ran as a service,
or ran as a wrapper every time like C<xvfb-run orca ...>.

=head1 SEE ALSO

L<Alien>, 
L<Chart::Plotly>

L<https://github.com/plotly/orca>

