 
init() {
	$files = $(find . -maxdepth 1 -type f -and ! -name 'config.sh')	
	for file in $files; do
		ln -s $file ~/$file
	done
}


