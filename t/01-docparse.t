#!/bin/env perl

BEGIN {
  unless(grep /blib/, @INC) {
    chdir 't' if -d 't';
    unshift @INC, '../lib' if -d '../lib';
  }
}

use strict;
use Test;

BEGIN { plan tests => 3 }

{

  use Biblio::DocParser::Standard;
  use Biblio::DocParser::Utils;
  my $content = Biblio::DocParser::Utils::get_content("t/test.txt");
  my $doc_parser = new Biblio::DocParser::Standard();
  my @references = $doc_parser->parse($content);
  ok(scalar @references == 3);
  ok($references[0] eq "A Reference");
  ok($references[2] eq "Yet another reference");
}
