{% extends 'base.swig' %}
{% block meta %}
	<title>Goalify Blog</title>
	<meta name="description" content="Sharing is caring.We happy to share all about the resources that help to build better work place. We also share our ideas, guide, and viewpoints from team and build up the culture, engagement.">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- for Google -->
	<meta name="description" content="Sharing is caring.We happy to share all about the resources that help to build better work place. We also share our ideas, guide, and viewpoints from team and build up the culture, engagement." />
	<meta name="keywords" content="" />
	<!-- for Facebook -->
	<meta property="og:title" content="Goalify Blog" />
	<meta property="og:type" content="article" />
	<meta property="og:image" content="{{config.url + '/images/blog-cover.png'}}" />
	<meta property="og:url" content="{{config.url + '/blog/'}}" />
	<meta property="og:description" content="Sharing is caring.We happy to share all about the resources that help to build better work place. We also share our ideas, guide, and viewpoints from team and build up the culture, engagement." />

	<!-- for Twitter -->
	<meta name="twitter:card" content="summary" />
	<meta name="twitter:title" content="Goalify Blog" />
	<meta name="twitter:description" content="Sharing is caring.We happy to share all about the resources that help to build better work place. We also share our ideas, guide, and viewpoints from team and build up the culture, engagement." />
	<meta name="twitter:image" content="{{config.url + '/images/blog-cover.png'}}" />
{% endblock %}

{% block hero-banner %}
	{{ partial('_partial/hero-banner', {
		page: {
			isHeroBannerHeader: true,
			backgroundHeader: '/images/job-header-banner.jpg',
			titleHeader: __('blog.bannerTitle'),
			descHeaderFirst: 'Sharing is caring.',
			descHeaderSecond: 'We happy to share all about the resources that help to build better work place. We also share our ideas, guide, and view from team and growing up the culture, engagment.'
		}
	}) }}
{% endblock %}

{% block main %}
	<main class="blog">
		<div class="container-fluid container-fluid--fixed">
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<section class="blog__tags">
						<ul class="blog__tags__wrapper">
							<li class="blog__tags__item">
								{% if page.category === '' || page.category === 'blog'%}
									<a class="blog__tags__link active" href="{{ url_for_lang('blog') }}">All</a>
								{% else %}
									<a class="blog__tags__link" href="{{ url_for_lang('blog') }}">All</a>
								{% endif %}
							</li>
							{% for tag in categories_list(page) %}
								{% if check_category(site, convert_category(tag))%}
									<li class="blog__tags__item">
										{% if convert_category(tag) === page.category %}
											<a class="blog__tags__link active" href="{{ url_for_lang('blog' + '/' + convert_category(tag)) }}">{{tag}}</a>
										{% else %}
											<a class="blog__tags__link" href="{{ url_for_lang('blog' + '/' + convert_category(tag)) }}">{{tag}}</a>
										{% endif %}
									</li>
								{% endif %}
							{% endfor %}
						</ul>
					</section>
					<section class="blog__posts">
						{% for item in page.posts %}
							<div class="blog__post">
								<a href="{{ url_for_lang(item.path) }}">
									<div class="blog__post__thumbnail" style="background-image: url({{ url_for(item.thumbnail) }})"></div>
								</a>
								<div class="blog__post__content">
									<h4 class="blog__post__title"><a href="{{ url_for_lang(item.path) }}" class="blog__post__link">{{item.title}}</a></h4>
									<p class="blog__post__intro">
										{{ truncate(strip_html(item.content), {length: 180}) }}
									</p>
									<div class="blog__post__info">
										<span class="blog__post__author-avatar" style="background-image: url({{ url_for(item.author.avatar) }})"></span>
										<span class="blog__post__author-name">{{item.author.name}}</span>
										<time class="blog__post__time" datetime="{{ item.date.toDate().toISOString() }}">{{ item.date.format(config.date_format) }}</time>
									</div>
								</div>
							</div>
						{% endfor %}
					</section>
					<section class="blog__pagination">
						Page {{ paginator({prev_next: true, mid_size: 0, end_size: 0, space: '', prev_text: 'Newer Posts', next_text: 'Older Posts'}) }} of <span class="total-page">{{ paginator({prev_next: false, mid_size: 0, end_size: 1, space: ''}) }}</span>
					</section>
				</div>
			</div>
		</div>

		<div class="blog__register">
			<div class="register-form-horizontal container-fluid container-fluid--fixed">
				<div class="register-form-horizontal__title">
					<span class="common">Subcribe for more read</span>
				</div>
				<form class="register-form-horizontal__group-btn" id="mail-subscribe-form">
					<input name="email" type="email" required class="register__form" placeholder="name@yourcompany.com"></input>
					<button class="btn btn--second">Subcribe</button>
				</form>
			</div>
		</div>

		<div class="popup">
			<h4 class="popup__title">Thank you for your subcription!</h4>
			<span class="popup__desc">We will share you more topic and our thinking!</span>
			<span class="popup__close-btn js-close-popup"><i class="icon icon--close popup__close-icon"></i>Close</span>
			<div class="register">
				<h3 class="register__title">Ready to get started for free ?</h3>
				<div class="register__form-wrapper">
					<input type="text" class="register__form" placeholder="name@yourcompany.com"></input>
					<button class="btn">Let started NOW!</button>
				</div>
			</div>
		</div>
	</main><!-- /.main -->
{% endblock %}
