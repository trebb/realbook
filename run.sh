#! /bin/bash

# Our COLORs: ClBn, ClGn, ClVi, ClRd
books=(
    #KEY  COLOR   TITLE                                            PUBLISHER       ISBN             YEAR    PAGES  REMARKS  SOURCE FILE
    "1  C:ClRd  T:The Real Book vol I (sixth edition)~.........  P:Hal Leonard   I:9780634060380  Y:2004  p:453  R:       F:hl_realbook_vol1.txt"
    "2  C:ClRd  T:The Real Book vol II (second edition)~.......  P:Hal Leonard   I:9780634060212  Y:2005  p:429  R:       F:hl_realbook_vol2.txt"
    "3  C:ClRd  T:The Real Book vol III (second edition)~......  P:Hal Leonard   I:9780634061363  Y:2006  p:455  R:       F:hl_realbook_vol3.txt"
    "4  C:ClRd  T:The Real Book vol IV~........................  P:Hal Leonard   I:9781423425427  Y:2011  p:501  R:       F:hl_realbook_vol4.txt"
    "5  C:ClRd  T:The Real Book vol V~.........................  P:Hal Leonard   I:9781423488484  Y:2013  p:494  R:       F:hl_realbook_vol5.txt"
    "6  C:ClRd  T:The Real Book vol VI~........................  P:Hal Leonard   I:9781458440655  Y:2016  p:479  R:       F:hl_realbook_vol6.txt"
    "7  C:ClGn  T:557 Jazz Standards - swing to bop~...........  P:anonymous     I:.............  Y:1970s p:444  R:       F:557-jazz-standards.txt"
    "a  C:ClRd  T:The All-Jazz Real Book~......................  P:Sher Music    I:9781883217143  Y:2001  p:540  R:DR,L   F:all-jazz-real-book.txt"
    "a1 C:ClGn  T:The Real Book vol I (fifth edition)~.........  P:anonymous     I:.............  Y:1970s p:497  R:       F:unlicenced_realbook_vol1.txt"
    "a2 C:ClGn  T:The Real Book vol II~........................  P:anonymous     I:.............  Y:....  p:414  R:       F:unlicenced_realbook_vol2.txt"
    "a3 C:ClGn  T:The Real Book vol III~.......................  P:anonymous     I:.............  Y:....  p:360  R:       F:unlicenced_realbook_vol3.txt"
    "b  C:ClGn  T:The Book/Commercial~.........................  P:anonymous     I:.............  Y:....  p:502  R:       F:thebook.txt"
    "bb C:ClRd  T:The Real Blues Book~.........................  P:Hal Leonard   I:9781423404514  Y:2011  p:480  R:L      F:the-real-blues-book.txt"
    "bi C:ClBn  T:The Bird Book~...............................  P:Hal Leonard   I:9781423495659  Y:2012  p:72   R:       F:the-bird-book.txt"
    "c  C:ClGn  T:The Colorado Cookbook~.......................  P:anonymous     I:.............  Y:....  p:280  R:       F:the-colorado-cookbook.txt"
    "c1 C:ClGn  T:Cuban Fake Book Vol. No 1~...................  P:anonymous     I:.............  Y:1980  p:187  R:L      F:cuban-fake-book-vol1.txt"
    "co C:ClRd  T:The Billy Cobham Real Book~..................  P:Hal Leonard   I:9781495099724  Y:2017  p:104  R:       F:the-billy-cobham-real-book.txt"
    "cr C:ClBn  T:Classic Rock Fake Book~......................  P:Hal Leonard   I:9780793578566  Y:2011  p:304  R:L      F:classic-rock-fakebook.txt"
    "d  C:ClRd  T:The Best Rock Pop Fake Book~.................  P:Hal Leonard   I:9781423453871  Y:2013  p:592  R:L      F:the-best-rock-pop-fakebook.txt"
    "e  C:ClRd  T:The European Real Book~......................  P:Sher Music    I:9781883217242  Y:2005  p:419  R:DR     F:the-european-real-book.txt"
    "el C:ClBn  T:The Duke Ellington Real Book~................  P:Hal Leonard   I:9780634063275  Y:2009  p:128  R:       F:the-duke-ellington-real-book.txt"
    "ev C:ClGn  T:Bill Evans Fakebook~.........................  P:Hal Leonard   I:9780634023897  Y:1996  p:101  R:L      F:bill-evans-fakebook.txt"
    "f  C:ClGn  T:Jazz Fakebook~...............................  P:anonymous     I:.............  Y:....  p:417  R:L      F:jazz-fake-book.txt"
    "g  C:ClRd  T:The World's Greatest Fake Book~..............  P:Sher Music    I:9780961470111  Y:1983  p:483  R:DR,L   F:the_worlds_greatest_fakebook.txt"
    "h  C:ClBn  T:The Ultimate Pop/Rock Fake Book~.............  P:Hal Leonard   I:9780793570003  Y:1997  p:584  R:L      F:the-ultimate-pop-rock-fakebook.txt"
    "i  C:ClBn  T:The Real Berklee Book~.......................  P:Hal Leonard   I:9781423489566  Y:2024  p:512  R:       F:the-real-berklee-book.txt"
    "j  C:ClGn  T:Jazz LTD/Over 500 tunes the real books missed  P:anonymous     I:.............  Y:1970s p:393  R:       F:jazz-ltd.txt"
    "js C:ClBn  T:Just Standards Real Book~....................  P:Alfred Music  I:9780739039441  Y:2001  p:416  R:L      F:just-standards-real-book.txt"
    "l  C:ClRd  T:The Real Latin Book~.........................  P:Hal Leonard   I:9781423487630  Y:2014  p:596  R:       F:the-real-latin-book.txt"
    "lr C:ClVi  T:The Latin Real Book~.........................  P:Sher Music    I:9781883217051  Y:1999  p:568  R:DR,L   F:the-latin-real-book.txt"
    "m  C:ClGn  T:Library Of Musicians' Jazz~..................  P:anonymous     I:.............  Y:1960s p:212  R:       F:library-of-musicians-jazz.txt"
    "me C:ClBn  T:The Real Pat Metheny Book~...................  P:Hal Leonard   I:9781480350595  Y:2017  p:272  R:       F:the-real-pat-metheny-book.txt"
    "mi C:ClBn  T:The Miles Davis Real Book~...................  P:Hal Leonard   I:9781540025005  Y:2018  p:96   R:       F:the-miles-davis-real-book.txt"
    "mo C:ClBn  T:Thelonious Monk Fake Book~...................  P:Hal Leonard   I:9780634039188  Y:2002  p:98   R:       F:thelonius-monk-fakebook.txt"
    "n  C:ClBn  T:The Real R\&B Book~..........................  P:Hal Leonard   I:9781458416940  Y:2021  p:536  R:L      F:the-real-r-b-book.txt"
    "n1 C:ClVi  T:The New Real Book vol 1~.....................  P:Sher Music    I:9780961470142  Y:1988  p:438  R:L      F:the-new-realbook-vol1.txt"
    "n2 C:ClVi  T:The New Real Book vol 2~.....................  P:Sher Music    I:9780961470173  Y:1991  p:484  R:L      F:the-new-realbook-vol2.txt"
    "n3 C:ClVi  T:The New Real Book vol 3~.....................  P:Sher Music    I:9781883217310  Y:1995  p:448  R:DR,L   F:the-new-realbook-vol3.txt"
    "o  C:ClGn  T:The Original, Legal, Musicians' Fake Book~...  P:Hansen House  I:9780849400018  Y:1979  p:642  R:L      F:original-legal-musician-fake-book.txt"
    "p  C:ClRd  T:The Real Bebop Book~.........................  P:Hal Leonard   I:9781495052767  Y:2017  p:241  R:       F:real-bebop-book.txt"
    "p1 C:ClBn  T:The Real Pop Book - Vol 1~...................  P:Hal Leonard   I:9781480338159  Y:2016  p:456  R:L      F:the-real-pop-book-vol1.txt"
    "p2 C:ClBn  T:The Real Pop Book - Vol 2~...................  P:Hal Leonard   I:9781540039880  Y:2020  p:464  R:L      F:the-real-pop-book-vol2.txt"
    "po C:ClBn  T:The Bud Powell Real Book~....................  P:Hal Leonard   I:9781423461319  Y:2010  p:80   R:       F:the-bud-powell-real-book.txt"
    "q  C:ClBn  T:The Best Fake Book Ever~.....................  P:Hal Leonard   I:9780634034244  Y:1991  p:802  R:L      F:the-best-fakebook-ever.txt"
    "r  C:ClVi  T:The Hal Leonard Real Jazz Book~..............  P:Hal Leonard   I:9780793562305  Y:1998  p:365  R:L      F:real_jazz_book.txt"
    "r1 C:ClBn  T:The Real Rock Book - Vol I~..................  P:Hal Leonard   I:9781423453888  Y:2011  p:400  R:L      F:the-real-rock-book-vol1.txt"
    "r2 C:ClBn  T:The Real Rock Book - Vol II~.................  P:Hal Leonard   I:9781423438533  Y:2014  p:392  R:L      F:the-real-rock-book-vol2.txt"
    "s  C:ClRd  T:The Standards Real Book~.....................  P:Sher Music    I:9781883217099  Y:2000  p:565  R:DR,L   F:the_standards_real_book.txt"
    "s1 C:ClBn  T:Jazz Club Piano Solos 1~.....................  P:Music Sales   I:9780711937666  Y:1993  p:48   R:       F:jazz-club-piano-solos-vol1.txt"
    "s2 C:ClBn  T:Jazz Club Piano Solos 2~.....................  P:Music Sales   I:9780711941212  Y:1994  p:48   R:       F:jazz-club-piano-solos-vol2.txt"
    "s3 C:ClGn  T:Jazz Club Piano Solos 3~.....................  P:Wise          I:9780711941229  Y:1994  p:46   R:       F:jazz-club-piano-solos-vol3.txt"
    "si C:ClBn  T:The Frank Sinatra Fake Book~.................  P:Hal Leonard   I:9781423433446  Y:2010  p:244  R:L      F:the-frank-sinatra-fakebook.txt"
    "t  C:ClBn  T:The Real Jazz Standards Fake Book~...........  P:Hal Leonard   I:9780634021558  Y:2001  p:576  R:L      F:real-jazz-standards-fake-book.txt"
    "tr C:ClBn  T:The Trane Book~..............................  P:Hal Leonard   I:9781458422620  Y:2014  p:160  R:       F:the-trane-book.txt"
    "u  C:ClRd  T:The Ultimate Fake Book (fifth edition)~......  P:Hal Leonard   I:9780793529391  Y:1994  p:786  R:L      F:the-ultimate-fake-book.txt"
    "v  C:ClBn  T:The Ultimate Jazz Fake Book~.................  P:Hal Leonard   I:9780881889796  Y:1988  p:448  R:L      F:ultimate-jazz-fake-book.txt"
    "w  C:ClVi  T:Richard Wolfe's legit professional fake book   P:CPP/Belwin    I:9780898984484  Y:1986  p:467  R:L      F:richard-wolfes-legit-professional-fakebook.txt"
    "x  C:ClBn  T:The Real Dixieland Book~.....................  P:Hal Leonard   I:9781423476948  Y:2021  p:380  R:L      F:the-real-dixieland-book.txt"
    "y  C:ClBn  T:The Ultimate Rock Pop Fake Book~.............  P:Hal Leonard   I:9781423453390  Y:2014  p:560  R:L      F:the-ultimate-rock-pop-fakebook.txt"
    "z  C:ClBn  T:Just Jazz Real Book~.........................  P:Hal Leonard   I:9780757901683  Y:2001  p:400  R:L      F:just-jazz-real-book.txt"
)

for b in "${books[@]}"; do
    key="${b/ *}"
    rm -f toc_${key}.txt
done

for b in "${books[@]}"; do
    key="${b/ *}"
    color="${b#* C:}"
    color="${color/ *}"
    file="${b#* F:}"
    cp "tocs/$file" "toc_${key}.txt"
    awk -v key=${key} -v color=${color} '{print toupper($0) "%%--%%" key "%%--%%{\\color{" color "}" toupper(key) "}"}' "toc_${key}.txt"
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
printf "%s items | %s | %s" $total $today $author > tail.tex

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

# find duplicate lines that are in the same toc file:
sed -e 's/\(^.*\)%%--%%.*%%--%%.*}\(.*\)}/\1==\2/' tempfile0 | sort | uniq -D

expected_duplications='CATFISHBLUES\|COMEGOWITHME\|DREAMER\|ITHANKYOU\|LETSFALLINLOVE\|LOVESTORY\|MYLOVE\|NOCTURNE\|OURLOVEAFFAIR\|PARISBLUES\|PROMISE\|SOLAMENTEUNAVEZ\|THEME\|VERACRUZ\|WEE'
grep -v "^$" prunedstrings | uniq -w 40 -D | grep -v -e "$expected_duplications"
