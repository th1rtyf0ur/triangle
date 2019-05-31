#!/usr/bin/perl -w
# get no. of lines (or use default: 10)
$c = $ARGV[0] || 10;
# set up & print first 2 lines
printf("%*s\n", $c+12, &colorize(1));
@a = (1);	# start!
for (my $i=1;$i<$c;$i++) {	# lines
	for (my $j=0; $j<$#a; $j++) {	# columns- replace array in-line
		$a[$j] += $a[$j+1];
		$a[$j] %= 10;
	}
	printf("%*s ", ($c+12-$i), &colorize(1));
	print join(" ", map { &colorize($_) } @a) ."\n";
	unshift(@a, 1); # add a 1 to the beginning for next line
}

sub colorize {
	my $l = shift;
	my $esc = $l % 7 + 31;
	return ($l > 7 || $l == 0) ?  "\e[$esc;1m$l\e[0m" : "\e[${esc}m$l\e[0m"
}
