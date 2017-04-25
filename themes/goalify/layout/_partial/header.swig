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
			<a href="/products" class="nav__item">products</a>
			<a href="/pricing" class="nav__item">pricing</a>
			<a href="/about" class="nav__item">about</a>
			<a href="/resources" class="nav__item">resources</a>
			<a href="/login" class="nav__item nav__item--login">login</a>
			<a href="/how-we-work" class="nav__item nav__item--btn btn">Calculate ROI</a>
		</nav>
	</div>
</header>
