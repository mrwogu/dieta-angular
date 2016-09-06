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
	
	appCtrl.$inject = ['appVersion'];
	function appCtrl(appVersion) {
		
		var vm = this;

		vm.appVersion = appVersion;
	}

})();





