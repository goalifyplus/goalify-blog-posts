{% extends 'base.swig' %}

{% block main %}
	<main class="main post-page">
		<h1>ahihi</h1>
		<article>
			<header>
				<h1>{{ page.title }}</h1>
				<time datetime="{{ page.date.toDate().toISOString() }}">{{ page.date.format(config.date_format) }}</time>
				|
				{% if page.tags %}
					{% for tag in page.tags %}
						<a href="{{ url_for(tag.path ) }}">#{{ tag.name}}</a> |
					{% endfor %}
				{% endif %}
			</header>

			<div class="post-content">
				{{ page.content }}
			</div>
		</article>
	</main><!-- /.main -->
{% endblock %}

