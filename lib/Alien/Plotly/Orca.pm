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

=head1 DESCRIPTION

This module finds L<plotly-orca|https://github.com/plotly/orca> or
installs it.

=head1 CAVEATS

On Linux plotly-orca requires X service. If your host is headless you
mostly need L<xvfb|https://en.wikipedia.org/wiki/Xvfb>, either ran as a
service, or ran as a wrapper every time like C<xvfb-run orca ...>.

For Mac OSX I can't really test it as I don't have such a system at
hand. Travis CI does not seem to support Perl for OSX...

=head1 SEE ALSO

L<Alien>, 
L<Chart::Plotly>

L<https://github.com/plotly/orca>

