/* global hexo */

'use strict';

const convertVietnamese = function(str) {
	let newString = str || '';
	newString = newString.toLowerCase();
	newString = newString.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, 'a');
	newString = newString.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, 'e');
	newString = newString.replace(/ì|í|ị|ỉ|ĩ/g, 'i');
	newString = newString.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, 'o');
	newString = newString.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, 'u');
	newString = newString.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, 'y');
	newString = newString.replace(/đ/g, 'd');
	newString = newString.replace(/!|@|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\;|\'| |\"|\&|\#|\[|\]|~|$|_/g, '-');
	newString = newString.replace(/-+-/g, '-');
	newString = newString.replace(/^\-+|\-+$/g, '');

	return newString;
};

hexo.extend.helper.register('convert_category', (category) => {
	const newString = convertVietnamese(category);
	return newString.replace(/ /g, '-');
});
