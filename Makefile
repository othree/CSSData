cssdata.json: raw.json
	sed 's/&gt;/>/g' raw.json | sed 's/&lt;/</g' > cssdata.json
