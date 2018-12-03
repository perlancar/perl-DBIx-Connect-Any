package DBIx::Connect::Any;

# DATE
# VERSION

use strict;
use warnings;
#use Log::ger;

sub connect {
    my $pkg  = shift;
    my $dsn  = shift;
    my $user = shift;
    my $pass = shift;

    if ($dsn =~ /\A\QDBI:mysql:\E/) {
        require DBIx::Connect::MySQL;
        DBIx::Connect::MySQL->connect($dsn, $user, $pass, @_);
    } else {
        require DBI;
        DBI->connect($dsn, $user, $pass, @_);
    }
}

1;
# ABSTRACT: Connect to DBI using DBIx::Connect::*

=head1 SYNOPSIS

Instead of:

 use DBI;
 my $dbh = DBI->connect("dbi:mysql:database=mydb", ...);

you can now do:

 use DBIx::Connect::Any;
 my $dbh = DBIx::Connect::Any->connect("dbi:mysql:database=mydb", ...);

and connecting will be handled by L<DBIx::Connect::MySQL>.


=head1 DESCRIPTION

This is a wrapper for L<DBIx::Connect::MySQL> and other future DBIx::Connect::*.


=head1 METHODS

=head2 connect($dsn, $user, $pass, ...)

Currently will pass to L<DBI::Connect::MySQL> if C<$dsn> starts with
"DBI:mysql:". Otherwise will pass to C<< DBI->connect >>.
