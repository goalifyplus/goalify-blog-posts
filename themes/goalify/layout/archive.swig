{# Note: this is the template for Ideas page, since it support pagination #}

{% extends 'base.swig' %}

{% block main %}
	<main class="main">
		{# <section class="middle-md center-sm container-fluid">
			<div class="row center-sm">
				<div class="intro col-xs-12 start-sm">
					<div class="intro__our">
						<span><strong>Our</strong></span><span class="intro__our-line"></span>
					</div>
					<div class="intro__services">
						<strong>Ideas</strong>
					</div>
					<div class="intro__content">
						We focus on emotion and usability rather than functionality.
					</div>
					<div class="intro__corner-image end-xs">
						<img src="{{url_for('img/our-ideas/intro-corner.svg')}}" alt="">
					</div>
					<div class="intro__wavy-image">
						<img src="{{url_for('img/our-ideas/intro-wavy.svg')}}" alt="" >
					</div>
				</div>
			</div>
		</section> #}

		{# <section class="container-fluid filter__container no-animation">
			<div class="col-xs-12 filter">
				<div class="project-selector dropdown js-dropdown visible-xs">
					<button class="dropdown__toggle"><span>All ideas</span><span class="icon icon--caret"></span></button>
					<ul class="dropdown__menu">
						{% for tag in site.tags %}
							<li><a href="{{ url_for(tag.path ) }}">{{tag.name}}</a></li>
						{% endfor %}
					</ul>
				</div>



				<div class="filter__choice-container hidden-xs">
					<ul class="filter__choices">
						{% for tag in site.tags %}
							<li class="filter__choice"><a href="{{ url_for(tag.path ) }}">{{tag.name}}</a></li>
						{% endfor %}
					</ul>
				</div>
			</div>
		</section> #}

		<section class="middle-md center-sm container-fluid">
			<div class="row center-sm">
				<div class="filter col-xs-12 col-md-8 col-sm-11">
					<div class="dropdown js-dropdown">
						<button class="dropdown__toggle">All ideas<span class="icon icon--caret"></span></button>
						<ul class="dropdown__menu">
							{% for tag in site.tags %}
								<li><a href="{{ url_for(tag.path ) }}">{{tag.name}}</a></li>
							{% endfor %}
						</ul>
					</div>
				</div>
			</div>
		</section>

		{% for post in page.posts %}
			<section class="container-fluid hidden-xs">
				<div class="row middle-md center-sm">
					<div class="idea start-sm col-sm-12">
						<div class="idea__author">
							<div class="idea__author__avatar"><img src="{{ post.author.avatar }}" alt="Avatar of {{ post.author.name }}"></div>
							<div class="idea__author__name-and-date">
								<div class="idea__author__name">{{ post.author.name }}</div>
								<div class="idea__author__post-date">{{ post.date.format(config.date_format) }}</div>
							</div>
						</div>
						<div class="idea__image">
							<a href="{{ url_for(post.path) }}">
								<img src="{{url_for(post.path + '/cover.jpg')}}" alt="">
							</a>
						</div>
						<div class="idea__title">
							<a href="{{ url_for(post.path) }}">
								{{ post.title }}
							</a>
						</div>
						<div class="idea__content">
							{{ post.excerpt}}
						</div>
						<div class="idea__readmore"></div>
						<a href="{{ url_for(post.path) }}" class="idea__readmore">Read more ...</a>
					</div>
				</div>
			</section>
		{% endfor %}
		<section class="visible-xs">
			<div class="blog-list col-md-8">
				{% for item in site.posts %}
					{% if loop.index < 4 %}
					<div class="blog js-blog" style="background-image: url('{{url_for('img/home/blog-car.jpg')}}')">
						<div class="blog__overlay">
							<div class="row">
								<div class="blog__header col-xs-12">
									<div class="blog__header__row">
										<span class="blog__href">
											<i class="icon icon--folder"></i>
											{% if item.tags && item.tags.length %}
												{% for tag in item.tags %}
													<a href="{{ url_for(tag.path ) }}">{{ tag.name}}</a>
													{% if loop.index < item.tags.length %}, {% endif %}
												{% endfor %}
											{% endif %}
										</span>
										<span class="blog__author"><i class="icon icon--author"></i> {{ item.author }}</span>
									</div>

									<div class="blog__header__row">
										<span class="blog__date">{{ item.date.format(config.date_format) }}</span>
									</div>
								</div>
								<div class="blog__header--tablet col-sm-2">
									<span class="blog__day">{{ item.date.format(config.get_day) }}</span>
									<span class="blog__month">{{item.date.format(config.get_month)}}</span>
								</div>
								<div class="blog__title col-xs-12 col-sm-10 start-md">
									<a href="{{ url_for(item.path) }}"><strong>{{ item.title | striptags }}</strong></a>
									<div class="hide-xs blog__header row start-sm">
										<span class="blog__href col-sm-5">
											<i class="icon icon--folder"></i>
											{% if item.tags && item.tags.length %}
												{% for tag in item.tags %}
													<a href="{{ url_for(tag.path ) }}">{{ tag.name}}</a>
													{% if loop.index < item.tags.length %}, {% endif %}
												{% endfor %}
											{% endif %}
										</span>
										<span class="blog__author"><i class="icon icon--author"></i> {{ item.author }}</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					{% endif %}
				{% endfor %}
			</div>
		</section>
		{# paginator #}
		<nav class="paginator">
			{{ paginator({prev_next: false, mid_size: 1}) }}
		</nav>
	</main><!-- /.main -->
{% endblock %}

{% block footer%}

{% include '_partial/footer.swig' %}

{% endblock %}
