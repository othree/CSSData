'use strict';

const request = require('superagent');
const cheerio = require('cheerio');
const fs = require('fs');

const rawURL = 'https://developer.mozilla.org/en-US/docs/Template:SpecName';

request.get(rawURL).end((err, res) => {
  if (err) {
    throw err;
  }
  const $ = cheerio.load(res.text);
  const rawJS = $('#wikiArticle>pre').text();

  try {
    fs.writeFileSync('./speclist.js',  rawJS.split('\r\n').slice(40, -32).concat([
      'console.log(JSON.stringify(specList, null, 2));'
    ]).join('\n') );
  } catch (e) {
    console.log(e);
    process.exit(1);
  }


});
