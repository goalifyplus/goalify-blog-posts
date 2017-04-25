/* © 2017 NauStud.io
 * @author Eric
 */

/* global goalify */
var goalify = goalify || {};

(function() {
	'use strict';

	var keyCodes = [8, 9, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57];
	var goalifyContactUrl = 'https://script.google.com/macros/s/AKfycbz5oEQoNpz7Coinl_pLkcv0sQKqDd0XqHBsf_pFoZFYqjXej2s/exec';

	var howWeWork = document.querySelector('.how-we-work');
	var contactUs = document.querySelector('.contact-us');

	// utils
	var numberWithCommas = function(x) {
		var parts = x.toString().split('.');
		parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		return parts.join('.');
	};

	var serialize = function(obj) {
		var str = [];
		for(var p in obj) {
			if (obj.hasOwnProperty(p)) {
				str.push(encodeURIComponent(p) + '=' + encodeURIComponent(obj[p]));
			}
		}
		return str.join('&');
	};

	var ajax = function(url, param, success, error) {
		var request = new XMLHttpRequest();
		request.open('GET', url + '?' + serialize(param), true);

		request.onload = function() {
			if (request.status >= 200 && request.status < 400) {
				success();
			} else {
				error();
			}
		};

		request.onerror = function() {
			error();
		};

		request.send();
	};

	if (howWeWork) {
		var expectationReduceForm = document.getElementById('roi-form');
		if (expectationReduceForm) {
			var inputs = expectationReduceForm.querySelectorAll('.roi-form__input');
			[].forEach.call(inputs, function(input) {
				// prevent keycode not number
				input.addEventListener('keydown', function(e) {
					var event = e || window.event;
					if (input.name === 'salary') {
						keyCodes.push(190);
					}
					if (input.name === 'turnoverPercent') {
						if (e.target.value.length >= 3 && event.keyCode !== 8) {
							e.preventDefault();
							return false;
						}
					}
					if (keyCodes.indexOf(event.keyCode) === -1) {
						e.preventDefault();
						return false;
					}

				});

				// set value attribute to keep label floating, add comma if salary input
				input.addEventListener('keyup', function(e) {
					if (input.name === 'salary') {
						var salaryInput = e.target;
						var convertedNumber = numberWithCommas(salaryInput.value.replace(/,/g, ''));
						salaryInput.value = convertedNumber;
					}
					input.setAttribute('value', e.target.value);
				});
			});

			// change percentage when change slider value
			expectationReduceForm.addEventListener('input', function(e) {
				var form = e.target.form;
				var input = e.target;
				if (input.name === 'reduce-percent') {
					var result = form.elements.result;
					var resultContainer = result.parentElement;
					result.value = input.value + ' %';
					resultContainer.style.marginLeft = input.value + '%';
				}
			});
		}
	}

	if (contactUs) {
		var contactForm = document.getElementById('contact-form');
		if (contactForm) {
			contactForm.addEventListener('submit', function(e) {
				e.preventDefault();
				var elements = e.target.elements;
				var param = {};
				var submit = elements.submit;
				if (elements && elements.length) {
					for (var index = 0; index < elements.length - 1; index++) {
						var element = elements[index];
						param[element.name] = element.value;
					}
				}

				submit.disabled = true;
				ajax(goalifyContactUrl, param, function() {
					submit.textContent = 'Thank you';
				}, function() {
					submit.disabled = false;
					alert('Failure');
				});
			});
		}
	}
}());
