BUILDDIR=build

SLIDES=$(BUILDDIR)/slides.html
REVEALJS=node_modules/reveal.js
METADATA=metadata.yaml

.PHONY: all
all: slides

.PHONY:slides
slides: $(SLIDES)

.PHONY:watch
watch:
	while true; do \
		make all; \
		inotifywait --exclude '($(BUILDDIR)|.git)' -qre close_write .; \
	done

$(BUILDDIR)/slides.html: slides.md $(METADATA) $(REVEALJS) $(BUILDDIR)
	pandoc $< \
		--standalone \
		--from markdown+smart \
		--to revealjs \
		--filter pandoc-crossref \
		--citeproc \
		--metadata-file=$(METADATA) \
		--self-contained \
		--variable revealjs-url=./$(REVEALJS) \
		--variable theme="white" \
		--variable transition="slide" \
		--variable slideNumber="true" \
		--variable showSlideNumber="true" \
		--output $@ && \
	rsync -azi ./node_modules ./build

$(REVEALJS):
	npm install

$(BUILDDIR):
	mkdir -p $(BUILDDIR)

.PHONY:clean
clean:
	rm -rf $(BUILDDIR)


