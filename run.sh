#! /bin/bash

# vol_aj.txt: The All-Jazz Real Book (Sher Music) (all-jazz-real-book.txt)
# vol_bc.txt: The Book - Commercial (thebook.txt)
# vol_c1.txt: Cuban Fake Book Vol. No 1 (cuban-fake-book-vol1.txt)
# vol_cc.txt: The Colorado Cookbook (MASTERNX.txt:ColoBk)
# vol_eu.txt: The European Real Book (Sher Music) (the-european-real-book.txt)
# vol_ev.txt: Bill Evans Fakebook (MASTERNX.txt:EvansBk)
# vol_fj.txt: 557 Jazz Standards - swing to bop (557-jazz-standards.txt)
# vol_h1.txt ... vol_h6.txt: Real Book (Hal Leonard) vol 1-6 (vol_h{1..6}_raw.txt)
# vol_jf.txt: The Jazz Fakebook (MASTERNX.txt:JazzFake)
# vol_jj.txt: Just Jazz Real Book (Hal Leonard) (just-jazz-real-book.txt)
# vol_jl.txt: Jazz LTD (MASTERNX.txt:JazzLTD)
# vol_js.txt: Just Standards Real Book (Warner Brothers) (just-standards-real-book.txt)
# vol_lm.txt: Library Of Musician’s Jazz (MASTERNX.txt:Library)
# vol_lr.txt: The Latin Real Book (Sher Music) (the-latin-real-book.txt)
# vol_n1.txt ... vol_n3.txt: The New Real Book (Sher) vol 1-3 (MASTERNX.txt:NewReal1-3)
# vol_ol: The Original Legal Musicians' Fake Book (original-legal-musician-fake-book.txt)
# vol_rj.txt: The Real Jazz Book (Hal Leonard) (real_jazz_book.txt)
# vol_rs.txt: The Real Jazz Standards Fake Book (Hal Leonard) (real-jazz-standards-fake-book.txt)
# vol_rw.txt: Richard Wolfe's legit professional fake book : more than 1010 songs (CPP/Belwin) (richard-wolfes-legit-professional-fakebook.txt)
# vol_s1.txt ... vol_s3.txt: Jazz Club Piano Solos 1-3 (Wise/Music Scale) (jazz-club-piano-solos-vol{1..3}.txt)
# vol_st.txt: Standards Real Book (Sher Music) (vol_st_raw.txt)
# vol_u1.txt ... vol_v3.txt: The Real Book (5th edition) vol 1-3 (MASTERNX.txt:RealBk1-3)
# vol_uf.txt: The Ultimate Fake Book (Hal Leonard) (the-ultimate-fake-book.txt)
# vol_uj.txt: The Ultimate Jazz Fake Book (Hal Leonard) (ultimate-jazz-fake-book.txt)
# vol_wg.txt: The World's Greatest Fake Book (Sher Music) (the_worlds_greatest_fakebook.txt)

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
sed -e 's/\(.*\), \(the\|a\)$/\2 \1/g' thebook.txt > vol_bc.txt
cp the_worlds_greatest_fakebook.txt vol_wg.txt
cp all-jazz-real-book.txt vol_aj.txt
cp the-latin-real-book.txt vol_lr.txt
cp original-legal-musician-fake-book.txt vol_ol.txt
cp just-standards-real-book.txt vol_js.txt
sed -e 's/\(.*\), \(THE\|A\)$/\2 \1/g' just-jazz-real-book.txt > vol_jj.txt
cp real-jazz-standards-fake-book.txt vol_rs.txt
sed -e 's/\(.*\), \(The\|A\)$/\2 \1/g' ultimate-jazz-fake-book.txt > vol_uj.txt
sed -e 's/\(.*\), \(The\|A\)$/\2 \1/g' 557-jazz-standards.txt > vol_fj.txt
cp the-european-real-book.txt vol_eu.txt
cp jazz-club-piano-solos-vol1.txt vol_s1.txt
cp jazz-club-piano-solos-vol2.txt vol_s2.txt
cp jazz-club-piano-solos-vol3.txt vol_s3.txt
cp the-ultimate-fake-book.txt vol_uf.txt
cp richard-wolfes-legit-professional-fakebook.txt vol_rw.txt
sed -Ee 's/[0-9]+\) //' cuban-fake-book-vol1.txt | sed -e 's/\(.*\), \(El\|La\)$/\2 \1/g' > vol_c1.txt
cut -d ' ' -f 2- real_jazz_book.txt | awk '{$1=$1};1' > vol_rj.txt
sed -e 's/\(.*\), \(The\|A\)/\2 \1/g' vol_st_raw.txt > vol_st.txt
for i in {1..6}; do
    cp vol_h${i}_raw.txt vol_h$i.txt
done

for v in {aj,bc,c1,cc,eu,ev,fj,h1,h2,h3,h4,h5,h6,jf,jj,jl,js,lm,lr,n1,n2,n3,ol,rj,rs,rw,s1,s2,s3,st,u1,u2,u3,uf,uj,wg}; do
    awk -v vol=$v '{print toupper($0) "%%--%%" toupper(vol)}' vol_$v.txt
done > tempfile0
sed -e 's/&/\\&/g' -e 's/#/$\\sharp$/' tempfile0 | \
    sort | \
    awk -F '%%--%%'  'vol[$1]=vol[$1] ",\\allowbreak " $2 {print $1, "%%--%%" vol[$1]}' | \
    sort -r | \
    awk -F '%%--%%,' '!seen[$1] {print "\\hangindent1em " $1 "\\nolinebreak\\dotfill\\nolinebreak\\rule{1mm}{0mm}" $2 "\\par"; seen[$1]=1} ' > tempfile

for i in {A..Z}; do
    echo "%\\hangindent1em ${i}%%00000" >> tempfile
done

sort tempfile |\
    sed -Ee 's/%\\hangindent1em ([A-Z])%%00000/\\vspace{\\baselineskip}{\\centering \1\\nopagebreak\\\\}\\vspace{\\baselineskip}\\nopagebreak/' > allsongs.tex

cat tempfile |\
    sed -Ee 's/%\\hangindent1em ([A-Z])%%00000//' -e 's/\\hangindent1em (.*) \\nolinebreak.*/\1/' -e 's/^THE |^A |^AN //' -e 's/[[:punct:][:blank:]]//g' | sort > prunedstrings

# uniq -w 10 -cd prunedstrings
# exit

pdflatex realbookindex.tex
