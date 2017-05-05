/* © 2017 NauStud.io
 * @author Eric
 */

/* global goalify */
var goalify = goalify || {};

(function() {
	'use strict';

	var keyCodes = [8, 9, 16, 35, 36, 46, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57];
	var annualCost = [
		{ min: 0, max: 0, cost: 0 },
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
	var goalifyApiUrl = 'http://app.dev.goalify.plus/api';
	var howWeWork = document.querySelector('.how-we-work');
	var contactUs = document.querySelector('.contact-us');
	var pricing = document.querySelector('.pricing');
	var dropDownTrigger = document.querySelectorAll('.js-trigger-dropdown');

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
			turnoverCost: Math.round(turnoverCost),
			rehireCost: Math.round(hiring * percent * n),
		};
	};

	var currencyText = function(symbol, currency, value) {
		return symbol + ' ' + numberWithCommas(value) + ' ' + currency;
	};

	var currentLang = function() {
		var langs = ['en', 'vi'];
		var url = window.location.pathname.split('/');
		var lang = url[1];
		if (langs.indexOf(lang) > -1) {
			return lang;
		}
		return 'en';
	};

	//------------------------- Main scripts ------------------------
	if (dropDownTrigger && dropDownTrigger.length > 0) {
		dropDownTrigger.forEach((dropDown) => {
			dropDown.addEventListener('mouseenter', function(e) {
				e.currentTarget.querySelector('.dropdown').classList.add('dropdown--active');
			});
			dropDown.addEventListener('mouseleave', function(e) {
				e.currentTarget.querySelector('.dropdown').classList.remove('dropdown--active');
			});
		});
	}
	if (howWeWork) {
		var expectationReduceForm = document.getElementById('roi-form');
		var savingCost = document.getElementById('savingCost');
		var currentCostToRehire = document.getElementById('currentCostToRehire');
		var costGoingWithUs = document.getElementById('costGoingWithUs');
		var employeeYouSave = document.getElementById('employeeYouSave');
		var costRehireWithUs = document.getElementById('costRehireWithUs');
		var oldData = {
			num: 0,
			salary: 0,
			currency: 'usd',
			percent: 0,
			expect: 0
		};

		var isValidData = function(form) {
			var employeeNumber = form.elements.numberOfEmployee.value;
			var salary = form.elements.salary.value.replace(/,/g, '');
			var turnoverPercent = Number(form.elements.turnoverPercent.value);

			if (!employeeNumber || !salary || !turnoverPercent) {
				return false;
			}

			if (employeeNumber < 2) {
				return false;
			}

			if (salary < 500) {
				return false;
			}

			if (turnoverPercent > 100) {
				return false;
			}
			return true;
		};

		var compareObject = function(obj1, obj2) {
			return JSON.stringify(obj1) === JSON.stringify(obj2);
		};

		var sendingRoiCalculationData = function(data) {
			ajax(goalifyApiUrl + '/collect-roi-calculation-data', data, function() {
				console.log('success');
			}, function() {
				console.log('fail');
			});
		};

		var calculateSaving = function(form) {
			// Get value from inputs
			var max = Number(form.elements.reducePercent.max);
			var expectValue = Number(form.elements.reducePercent.value);
			var employeeNumber = form.elements.numberOfEmployee.value || 0;
			var salary = form.elements.salary.value.replace(/,/g, '') || 0;
			var turnoverPercent = form.elements.turnoverPercent.value || 0;
			var currency = form.elements.currency.value || 'usd';
			var expectPercent = max;
			if (expectValue) {
				expectPercent = max - expectValue;
			}

			clearTimeout(goalify.roiCalculationTimeout);
			if (isValidData(form)) {
				var newData = {
					num: Number(employeeNumber),
					salary: Number(salary),
					currency,
					percent: Number(turnoverPercent),
					expect: Number(expectPercent)
				};
				goalify.roiCalculationTimeout = setTimeout(function() {
					if (!compareObject(newData, oldData)) {
						sendingRoiCalculationData(newData);
						oldData = newData;
					}
				}, 12000);
			}

			// calculate roi
			var actualTurnoverCost = calculateROI(employeeNumber, salary, turnoverPercent);
			var expectTurnoverCost = calculateROI(employeeNumber, salary, expectPercent);

			var saving = actualTurnoverCost.turnoverCost - expectTurnoverCost.turnoverCost;
			var symbol = '';
			if (currency === 'usd') {
				symbol = '$';
			}
			currency = currency.toUpperCase();

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
			costGoingWithUs.innerText = '$ ' + annualCost[temp].cost + ' USD';
		};

		var setExpectPercentage = function(form, value, isReset) {
			var flooredValue = Math.floor(value);
			var maxPercent = document.getElementById('js-max-reduce-percentage');
			var result = form.elements.result;
			var resultContainer = result.parentElement;
			var expectPercentageInput = form.reducePercent;
			expectPercentageInput.max = isReset ? '100' : flooredValue;
			expectPercentageInput.value = isReset ? '100' : '0';
			maxPercent.innerText = isReset ? '100' : flooredValue;
			result.value = flooredValue + '%';
			resultContainer.style.marginLeft = isReset ? '100%' : '0';
			expectPercentageInput.disabled = isReset;
		};

		if (expectationReduceForm) {
			var inputs = expectationReduceForm.querySelectorAll('.roi-form__input');
			[].forEach.call(inputs, function(input) {
				// prevent keycode not number
				input.addEventListener('keydown', function(e) {
					var event = e || window.event;
					var temp = keyCodes.slice(0);
					if (event.target.value.indexOf('.') < 0) {
						temp.push(190);
					}
					if (temp.indexOf(event.keyCode) === -1) {
						e.preventDefault();
						return false;
					}
				});
			});

			// change percentage when change slider value
			expectationReduceForm.addEventListener('input', function(e) {
				var form = e.target.form;
				var input = e.target;
				var turnoverPercentValue = Math.floor(Number(form.turnoverPercent.value));
				if (input.name === 'reducePercent') {
					var result = form.elements.result;
					var resultContainer = result.parentElement;
					var valueFromTurnOverPercent = 1;
					var max = Number(form.reducePercent.max);
					if (turnoverPercentValue) {
						valueFromTurnOverPercent = 100 / turnoverPercentValue;
					}
					var percentageForMargin = input.value * valueFromTurnOverPercent;
					result.value = (max - input.value) + ' %';
					resultContainer.style.marginLeft = percentageForMargin + '%';
				}
				// set value attribute to keep label floating,
				// add comma if salary input
				if (input.name === 'salary') {
					var convertedNumber = numberWithCommas(input.value.replace(/,/g, ''));
					input.value = convertedNumber;
				}
				if (input.name === 'turnoverPercent') {
					setExpectPercentage(form, turnoverPercentValue, turnoverPercentValue === 0);
				}
				input.setAttribute('value', input.value);
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
					if (currentLang() === 'vi') {
						submit.textContent = 'Cảm ơn bạn';
					} else {
						submit.textContent = 'Thank you';
					}
				}, function() {
					submit.disabled = false;
					alert('Failure');
				});
			});
		}
	}

	if (pricing) {
		var priceSelection = document.querySelector('.js-price-selection');
		var priceResult = document.querySelector('.js-price-result');
		var selectPriceYearly = document.querySelector('.js-select-price-yearly');
		var selectPriceMonthly = document.querySelector('.js-select-price-monthly');
		var pricePeriod = document.querySelector('.js-price-period');
		var priceByMembers = priceSelection.children;
		var priceByYearly = [100, 750, 1500, 3000, 4500, 7500, 15000];
		var priceByMonthly = [8, 75, 150, 300, 450, 750, 1500];

		selectPriceYearly.addEventListener('click', function() {
			priceByYearly.forEach(function(item, index) {
				priceByMembers[index].value = item;
			});
			priceResult.innerHTML = priceSelection.value;
			if (currentLang() === 'vi') {
				pricePeriod.innerHTML = 'mỗi năm';
			} else {
				pricePeriod.innerHTML = 'per year';
			}
		});

		selectPriceMonthly.addEventListener('click', function() {
			priceByMonthly.forEach(function(item, index) {
				priceByMembers[index].value = item;
			});
			priceResult.innerHTML = priceSelection.value;
			if (currentLang() === 'vi') {
				pricePeriod.innerHTML = 'mỗi tháng';
			} else {
				pricePeriod.innerHTML = 'per month';
			}
		});

		priceSelection.addEventListener('change', function() {
			console.log('test: ', priceSelection.value);
			priceResult.innerHTML = priceSelection.value;
		});
	}

	// script to subscribe email
	var subscribeMailForm = document.getElementById('mail-subscribe-form');
	if (subscribeMailForm) {
		var popup = document.querySelector('.popup');
		var popupCloseBtn = document.querySelector('.js-close-popup');
		if (popupCloseBtn) {
			popupCloseBtn.addEventListener('click', function() {
				popup.style.opacity = 0;
				document.body.style.overflow = 'auto';
				setTimeout(function() {
					popup.style.display = 'none';
				}, 300);
			});
		}

		subscribeMailForm.addEventListener('submit', function(e) {
			e.preventDefault();
			const emailInput = e.target.email;
			if (emailInput) {
				ajax(goalifyApiUrl + '/mail-subscribe', {email: emailInput.value}, function() {
					popup.style.display = 'flex';
					setTimeout(function() {
						popup.style.opacity = 1;
						document.body.style.overflow = 'hidden';
					}, 0);
					emailInput.value = '';
				}, function() {
					alert('Failure');
				});
			}
		});
	}
}());
