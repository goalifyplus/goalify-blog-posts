// Nau standard eslint rules, save it as .eslintrc.js
module.exports = {
	'root': true,
	'extends': [
		'nau',
	],
	'rules': {
		'no-var': 'off',
		'strict': 'off',
		'no-use-before-define': 'off',
	},
	'globals': {},
	'env': {
		browser: true,
		commonjs: true,
		es6: true,
		jest: true,
	},
	// 'parser': 'babel-eslint',
	'parserOptions': {
		'ecmaVersion': 6,
		// 'sourceType': 'module',
		'ecmaFeatures': {
			'impliedStrict': true,
			// 'jsx': true,
			// 'classes': true,
		},
	},
	'plugins': [
		'import',
	],
};
