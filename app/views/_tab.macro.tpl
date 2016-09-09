		<h2>Makro i posiłki</h2>
		
        <div class="panel-group margintop30">
			<form name="vm.personForm" class="form-horizontal" novalidate>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>Proporcje makroskładników</h4>
						<p>Wybierz procentowy rozkład makroskładników w <b>{{vm.person.tdee.total}} kcal</b></p>
					</div>
					<div class="panel-body">

					<div class="panel-body">
						<div class="form-group">
							<label class="control-label col-sm-4" for="mealsAmount">Ilość posiłków dziennie</label>
							<div class="col-sm-8" bs-radio-group>
								<div class="btn-group" ng-model="vm.person.makro.mealsAmount" bs-radio-group data-placement="right" data-type="info" data-animation="am-fade-and-scale" bs-tooltip="'Wybierz dzienną ilość posiłków jaką chcesz spożywać. Im większa ilość posiłków tym lepiej.'">
									<label class="btn btn-default"><input type="radio" name="mealsAmount" value="3" required/>3<br /><small>posiłki</small></label>
									<label class="btn btn-default"><input type="radio" name="mealsAmount" value="4" required/>4<br /><small>posiłki</small></label>
									<label class="btn btn-default"><input type="radio" name="mealsAmount" value="5" required/>5<br /><small>posiłków</small></label>
									<label class="btn btn-default"><input type="radio" name="mealsAmount" value="6" required/>6<br /><small>posiłków</small></label>
								</div>
								<div ng-messages="vm.personForm.mealsAmount.$error" class="input-error am-fade" role="alert" ng-if="vm.personForm.mealsAmount.$touched || vm.personForm.submitted">
									<div ng-message="required">To pole jest wymagane</div>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-4" for="mealsAmount">Proporcja makroskładników w diecie</label>
							<div class="col-sm-8 control-value">
									<span>
										<dl class="dl-horizontal">
											<dt>węglowodany</dt>
											<dd>{{vm.person.macroSlider.carbons}}%</dd>
											<dt>białko</dt>
											<dd>{{vm.person.macroSlider.proteins}}%</dd>
											<dt>tłuszcze</dt>
											<dd>{{vm.person.macroSlider.fats}}%</dd>
											<div  class="fontRed font11" ng-if="vm.person.macroSlider.sum != 100 || !vm.person.macroSlider.view">
												<hr class="hr-well">
												<dt>suma</dt>
												<dd>{{vm.person.macroSlider.sum}}%</dd>

												<p class="margintop10">(Suma makroskładników musi wynosic 100%. Popraw ustawienia)</p>
											</div>
										</dl>
									</span>
									<p>Możesz zmienić proporcje makroskładników klikając <a href="" ng-click="vm.options.macroSlider=!vm.options.macroSlider">tutaj</a></p>
							</div>
						</div>

						<div ng-if="vm.options.macroSlider" class="am-fade">
							<div class="form-group">
								<label class="control-label col-sm-4">Udział % białka</label>
								<div class="col-sm-8">
									<div class="nestedSlider">
										<rzslider rz-slider-model="vm.person.macroSlider.proteins" rz-slider-options="vm.macroSlierOptions"></rzslider>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4">Udział  % węglowodanów</label>
								<div class="col-sm-8">
									<div class="nestedSlider">
										<rzslider rz-slider-model="vm.person.macroSlider.carbons" rz-slider-options="vm.macroSlierOptions"></rzslider>
									</div>
								</div>
							</div>

							
							<div class="form-group">
								<label class="control-label col-sm-4">Udział % tłuszczy</label>
								<div class="col-sm-8">
									<div class="nestedSlider">
										<rzslider rz-slider-model="vm.person.macroSlider.fats" rz-slider-options="vm.macroSlierOptions"></rzslider>
									</div>
								</div>
							</div>

						</div>

					</div>
				</div>
			</form>
		</div>