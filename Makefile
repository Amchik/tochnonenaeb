## tochnonenaeb.xyz Makefile
## (c) Er2, hqsq 2021-2022
## MIT License

# CONSTANTS
SERVROOT ?= /var/www/html
FILES += js/ css/ img/ old/ CNAME LICENSE *.html

# FILES
CSRC= $(wildcard coffee/*.coffee)
HSRC= $(wildcard *.src.html)
HEPS= $(HSRC:%.src.html=%.html)
JEPS= $(CSRC:coffee/%.coffee=js/%.js)

all: clean build
build: check js html
js: $(JEPS)
html: $(HEPS)

check:
	@coffee -v
	@echo "Coffee.. yes"
	@buble -v
	@echo "Buble... yes"
	@minify -v
	@echo "Minify.. yes"
	@echo "Nginx..."
	-@nginx -v

deploy: build
	mkdir -p $(SERVROOT)
	cp -r $(FILES) $(SERVROOT)
	find $(SERVROOT) -name '*.src.html' -exec rm {} \;
	chmod 755 -R $(SERVROOT)

undeploy:
	cd $(SERVROOT) && rm -rf $(FILES)

clean:
	@$(RM) $(HEPS) $(JEPS)

%.html: %.src.html
	@minify $< > $@

%.js: %.tmp.js
	@minify $< > $@

js/%.tmp.js: coffee/%.coffee
	@mkdir -p $(@D)
	@coffee -bcp $< | buble -t ie:11,chrome:50 -y arrow,destructuring > $@

