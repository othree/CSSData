all: cssdata.json speclist.json

cssdata.json: raw.json
	sed 's/&gt;/>/g' raw.json | sed 's/&lt;/</g' | sed 's/<code>//g' | sed 's/<\/code>//' > cssdata.json

speclist.json: speclist.js
	node speclist.js > speclist.json
