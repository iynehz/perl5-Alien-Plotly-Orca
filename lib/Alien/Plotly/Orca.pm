package Alien::Plotly::Orca;

# ABSTRACT: Finds or installs plotly-orca

use strict;
use warnings;
use utf8;

# VERSION

use parent 'Alien::Base';

1;

__END__

=head1 SYNOPSIS

    use Alien::Plotly::Orca;

    $ENV{PATH} = join(
        ( $^O eq 'MSWin32' ? ';' : ':' ),
        Alien::Plotly::Orca->bin_dir,
        $ENV{PATH}
    );
    
    my $version = Alien::Plotly::Orca->version;

=head1 DESCRIPTION

This module finds L<plotly-orca|https://github.com/plotly/orca> or
installs it.

=head1 SEE ALSO

L<Alien>, 
L<Chart::Plotly>

L<https://github.com/plotly/orca>

