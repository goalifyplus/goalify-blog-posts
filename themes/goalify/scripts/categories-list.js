/* global hexo */

'use strict';

const config = hexo.config;

hexo.extend.helper.register('categories_list', (page) => {
	const firstPath = page.path.split('/')[0];
	const lang = config.language.find((l) => l === firstPath) || config.language[0];
	return config.category_list[lang];
});
