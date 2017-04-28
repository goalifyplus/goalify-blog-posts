{% if page.isTransparentHeader %}
<header class="header header--transparent">
{% else %}
<header class="header">
{% endif %}
	<div class="container-fluid container-fluid--fixed header__container">
		{% if page.isTransparentHeader %}
			<a href="/"><img src="/images/logo-colored.svg" alt="Goalify Logo" class="header__container__logo"/></a>
		{% else %}
			<a href="/"><img src="/images/logo.svg" alt="Goalify Logo" class="header__container__logo"/></a>
		{% endif %}

		<nav class="nav">
			<a
				href="{{ url_for_lang('products') }}"
				class="nav__item
					{% if page.name === 'products' %}
						nav__item--active
					{% endif %}
				"
			>{{__('header.products')}}</a>
			<a
				href="{{ url_for_lang('pricing') }}"
				class="nav__item
					{% if page.name === 'pricing' %}
						nav__item--active
					{% endif %}
				"
			>{{__('header.pricing')}}</a>
			<a
				href="{{ url_for_lang('about') }}"
				class="nav__item
					{% if page.name === 'about' %}
						nav__item--active
					{% endif %}
				"
			>{{__('header.about')}}</a>
			<div class="nav__item-container">
				<a href="/#" class="nav__item">
					{{__('header.resources')}}
				</a>
				{% if page.isTransparentHeader %}
				<div class="dropdown dropdown--transparent">
				{% else %}
				<div class="dropdown">
				{% endif %}
					<ul class="dropdown__list">
						<li class="dropdown__list-item"><a href="{{url_for_lang('blog')}}" class="dropdown__list-item-link">{{__('header.blog')}}</a></li>
						<li class="dropdown__list-item"><a href="{{url_for_lang('library')}}" class="dropdown__list-item-link">{{__('header.library')}}</a></li>
					</ul>
				</div>
			</div>
			<a href="{{ url_for_lang('login') }}" class="nav__item nav__item--login">{{__('header.login')}}</a>
			<a href="{{ url_for_lang('roi-calculation') }}" class="nav__item nav__item--btn btn">{{__('header.calculationRoi')}}</a>
		</nav>
	</div>
</header>
