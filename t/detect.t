#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
BEGIN {
    eval "use IO::Pty::Easy;";
    plan skip_all => "IO::Pty::Easy is required for this test" if $@;
    plan tests => 2;
}

sub output_like {
    local $Test::Builder::Level = $Test::Builder::Level + 1;
    my ($script, $expected, $desc) = @_;
    my $pty = IO::Pty::Easy->new;
    $pty->spawn("$^X", "-e", $script);
    like($pty->read, $expected, $desc);
}

output_like(<<EOF,
    use Carp::Always::Color;
    warn "foo";
EOF
    qr/\e\[33mfoo\e\[m at -e line 2\b/,
    "detection works for terminal output");

output_like(<<EOF,
    my \$stderr;
    BEGIN {
        close(STDERR);
        open(STDERR, '>', \\\$stderr);
    }
    use Carp::Always::Color;
    warn "foo";
    print \$stderr;
EOF
    qr+<span style=\"color:#880\">foo</span> at -e line 7\b+,
    "detection works for terminal output");
