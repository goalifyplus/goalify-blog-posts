<!doctype html>{# mother of all layouts #}
<html class="no-js" lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>{% block title %}{{ page.title }}{% endblock %}</title>
	<meta name="description" content="{{page.excerpt}}">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- for Google -->
	<meta name="description" content="{{page.excerpt}}" />
	<meta name="keywords" content="" />
	<!-- for Facebook -->
	<meta property="og:title" content="{{page.title}}" />
	<meta property="og:type" content="article" />
	<meta property="og:image" content="{{page.href}}/cover.jpg" />
	<meta property="og:url" content="{{page.href}}" />
	<meta property="og:description" content="{{page.excerpt}}" />

	<!-- for Twitter -->
	<meta name="twitter:card" content="summary" />
	<meta name="twitter:title" content="{{page.title}}" />
	<meta name="twitter:description" content="{{page.excerpt}}" />
	<meta name="twitter:image" content="{{page.href}}/cover.jpg" />

	<link rel="apple-touch-icon" href="/apple-touch-icon.png">
	<!-- Place favicon.ico in the root directory -->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,900,300,100&subset=latin,latin-ext,vietnamese' rel='stylesheet' type='text/css'>

	{% block stylesheet %}
	<link rel="stylesheet" href="{{ url_for('css/main.css') }}">
	<!--[if gt IE 8]><!-->
	<link rel="stylesheet" href="{{ url_for('css/tablet.css') }}" media="screen and (min-width: 768px)">
	<link rel="stylesheet" href="{{ url_for('css/desktop.css') }}" media="screen and (min-width: 992px)">

	<!--<![endif]-->
	<!--[if (lte IE 8)]>
	<link rel="stylesheet" href="css/ie8.css">
	<![endif]-->
	{% endblock stylesheet %}
</head>

<body>

{% block header %}

{% include '_partial/header.swig'%}

{% endblock %}

{% block hero-banner %}
{% endblock %}

{% block main %}

{{ page.content }} {# extends with main content here #}

{% endblock %}

{% block footer%}

{% include '_partial/footer.swig' with page%}

{% endblock %}

{% block scripts %}
	<script src="{{ url_for('js/main.js') }}"></script>
{% endblock %}

	<!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
	<script>
		(function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
		function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
		e=o.createElement(i);r=o.getElementsByTagName(i)[0];
		e.src='https://www.google-analytics.com/analytics.js';
		r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
		ga('create','{{config.ga_id}}','auto');ga('send','pageview');
	</script>
</body>
</html>
