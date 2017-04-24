{% extends 'base.swig' %}

{% block main %}
	<main class="blog-detail">
		<div class="container-fluid container-fluid--fixed">
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<article>
						<header class="blog-detail__header">
							<h1 class="blog-detail__header__title">{{ page.title }}</h1>
							<div class="blog-detail__header__info">
								<span class="blog-detail__header__author-avatar" style="background-image: url({{ url_for(page.authorAvatar) }})"></span>
								<span class="blog-detail__header__author-name">{{ page.authorName }}</span>
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
					<button class="btn btn--second ">Subcribe</button>
				</div>
			</div>
		</section>
		<section class="blog-detail__suggestion">
			<div class="blog-detail__suggestion__item" style="background-image: url({{ url_for(page.thumbnail) }})">
				<button class="btn btn--transparent blog-detail__suggestion__btn float lighter">Read this next</button>
				<h4 class="blog-detail__suggestion__title float">The Purpose of Education</h4>
				<p class="blog-detail__suggestion__desc float lighter">I am happy to join with you today in what will go down in history as the greatest demonstration for freedom in the history of our</p>
			</div>{#
			#}<div class="blog-detail__suggestion__item" style="background-image: url(/images/food-dinner.jpg)">
				<button class="btn btn--transparent blog-detail__suggestion__btn float lighter">You might enjoy</button>
				<h4 class="blog-detail__suggestion__title float">The Purpose of Education</h4>
				<p class="blog-detail__suggestion__desc float lighter">I am happy to join with you today in what will go down in history as the greatest demonstration for freedom in the history of our</p>
			</div>
		</section>
	</main>
{% endblock %}

