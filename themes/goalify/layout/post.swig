{% extends 'base.swig' %}
{% block meta %}
	<title>{{page.title}} - Goalify Plus</title>
	<meta name="description" content="{{ truncate(strip_html(page.content), {length: 180}) }}">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- for Google -->
	<meta name="description" content="{{ truncate(strip_html(page.content), {length: 180}) }}" />
	<meta name="keywords" content="" />
	<!-- for Facebook -->
	<meta property="og:title" content="{{page.title + ' - Goalify Plus'}}" />
	<meta property="og:type" content="article" />
	<meta property="og:image" content="{{config.url + '/' + page.thumbnail}}" />
	<meta property="og:url" content="{{config.url + '/' + page.path}}" />
	<meta property="og:description" content="{{ truncate(strip_html(page.content), {length: 180}) }}" />

	<!-- for Twitter -->
	<meta name="twitter:card" content="summary" />
	<meta name="twitter:title" content="{{page.title + ' - Goalify Plus'}}" />
	<meta name="twitter:description" content="{{ truncate(strip_html(page.content), {length: 180}) }}" />
	<meta name="twitter:image" content="{{config.url + '/' + page.thumbnail}}" />
{% endblock %}
{% block hero-banner %}
	{{ partial('_partial/hero-banner', {
		page: {
			isHeroBannerHeader: true,
			backgroundHeader: '/images/job-header-banner.jpg'
		}
	}) }}
{% endblock %}

{% block main %}
	<main class="blog-detail">
		<div class="container-fluid container-fluid--fixed">
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<article>
						<header class="blog-detail__header">
							<h1 class="blog-detail__header__title">{{ page.title }}</h1>
							<div class="blog-detail__header__info">
								<span class="blog-detail__header__author-avatar" style="background-image: url({{ url_for(page.author.avatar) }})"></span>
								<span class="blog-detail__header__author-name">{{ page.author.name }}</span>
								<time class="blog-detail__header__time" datetime="{{ page.date.toDate().toISOString() }}">{{ page.date.format(config.date_format) }}</time>
							</div>
						</header>
						<div class="blog-detail__content">
							{{ page.content }}
						</div>
					</article>
				</div>
			</div>
		</div>
		<section class="blog__register">
			<div class="register-form-horizontal container-fluid container-fluid--fixed">
				<div class="register-form-horizontal__title">
					<span class="common">Subcribe for more read</span>
				</div>
				<div class="register-form-horizontal__group-btn">
					<input type="text" class="register__form" placeholder="name@yourcompany.com"></input>
					<button class="btn btn--second js-open-popup">Subcribe</button>
				</div>
			</div>
		</section>
		<section class="blog-detail__suggestion">
			{{ relatedPost(page, true) }}
			{{ relatedPost(page, false) }}
		</section>
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
	</main>
{% endblock %}

