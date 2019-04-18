#!/usr/bin/perl

use strict;
use warnings;

# Error dependencies
use CGI":standard";
use CGI::Carp qw(fatalsToBrowser);

# Libraries
require "../lib/jwt-0.024.lib";


sub Main() {

    ### SetToken function testing ###
    print STDOUT "Test cases for the function SetToken()...\n\n";
    # Successful creation of JWT
    my $jwt = &JWT::SetToken({ name => "Long Le", user => "admin" }, "nososecret");
    print STDOUT "Test 0: Data returned from success\n$jwt\n\n";

    # No input parameters
    my $jwt1 = &JWT::SetToken();
    print STDOUT "Test 2: No input parameters\n";
    foreach my $key (sort keys %{ $jwt1 }) {
        print STDOUT "$key: $jwt1->{$key}\n";
    }
    print STDOUT "\n";

    # Empty first input parameter
    my $jwt2 = &JWT::SetToken("");
    print STDOUT "Test 3: Empty first input parameter\n";
    foreach my $key (sort keys %{ $jwt2 }) {
        print STDOUT "$key: $jwt2->{$key}\n";
    }
    print STDOUT "\n";

    # Valid token parameter only
    my $jwt3 = &JWT::SetToken({ name => "Long Le", user => "admin" });
    print STDOUT "Test 4: Valid token parameter only\n";
    foreach my $key (sort keys %{ $jwt3 }) {
        print STDOUT "$key: $jwt3->{$key}\n";
    }
    print STDOUT "\n";

    # Token and empty key
    my $jwt4 = &JWT::SetToken({ name => "Long Le", user => "admin" }, "");
    print STDOUT "Test 5: Valid token and empty key\n";
    foreach my $key (sort keys %{ $jwt4 }) {
        print STDOUT "$key: $jwt4->{$key}\n";
    }
    print STDOUT "\n";

};

&Main();