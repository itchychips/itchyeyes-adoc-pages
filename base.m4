divert(-1)
dnl Asciidoc uses a lot of ` and ' characters.
changequote(`[[', `]]')

dnl REPEAT(n, string): Repeat string n times
define([[REPEAT]], [[ifelse(eval($1 <= 0), [[1]], [[]], [[$2[[]]REPEAT([[eval($1-1)]],$2)]])]])

dnl COUNT_OF(character, string): Count of single character in string; used for
dnl counting number of forward slashes (/).
define([[COUNT_OF]], [[eval(esyscmd(echo '$2' | sed 's/[^$1]//g' | tr '$1' '\n' | wc -l)-2)]])

dnl Must be running on a normal file.  If running on STDIN, file will resemble
dnl something like /dev/fd/63, so a count of 3 parents will be seen.
dnl
dnl Also assumes relative path.
define([[PARENTS_NEEDED]], [[eval(COUNT_OF([[/]], indir([[__file__]])))]]+1)
define([[REFERRAL_PARENTS_NEEDED]], [[COUNT_OF([[/]], indir([[__file__]]))-0]])

dnl Replace navhome link in a way that doesn't need to worry about how many
dnl parents there are.
define([[NAVHOME_LINK]], [[dnl
[.text-center]
| xref:REPEAT(REFERRAL_PARENTS_NEEDED, [[../]])index.adoc[Back home]
|dnl
]])

dnl Repeat for number of needed parents (../).
define([[COMMON_HEADER]], [[dnl
:toc: preamble
:assetsdir: REPEAT(PARENTS_NEEDED, [[../]])assets
:docinfo: shared
:toclevels: 4[[]]dnl
]])

dnl Basic replacements follow

define([[SITE_NAV]], [[dnl
[.text-center]
| xref:articles/about.adoc[About]
| xref:articles/cuis-smalltalk.adoc[Cuis Smalltalk]
| xref:articles/philosophy.adoc[Philosophy, prog]
| +
| xref:articles/sitedesign.adoc[Site design]
| xref:articles/devops-quantitative.adoc[Quantitative DevOps]
| xref:articles/autotools_cpp_setup.adoc[Autotools C++ Setup]
| xref:userscripts/index.adoc[Userscripts]
| https://github.com/itchychips?tab=repositories[Git repos]
|dnl
]])

include([[docinfo.m4]])
divert(0)dnl
