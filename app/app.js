(function() {
	'use strict';
	
	var appDieta = angular.module('appDieta', [
		'ngRoute',
		'ngAnimate',
		'informationsModule',
		'mgcrea.ngStrap',
		'ngSanitize'
	]);
	
	angular
		.module('appDieta')
		.controller('appCtrl', appCtrl)
		.config(appConfig)
		.value('appName', 'Kalkulator dietetyczny')
		.value('appVersion', '1.0.0')
		;
	
	appConfig.$inject = ['$routeProvider'];
	function appConfig($routeProvider) {
		
		var dirPrefix = "app/views/"
					
		$routeProvider
			.when("/", {
				controller: 'personalInformationCtrl',
				controllerAs: 'vm',
				templateUrl : dirPrefix + 'informations/personal-informations.tpl'
			})
	}
	
	appCtrl.$inject = ['appName', 'appVersion'];
	function appCtrl(appName, appVersion) {
		
		var vm = this;

		vm.appName = appName;
		vm.appVersion = appVersion;
	}

})();





