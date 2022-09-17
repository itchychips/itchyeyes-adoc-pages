INSTALL_DIR="$(HOME)/html/"

# Exclude any adoc files that start with '_' as they are includes.
all:
	asciidoctor -S unsafe pages/[^_]*.adoc pages/**/[^_]*.adoc --destination-dir build/ --source-dir pages/
	mkdir -p build/assets
	cp -v assets/clipboard.js build/assets/
	cp -v pages/favicon.ico build/
	cp -v pages/vimrc build/

package: all
	cd build && zip -r ../site.zip .

install: all
	cp -rv build/* $(INSTALL_DIR)

clean:
	rm -rf build/
