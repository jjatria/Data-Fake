use 5.008001;
use strict;
use warnings;
use Test::More 0.96;

use Data::Fake::Internet;

subtest 'fake_tld' => sub {
    for my $i ( 0 .. 5 ) {
        my $got = fake_tld->();
        ok( defined($got), "TLD ($got) is defined" );
    }
};

subtest 'fake_domain' => sub {
    for my $i ( 0 .. 5 ) {
        my $got = fake_domain->();
        ok( defined($got), "domain ($got) is defined" );
        like( $got, qr/\w\.\w/, "domain has dot separator" );
    }
};

subtest 'fake_email' => sub {
    for my $i ( 0 .. 5 ) {
        my $got = fake_email->();
        ok( defined($got), "email ($got) is defined" );
        like( $got, qr/^\w+\.\w+\@\w+\.\w+/, "email has expected form" );
    }
};

subtest 'fake_ip4' => sub {
    for my $i ( 0 .. 5 ) {
        my $got = fake_ip4->();
        ok( defined($got), "ip4 ($got) is defined" );
        is scalar( grep { $_ >= 0 && $_ < 256 } split( /[.]/,  $got)), 4,
            'ip4 has expected form';
    }
};

subtest 'fake_ip6' => sub {
    for my $i ( 0 .. 5 ) {
        my $got = fake_ip6->();
        ok( defined($got), "ip6 ($got) is defined" );
        like $got, qr/^[a-f0-9]{4}(:[a-f0-9]{4}){7}$/, 'ip6 has expected form';
    }
};

done_testing;
# COPYRIGHT

# vim: ts=4 sts=4 sw=4 et tw=75:
