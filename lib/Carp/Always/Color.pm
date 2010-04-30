package Carp::Always::Color;

=head1 NAME

Carp::Always::Color -

=head1 SYNOPSIS


=head1 DESCRIPTION


=cut

BEGIN {
    if (-t *STDERR) {
        require Carp::Always::Color::Term;
    }
    else {
        require Carp::Always::Color::HTML;
    }
}

=head1 BUGS

No known bugs.

Please report any bugs through RT: email
C<bug-carp-always-color at rt.cpan.org>, or browse to
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Carp-Always-Color>.

=head1 SEE ALSO


=head1 SUPPORT

You can find this documentation for this module with the perldoc command.

    perldoc Carp::Always::Color

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Carp-Always-Color>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Carp-Always-Color>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Carp-Always-Color>

=item * Search CPAN

L<http://search.cpan.org/dist/Carp-Always-Color>

=back

=head1 AUTHOR

  Jesse Luehrs <doy at tozt dot net>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Jesse Luehrs.

This is free software; you can redistribute it and/or modify it under
the same terms as perl itself.

=cut

1;
