 	<header id="header-global" class="js-header-global header-global {% if (no_hero_banner == true || page.no_hero_banner == true) %}header-global--no-hero-banner{% endif %}">

	<div class="header-global__hero-banner cf">
			{% if page.video || video %}
				<video autoplay loop class="header-global__video" muted>
				{% if home %}
					<source src="{{ url_for('videos/home-banner-video.webm') }}" type="video/webm"/>
					<source src="{{ url_for('videos/home-banner-video.mp4') }}" type="video/mp4"/>
				{% else %}
					{% if page.page_name %}
					<source src="{{ url_for('videos/' + page.page_name + '-banner-video.webm') }}" type="video/webm"/>
					<source src="{{ url_for('videos/' + page.page_name + '-banner-video.mp4') }}" type="video/mp4"/>
					{% else %}
					<source src="{{ url_for('videos/' + pageName + '-banner-video.webm') }}" type="video/webm"/>
					<source src="{{ url_for('videos/' + pageName + '-banner-video.mp4') }}" type="video/mp4"/>
					{% endif %}
				{% endif %}
				</video>
			{% endif %}
			<div style="background-image: url({% if (page.page_name != null) %} '{{ url_for('img/' + page.page_name + '/banner.jpg') }}' {% else %} '{{ url_for('img/home/banner.jpg') }}' {% endif %})" class="header-global__background-image"></div>
{# 				<div class="header-global__rect"></div>
				<div class="header-global__text text-center">
					<strong>{{ page.hero_title || config.subtitle }}</strong>
				</div> #}
			<div class="header-global__rect">
				<svg version="1.1" id="header-rect" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
				 width="170px" height="270px" viewBox="0 0 170 270" enable-background="new 0 0 170 270" xml:space="preserve">
					<line id="header-rect-line-1" stroke="#977857" stroke-width="10" x1="2" y1="5" x2="170" y2="5"/>
					<line id="header-rect-line-2" stroke="#977857" stroke-width="10" x1="6" y1="0" x2="6" y2="270"/>
					<line id="header-rect-line-3" stroke="#977857" stroke-width="10" x1="165" y1="0" x2="165" y2="267"/>
					<line id="header-rect-line-4" stroke="#977857" stroke-width="10" x1="2" y1="265" x2="170" y2="265"/>
				</svg>
				<div class="header-global__rect--title">
					{% if page.hero_title %}
					<span> {{page.hero_title}} </span>
					{% else %}
					<span> {{heroTitle || config.subtitle}} </span>
					{% endif %}
				</div>
				<div class="header-global__rect--scroll">
					<span class="js-scroll">SCRO</span>
				</div>
			</div>
			<div class="js-header-global__text header-global__text text-center">
				{% if page.hero_title %}
				<strong> {{page.hero_title}} </strong>
				{% else %}
				<strong> {{heroTitle || config.subtitle}} </strong>
				{% endif %}
			</div>
			<div class="js-header-global__scroll header-global__scroll">
				<span class="js-scroll">SCRO</span>
			</div>
		</div>

		<div class="nav-bar-toggle js-nav-bar-toggle {% if (no_hero_banner == true || page.no_hero_banner == true) %} nav-bar-toggle--with-bg {% else %}js-nav-bar-toggle-with-background nav-bar-toggle--white {% endif %}">
			<div class="nav-bar-toggle__background"></div>
			<span class="nav-bar-toggle__line"></span>
			<span class="nav-bar-toggle__text">
				<?xml version="1.0" encoding="utf-8"?>
				<svg version="1.1" class="logo-mini" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
					 width="44px" height="12.5px" viewBox="0 0 44 12.5" enable-background="new 0 0 44 12.5" xml:space="preserve">
				<path id="XMLID_56_" fill="#ffffff" d="M3,12.5V3.1h2.6c1,0,1.8,0.5,2.1,1.4l2.9,8h3.4l-3.4-9.2C10.5,2.6,9.5,0,6.5,0H0v12.5H3z"/>
				<path id="XMLID_55_" fill="#ffffff" d="M41,0v9.4h-2.6c-1,0-1.8-0.6-2.1-1.4l-2.9-8h-3.4l3.4,9.2c0.4,1.2,1.5,3.3,4.2,3.3H44V0H41z"
					/>
				<polygon id="XMLID_54_" fill="#ffffff" points="20.4,12.5 17.2,12.5 16,9.4 19.2,9.4 "/>
				<path id="XMLID_53_" fill="#ffffff" d="M28.2,9.8c0,0-3.2-8.6-3.2-8.7C24.5,0.4,23.9,0,23,0h-2.7c0,0,1,0.8,1.7,2.7
					c0,0,3,8.2,3.1,8.4c0.3,0.9,1.1,1.4,1.8,1.4h2.9C29.9,12.5,28.8,11.7,28.2,9.8"/>
				</svg>


			</span>
			<span class="nav-bar-toggle__line"></span>
		</div>

		<nav class="header-global__nav-bar js-nav-bar-desktop" style="background-image: url({% if (page.page_name != null) %} '{{ url_for('img/' + page.page_name + '/banner.jpg') }}' {% else %} '{{ url_for('img/' + pageName + '/banner.jpg') }}' {% endif %})">
			<div class="nav-bar-toggle--desktop js-nav-bar-toggle--desktop hidden-xs hidden-sm">
				<span class="nav-bar-toggle--desktop__line"></span>
				<span class="nav-bar-toggle--desktop__text">
					<?xml version="1.0" encoding="utf-8"?>
					<svg version="1.1" fill="#000" clas="logo-mini" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
						 width="50px" height="14.2px" viewBox="0 0 50 14.2" enable-background="new 0 0 50 14.2" xml:space="preserve">
					<path id="XMLID_56_" d="M3.5,14.2V3.6h3c1.1,0,2,0.6,2.3,1.6l3.3,9.1H16L12.1,3.8C11.9,2.9,10.7,0,7.4,0H0v14.2H3.5z
						"/>
					<path id="XMLID_55_" d="M46.5,0v10.6h-3c-1.1,0-2-0.7-2.3-1.6L37.9,0H34l3.9,10.4c0.4,1.4,1.7,3.7,4.8,3.7H50V0H46.5
						z"/>
					<polygon id="XMLID_54_" points="23.1,14.2 19.5,14.2 18.2,10.7 21.8,10.7 "/>
					<path id="XMLID_53_" d="M32,11.1c0,0-3.6-9.8-3.7-9.9C27.9,0.5,27.2,0,26.2,0h-3c0,0,1.2,0.9,1.9,3
						c0,0,3.4,9.3,3.5,9.5c0.4,1,1.2,1.6,2,1.6H34C34,14.2,32.8,13.3,32,11.1"/>
					</svg>

				</span>
				<span class="nav-bar-toggle--desktop__line"></span>
			</div>
			<ul class="header-global__nav-bar-left js-header-global__nav-bar-left">
				<li class="header-global__nav-bar-item hidden-xs hidden-sm"><a href="{{ url_for('') }}" {%if home%} class="active" {%endif%}><strong>NAU</strong> DIGITAL CREATIVE</a></li>
				<li class="header-global__nav-bar-item visible-xs visible-sm"><a href="{{ url_for('/') }}"  {%if home%} class="active" {%endif%}>Home</a></li>
				<li class="header-global__nav-bar-item"><a href="{{ url_for('about-us') }}"  {%if page.about_us%} class="active" {%endif%}>About us</a></li>
				<li class="header-global__nav-bar-item"><a href="{{ url_for('work') }}"  {%if work%} class="active" {%endif%}>Our work</a></li>
				<li class="header-global__nav-bar-item"><a href="{{ url_for('how-we-work') }}"  {%if page.how_we_work%} class="active" {%endif%}>How we work</a></li>
				<li class="header-global__nav-bar-item"><a href="{{ url_for('our-services') }}"  {%if page.our_services%} class="active" {%endif%}>Our services</a></li>
				<li class="header-global__nav-bar-item"><a href="{{ url_for('ideas') }}"  {%if ideas%} class="active" {%endif%}>Ideas</a></li>
				<li class="header-global__nav-bar-item header-global__nav-bar-item--careers">
					<a href="{{ url_for('career') }}" {%if page.career%} class="active" {%endif%}>Careers
						<span>5</span>
					</a>
				</li>
				<li class="header-global__nav-bar-item"><a href="{{ url_for('contact') }}"  {%if page.contact_us%} class="active" {%endif%}>Contact us</a></li>
			</ul>
			<ul class="header-global__nav-bar-right js-header-global__nav-bar-right sans-serif">
				<li class="header-global__nav-bar-item"><a href="{{ url_for('get-in-touch') }}"  {%if page.get_in_touch%} class="active" {%endif%}><strong></strong></a></li>
			</ul>
		</nav>
	</header>
