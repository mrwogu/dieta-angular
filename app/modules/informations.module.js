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
	
	personalInformationCtrl.$inject = ['$scope', 'bmrService', 'tdeeService', '$localStorage'];
	function personalInformationCtrl($scope, bmrService, tdeeService, $localStorage) {
		
		var vm = this;
		vm.localStorage = $localStorage;
		
		vm.person = vm.localStorage.personForm;

		$scope.$watch('vm.person', function(){
			if (typeof vm.person == "object" && Object.keys(vm.person).length)
				vm.localStorage.personForm = vm.person;
		}, true);

		if (typeof vm.localStorage.person == "object")
			vm.person = vm.localStorage.person;
		
		vm.submit = function() {
			
			vm.personForm.submitted = true;
						
			if (!vm.personForm.$invalid) {

				vm.person.bmr = bmrService.getBmr(vm.person);
				vm.person.tdee = tdeeService.getTdee(vm.person);
				
				console.log(vm.person.tdee);

				//vm.localStorage.person = vm.person;
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
			//delete vm.localStorage.personForm;
			vm.person.bmr = undefined;
		}
		
	}

	function greetFilter() {
		return function(name) {
			return 'Hello, ' + name + '!';
		};
	}

})();





