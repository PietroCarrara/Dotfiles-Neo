file=$1

if [[ ! "$file" ]]; then
	echo "usage: $0 <filepath>"
	exit 1
fi

if [[ ! "$file" = /* ]]; then
	file=$PWD/$file
fi

echo -e "[Desktop Entry]\nIcon=$file" > .directory

