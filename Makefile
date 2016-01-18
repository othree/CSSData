cssdata.json: raw.json
	sed 's/&gt;/>/g' raw.json | sed 's/&lt;/</g' | sed 's/<code>//g' | sed 's/<\/code>//' > cssdata.json
