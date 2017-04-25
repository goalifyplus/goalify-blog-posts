/* © 2017 NauStud.io
 * @author Eric
 */

/* global goalify */
var goalify = goalify || {};

(function() {
	'use strict';

	const howWeWork = document.querySelector('.how-we-work');
	if (howWeWork) {
		const expectationReduceForm = document.getElementById('expectation-reduce');
		if (expectationReduceForm) {
			expectationReduceForm.addEventListener('input', function(e) {
				var form = e.target.form;
				var input = e.target;
				var result = form.elements.result;
				var resultContainer = result.parentElement;
				result.value = input.value + ' %';
				resultContainer.style.marginLeft = input.value + '%';
			});
		}
	}
}());
