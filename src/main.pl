#!/usr/bin/perl

use strict;
use warnings;

# Error dependencies
use CGI":standard";
use CGI::Carp qw(fatalsToBrowser);

# Libraries
require "../lib/jwt.lib";


sub Main() {

    ### SetToken function testing ###
    print STDOUT "SetToken() function test cases...\n";
    # JWT returned from successful encoding
    my $jwt = &JWT::SetToken({ name => "Long Le", user => "admin" }, "notsosecret");
    print STDOUT "Test 1: JWT returned from successful encoding\n";
    foreach my $key (sort keys %{ $jwt }) {
        print STDOUT "$key: $jwt->{$key}\n";
    }
    print STDOUT "\n";

    # No input parameters
    my $jwt1 = &JWT::SetToken();
    print STDOUT "Test 2: No input parameters\n";
    foreach my $key (sort keys %{ $jwt1 }) {
        print STDOUT "$key: $jwt1->{$key}\n";
    }
    print STDOUT "\n";

    # Single empty parameter
    my $jwt2 = &JWT::SetToken("");
    print STDOUT "Test 3: Single empty parameter\n";
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

    # Valid token and empty key
    my $jwt4 = &JWT::SetToken({ name => "Long Le", user => "admin" }, "");
    print STDOUT "Test 5: Valid token and empty key\n";
    foreach my $key (sort keys %{ $jwt4 }) {
        print STDOUT "$key: $jwt4->{$key}\n";
    }
    print STDOUT "\n\n";
    ### SetToken function testing END ###

    ### ValidateToken function testing ###
    # Valid token and key
    print STDOUT "ValidateToken() function test cases...\n";
    my $jwt_validate = &JWT::ValidateToken($jwt->{token}, "notsosecret");
    my $jwt_token1 = $jwt_validate->{token};
    print STDOUT "Test 6: Valid token and key\n";
    foreach my $key (sort keys %{ $jwt_token1 }) {
        print STDOUT "$key: $jwt_token1->{$key}\n";
    }
    print STDOUT "\n";

    # Valid token and invalid key
    my $jwt_validate1 = &JWT::ValidateToken($jwt, "sosecret");
    print STDOUT "Test 7: Valid token and invalid key\n";
    foreach my $key (sort keys %{ $jwt_validate1 }) {
        print STDOUT "$key: $jwt_validate1->{$key}\n";
    }
    print STDOUT "\n";

    # Valid token and empty key
    my $jwt_validate2 = &JWT::ValidateToken($jwt, "");
    print STDOUT "Test 8: Valid token and empty key\n";
    foreach my $key (sort keys %{ $jwt_validate2 }) {
        print STDOUT "$key: $jwt_validate2->{$key}\n";
    }
    print STDOUT "\n";

    # Empty token and empty key
    my $jwt_validate3 = &JWT::ValidateToken("", "");
    print STDOUT "Test 9: Empty token and empty key\n";
    foreach my $key (sort keys %{ $jwt_validate3 }) {
        print STDOUT "$key: $jwt_validate3->{$key}\n";
    }
    print STDOUT "\n";

    # No input parameter
    my $jwt_validate4 = &JWT::ValidateToken();
    print STDOUT "Test 10: No input parameter\n";
    foreach my $key (sort keys %{ $jwt_validate4 }) {
        print STDOUT "$key: $jwt_validate4->{$key}\n";
    }
    print STDOUT "\n";

    # One empty parameter
    my $jwt_validate5 = &JWT::ValidateToken("");
    print STDOUT "Test 11: One empty parameter\n";
    foreach my $key (sort keys %{ $jwt_validate5 }) {
        print STDOUT "$key: $jwt_validate5->{$key}\n";
    }
    print STDOUT "\n\n";
    ### ValidateToken function testing END ###

};

&Main();