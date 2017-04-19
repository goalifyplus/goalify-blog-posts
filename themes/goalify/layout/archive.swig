{# Note: this is the template for Blog page #}

{% extends 'base.swig' %}

{% block main %}
	<main class="main">
		<ul>
			<li><a href="{{ url_for(config.archive_dir ) }}">All</a></li>
			{% for tag in site.tags %}
				<li><a href="{{ url_for(tag.path ) }}">#{{ tag.name}}</a></li>
			{% endfor %}
		</ul>
		{% for item in page.posts %}
			<section>
				<time datetime="{{ item.date.toDate().toISOString() }}">{{ item.date.format(config.date_format) }}</time>
				<h4 class="title"><a href="{{ url_for(item.path) }}">{{ item.title }}</a> {{item.path}} </h4>
			</section>
		{% endfor %}

		<nav>
			{% if page.prev %}
				<a href="{{ url_for(page.prev_link) }}">&lt; Previous</a>
			{% endif %}
			{% if page.next %}
				<a href="{{ url_for(page.next_link) }}">Next &gt;</a>
			{% endif %}
		</nav>
	</main><!-- /.main -->
{% endblock %}
