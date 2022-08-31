#! /bin/bash

# usable COLORs: red, blue, cyan, magenta, black, gray, brown, orange, purple, teal, violet
books=(
    #KEY  COLOR     TITLE                                              PUBLISHER         ISBN            SOURCE FILE
    "aj C:gray    T:The All-Jazz Real Book                           P:Sher Music      I:9781883217143 F:all-jazz-real-book.txt"
    "bc C:teal    T:The Book / Commercial                            P:-               I:-             F:thebook.btxt"
    "c1 C:teal    T:Cuban Fake Book Vol. No 1                        P:-               I:-             F:cuban-fake-book-vol1.txt"
    "cc C:teal    T:The Colorado Cookbook                            P:-               I:-             F:MASTERNX.txt:ColoBk"
    "eu C:gray    T:The European Real Book                           P:Sher Music      I:9781883217242 F:the-european-real-book.txt"
    "ev C:teal    T:Bill Evans Fakebook                              P:-               I:-             F:MASTERNX.txt:EvansBk"
    "fj C:teal    T:557 Jazz Standards - swing to bop                P:-               I:-             F:557-jazz-standards.txt"
    "h1 C:red     T:Real Book vol 1 (sixth edition)                  P:Hal Leonard     I:9780634060380 F:vol_h1_raw.txt"
    "h2 C:red     T:Real Book vol 2 (second edition)                 P:Hal Leonard     I:9780634060212 F:vol_h2_raw.txt"
    "h3 C:red     T:Real Book vol 3 (second edition)                 P:Hal Leonard     I:9780634061363 F:vol_h3_raw.txt"
    "h4 C:red     T:Real Book vol 4                                  P:Hal Leonard     I:9781423425427 F:vol_h4_raw.txt"
    "h5 C:red     T:Real Book vol 5                                  P:Hal Leonard     I:9781423488484 F:vol_h5_raw.txt"
    "h6 C:red     T:Real Book vol 6                                  P:Hal Leonard     I:9781458440655 F:vol_h6_raw.txt"
    "jf C:teal    T:The Jazz Fakebook                                P:-               I:-             F:MASTERNX.txt:JazzFake"
    "jj C:gray    T:Just Jazz Real Book                              P:Hal Leonard     I:9780757901683 F:just-jazz-real-book.txt"
    "jl C:teal    T:Jazz LTD / Over 500 tunes the real books missed  P:-               I:-             F:MASTERNX.txt:JazzLTD"
    "js C:gray    T:Just Standards Real Book                         P:Warner Brothers I:9780757904530 F:just-standards-real-book.txt"
    "lm C:teal    T:Library Of Musicians' Jazz                       P:-               I:-             F:MASTERNX.txt:Library"
    "lr C:black   T:The Latin Real Book                              P:Sher Music      I:9781883217051 F:the-latin-real-book.txt"
    "n1 C:black   T:The New Real Book vol 1                          P:Sher Music      I:9780961470142 F:MASTERNX.txt:NewReal1"
    "n2 C:black   T:The New Real Book vol 2                          P:Sher Music      I:9780961470173 F:MASTERNX.txt:NewReal2"
    "n3 C:black   T:The New Real Book vol 3                          P:Sher Music      I:9781883217310 F:MASTERNX.txt:NewReal3"
    "ol C:teal    T:Original Legal Musicians' Fake Book              P:-               I:0849400015    F:original-legal-musician-fake-book.txt"
    "rj C:black   T:The Hal Leonard Real Jazz Book                   P:Hal Leonard     I:9780793562305 F:real_jazz_book.txt"
    "rs C:gray    T:The Real Jazz Standards Fake Book                P:Hal Leonard     I:9780634021558 F:real-jazz-standards-fake-book.txt"
    "rw C:black   T:Richard Wolfe's legit professional fake book     P:CPP/Belwin      I:9780898984484 F:richard-wolfes-legit-professional-fakebook.txt"
    "s1 C:gray    T:Jazz Club Piano Solos 1                          P:Music Scales    I:9780711937666 F:jazz-club-piano-solos-vol1.txt"
    "s2 C:gray    T:Jazz Club Piano Solos 2                          P:Music Scales    I:9780711941212 F:jazz-club-piano-solos-vol2.txt"
    "s3 C:teal    T:Jazz Club Piano Solos 3                          P:Wise            I:-             F:jazz-club-piano-solos-vol3.txt"
    "st C:red     T:Standards Real Book                              P:Sher Music      I:9781883217099 F:vol_st_raw.txt"
    "u1 C:teal    T:The Real Book vol 1 (fifth edition)              P:-               I:-             F:MASTERNX.txt:RealBk1"
    "u2 C:teal    T:The Real Book vol 2                              P:-               I:-             F:MASTERNX.txt:RealBk2"
    "u3 C:teal    T:The Real Book vol 3                              P:-               I:-             F:MASTERNX.txt:RealBk3"
    "uf C:black   T:The Ultimate Fake Book                           P:Hal Leonard     I:9780793529391 F:the-ultimate-fake-book.txt"
    "uj C:gray    T:The Ultimate Jazz Fake Book                      P:Hal Leonard     I:9780881889796 F:ultimate-jazz-fake-book.txt"
    "wg C:black   T:The World's Greatest Fake Book                   P:Sher Music      I:9780961470111 F:the_worlds_greatest_fakebook.txt"
)

