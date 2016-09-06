<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <div class="panel-group" ng-show="!vm.person.bmr">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Uzupełnij dane personalne</h4>
                    <p>Posłużą one do obliczenia zapotrzebowania kalorycznego</p>
                </div>
                <div class="panel-body">
                    <form name="vm.personForm" class="form-horizontal" novalidate>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="age">Wiek</label>
                            <div class="col-sm-9">
                                <div class="input-group">
                                    <input type="number" min="9" max="100" class="form-control" name="age" id="age" ng-model="vm.person.age" required/>
                                    <span class="input-group-addon">lat</span>
                                </div>
                                <div ng-messages="vm.personForm.age.$error" class="input-error am-fade" role="alert" ng-if="vm.personForm.age.$touched || vm.personForm.submitted">
                                    <div ng-message="required">To pole jest wymagane</div>
                                    <div ng-message="number">Wpisana wartość nie jest liczbą</div>
                                    <div ng-message="min">Wpisano zbyt małą wartość</div>
                                    <div ng-message="max">Wpisano zbyt dużą wartość</div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="weight">Waga</label>
                            <div class="col-sm-9">
                                <div class="input-group">
                                    <input type="number" min="35" max="250" class="form-control" name="weight" id="weight" ng-model="vm.person.weight" required/>
                                    <span class="input-group-addon">kg</span>
                                </div>
                                <div ng-messages="vm.personForm.weight.$error" class="input-error am-fade" role="alert" ng-if="vm.personForm.weight.$touched || vm.personForm.submitted">
                                    <div ng-message="required">To pole jest wymagane</div>
                                    <div ng-message="number">Wpisana wartość nie jest liczbą</div>
                                    <div ng-message="min">Wpisano zbyt małą wartość</div>
                                    <div ng-message="max">Wpisano zbyt dużą wartość</div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="height">Wzrost</label>
                            <div class="col-sm-9">
                                <div class="input-group">
                                    <input type="number" min="100" max="220" name="height" id="height" class="form-control" ng-model="vm.person.height" required/>
                                    <span class="input-group-addon">cm</span>
                                </div>
                                <div ng-messages="vm.personForm.height.$error" class="input-error am-fade" role="alert" ng-if="vm.personForm.height.$touched || vm.personForm.submitted">
                                    <div ng-message="required">To pole jest wymagane</div>
                                    <div ng-message="number">Wpisana wartość nie jest liczbą</div>
                                    <div ng-message="min">Wpisano zbyt małą wartość</div>
                                    <div ng-message="max">Wpisano zbyt dużą wartość</div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="gander">Płeć</label>
							<div class="col-sm-9" bs-radio-group>
								<div class="btn-group" ng-model="vm.person.gander" bs-radio-group>
									<label class="btn btn-default"><input type="radio" name="gander" value="f" required/>Kobieta</label>
									<label class="btn btn-default"><input type="radio" name="gander" value="m" required/>Mężczyzna</label>

								</div>
								<div ng-messages="vm.personForm.gander.$error" class="input-error am-fade" role="alert" ng-if="vm.personForm.ganer.$touched || vm.personForm.submitted">
										<div ng-message="required">To pole jest wymagane</div>
								</div>
							</div>
                        </div>

                        <hr />

                        <div class="col-sm-6 col-sm-offset-3">
                            <button class="btn btn-success" ng-click="vm.submit()">Oblicz zapotrzebowanie kaloryczne</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
		
       <div class="well am-fade" ng-show="vm.person.bmr">
			<div class="form-horizontal">
				<h4>Zapotrzebowanie kaloryczne <button class="btn btn-default pull-right" ng-click="vm.clear()">Edytuj</button></h4>
				<p>
					<span ng-if="vm.person.gander == 'f'"><b>Kobieta</b></span>
					<span ng-if="vm.person.gander == 'm'"><b>Mężczyzna</b></span>
					w wieku <b>{{vm.person.age}} lat</b> przy wzroście <b>{{vm.person.height}} cm</b> i wadze <b>{{vm.person.weight}} kg</b>:
				</p>
				
				<hr />
					
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
				
				<br />
				
				<div class="form-group">
					<label data-placement="top" data-type="info" data-animation="am-fade-and-scale" bs-tooltip="'Jest to wartość średnia wyliczona na podstawie trzech najbardziej popularnych metod liczenia BMR'" class="control-label col-sm-7 font105" for="weight"><i class="fa fa-question-circle"></i> Podstawowe zapotrzebowanie kaloryczne (BMR)</label>
					<div class="col-sm-5 control-value font105">
						<span><b>{{vm.person.bmr.average}} kcal</b></span>
					</div>
				</div>
			</div>
		</div>
		
    </div>
</div>