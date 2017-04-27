{% extends 'base.swig' %}
{% block meta %}
	<title>{% block title %}{{ page.title }}{% endblock %}</title>
	<meta name="description" content="{{page.excerpt}}">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- for Google -->
	<meta name="description" content="{{page.description}}" />
	<meta name="keywords" content="" />
	<!-- for Facebook -->
	<meta property="og:title" content="{{page.title}}" />
	<meta property="og:type" content="{{page.layout}}" />
	<meta property="og:image" content="{{config.url + page.imageUrl}}" />
	<meta property="og:url" content="{{config.url + page.url}}" />
	<meta property="og:description" content="{{page.description}}" />
	<meta property="fb:app_id" content="{{config.fb_app_id}}" />

	<!-- for Twitter -->
	<meta name="twitter:card" content="summary" />
	<meta name="twitter:title" content="{{page.title}}" />
	<meta name="twitter:description" content="{{page.excerpt}}" />
	<meta name="twitter:image" content="{{page.href}}/cover.jpg" />
{% endblock %}
{% block hero-banner %}
	{% if page.isHeroBannerHeader %}
		{% include '_partial/hero-banner.swig'%}
	{% endif %}
{% endblock %}
