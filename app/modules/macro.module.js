(function() {
	'use strict';
	
	var macroModule = angular.module('macroModule', [
		'ngRoute', 
		'ngMessages', 
		'ngAnimate',
		'rzModule',
		'ngStorage',
		'mgcrea.ngStrap',
		'ngSanitize',
		'calculationsModule',
		'chart.js'
	]);
		
	angular
		.module('macroModule')
		.controller('macroCtrl', macroCtrl)
		;
	
	macroCtrl.$inject = ['$scope', 'bmrService', 'tdeeService', '$localStorage', '$location', '$timeout'];
	function macroCtrl($scope, bmrService, tdeeService, $localStorage, $location, $timeout) {
		
		/* public */
		
		var vm = this;

		vm.localStorage = $localStorage;
		vm.person = vm.localStorage.person;

		if (typeof vm.person.macroSlider == "undefined") {
			vm.person.macroSlider = {
				proteins: 30,
				carbons: 50,
				fats: 20
			};
			vm.person.macro = {
				proteins: 30,
				carbons: 50,
				fats: 20
			};
		}

		//przerobic na ng change
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


		vm.labels = ["Białko", "Węglowodany", "Tłuszcze"];

		$scope.$watch('vm.person.macroSlider.proteins', function() {
			_macroSumAll();
		});

		$scope.$watch('vm.person.macroSlider.carbons', function() {
			_macroSumAll();
		});

		$scope.$watch('vm.person.macroSlider.fats', function() {
			_macroSumAll();
		});

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

	}

})();





