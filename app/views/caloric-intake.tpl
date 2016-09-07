<div class="row">
    <div class="col-md-10 col-md-offset-1">
		<h2>Zapotrzebowanie kaloryczne</h2>
		
        <div class="panel-group margintop30">
			<form name="vm.personForm" class="form-horizontal" novalidate>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>Wyliczone zapotrzebowanie</h4>
						<p>
							Dla
							<span ng-if="vm.person.gander == 'f'"><b>kobiety</b></span>
							<span ng-if="vm.person.gander == 'm'"><b>mężczyzny</b></span>
							w wieku <b>{{vm.person.age}} lat</b> o wzroście <b>{{vm.person.height}} cm</b> i wadze <b>{{vm.person.weight}} kg</b>
						</p>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label class="control-label col-sm-7" for="weight">Podstawowe dzienne zapotrzebowanie kaloryczne (BMR)</label>
							<div class="col-sm-5 control-value">
								<span>{{vm.person.bmr.average}} kcal</span><span class="pull-right"><a href="" ng-click="vm.options.bmrDetails=!vm.options.bmrDetails">(szczegóły)</a></span>
							</div>
						</div>

						<div ng-if="vm.options.bmrDetails" class="am-fade">
							<div class="form-group-nomargins font09 fontGrayed">
								<label class="control-label col-sm-7" for="weight">Według wzoru Harrisa-Benedicta</label>
								<div class="col-sm-5 control-value">
									<span>{{vm.person.bmr.harrisBenedict1}} kcal</span>
								</div>
							</div>
							
							<div class="form-group-nomargins font09 fontGrayed">
								<label class="control-label col-sm-7" for="weight">Według ulepszonego wzoru Harrisa-Benedicta</label>
								<div class="col-sm-5 control-value">
									<span>{{vm.person.bmr.harrisBenedict2}} kcal</span>
								</div>
							</div>
							<div class="form-group-nomargins font09 fontGrayed">
								<label class="control-label col-sm-7" for="weight">Według wzoru Mifflina St Jeora</label>
								<div class="col-sm-5 control-value">
									<span>{{vm.person.bmr.hifflinStJeor}} kcal</span>
								</div>
							</div>

							<hr class="hr-well" />

							<div class="form-group-nomargins font09 fontGrayed">
								<label class="control-label col-sm-7" for="weight">Wartość średnia</label>
								<div class="col-sm-5 control-value">
									<span>{{vm.person.bmr.average}} kcal</span>
								</div>
							</div>

						</div>


						<div class="form-group">
							<label class="control-label col-sm-7" for="weight">Dzienne zapotrzebowanie kaloryczne</label>
							<div class="col-sm-5 control-value">
								<span>{{vm.person.tdee.average}} kcal</span><span class="pull-right"><a href="" ng-click="vm.options.tdeeDetails=!vm.options.tdeeDetails">(szczegóły)</a></span>
							</div>
						</div>

						<div ng-if="vm.options.tdeeDetails" class="am-fade">
							<div class="form-group-nomargins font09 fontGrayed">
								<label class="control-label col-sm-7" for="weight">Według wzorów Harrisa-Benedicta</label>
								<div class="col-sm-5 control-value">
									<span>{{vm.person.tdee.harrisBenedict}} kcal</span>
								</div>
							</div>
							<div class="form-group-nomargins font09 fontGrayed">
								<label class="control-label col-sm-7" for="weight">Według wzoru Mifflina St Jeora</label>
								<div class="col-sm-5 control-value">
									<span>{{vm.person.tdee.hifflinStJeor}} kcal</span>
								</div>
							</div>
							
							<hr class="hr-well" />

							<div class="form-group-nomargins font09 fontGrayed">
								<div class="col-md-8 col-md-offset-2 control-value">
									<span>*Wybrana wartość to wynik ze wzoru Mifflina St Jeora. Jest on zależny od wielu zmiennych przez co jest o wiele dokładniejszy. Wzór Harrisa-Benedicta ma zbyt duży rozrzut wartości.</span>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-7" for="weight">Cel diety</label>
							<div class="col-sm-5 control-value">
								<span ng-if="vm.person.differental < 0">Redukcja wagi ( {{vm.person.differental}} kcal )</span>
								<span ng-if="vm.person.differental == 0">Utrzymanie wagi</span>
								<span ng-if="vm.person.differental > 0">Zdobywanie masy ( +{{vm.person.differental}} kcal )</span>
							</div>
						</div>

						<hr class="hr-well-margins" />

						<div class="form-group">
							<label class="control-label col-sm-7 font11 fontHighlight" for="weight">Dzienne zapotrzebowanie uwzględniając cel</label>
							<div class="col-sm-5 control-value font11 fontHighlight">
								<span><b>{{vm.person.tdee.average*1 + vm.person.differental*1}} kcal</b></span>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>

    </div>
</div>