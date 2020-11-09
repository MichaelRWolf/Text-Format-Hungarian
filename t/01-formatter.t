#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

use Text::Format::Hungarian;

plan tests => 2;

my $test_plan = <<'TEST_PLAN';

PASS - Can create a formatter.
WIP - Formatting empty text returns empty text.
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
  EmptyTextReturnsEmptyText();
}

sub EmptyTextReturnsEmptyText {
  my $formatter = Text::Format::Hungarian->new();
  my $empty_text = '';

  my $expected = $empty_text;
  my $result = $formatter->format($empty_text);

  is($result, $expected, (caller(0))[3]);
}

sub CanCreateFormatter {
  my $formatter = Text::Format::Hungarian->new();

  isa_ok($formatter, 'Text::Format::Hungarian', (caller(0))[3]);
}
