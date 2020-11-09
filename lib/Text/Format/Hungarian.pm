package Text::Format::Hungarian;

use 5.006;
use strict;
use warnings;

=head1 NAME

Text::Format::Hungarian - The great new Text::Format::Hungarian!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Text::Format::Hungarian;

    my $foo = Text::Format::Hungarian->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 function1

=cut

sub new {
  my ($class, $lookup_ref) = @_;

  return bless {_lookup_ref => $lookup_ref}, $class;
}

sub format {
  my ($class, $text) = @_;

  return $text;
}

=head2 function2

=cut

sub function2 {
}

=head1 AUTHOR

Michael R. Wolf, C<< <MichaelRWolf at att.net> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-text-format-hungarian at rt.cpan.org>, or through
the web interface at L<https://rt.cpan.org/NoAuth/ReportBug.html?Queue=Text-Format-Hungarian>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Text::Format::Hungarian


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<https://rt.cpan.org/NoAuth/Bugs.html?Dist=Text-Format-Hungarian>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Text-Format-Hungarian>

=item * CPAN Ratings

L<https://cpanratings.perl.org/d/Text-Format-Hungarian>

=item * Search CPAN

L<https://metacpan.org/release/Text-Format-Hungarian>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

This software is Copyright (c) 2020 by Michael R. Wolf.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)


=cut

1; # End of Text::Format::Hungarian
