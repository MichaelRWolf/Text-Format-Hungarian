#!perl
use 5.006;
use strict;
use warnings;
use Test::More;

use Text::Format::Hungarian;

plan tests => 4;

my $test_plan = <<'TEST_PLAN';

PASS - Can create a formatter.
PASS - Formatting empty text returns empty text.
Null lookup returns original text.
PASS - Single-entry lookup changes single word.
**WIP** Single-entry lookup changes all matching words.
Multi-entry lookup changes all matching words.
Multi-entry lookup does not change partially matching words.
Unmatched words are added to lookup.
Lookup can be initialized from file.
Lookup can be serialized to file.
TEST_PLAN

RunAll();

my $formatter;
sub setup {
  my ($h_ref) = @_;
  $h_ref ||= {};
  $formatter = Text::Format::Hungarian->new($h_ref);
}


sub RunAll {
  CanCreateFormatter();
  EmptyTextReturnsEmptyText();
  SingleEntryLookupChangesSingleWord();
  SingleEntryLookupChangesAllMatchingWords();
}

sub CanCreateFormatter {
  setup();

  isa_ok($formatter, 'Text::Format::Hungarian', (caller(0))[3]);
}

sub EmptyTextReturnsEmptyText {
  setup();
  my $empty_text = '';

  my $expected = $empty_text;
  my $result = $formatter->format($empty_text);

  is($result, $expected, (caller(0))[3]);
}

sub SingleEntryLookupChangesSingleWord {
  setup({quick => 'adj'});

  my $original_text = 'The quick brown fox...';

  my $expected = 'The adjQuick brown fox...';
  my $result = $formatter->format($original_text);

  is($result, $expected, (caller(0))[3]);
}


sub SingleEntryLookupChangesAllMatchingWords {
  setup({quick => 'adj'});

  my $original_text = 'The quick quick brown fox is quick...';

  my $expected = 'The adjQuick adjQuick brown fox is adjQuick...';
  my $result = $formatter->format($original_text);

  is($result, $expected, (caller(0))[3]);
}

