(function() {
	'use strict';
	
	var caloricIntakeModule = angular.module('caloricIntakeModule', [
		'ngRoute', 
		'ngMessages', 
		'ngAnimate',
		'rzModule',
		'ngStorage',
		'mgcrea.ngStrap',
		'ngSanitize',
		'calculationsModule'
	]);
		
	angular
		.module('caloricIntakeModule')
		.controller('caloricIntakeCtrl', caloricIntakeCtrl)
		;
	
	caloricIntakeCtrl.$inject = ['$scope', 'bmrService', 'tdeeService', '$localStorage', '$location'];
	function caloricIntakeCtrl($scope, bmrService, tdeeService, $localStorage, $location) {
		
		/* public */
		
		var vm = this;

		vm.localStorage = $localStorage;	

		vm.person = vm.localStorage.person;

		vm.clearSummary = function() {
			vm.person.bmr = undefined;
			vm.person.tdee = undefined;

			$location.path("/dane-personalne");
		}
		
	}

})();





