package MyInstallUtil;

# Utilities only for installing Alien::Plotly::Orca. Not for used elsewhere.

use strict;
use warnings;

use Capture::Tiny qw(:all);
use File::Which;

=func need_xvfb

    need_xvfb($force_check=false)

Returns true if Linux host is "headless", that is, not having a running X
service.

On Windows it always returns false.

If C<$force_check> is false, the default, the result would be decided
only on first call to this function in a Perl process.

=func can_xvfb

    can_xvfb($force_check=false)

Returns true if C<xvfb-run> is found in system.

If C<$force_check> is false, the default, the result would be decided
only on first call to this function in a Perl process.

=cut

my $need_xvfb;

sub need_xvfb {
    my ($force_check) = @_;

    return 0 if ( $^O eq 'MSWin32' );
    if ( $force_check or !defined $need_xvfb ) {
        my ( $merged, $exit ) = capture_merged { system('xset q'); };
        $need_xvfb = $exit == 0 ? 0 : 1;
    }
    return $need_xvfb;
}

my $can_xvfb;

sub can_xvfb {
    my ($force_check) = @_;

    if ( $force_check or !defined $can_xvfb ) {
        $can_xvfb = which('xvfb-run') ? 1 : 0;
    }
    return $can_xvfb;
}

sub wrap_orca {
    my ($cmd) = @_;

    if ( need_xvfb() and can_xvfb() ) {
        if ( not ref($cmd) ) {
            return "xvfb-run -a $cmd";
        }
        else {
            return [ 'xvfb-run', '-a', @$cmd ];
        }
    }
    else {
        return $cmd;
    }
}

# call the orca cli to get its version
sub detect_orca_version {
    my $cmd = wrap_orca('orca --version');

    # check only stdout to workaroud a xvfb missing RANDR issue on Travis
    my ( $merged, $exit ) = capture_merged { system($cmd) };
    if ( $exit == 0 ) {
        chomp($merged);
        my ($version) = ( $merged =~ /^(\d+.*?)$/m );
        return $version if $version;
    }
    die "Failed when detecting orca version: $merged";
}

1;

