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
		'calculationsModule'
	]);
		
	angular
		.module('macroModule')
		.controller('macroCtrl', macroCtrl)
		;
	
	macroCtrl.$inject = ['$scope', 'bmrService', 'tdeeService', '$localStorage', '$location'];
	function macroCtrl($scope, bmrService, tdeeService, $localStorage, $location) {
		
		/* public */
		
		var vm = this;

		vm.localStorage = $localStorage;	

		vm.person = vm.localStorage.person;

	}

})();





