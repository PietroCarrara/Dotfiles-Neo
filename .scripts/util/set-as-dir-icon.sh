file=$1

if [[ ! "$file" ]]; then
	echo "usage: $0 <filepath>"
	exit 1
fi

if [[ ! "$file" = /* ]]; then
	file=$PWD/$file
fi

if [[ ! -f "$file" ]]; then
	echo "error: icon must exist and be a file"
	exit 1
fi

echo -e "[Desktop Entry]\nIcon=$file" > .directory

