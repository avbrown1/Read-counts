#!/usr/bin/perl
# This is to enable listing the counts from novoalign results with respect to the genes present in all the samples.
# The all_genes file should have a list of all the genes in the first column
# The novo_counts file should have genes and counts in two columns respectively, separated by a tab
# This script will report counts for all the genes, including genes/exons that were not present to allow easy linking of all the counts files
# The output files will have 2 columns; column1=genes, column2=counts
# usage perl counts-from-novo.pl <all_genes> <novo_counts> > <output.txt>
# Make sure both files are sorted identically

open TR1, $ARGV[0] or die "Can't open input all_genes file\n";
open TR2, $ARGV[1] or die "Can't open input novo_counts file\n";

my @genes;
my @gene_info;
my @novo_info;
my @novo_genes;
my @novo_hits;
my $total_count=0;
my $hits_count=0;
my $gene_counter=0;
my $novo_counter=0;

while (<TR1>)
{
    chomp();
    @genes=split(" ");
    push @gene_info, $genes[0];
}

while (<TR2>)
{
    chomp ();
    @novo_info=split(" ");
    push @novo_genes, $novo_info[0];
    push @novo_hits, $novo_info[1];
}

$total_count = @gene_info;
$hits_count = @hits;

while ($gene_counter <= $total_count)
	{
	if ($gene_info[$gene_counter] eq $novo_genes[$novo_counter])
		{
		print "$novo_genes[$novo_counter] \t $novo_hits[$novo_counter]\n";
		$gene_counter++;
		$novo_counter++;
		}
	else
		{
		print "$gene_info[$gene_counter] \t 0 \n";
		$gene_counter++;
		}
	}
exit;
