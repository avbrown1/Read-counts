## To extract counts from a SAM alignment file (e.g. Bowtie output)
## Important - Use only when the alignment file has one hit (best hit) per read being reported
## Important - Use only for single-end read alignments, NOT for paired-reads

for fname in *.sam; do
awk '{print$3"\t1"|"sort -d"}' $fname > $fname.precount
perl raw_count.pl $fname.precount | grep -v genes > $fname.count
done

cat *.sam.count | awk '{print$1|"sort -u"}' > all.txt

for fname in *.sam.count
do
perl counts-from-novo.pl all.txt $fname > $fname.all
done

exit
