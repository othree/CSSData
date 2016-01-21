'use strict';

const request = require('superagent');
const cheerio = require('cheerio');
const fs = require('fs');

const rawURL = 'https://developer.mozilla.org/en-US/docs/Template:CSSData';

request.get(rawURL).end((err, res) => {
  if (err) {
    throw err;
  }
  const $ = cheerio.load(res.text);
  const rawJSON = $('#wikiArticle>pre').text();

  try {
    const fileContent = JSON.stringify(JSON.parse(rawJSON), null, 2);
    fs.writeFileSync('./raw.json', fileContent);
  } catch (e) {
    console.log(e);
    process.exit(1);
  }


});
