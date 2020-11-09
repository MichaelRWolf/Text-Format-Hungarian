#!perl
use 5.006;
use strict;
use warnings;
use Test::More;

use Text::Format::Hungarian;

plan tests => 5;

my $test_plan = <<'TEST_PLAN';

PASS - Can create a formatter.
PASS - Formatting empty text returns empty text.
Null lookup returns original text.
PASS - Single-entry lookup changes single word.
PASS - Single-entry lookup changes all matching words.
PASS - Multi-entry lookup changes all matching words.
**WIP** Multi-entry lookup does not change partially matches.
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
  MultientrylookupChangesAllMatchingWords();
  MultiEntryLookupDoesNotChangePartiallyMatches();
}

sub CanCreateFormatter {
  setup();

  isa_ok($formatter, 'Text::Format::Hungarian', '$formatter');
}


sub EmptyTextReturnsEmptyText {
  setup();
  my $empty_text = '';

  my $result = $formatter->format($empty_text);
  my $expected = $empty_text;

  is($result, $expected, subroutine_name());
}


sub SingleEntryLookupChangesSingleWord {
  setup({quick => 'adj'});

  my $original_text = 'The quick brown fox...';

  my $result = $formatter->format($original_text);
  my $expected = 'The adjQuick brown fox...';

  is($result, $expected, subroutine_name());
}


sub SingleEntryLookupChangesAllMatchingWords {
  setup({quick => 'adj'});

  my $original_text = 'The quick quick brown fox is quick...';

  my $result = $formatter->format($original_text);
  my $expected = 'The adjQuick adjQuick brown fox is adjQuick...';

  is($result, $expected, subroutine_name());
}



sub MultientrylookupChangesAllMatchingWords {
  setup({quick => 'adj', brown => 'adj', 'fox' => 'noun'});

  my $original_text = 'The quick quick brown fox is quick...';

  my $result = $formatter->format($original_text);
  my $expected = 'The adjQuick adjQuick adjBrown nounFox is adjQuick...';

  is($result, $expected, subroutine_name());
}


sub MultiEntryLookupDoesNotChangePartiallyMatches{
  setup({quick => 'adj', brown => 'adj', 'fox' => 'noun'});

  my $original_text = 'The quick brown fox quickly browned foxfires';

  my $result = $formatter->format($original_text);
  my $expected = 'The adjQuick adjBrown nounFox quickly browned foxfires';

  is($result, $expected, subroutine_name());

}


# ================================================================
# Helpers


sub subroutine_name {
  my $frames_back_from_my_caller = (shift || 0);
  my $frames_back_from_me = $frames_back_from_my_caller + 1;
  my @caller_info = caller($frames_back_from_me);
  my $subroutine_name = $caller_info[3];
  return $subroutine_name;
}


  
