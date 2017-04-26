/* global hexo */

'use strict';

// const config = hexo.config;

// Compose author profile from Hexo data file
hexo.extend.filter.register('before_post_render', (data) => {
	console.log('before-post-render');
	const newData = data;
	let authorProfile;
	const authors = hexo.locals.get('data').authors;
	for (const author of authors) {
		if (author.name === data.authorName) {
			authorProfile = author;
		}
	}

	if (!authorProfile) {
		authorProfile = {
			name: 'Nau Studio',
			avatar: '/img/authors/default.jpg',
		};
	}
	if (newData.layout === 'post') {
		newData.author = authorProfile;
	}
	console.log('data.author', data.author);

	return newData;
});
