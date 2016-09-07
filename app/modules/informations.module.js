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
	
	personalInformationCtrl.$inject = ['$scope', 'bmrService', 'tdeeService', '$localStorage', '$location'];
	function personalInformationCtrl($scope, bmrService, tdeeService, $localStorage, $location) {
		
		/* public */
		
		var vm = this;
		vm.localStorage = $localStorage;

		// load model from localStorage at starting
		if (typeof vm.localStorage.person == "object")
			vm.person = vm.localStorage.person;
		else
			vm.person = angular.copy(_defaultPerson);
		
		// save model to localStorage if any changes occured
		$scope.$watch('vm.person', function(){
			if (typeof vm.person == "object" && Object.keys(vm.person).length)
				vm.localStorage.person = vm.person;
		}, true);

		vm.submit = function() {
			
			if (!vm.personForm.$invalid) {
				vm.person.bmr = bmrService.getBmr(vm.person);
				vm.person.tdee = tdeeService.getTdee(vm.person);
				
				$location.path("/zapotrzebowanie-kaloryczne");
			}
		}
		
		vm.dietTargetChange = function() {

			if (vm.person.target == "i")
				vm.person.differental = 300;
			else if (vm.person.target == "n")
				vm.person.differental = 0;
			else if (vm.person.target == "d")
				vm.person.differental = -300;
		}
		
		vm.clear = function() {
			delete vm.localStorage.person;
			vm.person = angular.copy(_defaultPerson);
		}
		
		/* private */
		
		var _defaultPerson = {
			bulid: 'mez',
			foodType: 'n',
			lifeType: 1.4
		}
		
		
	}

	function greetFilter() {
		return function(name) {
			return 'Hello, ' + name + '!';
		};
	}

})();





