#!/usr/bin/perl

use strict;
use warnings;

# Error dependencies
use CGI":standard";
use CGI::Carp qw(fatalsToBrowser);

# Libraries
require "../lib/jwt-0.024.lib";

sub Main() {

    my $inits                       = $_[0] || ();
    # my $query                       = new CGI;


    my $jwt_token = &JWT::SetToken({ name => "Long Le", type => "admin"}, "anos");
    print STDOUT "$jwt_token\n";

    if (ref $jwt_token eq "HASH") {
        print STDOUT "JWT Token:\n";
        foreach my $key (sort keys %{ $jwt_token }) {
            print STDOUT "$key: $jwt_token->{$key}\n";
        }
    }


    &JWT::SetHeader($jwt_token);

};

&Main();