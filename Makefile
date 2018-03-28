SHELL := /bin/bash

.PHONY: all install prepare build watch publish pdf epub mobi clean travis-deploy

all: install build

install: # install gitbook-cli
	npm install

prepare:
	npm run gitbook:prepare

build:
	npm run gitbook:build

watch:
	npm run gitbook:watch

pdf:
	npm run gitbook:pdf

epub:
	npm run gitbook:epub

mobi:
	npm run gitbook:mobi

deploy:
	npm run gitbook:build && npm run gitbook:publish
	

publish: build pdf epub mobi
	cd _book && \
	git init && \
	git commit --allow-empty -m 'update gh-pages' && \
	git checkout -b gh-pages && \
	git add . && \
	git commit -am 'update gh-pages' && \
	git push git@github.com:swaggo/swaggo.io.git gh-pages --force

clean:
	rm -rf _book
	rm -rf node_modules

travis-deploy:
	sudo -v && wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py | sudo python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"
	sudo ln -s /opt/calibre/ebook-convert /usr/local/bin/
	$(MAKE) install
	$(MAKE) publish

