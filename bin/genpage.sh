#!/bin/sh
#
# Convert Markdown file to HTML, including the header and footer from the
# config directory.
#

script_dir="$(dirname "$(realpath "$0")")"
basedir="$(dirname "$script_dir")"
confdir="$basedir/etc"

. "$confdir/genpage.conf"

if [ -z "$destdir" ]
then
	echo "Please set destdir in $confdir/genpage.conf" 1>&2
	exit 1
fi

for f in $(find "$basedir/md" \( -type f -a -not -name "*.md" \) -printf "%P\n")
do
	dirname="$(dirname "$f")"
	if [ \! -d "$destdir/$dirname" ]
	then
		mkdir -p "$destdir/$dirname"
	fi

	test -x "$basedir/md/$f" || cp -p "$basedir/md/$f" "$destdir/$f"
done

for f in $(find "$basedir/md" \( -type f -a -name "*.md" \) -printf "%P\n")
do
	dirname="$(dirname "$f")"
	destname="$(echo "$f" | sed -e's/\.md$/.html/')"

	if [ \! -d "$destdir/$dirname" ]
	then
		mkdir -p "$destdir/$dirname"
	fi

	headline="$(head -n 1 "$basedir/md/$f" | sed -e's/\&/\\\&amp;/g' -e's@/@\\\&#x2f;@g')"
	(sed -e "s/@TITLE@/${headline}/g" "$confdir/head.tmpl";
	 tail -n +2 "$basedir/md/$f" | markdown;
	 sed -e "s/@TITLE@/${headline}/g" "$confdir/footer.tmpl") > "$destdir/$destname"
done
