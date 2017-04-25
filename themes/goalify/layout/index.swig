{% extends 'base.swig' %}

{% block main %}
	<div class="home">
		<section class="hero-banner">
			<div class="container-fluid container-fluid--fixed hero-banner__content">
				<h1 class="hero-banner__title">Reinventing the way your team focusing into achieving their goal, create better working environement.</h1>
				<p class="hero-banner__desc">SEN give leaders tools to increase employee retention, leverage up productivity, improve company culture and inspire employee personal branding.</p>
				<img src="/images/macbook-air-perdoo.png" alt="Goalify image header" class="hero-banner__image"/>
			</div>
		</section>
		<div class="register home__register">
			<h3 class="register__title">Get started for FREE</h3>
			<!--<span class="register__sub-title">Invite more team member and starting a team is really that simple.</span>-->
			<div class="register__form-wrapper">
				<input type="text" class="register__form" placeholder="name@yourcompany.com"></input>
				<button class="btn">Get Started for FREE</button>
			</div>
			<!--<span class="register__desc">Free for team below 10 members or 15 days trial. No credit card required.</span>-->
		</div>

		<section class="home-section">
			<div class="row">
				<div class="col-md-6">
					<img src="/images/goalify-key-result.jpg" class="home-section__image">
				</div>
				<div class="col-md-6">
					<div class="home-section__content">
						<h2 class="home-section__content__title">Create a whole new working environment spirit</h2>
						<i class="icon icon--profile home-section__content__icon"></i>
						<h3 class="home-section__content__sub-title">Transparent Goal</h3>
						<div class="home-section__content__desc">Clear goal objectives and priorities. It helps to connect company, team and personal objectives to measurable results, making people move together in right direction.</div>
						<a href="#" class="home-section__content__more">Learn more</a>
						<button class="btn">Get Started for FREE</button>
					</div>
				</div>
			</div>
		</section>

		<section class="home-section">
			<div class="row row--reverse">
				<div class="col-md-6">
					<img src="/images/goalify-give-fruit.jpg" class="home-section__image">
				</div>
				<div class="col-md-6">
					<div class="home-section__content">
						<h2 class="home-section__content__title">Culture Engagement</h2>
						<i class="icon icon--profile home-section__content__icon"></i>
						<h3 class="home-section__content__sub-title">Company core value system</h3>
						<div class="home-section__content__desc">Firm delivers core culture values to a large amount of employees, help employees understand clearly about the mission, vision of the firm. Tight the gap and align the vision of firm and employee together.</div>
						<a href="#" class="home-section__content__more">Learn more</a>
						<button class="btn">Get Started for FREE</button>
					</div>
				</div>
			</div>
		</section>


		<section class="home-section">
			<div class="row">
				<div class="col-md-6">
					<img src="/images/goalify-objective.jpg" class="home-section__image">
				</div>
				<div class="col-md-6">
					<div class="home-section__content">
						<h2 class="home-section__content__title">Simplify Management</h2>
						<i class="icon icon--profile home-section__content__icon"></i>
						<h3 class="home-section__content__sub-title">Simplify the paperwork and focus more on employee</h3>
						<div class="home-section__content__desc">Help manager to simplify and help the work load more simplify and efficient. Release manager from paper work, complex process and focus more on people.</div>
						<a href="#" class="home-section__content__more">Learn more</a>
						<button class="btn">Get Started for FREE</button>
					</div>
				</div>
			</div>
		</section>

		<section class="home-section">
			<div class="row row--reverse">
				<div class="col-md-6">
					<img src="/images/goalify-fruit-board.jpg" class="home-section__image">
				</div>
				<div class="col-md-6">
					<div class="home-section__content">
						<h2 class="home-section__content__title">Mastery - Employee branding</h2>
						<i class="icon icon--profile home-section__content__icon"></i>
						<h3 class="home-section__content__sub-title">Greate confidence & inspiration</h3>
						<div class="home-section__content__desc">Helping employee have great confidence and be inspiration to the rest in the firm. Employees’ branding created by recognization & repectation by excellent work.</div>
						<a href="#" class="home-section__content__more">Learn more</a>
						<button class="btn">Get Started for FREE</button>
					</div>
				</div>
			</div>
		</section>

		<section class="home-customer">
			<i class="icon icon--double-quotation home-customer__icon"></i>
			<div class="home-customer__title">Customer Story</div>
			<div class="home-customer__commend-list">

				<div class="home-customer__commend-item" for="customer-1">
					<input type="radio" name="customer-story" id="customer-1" hidden>
					<label for="customer-1"><img src="/images/avatar-test.jpg" alt="customer avatar"></label>
					<div class="home-customer__commend-item__desc">
						<p class="text">"Commend 1"</p>
						<span class="author">Melissa Diaz, Project Manager</span>
					</div>
				</div>
				<div class="home-customer__commend-item" for="customer-2">
					<input type="radio" name="customer-story" id="customer-2" hidden checked>
					<label for="customer-2"><img src="/images/avatar-test.jpg" alt="customer avatar"></label>
					<div class="home-customer__commend-item__desc">
						<p class="text">"Commend 2."</p>
						<span class="author">Melissa Diaz, Project Manager</span>
					</div>
				</div>
				<div class="home-customer__commend-item" for="customer-3">
					<input type="radio" name="customer-story" id="customer-3" hidden>
					<label for="customer-3"><img src="/images/avatar-test.jpg" alt="customer avatar"></label>
					<div class="home-customer__commend-item__desc">
						<p class="text">"Commend 3."</p>
						<span class="author">Melissa Diaz, Project Manager</span>
					</div>
				</div>
			</div>
		</section>

		<section class="home__revenue">
			<img src="/images/goalify-revenue.png" alt="Goalify revenue" class="home__revenue__image">
			<div class="home__revenue__background"></div>
		</section>

		<section class="home__register-bottom">
			<div class="register-form-horizontal container-fluid container-fluid--fixed">
				<div class="register-form-horizontal__title">
					<span class="common highlight">Ready to get started for free</span>
					<span>or create an account</span>
				</div>
				<div class="register-form-horizontal__group-btn">
					<button class="btn btn--purple">Get started for FREE</button>
					<button class="btn btn--transparent ">Sign up</button>
				</div>
			</div>
		</section>
	</div>
{% endblock %}
