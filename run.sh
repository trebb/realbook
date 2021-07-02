#! /bin/bash

# vol_1.txt ... vol_6.txt: Real Book (Hal Leonard) vol 1-6
# vol_s.txt: Standards Real Book (Sher Music)
# vol_e.txt: Bill Evans Fakebook (EvansBk)
# vol_c.txt: The Colorado Cookbook (ColoBk)
# vol_jf.txt: The Jazz Fakebook (JazzFake)
# vol_jl.txt: Jazz LTD (JazzLTD)
# vol_1u.txt ... vol_3v.txt: The Real Book (5th edition) vol 1-3 (RealBk1-3)
# vol_1n.txt ... vol_3n.txt: The New Real Book (Sher) vol 1-3 (NewReal1-3)
# vol_m.txt: Library Of Musician’s Jazz (Library)
# vol_b.txt: The Book - Commercial (TheBook)

awk -e '{print $(NF-1), $0}' MASTERNX.txt | awk -e 'NF{NF-=2};1' > MASTERNX.tmp
grep -e '^EvansBk'  MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_e.txt
grep -e '^ColoBk'   MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_c.txt
grep -e '^JazzFake' MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_jf.txt
grep -e '^JazzLTD'  MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_jl.txt
grep -e '^RealBk1'  MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_1u.txt
grep -e '^RealBk2'  MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_2u.txt
grep -e '^RealBk3'  MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_3u.txt
grep -e '^NewReal1' MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_1n.txt
grep -e '^NewReal2' MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_2n.txt
grep -e '^NewReal3' MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_3n.txt
grep -e '^Library'  MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_m.txt
grep -e '^TheBook'  MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_b.txt

sed -e 's/\(.*\), \(The\|A\)/\2 \1/g' vol_s_raw.txt > vol_s.txt

for v in {1,1u,1n,2,2u,2n,3,3u,3n,4,5,6,s,jl,jf,c,m,b,e}; do
    awk -v vol=$v '{print toupper($0) "%%--%%" toupper(vol)}' vol_$v.txt
done | sed -e 's/&/\\&/g' -e 's/#/$\\sharp$/' | \
    sort | \
    awk -F '%%--%%'  'vol[$1]=vol[$1] "," $2 {print $1, "%%--%%" vol[$1]}' | \
    sort -r | \
    awk -F '%%--%%,' '!seen[$1] {print "\\hangindent1em " $1 "\\nolinebreak\\dotfill\\nolinebreak\\rule{.5mm}{0mm}" $2 "\\par"; seen[$1]=1} ' > tempfile

for i in {A..Z}; do
    echo "%\\hangindent1em ${i}%%00000" >> tempfile
done

sort tempfile |\
    sed -Ee 's/%\\hangindent1em ([A-Z])%%00000/\\vspace{\\baselineskip}{\\centering \1\\nopagebreak\\\\}\\vspace{\\baselineskip}\\nopagebreak/' > allsongs.tex

# uniq -w 10 -dD allsongs.tex
# exit

pdflatex realbookindex.tex
