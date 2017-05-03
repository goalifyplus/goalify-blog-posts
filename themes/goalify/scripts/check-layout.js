/* global hexo */

'use strict';

hexo.extend.helper.register('check_blog', (page) => {
	const path = page.path.split('/');
	return path[0] === 'blog' || path[1] === 'blog';
});
