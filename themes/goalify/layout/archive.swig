{# Note: this is the template for Blog page #}

{% extends 'base.swig' %}

{% block main %}
	<main class="blog">
		<div class="container-fluid container-fluid--fixed">
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<section class="blog__tags">
						<ul class="blog__tags__wrapper">
							<li class="blog__tags__item">
								{% if page.tag === '' %}
									<a class="blog__tags__link active" href="{{ url_for(config.archive_dir ) }}">All</a>
								{% else %}
									<a class="blog__tags__link" href="{{ url_for(config.archive_dir ) }}">All</a>
								{% endif %}
							</li>
							{% for tag in site.tags %}
								<li class="blog__tags__item">
									{% if tag.name === page.tag %}
										<a class="blog__tags__link active" href="{{ url_for(tag.path ) }}">{{tag.name}}</a>
									{% else %}
										<a class="blog__tags__link" href="{{ url_for(tag.path ) }}">{{tag.name}}</a>
									{% endif %}
								</li>
							{% endfor %}
						</ul>
					</section>
					<section class="blog__posts">
						{% for item in page.posts %}
							<div class="blog__post">
								<div class="blog__post__thumbnail" style="background-image: url({{ url_for(item.thumbnail) }})"></div>
								<div class="blog__post__content">
									<h4 class="blog__post__title"><a href="{{ url_for(item.path) }}" class="blog__post__link">{{item.title}}</a></h4>
									<p class="blog__post__intro">
										{{ truncate(strip_html(item.content), {length: 180}) }}
									</p>
									<div class="blog__post__info">
										<span class="blog__post__author-avatar" style="background-image: url({{ url_for(item.authorAvatar) }})"></span>
										<span class="blog__post__author-name">{{item.authorName}}</span>
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
				<div class="register-form-horizontal__group-btn">
					<input type="text" class="register__form" placeholder="name@yourcompany.com"></input>
					<button class="btn btn--second ">Subcribe</button>
				</div>
			</div>
		</div>
	</main><!-- /.main -->
{% endblock %}
