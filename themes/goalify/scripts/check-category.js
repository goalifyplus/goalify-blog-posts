/* global hexo */

'use strict';

hexo.extend.helper.register('check_category', (site, tag) => {
	const list = site.categories.map(c => c.name);
	return list.indexOf(tag) > -1;
});
