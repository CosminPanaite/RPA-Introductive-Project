// This file can be used to test Playwright selectors:
//	Run with > node inspect.js
//  Open developer tools, Console and run > playwright.$('text=Google') or playwright.$('anyselector')


const {chromium} = require('playwright');

(async () => {
    //const browser = await chromium.launch({ headless: false });
    const browser = await chromium.launch({
		headless: false,
		executablePath: 'C:/Program Files/Google/Chrome/Application/chrome.exe'
	});
    const context = await browser.newContext();
    const page = await context.newPage();
    await page.goto('https://google.com/');
	await page.pause();
    await browser.close();
  }
)();