<footer class="footer hidden-xs">
	<div class="container-fluid container-fluid--fixed footer-container">
		<div class="footer-container__language">
			<i class="icon icon--bubble-message footer-container__language__icon"></i>
			{% if lang === 'vi' %}
				<a href="{{switch_lang('en')}}" class="footer-container__lang">
					<span>English</span>
				</a>
			{% else %}
				<a href="{{switch_lang('vi')}}" class="footer-container__lang">
					<span>Tiếng Việt</span>
				</a>
			{% endif %}
		</div>
		<div class="footer-container__info">
			<div class="footer-container__info-section">
				<div class="footer-container__info-section__title">Goalify</div>
				<ul class="footer-container__info-section__nav">
					<li class="footer-container__nav-item"><a href="{{url_for_lang('/')}}">{{__('footer.home')}}</a></li>
					<li class="footer-container__nav-item">{{__('footer.features')}}</li>
					<li class="footer-container__nav-item"><a href="{{url_for_lang('pricing')}}">{{__('footer.pricing')}}</a></li>
				</ul>
			</div>
			<div class="footer-container__info-section">
				<div class="footer-container__info-section__title">{{__('footer.guide')}}</div>
				<ul class="footer-container__info-section__nav">
					<li class="footer-container__nav-item">{{__('footer.getStarted')}}</li>
					<li class="footer-container__nav-item">{{__('footer.howItWork')}}</li>
					<li class="footer-container__nav-item"><a href="{{url_for_lang('contact-us')}}">{{__('footer.support')}}</a></li>
				</ul>
			</div>
			<div class="footer-container__info-section">
				<div class="footer-container__info-section__title">{{__('footer.company')}}</div>
				<ul class="footer-container__info-section__nav">
					<li class="footer-container__nav-item"><a href="{{url_for_lang('about')}}">{{__('footer.about')}}</a></li>
					<li class="footer-container__nav-item"><a href="{{url_for_lang('job')}}">{{__('footer.jobs')}}</a></li>
					<li class="footer-container__nav-item">{{__('footer.press')}}</li>
				</ul>
			</div>
			<div class="footer-container__info-section">
				<div class="footer-container__info-section__title">{{__('footer.resource')}}</div>
				<ul class="footer-container__info-section__nav">
					<li class="footer-container__nav-item"><a href="{{url_for_lang('blog')}}">{{__('footer.blog')}}</a></li>
					<li class="footer-container__nav-item">{{__('footer.webinar')}}</li>
					<li class="footer-container__nav-item"><a href="{{url_for_lang('roi-calculation')}}">{{__('footer.roiCalculation')}}</a></li>
				</ul>
			</div>
			<div class="footer-container__info-section">
				<div class="footer-container__info-section__title">contact</div>
				<ul class="footer-container__info-section__nav">
					<li class="footer-container__nav-item"><a href="mailto:Goalifyjsc@gmail.com">Email</a></li>
					<li class="footer-container__nav-item"><a href="https://www.facebook.com/goalify.plus/">Facebook</a></li>
					<li class="footer-container__nav-item"><a href="https://www.linkedin.com/in/goalify-jsc-746788141/">Linkedin</a></li>
					<li class="footer-container__nav-item"><a href="https://twitter.com/Goalifyplus">Twitter</a></li>
				</ul>
			</div>
		</div>
		<div class="footer-container__copyright">&copy; Goalify 2017</div>
	</div>

</footer><!-- /.footer-->

