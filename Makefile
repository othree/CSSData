all: cssdata.json speclist.json

cssdata.json: scripts/raw.json
	sed 's/&gt;/>/g' scripts/raw.json | sed 's/&lt;/</g' | sed 's/<code>//g' | sed 's/<\/code>//' > cssdata.json

scripts/raw.json: scripts/fetch.js
	cd scripts; node fetch.js

speclist.json: scripts/speclist.js
	node scripts/speclist.js > speclist.json

scripts/speclist.js: scripts/fetch-spec.js
	cd scripts; node fetch-spec.js

