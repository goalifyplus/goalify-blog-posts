/* global hexo */

'use strict';

const helper = hexo.extend.helper;

hexo.extend.helper.register('relatedPost', (post, isNext = false) => {
	const newData = post;
	const site = hexo.locals.toObject();
	const urlFor = helper.get('url_for');
	const truncate = helper.get('truncate');
	const stripHtml = helper.get('strip_html');

	// Get all posts
	const posts = site.posts.toArray();
	let nextPost = null;
	let relatedPost = null;

	// sort post by date and find related posts using tags
	const categories = newData.categories.toArray();
	const relatedPosts = posts.sort((p1, p2) => p1.date < p2.date)
		.filter((p) => {
			const c = p.categories.toArray();
			return categories[categories.length - 1].name === c[c.length - 1].name;
		});

	// find next posts if there is one and
	// also remove next post and current post from related posts array
	for (let index = 0; index < relatedPosts.length; index++) {
		const element = relatedPosts[index];
		if (element.slug === newData.slug) {
			if (index < relatedPosts.length - 1) {
				nextPost = relatedPosts.splice(index + 1, 1)[0];
			}
			relatedPosts.splice(index, 1);
		}
	}

	// using what left in the related post array to random any post for interested post
	const leftRelatedPostsLength = relatedPosts.length;
	if (leftRelatedPostsLength > 0) {
		const random = Math.floor((Math.random() * leftRelatedPostsLength) + 1);
		relatedPost = relatedPosts[random - 1];
	}
	if (isNext) {
		if (nextPost) {
			return `
				<div class="blog-detail__suggestion__item" style="background-image: url(${urlFor.call(hexo, nextPost.thumbnail)})">
					<a href="${urlFor.call(hexo, nextPost.path)}" class="btn btn--transparent blog-detail__suggestion__btn float lighter">Read this next</a>
					<h4 class="blog-detail__suggestion__title float">${nextPost.title}</h4>
					<p class="blog-detail__suggestion__desc float lighter">
						${truncate(stripHtml(nextPost.content), { length: 120 })}
					</p>
				</div>
			`;
		}
		return '';
	}

	if (relatedPost) {
		return `
			<div class="blog-detail__suggestion__item" style="background-image: url(${urlFor.call(hexo, relatedPost.thumbnail)})">
				<a href="${urlFor.call(hexo, relatedPost.path)}" class="btn btn--transparent blog-detail__suggestion__btn float lighter">You might enjoy</a>
				<h4 class="blog-detail__suggestion__title float">${relatedPost.title}</h4>
				<p class="blog-detail__suggestion__desc float lighter">
					${truncate(stripHtml(relatedPost.content), { length: 120 })}
				</p>
			</div>
		`;
	}
	return '';
});
