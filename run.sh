#! /bin/bash

# Our COLORs: ClBn, ClGn, ClVi, ClRd
books=(
    #KEY  COLOR   TITLE                                            PUBLISHER       ISBN             YEAR    PAGES  REMARKS  SOURCE FILE
    "1  C:ClGn  T:The Real Book vol I (fifth edition)~.........  P:anonymous     I:.............  Y:1970s p:497  R:       F:MASTERNX.txt:RealBk1"
    "2  C:ClGn  T:The Real Book vol II~........................  P:anonymous     I:.............  Y:....  p:414  R:       F:MASTERNX.txt:RealBk2"
    "3  C:ClGn  T:The Real Book vol III~.......................  P:anonymous     I:.............  Y:....  p:360  R:       F:MASTERNX.txt:RealBk3"
    "7  C:ClGn  T:557 Jazz Standards - swing to bop~...........  P:anonymous     I:.............  Y:1970s p:444  R:       F:557-jazz-standards.txt"
    "a  C:ClRd  T:The All-Jazz Real Book~......................  P:Sher Music    I:9781883217143  Y:2001  p:540  R:DR,L   F:all-jazz-real-book.txt"
    "b  C:ClGn  T:The Book/Commercial~.........................  P:anonymous     I:.............  Y:....  p:502  R:       F:thebook.txt"
    "c  C:ClGn  T:The Colorado Cookbook~.......................  P:anonymous     I:.............  Y:....  p:280  R:       F:MASTERNX.txt:ColoBk"
    "c1 C:ClGn  T:Cuban Fake Book Vol. No 1~...................  P:anonymous     I:.............  Y:1980  p:187  R:L      F:cuban-fake-book-vol1.txt"
    "e  C:ClRd  T:The European Real Book~......................  P:Sher Music    I:9781883217242  Y:2005  p:419  R:DR     F:the-european-real-book.txt"
    "ev C:ClGn  T:Bill Evans Fakebook~.........................  P:Hal Leonard   I:9780634023897  Y:1996  p:101  R:L      F:MASTERNX.txt:EvansBk"
    "f  C:ClGn  T:Jazz Fakebook~...............................  P:anonymous     I:.............  Y:....  p:417  R:L      F:MASTERNX.txt:JazzFake"
    "g  C:ClRd  T:The World's Greatest Fake Book~..............  P:Sher Music    I:9780961470111  Y:1983  p:483  R:DR,L   F:the_worlds_greatest_fakebook.txt"
    "h1 C:ClRd  T:The Real Book vol I (sixth edition)~.........  P:Hal Leonard   I:9780634060380  Y:2004  p:453  R:       F:hl_realbook_vol1.txt"
    "h2 C:ClRd  T:The Real Book vol II (second edition)~.......  P:Hal Leonard   I:9780634060212  Y:2005  p:429  R:       F:hl_realbook_vol2.txt"
    "h3 C:ClRd  T:The Real Book vol III (second edition)~......  P:Hal Leonard   I:9780634061363  Y:2006  p:455  R:       F:hl_realbook_vol3.txt"
    "h4 C:ClRd  T:The Real Book vol IV~........................  P:Hal Leonard   I:9781423425427  Y:2011  p:501  R:       F:hl_realbook_vol4.txt"
    "h5 C:ClRd  T:The Real Book vol V~.........................  P:Hal Leonard   I:9781423488484  Y:2013  p:494  R:       F:hl_realbook_vol5.txt"
    "h6 C:ClRd  T:The Real Book vol VI~........................  P:Hal Leonard   I:9781458440655  Y:2016  p:479  R:       F:hl_realbook_vol6.txt"
    "j  C:ClGn  T:Jazz LTD/Over 500 tunes the real books missed  P:anonymous     I:.............  Y:1970s p:393  R:       F:MASTERNX.txt:JazzLTD"
    "js C:ClBn  T:Just Standards Real Book~....................  P:Alfred Music  I:9780739039441  Y:2001  p:416  R:L      F:just-standards-real-book.txt"
    "l  C:ClRd  T:The Real Latin Book~.........................  P:Hal Leonard   I:9781423487630  Y:2014  p:596  R:       F:the-real-latin-book.txt"
    "lr C:ClVi  T:The Latin Real Book~.........................  P:Sher Music    I:9781883217051  Y:1999  p:568  R:DR,L   F:the-latin-real-book.txt"
    "m  C:ClGn  T:Library Of Musicians' Jazz~..................  P:anonymous     I:.............  Y:1960s p:212  R:       F:MASTERNX.txt:Library"
    "n1 C:ClVi  T:The New Real Book vol 1~.....................  P:Sher Music    I:9780961470142  Y:1988  p:438  R:L      F:MASTERNX.txt:NewReal1"
    "n2 C:ClVi  T:The New Real Book vol 2~.....................  P:Sher Music    I:9780961470173  Y:1991  p:484  R:L      F:MASTERNX.txt:NewReal2"
    "n3 C:ClVi  T:The New Real Book vol 3~.....................  P:Sher Music    I:9781883217310  Y:1995  p:448  R:DR,L   F:MASTERNX.txt:NewReal3"
    "o  C:ClGn  T:The Original, Legal, Musicians' Fake Book~...  P:Hansen House  I:9780849400018  Y:1979  p:642  R:L      F:original-legal-musician-fake-book.txt"
    "p  C:ClRd  T:The Real Bebop Book~.........................  P:Hal Leonard   I:9781495052767  Y:2017  p:241  R:       F:real-bebop-book.txt"
    "r  C:ClVi  T:The Hal Leonard Real Jazz Book~..............  P:Hal Leonard   I:9780793562305  Y:1998  p:365  R:L      F:real_jazz_book.txt"
    "s  C:ClRd  T:The Standards Real Book~.....................  P:Sher Music    I:9781883217099  Y:2000  p:565  R:DR,L   F:the_standards_real_book.txt"
    "s1 C:ClBn  T:Jazz Club Piano Solos 1~.....................  P:Music Sales   I:9780711937666  Y:1993  p:48   R:       F:jazz-club-piano-solos-vol1.txt"
    "s2 C:ClBn  T:Jazz Club Piano Solos 2~.....................  P:Music Sales   I:9780711941212  Y:1994  p:48   R:       F:jazz-club-piano-solos-vol2.txt"
    "s3 C:ClGn  T:Jazz Club Piano Solos 3~.....................  P:Wise          I:9780711941229  Y:1994  p:46   R:       F:jazz-club-piano-solos-vol3.txt"
    "t  C:ClBn  T:The Real Jazz Standards Fake Book~...........  P:Hal Leonard   I:9780634021558  Y:2001  p:576  R:L      F:real-jazz-standards-fake-book.txt"
    "u  C:ClRd  T:The Ultimate Fake Book (fifth edition)~......  P:Hal Leonard   I:9780793529391  Y:1994  p:786  R:L      F:the-ultimate-fake-book.txt"
    "v  C:ClBn  T:The Ultimate Jazz Fake Book~.................  P:Hal Leonard   I:9780881889796  Y:1988  p:448  R:L      F:ultimate-jazz-fake-book.txt"
    "w  C:ClVi  T:Richard Wolfe's legit professional fake book   P:CPP/Belwin    I:9780898984484  Y:1986  p:467  R:L      F:richard-wolfes-legit-professional-fakebook.txt"
    "z  C:ClBn  T:Just Jazz Real Book~.........................  P:Hal Leonard   I:9780757901683  Y:2001  p:400  R:L      F:just-jazz-real-book.txt"
)

