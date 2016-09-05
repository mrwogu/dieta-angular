(function() {
	'use strict';
	
	var informationsModule = angular.module('informationsModule', ['ngRoute']);
		
	angular
		.module('informationsModule')

		.controller('personalInformation', personalInformation)
		.filter('greet', greetFilter)
		;
	

	
	personalInformation.$inject = ['$scope'];
	function personalInformation($scope) {
		
		var vm = this;
		console.log('personal informations');
	}

	function greetFilter() {
		return function(name) {
			return 'Hello, ' + name + '!';
		};
	}

})();





