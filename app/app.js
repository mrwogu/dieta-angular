(function() {
	'use strict';
	
	var appDieta = angular.module('appDieta', [
		'ngRoute',
		'ngAnimate',
		'mgcrea.ngStrap',
		'ngSanitize',
		'ngStorage',
		'informationsModule',
		'caloricIntakeModule',
		'macroModule',
	]);
	
	angular
		.module('appDieta')
		.controller('appCtrl', appCtrl)
		.config(appConfig)
		.value('appVersion', '1.0.0')
		;
	
	appConfig.$inject = ['$routeProvider'];
	function appConfig($routeProvider) {
		
		var dirPrefix = "app/views/"
					
		$routeProvider
			.when("/", {
				controller: 'appCtrl',
				controllerAs: 'vm',
				templateUrl : dirPrefix + 'app.tpl'
			})
			.when("/dane-personalne", {
				controller: 'personalInformationCtrl',
				controllerAs: 'vm',
				templateUrl : dirPrefix + 'personal-informations.tpl'
			})
			.when("/zapotrzebowanie-kaloryczne", {
				controller: 'caloricIntakeCtrl',
				controllerAs: 'vm',
				templateUrl : dirPrefix + 'caloric-intake.tpl'
			})
			.when("/makro-i-posilki", {
				controller: 'macroCtrl',
				controllerAs: 'vm',
				templateUrl : dirPrefix + 'macro.tpl'
			})
	}
	
	appCtrl.$inject = ['appVersion', '$location', '$localStorage'];
	function appCtrl(appVersion, $location, $localStorage) {
		
		var vm = this;

		vm.isActiveMenu = function(path) {
			return ($location.path().substr(0, path.length) === path) ? true : false;
		}

		vm.appVersion = appVersion;
	}

})();