# for b in "${books[@]}"; do
#     key="${b/ *}"
#     color="${b#* C:}"
#     color="${color/ *}"
#     title="${b#* T:}"
#     title="${title/ P:*}"
#     publisher="${b#* P:}"
#     publisher="${publisher/ I:*}"
#     isbn="${b#* I:}"
#     isbn="${isbn/ *}"
#     file="${b#* F:}"
#     echo "k=$key,c=$color,t=$title,p=$publisher,i=$isbn,f=$file"
# done

printf "\\\begin{tabular}{rlll}\n" > legend.tex
printf "  --- & ----------------------------------------------- & --------------- & -------------- \\\\\\ \n" >> legend.tex
printf "  KEY & TITLE                                           & PUBLISHER       & ISBN           \\\\\\ \n" >> legend.tex
printf "  --- & ----------------------------------------------- & --------------- & -------------- \\\\\\ \n" >> legend.tex
for b in "${books[@]}"; do
    key="${b/ *}"
    color="${b#* C:}"
    color="${color/ *}"
    title="${b#* T:}"
    title="${title/ P:*}"
    publisher="${b#* P:}"
    publisher="${publisher/ I:*}"
    isbn="${b#* I:}"
    isbn="${isbn/ *}"
    printf "  {\\\color{%s} %s} & %s & %s & %s \\\\\\ \n" "$color" "${key^^}" "${title^^}" "${publisher^^}" "$isbn"
done >> legend.tex
printf " \\multicolumn{4}{l}{---------------------------------------------------------------------------------------} \\\\\\ \n" >> legend.tex
printf "\\\end{tabular}\n" >> legend.tex

for b in "${books[@]}"; do
    key="${b/ *}"
    rm -f vol_${key}.txt
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

for b in "${books[@]}"; do
    key="${b/ *}"
    if ! [[ -f vol_${key}.txt ]]; then
        echo "file $vol_${key}.txt missing"
        exit
    fi
done

for b in "${books[@]}"; do
    key="${b/ *}"
    color="${b#* C:}"
    color="${color/ *}"
    awk -v key=${key} -v color=${color} '{print toupper($0) "%%--%%" key "%%--%%{\\color{" color "}" toupper(key) "}"}' vol_${key}.txt
done > tempfile0
sed -e 's/&/\\&/g' -e 's/#/$\\sharp$/' tempfile0 | \
    sort | \
    awk -F '%%--%%'  'vol[$1]=vol[$1] ",\\allowbreak " $3 {print $1, "%%--%%" vol[$1]}' | \
    sort -r | \
    awk -F '%%--%%,' '!seen[$1] {print "\\hangindent1em " $1 "\\nolinebreak\\dotfill\\nolinebreak\\rule{1mm}{0mm}" $2 "\\par"; seen[$1]=1} ' > tempfile

for i in {A..Z}; do
    echo "%\\hangindent1em ${i}%%00000" >> tempfile
done

sort tempfile |\
    sed -Ee 's/%\\hangindent1em ([A-Z])%%00000/\\vspace{\\baselineskip}{\\centering \1\\quad \1\\nopagebreak\\\\ \1\\quad \1\\quad \1\\nopagebreak\\\\ \1\\quad \1\\nopagebreak\\\\}\\vspace{\\baselineskip}\\nopagebreak/' > allsongs.tex

cat tempfile |\
    sed -Ee 's/%\\hangindent1em ([A-Z])%%00000//' -e 's/\\hangindent1em (.*) \\nolinebreak.*/\1/' -e 's/^THE |^A |^AN //' -e 's/[[:punct:][:blank:]]//g' | sort > prunedstrings

pdflatex realbookindex.tex

echo "checking for duplications..."
grep -v "^$" prunedstrings | uniq -w 40 -D
for b in "${books[@]}"; do

    pdftotext realbookindex.pdf - | grep -i "${key},${key}"
done
