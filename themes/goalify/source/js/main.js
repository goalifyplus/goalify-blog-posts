/* © 2017 NauStud.io
 * @author Eric
 */

/* global goalify */
var goalify = goalify || {};

(function() {
	'use strict';

	var keyCodes = [8, 9, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 190];
	var annualCost = [
		{ min: 1, max: 10, cost: 100 },
		{ min: 11, max: 15, cost: 750 },
		{ min: 16, max: 25, cost: 1500 },
		{ min: 26, max: 50, cost: 3000 },
		{ min: 51, max: 100, cost: 4500 },
		{ min: 101, max: 500, cost: 7500 },
		{ min: 501, max: 2000, cost: 15000 }
	];
	var teamsizes = ['1-10', '11-50', '51-100', '101-200', '>200'];
	var goalifyContactUrl = 'https://script.google.com/macros/s/AKfycbz5oEQoNpz7Coinl_pLkcv0sQKqDd0XqHBsf_pFoZFYqjXej2s/exec';

	var howWeWork = document.querySelector('.how-we-work');
	var contactUs = document.querySelector('.contact-us');

	// ---------------------------- Utils -------------------------------
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

	var calculateROI = function(numberOfEmployee, salary, turnoverPercent) {
		// convert to number if not string
		var n = Number(numberOfEmployee);
		var s = Number(salary);
		var p = Number(turnoverPercent);

		// hiring cost
		var hiring = (s / 12) * 2;
		var onBoarding = (s / 12) * 0.75;
		var development = (s / 12) * 2 * 0.5;
		var unfulliedTime = (s / 12) * 2 * 0.25;
		var percent = p / 100;

		var turnoverCost = (hiring + onBoarding + development + unfulliedTime) * percent * n;
		return {
			turnoverCost,
			rehireCost: hiring * percent * n,
		};
	};

	var currencyText = function(symbol, currency, value) {
		return symbol + ' ' + numberWithCommas(value) + ' ' + currency;
	};

	//------------------------- Main scripts ------------------------
	if (howWeWork) {
		var expectationReduceForm = document.getElementById('roi-form');
		var savingCost = document.getElementById('savingCost');
		var currentCostToRehire = document.getElementById('currentCostToRehire');
		var costGoingWithUs = document.getElementById('costGoingWithUs');
		var employeeYouSave = document.getElementById('employeeYouSave');
		var costRehireWithUs = document.getElementById('costRehireWithUs');

		var calculateSaving = function(form) {
			// Get value from inputs
			var employeeNumber = form.elements.numberOfEmployee.value || 0;
			var salary = form.elements.salary.value.replace(/,/g, '') || 0;
			var turnoverPercent = form.elements.turnoverPercent.value || 0;
			var expectPercent = form.elements.reducePercent.value || 0;

			// calculate roi
			var actualTurnoverCost = calculateROI(employeeNumber, salary, turnoverPercent);
			var expectTurnoverCost = calculateROI(employeeNumber, salary, expectPercent);

			var saving = actualTurnoverCost.turnoverCost - expectTurnoverCost.turnoverCost;
			var symbol = '$';
			var currency = 'USD';

			// set element text after calculate
			savingCost.innerText = currencyText(symbol, currency, saving);
			currentCostToRehire.innerText = currencyText(symbol, currency, actualTurnoverCost.rehireCost);
			employeeYouSave.innerText = Math.ceil(employeeNumber * (turnoverPercent - expectPercent) / 100);
			costRehireWithUs.innerText = currencyText(symbol, currency, expectTurnoverCost.rehireCost);

			// get annual cost using us
			var temp = 0;
			for (var index = 0; index < annualCost.length; index++) {
				if (annualCost[index].min <= employeeNumber && annualCost[index].max >= employeeNumber) {
					temp = index;
					break;
				}
			}
			costGoingWithUs.innerText = currencyText(symbol, currency, annualCost[temp].cost);
		};

		if (expectationReduceForm) {
			var inputs = expectationReduceForm.querySelectorAll('.roi-form__input');
			[].forEach.call(inputs, function(input) {
				// prevent keycode not number
				input.addEventListener('keydown', function(e) {
					var event = e || window.event;
					if (keyCodes.indexOf(event.keyCode) === -1) {
						e.preventDefault();
						return false;
					}

				});

				// set value attribute to keep label floating, add comma if salary input
				input.addEventListener('keyup', function(e) {
					var i = e.target;
					if (i.name === 'salary') {
						var convertedNumber = numberWithCommas(i.value.replace(/,/g, ''));
						i.value = convertedNumber;
					}
					i.setAttribute('value', i.value);
				});
			});

			// change percentage when change slider value
			expectationReduceForm.addEventListener('input', function(e) {
				var form = e.target.form;
				var input = e.target;
				if (input.name === 'reducePercent') {
					var result = form.elements.result;
					var resultContainer = result.parentElement;
					result.value = input.value + ' %';
					resultContainer.style.marginLeft = input.value + '%';
				}
				calculateSaving(form);
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
						if (element.name === 'teamsize') {
							param.teamsize = teamsizes[element.value];
						}
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
