{% if page.no_good_read != true %}
<div class="col-xs-12">
	<section class="row center-md middle-md js-blog-list">
		<div class="blog-list">
			<div class="js-blog-list__title blog-list__title center-xs">
				<strong>GOOD READ</strong>
			</div>
			<div class="js-blog-list__arrow-down blog-list__arrow-down center-xs">
				<i class="icon icon--arrow-down box"></i>
			</div>
			{% set posts = site.posts.sort('-date') %}
			{% for item in posts.limit('3') %}
				<div class="blog js-blog js-blog-animation" style="background-image: url('{{url_for(item.path + 'cover.jpg')}}')">
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
									<span class="blog__author"><i class="icon icon--author"></i> {{ item.author.name }}</span>
								</div>

								<div class="blog__header__row">
									<span class="blog__date">{{ item.date.format(config.date_format) }}</span>
								</div>
							</div>
							<div class="blog__header--tablet col-sm-2">
								<span class="blog__day">{{ item.date.format(config.get_day) }}</span>
								<span class="blog__month">{{item.date.format(config.get_month)}} {{item.date.format(config.get_year)}}</span>
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
									<span class="blog__author"><i class="icon icon--author"></i> {{ item.author.name }}</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			{% endfor %}
		</div>
	</section>
</div>
{% endif %}
