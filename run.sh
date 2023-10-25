#! /bin/bash

# Our COLORs: ClBn, ClGn, ClVi, ClRd
books=(
    #KEY  COLOR   TITLE                                            PUBLISHER       ISBN             REMARK                SOURCE FILE
    "aj C:ClRd  T:The All-Jazz Real Book~......................  P:Sher Music    I:9781883217143  R:lyrics, drum parts  F:all-jazz-real-book.txt"
    "bc C:ClGn  T:The Book/Commercial~.........................  P:...........   I:.............  R:-                   F:thebook.txt"
    "c1 C:ClGn  T:Cuban Fake Book Vol. No 1~...................  P:...........   I:.............  R:lyrics              F:cuban-fake-book-vol1.txt"
    "cc C:ClGn  T:The Colorado Cookbook~.......................  P:...........   I:.............  R:-                   F:MASTERNX.txt:ColoBk"
    "eu C:ClRd  T:The European Real Book~......................  P:Sher Music    I:9781883217242  R:drum parts          F:the-european-real-book.txt"
    "ev C:ClGn  T:Bill Evans Fakebook~.........................  P:Hal Leonard   I:9780634023897  R:lyrics              F:MASTERNX.txt:EvansBk"
    "fj C:ClGn  T:557 Jazz Standards - swing to bop~...........  P:...........   I:.............  R:-                   F:557-jazz-standards.txt"
    "h1 C:ClRd  T:The Real Book vol 1 (sixth edition)~.........  P:Hal Leonard   I:9780634060380  R:-                   F:vol_h1_raw.txt"
    "h2 C:ClRd  T:The Real Book vol 2 (second edition)~........  P:Hal Leonard   I:9780634060212  R:-                   F:vol_h2_raw.txt"
    "h3 C:ClRd  T:The Real Book vol 3 (second edition)~........  P:Hal Leonard   I:9780634061363  R:-                   F:vol_h3_raw.txt"
    "h4 C:ClRd  T:The Real Book vol 4~.........................  P:Hal Leonard   I:9781423425427  R:-                   F:vol_h4_raw.txt"
    "h5 C:ClRd  T:The Real Book vol 5~.........................  P:Hal Leonard   I:9781423488484  R:-                   F:vol_h5_raw.txt"
    "h6 C:ClRd  T:The Real Book vol 6~.........................  P:Hal Leonard   I:9781458440655  R:-                   F:vol_h6_raw.txt"
    "jf C:ClGn  T:Jazz Fakebook~...............................  P:...........   I:.............  R:lyrics              F:MASTERNX.txt:JazzFake"
    "jj C:ClBn  T:Just Jazz Real Book~.........................  P:Hal Leonard   I:9780757901683  R:lyrics              F:just-jazz-real-book.txt"
    "jl C:ClGn  T:Jazz LTD/Over 500 tunes the real books missed  P:...........   I:.............  R:-                   F:MASTERNX.txt:JazzLTD"
    "js C:ClBn  T:Just Standards Real Book~....................  P:Alfred Music  I:9780739039441  R:lyrics              F:just-standards-real-book.txt"
    "lm C:ClGn  T:Library Of Musicians' Jazz~..................  P:...........   I:.............  R:-                   F:MASTERNX.txt:Library"
    "lr C:ClVi  T:The Latin Real Book~.........................  P:Sher Music    I:9781883217051  R:lyrics, drum parts  F:the-latin-real-book.txt"
    "n1 C:ClVi  T:The New Real Book vol 1~.....................  P:Sher Music    I:9780961470142  R:lyrics              F:MASTERNX.txt:NewReal1"
    "n2 C:ClVi  T:The New Real Book vol 2~.....................  P:Sher Music    I:9780961470173  R:lyrics              F:MASTERNX.txt:NewReal2"
    "n3 C:ClVi  T:The New Real Book vol 3~.....................  P:Sher Music    I:9781883217310  R:lyrics, drum parts  F:MASTERNX.txt:NewReal3"
    "ol C:ClGn  T:The Original, Legal, Musicians' Fake Book~...  P:Hansen House  I:9780849400018  R:lyrics              F:original-legal-musician-fake-book.txt"
    "rj C:ClVi  T:The Hal Leonard Real Jazz Book~..............  P:Hal Leonard   I:9780793562305  R:lyrics              F:real_jazz_book.txt"
    "rl C:ClRd  T:The Real Latin Book~.........................  P:Hal Leonard   I:9781423487630  R:-                   F:the-real-latin-book.txt"
    "rs C:ClBn  T:The Real Jazz Standards Fake Book~...........  P:Hal Leonard   I:9780634021558  R:lyrics              F:real-jazz-standards-fake-book.txt"
    "rw C:ClVi  T:Richard Wolfe's legit professional fake book   P:CPP/Belwin    I:9780898984484  R:lyrics              F:richard-wolfes-legit-professional-fakebook.txt"
    "s1 C:ClBn  T:Jazz Club Piano Solos 1~.....................  P:Music Sales   I:9780711937666  R:-                   F:jazz-club-piano-solos-vol1.txt"
    "s2 C:ClBn  T:Jazz Club Piano Solos 2~.....................  P:Music Sales   I:9780711941212  R:-                   F:jazz-club-piano-solos-vol2.txt"
    "s3 C:ClGn  T:Jazz Club Piano Solos 3~.....................  P:Wise          I:.............  R:-                   F:jazz-club-piano-solos-vol3.txt"
    "st C:ClRd  T:The Standards Real Book~.....................  P:Sher Music    I:9781883217099  R:lyrics, drum parts  F:vol_st_raw.txt"
    "u1 C:ClGn  T:The Real Book vol 1 (fifth edition)~.........  P:...........   I:.............  R:-                   F:MASTERNX.txt:RealBk1"
    "u2 C:ClGn  T:The Real Book vol 2~.........................  P:...........   I:.............  R:-                   F:MASTERNX.txt:RealBk2"
    "u3 C:ClGn  T:The Real Book vol 3~.........................  P:...........   I:.............  R:-                   F:MASTERNX.txt:RealBk3"
    "uf C:ClRd  T:The Ultimate Fake Book (fifth edition)~......  P:Hal Leonard   I:9780793529391  R:lyrics              F:the-ultimate-fake-book.txt"
    "uj C:ClBn   T:The Ultimate Jazz Fake Book~.................  P:Hal Leonard   I:9780881889796  R:lyrics              F:ultimate-jazz-fake-book.txt"
    "wg C:ClRd  T:The World's Greatest Fake Book~..............  P:Sher Music    I:9780961470111  R:lyrics, drum parts  F:the_worlds_greatest_fakebook.txt"
)

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
cp the-real-latin-book.txt vol_rl.txt
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

