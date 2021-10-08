#! /bin/bash

# vol_bc.txt: The Book - Commercial (TheBook)
# vol_cc.txt: The Colorado Cookbook (ColoBk)
# vol_ev.txt: Bill Evans Fakebook (EvansBk)
# vol_h1.txt ... vol_h6.txt: Real Book (Hal Leonard) vol 1-6
# vol_jf.txt: The Jazz Fakebook (JazzFake)
# vol_jl.txt: Jazz LTD (JazzLTD)
# vol_ol: The Original Legal Musicians' Fake Book
# vol_lm.txt: Library Of Musician’s Jazz (Library)
# vol_n1.txt ... vol_n3.txt: The New Real Book (Sher) vol 1-3 (NewReal1-3)
# vol_rj.txt: The Real Jazz Book (Hal Leonard)
# vol_st.txt: Standards Real Book (Sher Music)
# vol_u1.txt ... vol_v3.txt: The Real Book (5th edition) vol 1-3 (RealBk1-3)
# vol_wg.txt: The World's Greatest Fake Book (Sher Music)


awk -e '{print $(NF-1), $0}' MASTERNX.txt | awk -e 'NF{NF-=2};1' > MASTERNX.tmp
grep -e '^EvansBk'  MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_ev.txt
grep -e '^ColoBk'   MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_cc.txt
grep -e '^JazzFake' MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_jf.txt
grep -e '^JazzLTD'  MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_jl.txt
grep -e '^RealBk1'  MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_u1.txt
grep -e '^RealBk2'  MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_u2.txt
grep -e '^RealBk3'  MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_u3.txt
grep -e '^NewReal1' MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_n1.txt
grep -e '^NewReal2' MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_n2.txt
grep -e '^NewReal3' MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_n3.txt
grep -e '^Library'  MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_lm.txt
sed -e 's/\(.*\), \(the\|a\)/\2 \1/g' thebook.txt > vol_bc.txt
cp the_worlds_greatest_fakebook.txt vol_wg.txt
cp original-legal-musician-fake-book.txt vol_ol.txt
cut -d ' ' -f 2- real_jazz_book.txt | awk '{$1=$1};1' > vol_rj.txt
sed -e 's/\(.*\), \(The\|A\)/\2 \1/g' vol_st_raw.txt > vol_st.txt
for i in {1..6}; do
    cp vol_h${i}_raw.txt vol_h$i.txt
done

for v in {h1,u1,n1,h2,u2,n2,h3,u3,n3,h4,h5,h6,st,jl,jf,cc,lm,bc,ev,wg,rj,ol}; do
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
