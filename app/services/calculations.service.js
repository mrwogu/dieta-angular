(function() {
	'use strict';
	
	var calculationsModule = angular.module('calculationsModule', []);

	angular
		.module('calculationsModule')
		.service('bmrService', bmrService)
		.service('tdeeService', tdeeService)
	;
	
	tdeeService.$inject = [];
	function tdeeService() {

		/* public */

		this.getTdee = function(person) {
			
			//tdee1
			var tdeeHarrisBenedict = harrisBenedict(person.bmr.harrisBenedict1, person.bmr.harrisBenedict2, person.lifeType);
			
			//tdee2
			//tea
			
			var teaGym = 0;
			var teaCardio = 0;

			if (person.isGym) {
				var gymIntense = teaGymIntenseConfig[person.gym.workoutIntense];
				teaGym = (parseInt(person.gym.workoutAmount) * parseInt(person.gym.workoutTime) * parseInt(gymIntense)) / 7;
			}
				
			
			if (person.isCardio) {
				var cardioIntense = teaCardioIntenseConfig[person.cardio.cardioIntense];
				teaCardio = (parseInt(person.cardio.cardioAmount) * parseInt(person.cardio.cardioTime) * parseInt(cardioIntense)) / 7;
			}

			var tea = parseFloat(teaGym) + parseFloat(teaCardio);

			//epoc
			var epoc = 0;

			if (person.isGym) {
				var gymIntense = epocGymIntenseConfig[person.gym.workoutIntense];
				var gymEpoc = ((parseInt(gymIntense) * parseInt(person.bmr.hifflinStJeor))/100);
				gymEpoc = (parseFloat(gymEpoc) * parseInt(person.gym.workoutAmount) / 7);

				epoc += gymEpoc;
			}

			if (person.isCardio) {
				var cardioIntense = epocCardioIntenseConfig[person.cardio.cardioIntense];
				var cardioEpoc = (parseInt(cardioIntense) * parseInt(person.cardio.cardioAmount)) / 7;
				
				epoc += cardioEpoc;
			}
			
			//neat
			var neat = neatConfig[person.bulid][person.workType];

			//tef
			var tef = tefConfig[person.foodType]

			var tdeeHifflinStJeor = hifflinStJeor(person.bmr.hifflinStJeor, tea, epoc, tef, neat);

			return {
				harrisBenedict: parseFloat(tdeeHarrisBenedict).toFixed(0),
				hifflinStJeor: parseFloat(tdeeHifflinStJeor).toFixed(0),
				//average: ((parseFloat(tdeeHarrisBenedict) + parseFloat(tdeeHifflinStJeor))/2).toFixed(0)
				average: parseFloat(tdeeHifflinStJeor).toFixed(0),
			}
		}

		/* private */

		var tefConfig = {
			"l": 0.06,
			"n": 0.08,
			"h": 0.10,
		}

		var teaGymIntenseConfig = {
			"l": 7,
			"n": 8,
			"h": 9,
		}

		var teaCardioIntenseConfig = {
			"l": 6,
			"n": 8,
			"h": 10,
		}

		var epocGymIntenseConfig = {
			"l": 4,
			"n": 5.5,
			"h": 7,
		}

		var epocCardioIntenseConfig = {
			"l": 5,
			"n": 35,
			"h": 180,
		}

		var neatConfig = {
			"end" : {
				"l": 200,
				"n": 300,
				"h": 400
			},
			"mez" : {
				"l": 400,
				"n": 450,
				"h": 500
			},
			"ekt" : {
				"l": 700,
				"n": 800,
				"h": 900
			}
		}

		var harrisBenedict = function(harrisBenedictBmr1, harrisBenedictBmr2, activityRate) {

			var tdee = parseInt(( parseInt(harrisBenedictBmr1) + parseInt(harrisBenedictBmr2)) / 2 );
			return tdee*parseFloat(activityRate);

		}

		var hifflinStJeor = function(bmr, tea, epoc, tef, neat) {

			var tdee = parseFloat(bmr) + parseFloat(tea) + parseFloat(epoc) + parseFloat(neat);
			tdee = parseFloat(tdee) + (parseFloat(tef) * parseFloat(tdee));
			return tdee;
			
		}
	}

	bmrService.$inject = [];
	function bmrService() {
		
		/* public */
		
		this.getBmr = function(person) {
			
			var bmrInformations = {
				harrisBenedict1: parseInt(harrisBenedict1(person.age, person.weight, person.height, person.gander)),
				harrisBenedict2: parseInt(harrisBenedict2(person.age, person.weight, person.height, person.gander)),
				hifflinStJeor: parseInt(hifflinStJeor(person.age, person.weight, person.height, person.gander))
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





