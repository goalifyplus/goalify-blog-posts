/* global hexo */

'use strict';

// const config = hexo.config;

// Compose author profile from Hexo data file
hexo.extend.filter.register('before_post_render', (data) => {
	const newData = data;
	let authorProfile;
	// Get author data from authorName
	const authors = hexo.locals.get('data').authors;
	authors.forEach((author) => {
		if (author.name === data.authorName) {
			authorProfile = author;
		}
	});

	if (!authorProfile) {
		authorProfile = {
			name: 'Goalify',
			avatar: '/images/authors/default.jpg',
		};
	}
	if (newData.layout === 'post') {
		newData.author = authorProfile;
	}

	return newData;
});
