(function() {
	'use strict';
	
	var appDieta = angular.module('appDieta', [
		'ngMaterial', 
		'ngRoute',
		'informationsModule'
	]);
	
	angular
		.module('appDieta')
		.controller('appController', appController)
		.config(appConfig)
		.value('appName', 'Kalkulator dietetyczny')
		.value('appVersion', '1.0.0')
		;
	
	appConfig.$inject = ['$mdThemingProvider', '$routeProvider'];
	function appConfig($mdThemingProvider, $routeProvider) {
		
		var dirPrefix = "app/views/"
		
		$mdThemingProvider.theme('default')
			.primaryPalette('indigo')
			.accentPalette('orange');
					
		$routeProvider
			.when("/dane-personalne", {
				controller: 'personalInformation',
				templateUrl : dirPrefix + 'informations/personal-informations.tpl'
			})
			.when("/", {
				controller: 'appController',
				templateUrl : dirPrefix + 'app/app.tpl'
			})
	}
	
	appController.$inject = ['appName', 'appVersion'];
	function appController(appName, appVersion) {
		
		var vm = this;

		vm.appName = appName;
		vm.appVersion = appVersion;
	}

})();





