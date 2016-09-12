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
	
	personalInformationCtrl.$inject = ['$scope', 'bmrService', 'tdeeService', '$localStorage', '$location', '$timeout'];
	function personalInformationCtrl($scope, bmrService, tdeeService, $localStorage, $location, $timeout) {
		
		/* private */
		
		var _defaultPerson = {
			bulid: 'mez',
			foodType: 'n',
			lifeType: '1.4',
			macroSlider: {
				proteins: 30,
				carbons: 50,
				fats: 20
			},
			macro: {
				proteins: 30,
				carbons: 50,
				fats: 20
			}
		}

		var _macroSumAll = function() {
			vm.person.macroSlider.sum = parseInt(vm.person.macroSlider.proteins) +
			parseInt(vm.person.macroSlider.carbons) +
			parseInt(vm.person.macroSlider.fats);

			vm.data = [vm.person.macroSlider.proteins, vm.person.macroSlider.carbons, vm.person.macroSlider.fats];

			if (vm.person.macroSlider.sum == 100)
				$timeout(function() {
					vm.person.macroSlider.view = true;
				}, 1000);
			else 
				vm.person.macroSlider.view = false;
		}

		/* public */
		
		var vm = this;

		vm.options = {};
		vm.options.activeTab = 0;
		vm.localStorage = $localStorage;

		// load model from localStorage at starting
		if (typeof vm.localStorage.person == "object")
			vm.person = vm.localStorage.person;
		else {
			vm.person = vm.localStorage.person = angular.copy(_defaultPerson);
		}
		
		// auto reload bmr and tdee if any changes occured
		$scope.$watch('vm.person', function() {
			if (vm.personForm && !vm.personForm.$invalid) {
				vm.person.bmr = bmrService.getBmr(vm.person);
				vm.person.tdee = tdeeService.getTdee(vm.person);
			}
		}, true);
		
		vm.submit = function() {
			vm.personForm.submitted = true;
			if (!vm.personForm.$invalid) {
				vm.person.bmr = bmrService.getBmr(vm.person);
				vm.person.tdee = tdeeService.getTdee(vm.person);
				
				vm.tabs[1].disable = false;
				vm.options.activeTab = 1;
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
			vm.person = vm.localStorage.person = angular.copy(_defaultPerson);
		}

		vm.macroSlierOptions = {
			floor: 10, 
			ceil: 90, 
			step: 1, 
			precision:0, 
			boundPointerLabels :false,
			hideLimitLabels :true,
			showTicks: 10,
			translate: function(value) {
				return value + "%";
			}
		};

		$scope.$watch('vm.person.macroSlider.proteins', function() {
			_macroSumAll();
		});

		$scope.$watch('vm.person.macroSlider.carbons', function() {
			_macroSumAll();
		});

		$scope.$watch('vm.person.macroSlider.fats', function() {
			_macroSumAll();
		});

		vm.tabs = [
			{
				id: 0,
				title: 'Dane personalne',
				template: 'app/views/_tab.informations.tpl'
			},
			{
				id: 1,
				title: 'Makroskładniki i posiłki',
				template: 'app/views/_tab.macro.tpl',
				//disabled: true
			}
		];
	}

	function greetFilter() {
		return function(name) {
			return 'Hello, ' + name + '!';
		};
	}

})();





