#! /bin/bash

books=(
    aj # vol_aj.txt: The All-Jazz Real Book (Sher Music) (all-jazz-real-book.txt)
    bc # vol_bc.txt: The Book - Commercial (thebook.txt)
    c1 # vol_c1.txt: Cuban Fake Book Vol. No 1 (cuban-fake-book-vol1.txt)
    cc # vol_cc.txt: The Colorado Cookbook (MASTERNX.txt:ColoBk)
    eu # vol_eu.txt: The European Real Book (Sher Music) (the-european-real-book.txt)
    ev # vol_ev.txt: Bill Evans Fakebook (MASTERNX.txt:EvansBk)
    fj # vol_fj.txt: 557 Jazz Standards - swing to bop (557-jazz-standards.txt)
    h1 # vol_h1.txt: Real Book (Hal Leonard) vol 1 (vol_h1_raw.txt)
    h2 # vol_h2.txt: Real Book (Hal Leonard) vol 2 (vol_h2_raw.txt)
    h3 # vol_h3.txt: Real Book (Hal Leonard) vol 3 (vol_h3_raw.txt)
    h4 # vol_h4.txt: Real Book (Hal Leonard) vol 4 (vol_h4_raw.txt)
    h5 # vol_h5.txt: Real Book (Hal Leonard) vol 5 (vol_h5_raw.txt)
    h6 # vol_h6.txt: Real Book (Hal Leonard) vol 6 (vol_h6_raw.txt)
    jf # vol_jf.txt: The Jazz Fakebook (MASTERNX.txt:JazzFake)
    jj # vol_jj.txt: Just Jazz Real Book (Hal Leonard) (just-jazz-real-book.txt)
    jl # vol_jl.txt: Jazz LTD (MASTERNX.txt:JazzLTD)
    js # vol_js.txt: Just Standards Real Book (Warner Brothers) (just-standards-real-book.txt)
    lm # vol_lm.txt: Library Of Musician’s Jazz (MASTERNX.txt:Library)
    lr # vol_lr.txt: The Latin Real Book (Sher Music) (the-latin-real-book.txt)
    n1 # vol_n1.txt: The New Real Book (Sher) vol 1 (MASTERNX.txt:NewReal1)
    n2 # vol_n2.txt: The New Real Book (Sher) vol 2 (MASTERNX.txt:NewReal2)
    n3 # vol_n3.txt: The New Real Book (Sher) vol 3 (MASTERNX.txt:NewReal3)
    ol # vol_ol: The Original Legal Musicians' Fake Book (original-legal-musician-fake-book.txt)
    rj # vol_rj.txt: The Real Jazz Book (Hal Leonard) (real_jazz_book.txt)
    rs # vol_rs.txt: The Real Jazz Standards Fake Book (Hal Leonard) (real-jazz-standards-fake-book.txt)
    rw # vol_rw.txt: Richard Wolfe's legit professional fake book : more than 1010 songs (CPP/Belwin) (richard-wolfes-legit-professional-fakebook.txt)
    s1 # vol_s1.txt: Jazz Club Piano Solos 1 (Music Scales) (jazz-club-piano-solos-vol1.txt)
    s2 # vol_s2.txt: Jazz Club Piano Solos 2 (Music Scales) (jazz-club-piano-solos-vol2.txt)
    s3 # vol_s3.txt: Jazz Club Piano Solos 3 (Wise) (jazz-club-piano-solos-vol3.txt)
    st # vol_st.txt: Standards Real Book (Sher Music) (vol_st_raw.txt)
    u1 # vol_u1.txt: The Real Book (5th edition) vol 1 (MASTERNX.txt:RealBk1)
    u2 # vol_u2.txt: The Real Book vol 2 (MASTERNX.txt:RealBk2)
    u3 # vol_u3.txt: The Real Book vol 3 (MASTERNX.txt:RealBk3)
    uf # vol_uf.txt: The Ultimate Fake Book (Hal Leonard) (the-ultimate-fake-book.txt)
    uj # vol_uj.txt: The Ultimate Jazz Fake Book (Hal Leonard) (ultimate-jazz-fake-book.txt)
    wg # vol_wg.txt: The World's Greatest Fake Book (Sher Music) (the_worlds_greatest_fakebook.txt)
)

for v in ${books[@]}; do
    rm -f vol_$v.txt
done

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

for v in ${books[@]}; do
    if ! [[ -f vol_$v.txt ]]; then
        echo "file $vol_$v.txt missing"
        exit
    fi
done

for v in ${books[@]}; do
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

pdflatex realbookindex.tex

echo "checking for duplications..."
grep -v "^$" prunedstrings | uniq -w 40 -D
for v in ${books[@]}; do
    pdftotext realbookindex.pdf - | grep -i "$v,$v"
done
