# Exclude any adoc files that start with '_' as they are includes.
all:
	asciidoctor pages/[^_]*.adoc pages/**/[^_]*.adoc --destination-dir build/ --source-dir pages/
	cp pages/favicon.ico build/

package: all
	cd build && zip -r ../site.zip .

clean:
	rm -rf build/
