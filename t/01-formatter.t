#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

use Text::Format::Hungarian;

plan tests => 1;

my $test_plan = <<'TEST_PLAN';

** Can create a formatter.
Formatting empty text returns empty text.
Formatting simple text returns identical text.
Single-entry lookup changes single word.
Single-entry lookup changes all matching words.
Multi-entry lookup changes all matching words.
Multi-entry lookup does not change partially matching words.
Unmatched words are added to lookup.
Lookup can be initialized from file.
Lookup can be serialized to file.
TEST_PLAN

RunAll();

sub RunAll {
  CanCreateFormatter();
}

sub CanCreateFormatter {
  my $formatter = Text::Format::Hungarian->new();

  isa_ok($formatter, 'Text::Format::Hungarian');
}
