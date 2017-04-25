{% extends 'base.swig' %}
{% block hero-banner %}
	{% if page.isHeroBannerHeader %}
		{% include '_partial/hero-banner.swig'%}
	{% endif %}
{% endblock %}
