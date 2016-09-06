(function() {
	'use strict';
	
	var informationsModule = angular.module('informationsModule', [
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
		.module('informationsModule')
		.controller('personalInformationCtrl', personalInformationCtrl)
		.filter('greet', greetFilter)
		;
	
	personalInformationCtrl.$inject = ['$scope', 'bmrService', '$localStorage'];
	function personalInformationCtrl($scope, bmrService, $localStorage) {
		
		var vm = this;
			
		vm.localStorage = $localStorage;
		
		if (typeof vm.localStorage.person == "object")
			vm.person = vm.localStorage.person;
		
		vm.submit = function() {
			
			vm.personForm.submitted = true;
						
			if (!vm.personForm.$invalid) {
				vm.person.bmr = bmrService.getBmr(
					vm.person.age, 
					vm.person.weight, 
					vm.person.height, 
					vm.person.gander
				);
				
				vm.localStorage.person = vm.person;
				
			}
		}
		
		vm.clear = function() {
			delete vm.localStorage.person;
			vm.person = {};
		}
		
	}

	function greetFilter() {
		return function(name) {
			return 'Hello, ' + name + '!';
		};
	}

})();





