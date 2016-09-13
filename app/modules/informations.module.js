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
	
	personalInformationCtrl.$inject = ['$scope', 'bmrService', 'tdeeService','macroService', '$localStorage', '$location', '$timeout'];
	function personalInformationCtrl($scope, bmrService, tdeeService, macroService, $localStorage, $location, $timeout) {
		
		/* private */
		
		var _defaultPerson = {
			bulid: 'mez',
			foodType: 'n',
			lifeType: '1.4',
			macroSlider: {
				proteins: 30,
				carbons: 50,
				fats: 20,
				sum: 100
			},
			macroPerson: {
				proteins: {},
				carbons: {},
				fats: {}
			},
			mealsAmount: 4,
			macroMeals: []
		}

		var _calculateMacroPerson = function() {
			vm.person.macroSlider.sum = macroService.sumSliderMacro(vm.person.macroSlider);

			if (vm.person.macroSlider.sum == 100) {
				$timeout(function() {
					
					vm.person.macroSlider.error = false;
					if (vm.personForm && !vm.personForm.$invalid) {
						vm.person.macroPerson = macroService.calculatePersonMacro(vm.person);
						vm.mealsAmountChange();
					}


				}, 1000);
			}
			else {
				vm.person.macroSlider.error = true;
			}
		}

		/* public */
		
		var vm = this;

		vm.options = {};
		vm.localStorage = $localStorage;

		// load model from localStorage at starting
		if (typeof vm.localStorage.person == "object")
			// prevent previous version of person in localStorage
			vm.person = angular.merge({}, _defaultPerson, vm.localStorage.person);
		else {
			vm.person = vm.localStorage.person = angular.copy(_defaultPerson);
		}
		
		
		vm.submit = function() {
			vm.personForm.submitted = true;
			if (!vm.personForm.$invalid) {

				vm.person.bmr = bmrService.getBmr(vm.person);
				vm.person.tdee = tdeeService.getTdee(vm.person);
				_calculateMacroPerson();
				vm.mealsAmountChange();
			} 
		}
				
		vm.clear = function() {
			vm.person = vm.localStorage.person = angular.copy(_defaultPerson);
			vm.options = {};
		}

		vm.macroSlierOptions = {
			floor: 0, 
			ceil: 100, 
			step: 1, 
			precision:0, 
			boundPointerLabels :false,
			hideLimitLabels :true,
			showTicks: 10,
			translate: function(value) {
				return value + "%";
			}
		};

		// $watch functions ------------------------------------------

		// auto reload bmr and tdee if any changes occured
		$scope.$watch('vm.person', function() {
			if (vm.personForm && !vm.personForm.$invalid && vm.personForm.$dirty) {

				vm.person.bmr = bmrService.getBmr(vm.person);
				vm.person.tdee = tdeeService.getTdee(vm.person);
				_calculateMacroPerson();
				vm.mealsAmountChange();
			}
		}, true);

		$scope.$watch('vm.person.macroSlider.proteins', function() {
			_calculateMacroPerson();
		});

		$scope.$watch('vm.person.macroSlider.carbons', function() {
			_calculateMacroPerson();
		});

		$scope.$watch('vm.person.macroSlider.fats', function() {
			_calculateMacroPerson();
		});

		//## ngChange functions ------------------------------------------

		vm.dietTargetChange = function() {
			if (vm.person.target == "i")
				vm.person.differental = 300;
			else if (vm.person.target == "n")
				vm.person.differental = 0;
			else if (vm.person.target == "d")
				vm.person.differental = -300;
		}

		vm.mealsAmountChange = function() {
			if (vm.personForm && !vm.personForm.$invalid) {
				vm.person.macroMeals = macroService.setMeals(vm.person);
			}
		}
	}

	function greetFilter() {
		return function(name) {
			return 'Hello, ' + name + '!';
		};
	}

})();





