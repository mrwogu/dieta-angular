(function() {
	'use strict';
	
	var calculationsModule = angular.module('calculationsModule', []);

	angular
		.module('calculationsModule')
		.service('bmrService', bmrService)
	;
	
	bmrService.$inject = [];
	function bmrService() {
		
		/* public */
		
		this.getBmr = function(age, weight, height, gander) {
			
			var bmrInformations = {
				harrisBenedict1: parseInt(harrisBenedict1(age, weight, height, gander)),
				harrisBenedict2: parseInt(harrisBenedict2(age, weight, height, gander)),
				hifflinStJeor: parseInt(hifflinStJeor(age, weight, height, gander))
			}
			
			bmrInformations.average = (parseInt(
				parseInt(bmrInformations.harrisBenedict1) + 
				parseInt(bmrInformations.harrisBenedict2) + 
				parseInt(bmrInformations.hifflinStJeor)
				) / 3).toFixed(0);
			
			return bmrInformations;
		}
		
		/* private */
		
		var harrisBenedict1 = function(age, weight, height, gander) {
			
			var bmr;
			
			console.log(age);
			console.log(weight);
			console.log(height);
			console.log(gander);
			if (gander == 'm')
				bmr = ( 13.7516 * weight ) + ( 5.0033 * height ) - ( 6.7550 * age) + 66.4730;
			else if (gander == 'f')
				bmr = ( 9.5634 * weight ) + ( 1.8496 * height ) - ( 4.6756 * age) + 655.0955;
			
			return bmr.toFixed(0);
		}
		
		var harrisBenedict2 = function(age, weight, height, gander) {
			
			var bmr;
			
			if (gander == 'm')
				bmr = ( 13.397 * weight ) + ( 4.799 * height ) - ( 5.677 * age) + 88.362;
			else if (gander == 'f')
				bmr = ( 9.247 * weight ) + ( 3.098 * height ) - ( 4.330 * age) + 447.593;
			
			return bmr.toFixed(0);
		}
		
		var hifflinStJeor = function(age, weight, height, gander) {
			
			var bmr = ( 10 * weight ) + ( 6.25 * height ) - ( 5 * age);
			
			if (gander == 'm')
				bmr += 5;
			else if (gander == 'f')
				bmr -= 161;
			
			return bmr.toFixed(0);
		}

	}
	
})();





