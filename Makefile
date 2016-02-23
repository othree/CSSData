all: cssdata.json speclist.json
	@echo ''
	@echo 'Done'
	@echo ''

cssdata.json: scripts/raw.json
	sed 's/&gt;/>/g' scripts/raw.json | sed 's/&lt;/</g' | sed 's/<code>//g' | sed 's/<\/code>//' > cssdata.json

scripts/raw.json: scripts/fetch.js init
	cd scripts; node fetch.js

speclist.json: scripts/speclist.js
	node scripts/speclist.js > speclist.json

scripts/speclist.js: scripts/fetch-spec.js init
	cd scripts; node fetch-spec.js

init:
	@echo 'Init'
	@echo ''
