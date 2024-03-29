package Biblio::DocParser;

######################################################################
#
# Biblio::DocParser; 
#
######################################################################
#
#  This file is part of ParaCite Tools (http://paracite.eprints.org/developers/) 
#
#  Copyright (c) 2002 University of Southampton, UK. SO17 1BJ.
#
#  ParaTools is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  ParaTools is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with ParaTools; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
######################################################################

use 5.006;
use strict;
use warnings;

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = ( 'parse', 'new' );

$VERSION = "1.10";

=pod

=head1 NAME

B<Biblio::DocParser> - document parsing framework 

=head1 DESCRIPTION

Biblio::DocParser provides generic methods that should be overriden
by specific parsers. This class should not be used directly, but rather
be overridden by specific parsers.  Parsers that extend the DocParser
class should at least override the parse method.

=head1 METHODS

=over 4

=item $docparser = Biblio::DocParser-E<gt>new()

The new() method creates a new parser instance. 

=cut

sub new
{
	my($class) = @_;
	my $self = {};
	return bless($self, $class);
}

=pod

=item @references = $parser-E<gt>parse($lines, %options)

The parse() method takes either a content string or an IO::Handle,
and returns an array of reference strings.

=cut

sub parse
{
	my($self, $lines, %options) = @_;
	die "This method should be overridden.\n";
}

1;

__END__

=pod

=back

=head1 AUTHOR

Mike Jewell <moj@ecs.soton.ac.uk>

=cut
