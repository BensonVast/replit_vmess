#!/bin/sh
skip=49

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | /*/) ;;
  /*) TMPDIR=$TMPDIR/;;
  *) TMPDIR=/tmp/;;
esac
if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -d "${TMPDIR}gztmpXXXXXXXXX"`
else
  gztmpdir=${TMPDIR}gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
?{X?cmain.sh ?Xmo????_q?????l?/s?f??4Fې?&[??y%1?H??$+???k2g??Y?5ˀ?^? m?`ݚ"u?kL??Կ?s?"?????0??{?9???>??<{F(*?`U?,?+V??K`??%??a?a귈d?b͢LŶkVʊ]?yI?	???L"9=-??P??QAԆ?^?gr?uSlq?f٢?2̥?L:WX??_N?6{?/??Wo?EQ?1?b1e?mdt?Tс]KLLܘ????X-6????m?ETUo?O>?-???I4??g)??̯f???|??t6?????Ǚ@Tmb?`???jdә?\.]???ӹ??P&v?7\??FFa??????ݷ?;?????J???iMRd???TQs%???Y662???l?جB|)?J???a*???x;>ʞl???;?h{?D??Ɋ?LIa?x'?q
???kEb?ª.!3??Q()??v?@?^?ڤf??A ???U??r?]vN??aςh k%?F?BC?y????s?,]c?C???,?V?????׭?%?$???%x????k?ذ?????81Mݜ?K"??`???u?P?>?? U?T??^7A#vS7?|?glC?a,??^?(?X?Z??M???v??µ㖰?b ?{hRZ?FѨ?!?DYZ?u?|eL????SdC"D&r?>?.???9?d???0?DA??7?o|Ϡ??7???(??75U??2?????kK?幅Bfq?J?=5{F???NÓU???M%?ۊ
?&?8?????jq?@?u4?E?aDx???
%?3?rA7?6[ ?EE1?$v?Ԣx?c?S???ex????]????HMןQR)̲????&?#$?b??X?d'??U??a??[???????{ZwE?@?"?W????ɮ?	???IZ???+?REix?SB(2??|n?*(?k?d3BE?.??S????8f8Yﮈ^???V??[7? ?3A?T????+???>?F?}?= 2r??
?)?q??)?!??9?2gRx?2$m̼ˑ??8'"??k????0???ź?*??`7???p?2^?WW
???|~9?Ko????????B:??e'??o?H??aň3?[??O????g?D?H
?]??^4?????`zr??XkT?jάkS&)?늜????;`\??n?*`;+??(??)??
,;??R??g?laI?Z?P%?FT?5??k??}߉?+˹?	?????:?ޟJ?o?9V???#?<ؘ???E«Km5yAҵ?R?[bM+Wx??Q?)?Z[???
̶???p??>??Y??1xS?IC??ȉ7??n?????|?й???????x????h??|??????<???????H???\?-So??)??~[QUQ??0rM??lZ?????? 80?? S?Q???\#?+?-LNL?S0r?r?j?<?U??T?G1??z?3??O?|f?????XM????i${ǖ?Ma??`iV???u?\uԗSS??r(?qbN,ӗ$Ho+H?*`??mJi?@[W!?H^TE???]????2?D????4???=?v??4????{? ?ٻ??????sD~q?b?HR!??s??K?Y??{?QÜv?i??U??ݝ???;?????:?x???8xp??o??_;??w=wv?9?q??????O;?/??x?3l?Ɏ???9??K??]z????ˬ???????6O?#B?Gs???%??q?_j?K?????'ǯ:;????(Դݶ~??hW?_<s^}???E"??ə???S????! ?=?M?ٔ0R 6?jrxjk????6??YXc?????Ѱ????(˞??K`?O??ǔ?H??|0???jz???eoHò?Vt???~!??J?`???Yc??O?݂"??)?&$?o?z?پw????_u>??#-??;'ZK??ėb???/}???O~?k3?&?$]&??سYJ?.??0C?? ??????<{????????????6?S???G??y?????x????^??Σ???b?=?0??&?-?]/7y??U?V????ïc??;?U?l?M|Gll?0?0?W?|S?-h?%?H??`*?*??H?ｪc?Btv?J?5X@???a_T?|V`?r?
^a??ю?Z?*o??.???y?c"ؐ括?5_?L?B?ڃ???+?U??w̑??9y???? ?'??$  