for b in "${books[@]}"; do
    key="${b/ *}"
    rm -f vol_${key}.txt
done

awk -e '{print $(NF-1), $0}' MASTERNX.txt | awk -e 'NF{NF-=2};1' > MASTERNX.tmp
grep -e '^EvansBk'  MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_ev.txt
grep -e '^ColoBk'   MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_c.txt
grep -e '^JazzFake' MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_f.txt
grep -e '^JazzLTD'  MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_j.txt
grep -e '^RealBk1'  MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_1.txt
grep -e '^RealBk2'  MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_2.txt
grep -e '^RealBk3'  MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_3.txt
grep -e '^NewReal1' MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_n1.txt
grep -e '^NewReal2' MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_n2.txt
grep -e '^NewReal3' MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_n3.txt
grep -e '^Library'  MASTERNX.tmp | cut -d ' ' -f 2- | sed -e 's/\(.*\) (\(The\|A\))/\2 \1/g' > vol_m.txt
sed -e 's/\(.*\), \(the\|a\)$/\2 \1/g' thebook.txt > vol_b.txt
cp the_worlds_greatest_fakebook.txt vol_g.txt
cp all-jazz-real-book.txt vol_a.txt
cp the-latin-real-book.txt vol_lr.txt
cp the-real-latin-book.txt vol_l.txt
cp original-legal-musician-fake-book.txt vol_o.txt
cp real-bebop-book.txt vol_p.txt
cp just-standards-real-book.txt vol_js.txt
sed -e 's/\(.*\), \(THE\|A\)$/\2 \1/g' just-jazz-real-book.txt > vol_z.txt
cp real-jazz-standards-fake-book.txt vol_t.txt
sed -e 's/\(.*\), \(The\|A\)$/\2 \1/g' ultimate-jazz-fake-book.txt > vol_v.txt
sed -e 's/\(.*\), \(The\|A\)$/\2 \1/g' 557-jazz-standards.txt > vol_7.txt
cp the-european-real-book.txt vol_e.txt
cp jazz-club-piano-solos-vol1.txt vol_s1.txt
cp jazz-club-piano-solos-vol2.txt vol_s2.txt
cp jazz-club-piano-solos-vol3.txt vol_s3.txt
cp the-ultimate-fake-book.txt vol_u.txt
cp richard-wolfes-legit-professional-fakebook.txt vol_w.txt
sed -Ee 's/[0-9]+\) //' cuban-fake-book-vol1.txt | sed -e 's/\(.*\), \(El\|La\)$/\2 \1/g' > vol_c1.txt
cut -d ' ' -f 2- real_jazz_book.txt | awk '{$1=$1};1' > vol_r.txt
sed -e 's/\(.*\), \(The\|A\)/\2 \1/g' the_standards_real_book.txt > vol_s.txt
for i in {1..6}; do
    cp hl_realbook_vol${i}.txt vol_h$i.txt
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

