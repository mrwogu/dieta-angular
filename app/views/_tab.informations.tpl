<h2>Dane personalne</h2>

<p>Postaraj się dokładnie uzupełnić poniższy formularz. <b>Nie zniechęć się dużą ilością pytań.</b> Możesz odnieść wrażenie, że niektóre pytania są nadmiarowe lub powtarzają się, jednak jest to spowodowane połączeniem kilku metod wyznaczania zapotrzebowania kalorycznego na raz.</p>

<div class="panel-group margintop30">
    <form name="vm.personForm" class="form-horizontal" novalidate>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4>Podstawowe dane</h4>
                <p>Posłużą do obliczenia podstawowego zapotrzebowania kalorycznego</p>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="control-label col-sm-4" for="age">Wiek</label>
                    <div class="col-sm-8">
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
                    <label class="control-label col-sm-4" for="weight">Waga</label>
                    <div class="col-sm-8">
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
                    <label class="control-label col-sm-4" for="height">Wzrost</label>
                    <div class="col-sm-8">
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
                    <label class="control-label col-sm-4" for="gander">Płeć</label>
                    <div class="col-sm-8" bs-radio-group>
                        <div class="btn-group" ng-model="vm.person.gander" bs-radio-group>
                            <label class="btn btn-default"><input type="radio" name="gander" value="f" required/>Kobieta</label>
                            <label class="btn btn-default"><input type="radio" name="gander" value="m" required/>Mężczyzna</label>

                        </div>
                        <div ng-messages="vm.personForm.gander.$error" class="input-error am-fade" role="alert" ng-if="vm.personForm.ganer.$touched || vm.personForm.submitted">
                                <div ng-message="required">To pole jest wymagane</div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-4" for="bulid">Typ budowy</label>
                    <div class="col-sm-8" bs-radio-group>
                        <div class="btn-group" ng-model="vm.person.bulid" bs-radio-group data-placement="right" data-type="info" data-animation="am-fade-and-scale" bs-tooltip="'Wybrana wartość ma duży wpływ na ostateczny wynik obliczeń. Zbyt duży poziom tkanki tłuszczowej na brzuchu nie koniecznie oznacza typ budowy endoformika. Wybrana wartość musi być rzetelna'">
                            <label class="btn btn-default"><input type="radio" name="bulid" value="end" required/>Endoformik<br/><small>(+200-400 kcal)</small></label>
                            <label class="btn btn-default"><input type="radio" name="bulid" value="mez" required/>Mezoformik<br/><small>(+400-500 kcal)</small></label>
                            <label class="btn btn-default"><input type="radio" name="bulid" value="ekt" required/>Ektoformik<br/><small>(+700-900 kcal)</small></label>
                        </div>
                        <div ng-messages="vm.personForm.bulid.$error" class="input-error am-fade" role="alert" ng-if="vm.personForm.ganer.$touched || vm.personForm.submitted">
                                <div ng-message="required">To pole jest wymagane</div>
                        </div>		
                        
                        <ul class="clearfix margintop10">
                            <li><b>Endoformik</b> - osoba charakteryzująca się tendencją do tycia, grubymi kościami, dość dużą masą</li>
                            <li><b>Mezoformik</b> - osoba charakteryzująca się względnie normalną (nie odstającą w żadną stronę) budową</li>
                            <li><b>Ektoformik</b> - osoba charakteryzująca się bardzo szczupłą budową, występują problemy z nabieraniem masy</li>
                        </ul>

                    </div>
                </div>
            </div>
            
            <div class="panel-heading">
                <h4>Dane o trybie życia</h4>
                <p>Posłużą do obliczenia kalorii spalonych w codziennych czynnościach</p>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="control-label col-sm-4" for="workType">Tryb pracy</label>
                    <div class="col-sm-8" bs-radio-group>
                        <div class="btn-group" ng-model="vm.person.workType" bs-radio-group>
                            <label class="btn btn-default"><input type="radio" name="workType" value="l" required/>Lekka<br/><small>(umysłowa)</small></label>
                            <label class="btn btn-default"><input type="radio" name="workType" value="n" required/>Średnia<br /><small>(lekka fizyczna)</small></label>
                            <label class="btn btn-default"><input type="radio" name="workType" value="h" required/>Ciężka<br /><small>(ciężka fizyczna)</small></label>
                        </div>
                        <div ng-messages="vm.personForm.workType.$error" class="input-error am-fade" role="alert" ng-if="vm.personForm.workType.$touched || vm.personForm.submitted">
                            <div ng-message="required">To pole jest wymagane</div>
                        </div>
                        
                        <ul class="clearfix margintop10">
                            <li><b>Lekka</b> - praca umysłowa, np. uczeń szkoły, student, programista, sekretarka, księgowa, kierowca itd.</li>
                            <li><b>Średnia</b> - lekka praca fizyczna, np. listonosz, mechanik samochodowy, kelner, sprzedawca, kierowca itd.</li>
                            <li><b>Ciężka</b> - ciężka praca fizyczna, np. praca na budowie, praca w fabryce, noszenie i dźwiganie itd.</li>
                        </ul>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4" for="lifeType">Ogólny współczynnik aktywności</label>
                    <div class="col-sm-8" bs-radio-group>
                        <div data-placement="right" data-type="info" container="body" data-animation="am-fade-and-scale" bs-tooltip="'Wybrana wartość ma duży wpływ na ostateczny wynik obliczeń. Jeżeli masz problem z wyborem wartości, spróbuj oszacować swoją ogólną dzienną aktywność w skali od 1.0 do 2.0 uwzględniając pracę i treningi.'">
                            <rzslider rz-slider-model="vm.person.lifeType"
                                rz-slider-options="{floor: 1, ceil: 2, step: 0.1, precision:1, hideLimitLabels :true, showTicksValues : true }"></rzslider>
                        </div>
                        <div ng-messages="vm.personForm.lifeType.$error" class="input-error am-fade" role="alert" ng-if="vm.personForm.lifeType.$touched || vm.personForm.submitted">
                            <div ng-message="required">To pole jest wymagane</div>
                        </div>
                        
                        <ul class="clearfix margintop10">
                            <li><b>1.0</b> - brak pracy, brak szkoły, brak aktywności fizycznej</li>
                            <li><b>1.2</b> - praca siedząca, brak treningów</li>
                            <li><b>1.4</b> - praca siedząca/szkoła, lekkie treningi 3x w tygodniu</li>
                            <li><b>1.6</b> - lekka praca fizyczna, treningi 3x w tygodniu</li>
                            <li><b>1.8</b> - praca fizyczna treningi 5x w tygodniu</li>
                            <li><b>2.0</b> - ciężka praca fizyczna, treningi 6 razy w tygodniu</li>
                        </ul>
                    </div>
                </div>
                

            </div>
            
            <div class="panel-heading">
                <h4>Dane o treningu</h4>
                <p>Posłużą do obliczenia kalorii spalonych przez dodatkowy trening</p>
            </div>
            <div class="panel-body">

                <div class="form-group">
                    <label class="control-label col-sm-4" for="isGym">Ćwiczenia siłowe</label>
                    <div class="col-sm-8" bs-radio-group>
                        <div class="btn-group" ng-model="vm.person.isGym" bs-radio-group>
                            <label class="btn btn-default"><input type="radio" name="isGym" value="1" required/>Tak</label>
                            <label class="btn btn-default"><input type="radio" name="isGym" value="0" required/>Nie</label>
                        </div>
                        <div ng-messages="vm.personForm.isGym.$error" class="input-error am-fade" role="alert" ng-if="vm.personForm.isGym.$touched || vm.personForm.submitted">
                            <div ng-message="required">To pole jest wymagane</div>
                        </div>
                    </div>
                </div>
                
                <div class="am-fade" ng-if="vm.person.isGym == 1">
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="workoutAmount">Liczba treningów w tygodniu</label>
                        <div class="col-sm-8">
                            <div class="input-group">
                                <input type="number" min="1" max="7" name="workoutAmount" id="workoutAmount" class="form-control" ng-model="vm.person.gym.workoutAmount" required/>
                                <span class="input-group-addon">razy</span>
                            </div>
                            <div ng-messages="vm.personForm.workoutAmount.$error" class="input-error am-fade" role="alert" ng-if="vm.personForm.workoutAmount.$touched || vm.personForm.submitted">
                                <div ng-message="required">To pole jest wymagane</div>
                                <div ng-message="number">Wpisana wartość nie jest liczbą</div>
                                <div ng-message="min">Wpisano zbyt małą wartość</div>
                                <div ng-message="max">Wpisano zbyt dużą wartość</div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="workoutTime">Średni czas treningu</label>
                        <div class="col-sm-8">
                            <div class="input-group">
                                <input type="number" min="10" max="200" name="workoutTime" id="workoutTime" class="form-control" ng-model="vm.person.gym.workoutTime" required/>
                                <span class="input-group-addon">min</span>
                            </div>
                            <div ng-messages="vm.personForm.workoutTime.$error" class="input-error am-fade" role="alert" ng-if="vm.personForm.workoutTime.$touched || vm.personForm.submitted">
                                <div ng-message="required">To pole jest wymagane</div>
                                <div ng-message="number">Wpisana wartość nie jest liczbą</div>
                                <div ng-message="min">Wpisano zbyt małą wartość</div>
                                <div ng-message="max">Wpisano zbyt dużą wartość</div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="workoutIntense">Intensywność treningu</label>
                        <div class="col-sm-8" bs-radio-group>
                            <div class="btn-group" ng-model="vm.person.gym.workoutIntense" bs-radio-group>
                                <label class="btn btn-default"><input type="radio" name="workoutIntense" value="l" required/>Niska<br /><small>(7kcal/min)</small></label>
                                <label class="btn btn-default"><input type="radio" name="workoutIntense" value="n" required/>Średnia<br /><small>(8kcal/min)</small></label>
                                <label class="btn btn-default"><input type="radio" name="workoutIntense" value="h" required/>Wysoka<br /><small>(9kcal/min)</small></label>
                            </div>
                            <div ng-messages="vm.personForm.workoutIntense.$error" class="input-error am-fade" role="alert" ng-if="vm.personForm.workoutIntense.$touched || vm.personForm.submitted">
                                <div ng-message="required">To pole jest wymagane</div>
                            </div>
                        </div>
                    </div>
                </div>

                <hr />
                                    
                <div class="form-group">
                    <label class="control-label col-sm-4" for="isCardio">Ćwiczenia aerobowe</label>
                    <div class="col-sm-8" bs-radio-group>
                        <div class="btn-group" ng-model="vm.person.isCardio" bs-radio-group>
                            <label class="btn btn-default"><input type="radio" name="isCardio" value="1" required/>Tak</label>
                            <label class="btn btn-default"><input type="radio" name="isCardio" value="0" required/>Nie</label>
                        </div>
                        <div ng-messages="vm.personForm.isCardio.$error" class="input-error am-fade" role="alert" ng-if="vm.personForm.isCardio.$touched || vm.personForm.submitted">
                            <div ng-message="required">To pole jest wymagane</div>
                        </div>
                    </div>
                </div>
                
                <div class="am-fade" ng-if="vm.person.isCardio == 1">
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="cardioAmount">Liczba treningów w tygodniu</label>
                        <div class="col-sm-8">
                            <div class="input-group">
                                <input type="number" min="1" max="7" name="cardioAmount" id="cardioAmount" class="form-control" ng-model="vm.person.cardio.cardioAmount" required/>
                                <span class="input-group-addon">razy</span>
                            </div>
                            <div ng-messages="vm.personForm.cardioAmount.$error" class="input-error am-fade" role="alert" ng-if="vm.personForm.cardioAmount.$touched || vm.personForm.submitted">
                                <div ng-message="required">To pole jest wymagane</div>
                                <div ng-message="number">Wpisana wartość nie jest liczbą</div>
                                <div ng-message="min">Wpisano zbyt małą wartość</div>
                                <div ng-message="max">Wpisano zbyt dużą wartość</div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="cardioTime">Średni czas treningu</label>
                        <div class="col-sm-8">
                            <div class="input-group">
                                <input type="number" min="10" max="200" name="cardioTime" id="cardioTime" class="form-control" ng-model="vm.person.cardio.cardioTime" required/>
                                <span class="input-group-addon">min</span>
                            </div>
                            <div ng-messages="vm.personForm.cardioTime.$error" class="input-error am-fade" role="alert" ng-if="vm.personForm.cardioTime.$touched || vm.personForm.submitted">
                                <div ng-message="required">To pole jest wymagane</div>
                                <div ng-message="number">Wpisana wartość nie jest liczbą</div>
                                <div ng-message="min">Wpisano zbyt małą wartość</div>
                                <div ng-message="max">Wpisano zbyt dużą wartość</div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="cardioIntense">Intensywność treningu</label>
                        <div class="col-sm-8" bs-radio-group>
                            <div class="btn-group" ng-model="vm.person.cardio.cardioIntense" bs-radio-group>
                                <label class="btn btn-default"><input type="radio" name="cardioIntense" value="l" required/>Niska<br /><small>(6kcal/min)</small></label>
                                <label class="btn btn-default"><input type="radio" name="cardioIntense" value="n" required/>Średnia<br /><small>(8kcal/min)</small></label>
                                <label class="btn btn-default"><input type="radio" name="cardioIntense" value="h" required/>Bardzo wysoka<br /><small>(10kcal/min)</small></label>
                            </div>
                            <div ng-messages="vm.personForm.cardioIntense.$error" class="input-error am-fade" role="alert" ng-if="vm.personForm.cardioIntense.$touched || vm.personForm.submitted">
                                <div ng-message="required">To pole jest wymagane</div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>	
            <div class="panel-heading">
                <h4>Straty termiczne pokarmu</h4>
                <p>Dane posłużą do obliczenia strat w przyrządzanych pokarmach</p>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="control-label col-sm-4" for="foodType">Spożywane jedzenie</label>
                    <div class="col-sm-8" bs-radio-group>
                        <div class="btn-group" ng-model="vm.person.foodType" bs-radio-group data-trigger='mouseover'>
                            <label class="btn btn-default"><input draggable="true" type="radio" name="foodType" value="l" required/>Naturalne<br/><small>(+6% kcal)</small></label>
                            <label class="btn btn-default"><input draggable="true" type="radio" name="foodType" value="n" required/>Zbliansowane<br /><small>(+8% kcal)</small></label>
                            <label class="btn btn-default"><input draggable="true" type="radio" name="foodType" value="h" required/>Przetworzone<br /><small>(+10% kcal)</small></label>
                        </div>
                        <div ng-messages="vm.personForm.foodType.$error" class="input-error am-fade" role="alert" ng-if="vm.personForm.foodType.$touched || vm.personForm.submitted">
                            <div ng-message="required">To pole jest wymagane</div>
                        </div>
                        
                        <ul class="clearfix margintop10">
                            <li><b>Naturalne</b> - duża ilość naturalych produków (jajka, twarogi), poddanych jak najmniejszej obróbce cieplnej</li>
                            <li><b>Zbliansowane</b> - dieta zbilansowana, np. naturalne śniadania oraz przetworzone cieplnie obiady</li>
                            <li><b>Przetworzone</b> - bardzo duża ilość gotowanych i smażonych produktów z dużą stratą termiczną</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="panel-heading">
                <h4>Cel diety</h4>
                <p>Dane posłużą do korekcji ostatecznego dziennego zapotrzebowania kalorycznego</p>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="control-label col-sm-4" for="target">Cel diety</label>
                    <div class="col-sm-8" bs-radio-group>
                        <div class="btn-group" ng-model="vm.person.target"  bs-radio-group>
                            <label class="btn btn-default"><input ng-change="vm.dietTargetChange()" draggable="true" type="radio" name="target" value="i" required/>Zdobywanie masy</label>
                            <label class="btn btn-default"><input ng-change="vm.dietTargetChange()" draggable="true" type="radio" name="target" value="n" required/>Utrzymanie wagi</label>
                            <label class="btn btn-default"><input ng-change="vm.dietTargetChange()" draggable="true" type="radio" name="target" value="d" required/>Redukcja wagi</label>
                        </div>
                        <div ng-messages="vm.personForm.target.$error" class="input-error am-fade" role="alert" ng-if="vm.personForm.target.$touched || vm.personForm.submitted">
                            <div ng-message="required">To pole jest wymagane</div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4" for="differental">Różnica kalorii</label>
                    <div class="col-sm-8">
                        <div class="input-group">
                            <input type="number" min="-3000" max="3000" class="form-control inputHighlight" name="differental" id="differental" ng-model="vm.person.differental" required/>
                            <span class="input-group-addon">kcal</span>
                        </div>
                        <div ng-messages="vm.personForm.differental.$error" class="input-error am-fade" role="alert" ng-if="vm.personForm.differental.$touched || vm.personForm.submitted">
                            <div ng-message="required">To pole jest wymagane</div>
                            <div ng-message="number">Wpisana wartość nie jest liczbą</div>
                            <div ng-message="min">Wpisano zbyt małą wartość</div>
                            <div ng-message="max">Wpisano zbyt dużą wartość</div>
                        </div>
                        <p class="clearfix margintop10">Różnica kalorii powinna być dodatnia lub ujemna w zależności od celu diety. Wartość należy systematycznie zwiększać lub pomniejszać w danych odstępach czasu w przypadku braku efektów lub w przypadku kontynuowania diety. Przykładowo podczas redukcji obcinać po 200 kalorii co 3 tygodnie.</p>
                    </div>
                </div>

            </div>
        </div>
    </form>
</div>