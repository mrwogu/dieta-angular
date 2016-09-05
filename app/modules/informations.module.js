(function() {
	'use strict';
	
	var informationsModule = angular.module('informationsModule', [
		'ngRoute', 
		'ngMessages', 
		'ngAnimate',
		'rzModule',
		'mgcrea.ngStrap',
		'ngSanitize'
	]);
		
	angular
		.module('informationsModule')
		.controller('personalInformationCtrl', personalInformationCtrl)
		.filter('greet', greetFilter)
		;
	
	personalInformationCtrl.$inject = ['$scope'];
	function personalInformationCtrl($scope) {
		
		var vm = this;

		vm.submit = function() {

			console.log(vm.person);
			vm.personForm.submitted = true;
		}
		
	}

	function greetFilter() {
		return function(name) {
			return 'Hello, ' + name + '!';
		};
	}

})();





