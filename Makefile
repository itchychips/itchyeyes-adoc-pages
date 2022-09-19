INSTALL_DIR="$(HOME)/html/"

BASE_M4_FILES := base.m4
INCLUDED_M4_FILES := docinfo.m4

ADOC_M4_FILES := $(shell find pages/ -type f -name '*.adoc.m4')
HTML_M4_FILES := $(shell find pages/ -type f -name '*.html.m4')
ADOC_FILES := $(patsubst %.adoc.m4, %.adoc, $(ADOC_M4_FILES))
HTML_FILES := $(patsubst %.html.m4, %.html, $(HTML_M4_FILES))

M4_OPTS :=

# Exclude any adoc files that start with '_' as they are includes.
all: $(ADOC_FILES)
	asciidoctor -S unsafe pages/[^_]*.adoc pages/**/[^_]*.adoc --destination-dir build/ --source-dir pages/
	mkdir -p build/assets
	cp -v assets/clipboard.js build/assets/
	cp -v pages/favicon.ico build/
	cp -v pages/vimrc build/

$(ADOC_FILES): $(BASE_M4_FILES) $(INCLUDED_M4_FILES) $(HTML_FILES)

$(HTML_FILES): $(BASE_M4_FILES) $(INCLUDED_M4_FILES)

package: all
	cd build && zip -r ../site.zip .

install: all
	cp -rv build/* $(INSTALL_DIR)

clean:
	rm -rf build/
	rm -f $(ADOC_FILES)
	rm -f $(HTML_FILES)

%.adoc: %.adoc.m4
	m4 $(M4_OPTS) $(BASE_M4_FILES) $< > $@

%.html: %.html.m4
	m4 $(M4_OPTS) $(BASE_M4_FILES) $< > $@
