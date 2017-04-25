/* © 2017 NauStud.io
 * @author Eric
 */

/* global goalify */
var goalify = goalify || {};

(function() {
	'use strict';

	var howWeWork = document.querySelector('.how-we-work');
	var keyCodes = [8, 9, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57];

	// utils
	var numberWithCommas = function(x) {
		var parts = x.toString().split('.');
		parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		return parts.join('.');
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
}());
