#! /usr/bin/perl

use strict;
use warnings;

main();


{ # Namespace for translator code
  sub translator_init {
    my %analogue_of =
      (
       Friends => 'Friends',
       Romans => 'Coders',
       countrymen => 'craftsmen',
       ears => 'eyes',
       
       # Caesar => 'AppsHungarianNotation',
       # Caesar => '__Strongly Typed Languages__',
       # Caesar => '__Undecorated Varialble Names__',
       # He =>  'It', he  => 'it',
       # Him => 'It', him => 'it',
       
       Caesar => '__Unadorned Identifiers__',
       He =>  'It', he  => 'it',
       Him => 'It', him => 'it',
       
       
       
       # ambitious => 'beneficial',
       # ambitious => 'evolving',
       
       # The evil that men do lives after them;
       # The good is oft interrèd with their bones.
       bones => 'repos',
       bones => 'merges',
       
       # Brutus => 'Microsoft Apps division',
       Brutus => '__AppsHungarianNotation__',
       'an honorable' => 'a clarifying',
       man => 'encoding', men => 'encodings',
       man => 'convention', men => 'conventions',
       
       
       funeral => 'funeral?',
       
       # He hath brought many captives home to Rome,
       # Whose ransoms did the general coffers fill.
       # Did this in Caesar seem ambitious?
       brought => 'tamed',
       captives => 'bugs',
       'home to Rome' => 'into Production',
       ransomes => 'recurring subscriptions',
       
       # When that the poor have cried, Caesar hath wept;
       # Ambition should be made of sterner stuff.
       # Yet Brutus says he was ambitious,
       # And Brutus is an honorable man.
       poor => q{PR reviewers},
       # wept => 'empathized',
      );
    
    
    sub translate_term {
      my ($input, $original_term, $new_term) = @_;
      my ($output) = ($input);
      
      $output =~ s(\b{wb} $original_term \b{wb})
		  ($new_term)gmx;
      # $output =~ s(\b{wb} $original_term \b{wb})
      # 	      ($new_term)gmx;
      
      return $output;
    }
  }


    
sub main {
  my $translated;
  my $term_count = 0;

  for( translator_init(), ($translated = Friends_Romans_Countrymen_text())
       ; (my($shak_term, $wolf_term) = each %analogue_of)
       ; # empty
     ) {
    $term_count++;
    printf qq{%s => "%s"\n}, $shak_term, $wolf_term;
    $translated = translate_term($translated, $shak_term, $wolf_term);
  }
  
  printf(join(q{}, q{=}x78, "\n", "%s", "\n"x2), $translated);
}



sub Friends_Romans_Countrymen_text {
  return <<'Friends_Romans_Countrymen';
Julius Caesar, Act III, Scene II
William Shakespeare - 1564-1616

Antony speaks at Caesar’s funeral


Friends, Romans, countrymen, lend me your ears.
I have come to bury Caesar, not to praise him.

The evil that men do lives after them;
The good is oft interrèd with their bones.
So let it be with Caesar.  

                           The noble Brutus
Hath told you Caesar was ambitious.
If it were so, it was a grievous fault,
And grievously hath Caesar answered it.

Here, under leave of Brutus and the rest
  (For Brutus is an honorable man;
  So are they all, all honorable men),
Come I to speak in Caesar’s funeral.

He was my friend, faithful and just to me,
But Brutus says he was ambitious,
And Brutus is an honorable man.

He hath brought many captives home to Rome,
Whose ransoms did the general coffers fill.
Did this in Caesar seem ambitious?

When that the poor have cried, Caesar hath wept;
Ambition should be made of sterner stuff.
Yet Brutus says he was ambitious,
And Brutus is an honorable man.

You all did see that on the Lupercal
I thrice presented  him a kingly crown,
Which he did thrice refuse. Was this ambition?
Yet Brutus says he was ambitious,
And sure he is an honorable man.

I speak not to disprove what Brutus spoke,
But here I am to speak what I do know.

You all did love him once, not without cause.
What cause withholds you, then, to mourn for him?—

O judgment, thou art fled to brutish beasts,
And men have lost their reason!

                                —Bear with me;

My heart is in the coffin there with Caesar,
And I must pause till it come back to me.

Friends_Romans_Countrymen
}
