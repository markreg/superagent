
SRC = lib/events.js lib/superagent.js

all: superagent.js superagent.min.js

superagent.js: $(SRC)
	cat $^ > $@

superagent.min.js: superagent.js
	uglifyjs --no-mangle $< > $@

test:
	@node test/server

docs: index.html

index.html: docs/index.md
	markdown < $< > $@

clean:
	rm -f superagent{,.min}.js

.PHONY: test docs clean