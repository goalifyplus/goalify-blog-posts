<!doctype html>{# mother of all layouts #}
<html class="no-js" lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
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

	<script>
		!function() {
			var t;
			if (t = window.driftt = window.drift = window.driftt || [], !t.init) return t.invoked ? void (window.console && console.error && console.error("Drift snippet included twice.")) : (t.invoked = !0,
				t.methods = [ "identify", "config", "track", "reset", "debug", "show", "ping", "page", "hide", "off", "on" ],
				t.factory = function(e) {
					return function() {
					var n;
					return n = Array.prototype.slice.call(arguments), n.unshift(e), t.push(n), t;
					};
				}, t.methods.forEach(function(e) {
					t[e] = t.factory(e);
				}), t.load = function(t) {
					var e, n, o, i;
					e = 3e5, i = Math.ceil(new Date() / e) * e, o = document.createElement("script"),
					o.type = "text/javascript", o.async = !0, o.crossorigin = "anonymous", o.src = "https://js.driftt.com/include/" + i + "/" + t + ".js",
					n = document.getElementsByTagName("script")[0], n.parentNode.insertBefore(o, n);
			});
		}();
		drift.SNIPPET_VERSION = '0.3.1';
		drift.load('hpixy35rix3v');
	</script>

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
