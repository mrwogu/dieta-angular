<div class="row">
    <div class="col-md-8 col-md-offset-2">
        <div class="panel-group">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>Uzupełnij dane personalne</h4>
                    <p>Posłużą one do obliczenia zapotrzebowania kalorycznego</p>
                </div>
                <div class="panel-body">
                    <form name="vm.personForm" class="form-horizontal" novalidate>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="age">Wiek</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <input type="number" min="10" max="100" class="form-control" name="age" id="age" ng-model="vm.person.age" required/>
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
                            <label class="control-label col-sm-2" for="weight">Waga</label>
                            <div class="col-sm-10">
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
                            <label class="control-label col-sm-2" for="height">Wzrost</label>
                            <div class="col-sm-10">
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
                            <label class="control-label col-sm-2" for="ganer">Płeć</label>
                            <div class="col-sm-10">
                                <div class="radio">
                                    <label><input type="radio" name="ganer" value="m" ng-model="vm.person.gander" required/>Kobieta</label>
                                </div>
                                <div class="radio">
                                    <label><input type="radio" name="ganer" value="f" ng-model="vm.person.gander" required/>Mężczyzna</label>
                                </div>
                                <div ng-messages="vm.personForm.ganer.$error" class="input-error am-fade" role="alert" ng-if="vm.personForm.ganer.$touched || vm.personForm.submitted">
                                    <div ng-message="required">To pole jest wymagane</div>
                                </div>
                            </div>
                        </div>

                        <hr />

                        <div class="col-sm-8 col-sm-offset-2">
                            <button class="btn btn-default" ng-click="vm.submit()">Oblicz zapotrzebowanie kaloryczne</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>