total=`sed -e 's/\(^.*\)%%--%%.*%%--%%.*/\1/' tempfile0 | sort | uniq | wc -l`
today=`date +%F`
author="github.com/trebb/realbook"
printf "%s items\n\n%s\n\n%s" $total $today $author > tail.tex

printf "\\\begin{tabular}{l@{~}l@{~~}l@{~}l@{~}l@{~}r@{~~}r@{~}r@{~~}l}\n" > legend.tex
printf " --  & --------------------------------------------- & ----------- & ---- & ------------- & ~--- & \multicolumn{2}{@{}l@{~~}}{--------} & ------- \\\\\\ \n" >> legend.tex
printf " KEY & TITLE                                         & PUBLISHER   & YEAR & ISBN          &     \multicolumn{3}{@{}l@{}}{PAGES~~PIECES} & REMARKS \\\\\\ \n" >> legend.tex
printf "     &                                               &             &      &               &      & \multicolumn{2}{@{}l@{}}{TOTL UNIQ}  & ~~(*)   \\\\\\ \n" >> legend.tex
printf " --  & --------------------------------------------- & ----------- & ---- & ------------- & ~--- &                           ---- & --- & ------- \\\\\\ \n" >> legend.tex
for b in "${books[@]}"; do
    key="${b/ *}"
    color="${b#* C:}"
    color="${color/ *}"
    title="${b#* T:}"
    title="${title/ P:*}"
    publisher="${b#* P:}"
    publisher="${publisher/ I:*}"
    isbn="${b#* I:}"
    isbn="${isbn/ Y:*}"
    year="${b#* Y:}"
    year="${year/ p:*}"
    pages="${b#* p:}"
    pages="${pages/ R:*}"
    remark="${b#* R:}"
    remark="${remark/ F:*}"
    total_songs=$(sed -e 's/\(^.*\)%%--%%\(.*\)%%--%%.*/\2 \1/' tempfile0 | grep -c "^$key ")
    unique_songs=$(grep -c "^$key " single_occurrences)
    printf "  {\\\color{%s} %s} & %s & %s & %s & %s & %s & %s & %s & %s \\\\\\ \n" "$color" "${key^^}" "${title^^}" "${publisher^^}" "${year^^}" "$isbn" "$pages" "$total_songs" "$unique_songs" "$remark" >> legend.tex
done
printf " \\multicolumn{9}{l}{-----------------------------------------------------------------------------------------------------------} \\\\\\ \n" >> legend.tex
printf " \\multicolumn{9}{c}{(*) DR=DRUM PARTS, L=LYRICS} \\\\\\ \n" >> legend.tex
printf "\\\end{tabular}\n" >> legend.tex

sed -e 's/&/\\&/g' -e 's/#/\\#/' tempfile0 | \
    sort | \
    awk -F '%%--%%'  'vol[$1]=vol[$1] ",\\allowbreak " $3 {print $1, "%%--%%" vol[$1]}' | \
    sort -r | \
    awk -F '%%--%%,' '!seen[$1] {print "\\hangindent1em " $1 "%%00000000000000000000%%\\nolinebreak\\dotfill\\nolinebreak\\rule{1mm}{0mm}" $2 "\\par"; seen[$1]=1} ' > tempfile

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
    "(HAYDN)"
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
    sed -Ee 's/%%00000000000000000000%%//' | \
    sed -Ee 's/\\hangindent1em (.*) \\nolinebreak.*/\1/' -e 's/^THE |^A |^AN //' | \
    sed -Ee "$c_expression" | \
    sed -Ee 's/( \((.*)\))/\1\n\2/' -e 's/[[:punct:][:blank:]]//g' | \
    sort > prunedstrings

for i in {A..Z}; do
    echo "%\\hangindent1em ${i}%%00000" >> tempfile
done

sort tempfile |\
    sed -Ee 's/%\\hangindent1em ([A-Z])%%00000/\\vspace{\\baselineskip}{\\centering \1\\quad \1\\nopagebreak\\\\ \1\\quad \1\\quad \1\\nopagebreak\\\\ \1\\quad \1\\nopagebreak\\\\}\\vspace{\\baselineskip}\\addcontentsline{toc}{section}{\1}\\markboth{\1}{\1}\\nopagebreak/' | \
    sed -Ee 's/%%00000000000000000000%%//' > allsongs.tex

pdflatex realbookindex.tex
pdflatex realbookindex.tex

echo "checking for duplications..."
grep -v "^$" prunedstrings | uniq -w 40 -D
sed -e 's/\(^.*\)%%--%%.*%%--%%.*}\(.*\)}/\1==\2/' tempfile0 | sort | uniq -D

echo "(expected duplications: LETSFALLINLOVE LOVESTORY MYLOVE NOCTURNE OURLOVEAFFAIR PARISBLUES PROMISE SOLAMENTEUNAVEZ THEME VERACRUZ WEE)"
