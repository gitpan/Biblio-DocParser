#!/usr/bin/perl

use utf8;
use lib "../..";

use ParaTools::DocParser::Standard;
use ParaTools::CiteParser::Standard;
use ParaTools::CiteParser::Citebase;
use ParaTools::OpenURL;
use Term::ANSIColor;

binmode(STDERR, ":utf8");
binmode(STDOUT, ":utf8");

if (scalar @ARGV != 1)
{
	print STDERR "Usage: $0 <filename>\n";
	exit;
}

my $cit_parser = new ParaTools::CiteParser::Standard;
my $doc_parser = new ParaTools::DocParser::Standard;

#print "Parsed using ParaTools::CiteParser::Standard\n\n";

#parse_document($doc_parser,$cit_parser);

print "Parsed using ParaTools::CiteParser::Citebase\n\n";

$cit_parser = new ParaTools::CiteParser::Citebase;
parse_document($doc_parser,$cit_parser);

sub parse_document {
	my ($doc_parser,$cit_parser) = @_;
	my $content = ParaTools::Utils::get_content($ARGV[0]);
	my @references = $doc_parser->parse($content);
	foreach $reference (@references)
	{
		$metadata = $cit_parser->parse($reference);
		$location = ParaTools::OpenURL::create_openurl($metadata);
		print
			color("red"), "$reference\n", color("reset"),
			color("green"), "\t$location\n", color("reset"),
			"---\n";
	}
}