echo "finding unique pieces..."
rm -f unique_pieces
IFS=$'\n'; for i in `sed -e 's/\(^.*\)%%--%%.*%%--%%.*/\1/' tempfile0 | sort | uniq -u`; do
               grep "^$i%%--%%" tempfile0;
           done |\
               sed -e 's/\(^.*\)%%--%%\(.*\)%%--%%.*/\2 \1/' > single_occurrences

for b in "${books[@]}"; do
    key="${b/ *}"
    title="${b#* T:}"
    title="${title/ P:*}"
    title="${title%"${title##*[![:space:]]}"}"
    songs=$(grep "^$key " single_occurrences |\
                cut -d ' ' -f '2-' |\
                sort)
    unique_songs=$(grep -c "^$key " single_occurrences)
    echo "${key^^} (${title^^}) - $unique_songs unique pieces" >> unique_pieces
    echo "$songs" >> unique_pieces
    echo >> unique_pieces
done

today=`date +%F`
total=`sed -e 's/\(^.*\)%%--%%.*%%--%%.*/\1/' tempfile0 | sort | uniq | wc -l`
printf "%s\n\n%s items\n" $today $total > tail.tex

printf "\\\begin{tabular}{l@{~}l@{~~}l@{~}l@{~~}r@{~}r@{~~}l}\n" > legend.tex
printf "  --  & --------------------------------------------- & ----------- & ------------- & \multicolumn{2}{@{}l@{~~}}{--------} & ------------------ \\\\\\ \n" >> legend.tex
printf "  KEY & TITLE                                         & PUBLISHER   & ISBN          & \multicolumn{2}{@{}c@{~~}}{ PIECES } & REMARKS            \\\\\\ \n" >> legend.tex
printf "      &                                               &             &               & \multicolumn{2}{@{}r@{~}}{TOTL UNIQ} &                    \\\\\\ \n" >> legend.tex
printf "  --  & --------------------------------------------- & ----------- & ------------- &                           ---- & --- & ------------------ \\\\\\ \n" >> legend.tex
for b in "${books[@]}"; do
    key="${b/ *}"
    color="${b#* C:}"
    color="${color/ *}"
    title="${b#* T:}"
    title="${title/ P:*}"
    publisher="${b#* P:}"
    publisher="${publisher/ I:*}"
    isbn="${b#* I:}"
    isbn="${isbn/ R:*}"
    remark="${b#* R:}"
    remark="${remark/ F:*}"
    total_songs=$(sed -e 's/\(^.*\)%%--%%\(.*\)%%--%%.*/\2 \1/' tempfile0 | grep -c "^$key ")
    unique_songs=$(grep -c "^$key " single_occurrences)
    printf "  {\\\color{%s} %s} & %s & %s & %s & %s & %s & %s \\\\\\ \n" "$color" "${key^^}" "${title^^}" "${publisher^^}" "$isbn" "$total_songs" "$unique_songs" "${remark^^}" >> legend.tex
done
printf " \\multicolumn{7}{l}{-----------------------------------------------------------------------------------------------------------} \\\\\\ \n" >> legend.tex
printf "\\\end{tabular}\n" >> legend.tex

sed -e 's/&/\\&/g' -e 's/#/\\#/' tempfile0 | \
    sort | \
    awk -F '%%--%%'  'vol[$1]=vol[$1] ",\\allowbreak " $3 {print $1, "%%--%%" vol[$1]}' | \
    sort -r | \
    awk -F '%%--%%,' '!seen[$1] {print "\\hangindent1em " $1 "\\nolinebreak\\dotfill\\nolinebreak\\rule{1mm}{0mm}" $2 "\\par"; seen[$1]=1} ' > tempfile

ignorable_strings=(
    "(BACH)"
    "(BEETHOVEN)"
    "(BIZET)"
    "(BORODIN)"
    "(BRAHMS)"
    "(CHARLES MINGUS)"
    "(CHOPIN)"
    "(DVORAK)"
    "(GRIEG)"
    "(LEHAR)"
    "(LOVE THEME)"
    "(MACDOWELL)"
    "(MENDELSSOHN)"
    "(MOZART)"
    "(RACHMANINOFF)"
    "(RIMSKY-KORSAKOV)"
    "(SAINT-SAENS)"
    "(SCHUBERT)"
    "(SCHUMANN)"
    "(STRAUSS)"
    "(TCHAIKOVSKY)"
    "(VERDI)"
    "(WAGNER)"
    "(WALDTEUFEL)"
)

c_expression=$(echo -n "s/${ignorable_strings[0]}"; for i in "${ignorable_strings[@]:1}"; do echo -n "|$i"; done; echo "//g")

cat tempfile |\
    iconv -f utf8 -t ascii//TRANSLIT | \
    sed -Ee 's/\\hangindent1em (.*) \\nolinebreak.*/\1/' -e 's/^THE |^A |^AN //' | \
    sed -Ee "$c_expression" | \
    sed -Ee 's/( \((.*)\))/\1\n\2/' -e 's/[[:punct:][:blank:]]//g' | \
    sort > prunedstrings

for i in {A..Z}; do
    echo "%\\hangindent1em ${i}%%00000" >> tempfile
done

sort tempfile |\
    sed -Ee 's/%\\hangindent1em ([A-Z])%%00000/\\vspace{\\baselineskip}{\\centering \1\\quad \1\\nopagebreak\\\\ \1\\quad \1\\quad \1\\nopagebreak\\\\ \1\\quad \1\\nopagebreak\\\\}\\vspace{\\baselineskip}\\addcontentsline{toc}{section}{\1}\\markboth{\1}{\1}\\nopagebreak/' > allsongs.tex

pdflatex realbookindex.tex
pdflatex realbookindex.tex

echo "checking for duplications..."
grep -v "^$" prunedstrings | uniq -w 40 -D
sed -e 's/\(^.*\)%%--%%.*%%--%%.*}\(.*\)}/\1==\2/' tempfile0 | sort | uniq -D
