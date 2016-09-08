<div class="row">
    <div class="col-md-10 col-md-offset-1">
		<h2>Makro i posiłki</h2>
		
        <div class="panel-group margintop30">
			<form name="vm.personForm" class="form-horizontal" novalidate>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4>Proporcje makroskładników</h4>
						<p>Wybierz procentowy rozkład makroskładników w <b>{{vm.person.tdee.all}} kcal</b></p>
					</div>
					<div class="panel-body">

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

						<div class="form-group">
							<label class="control-label col-sm-4">Suma makroskładników</label>
							<div class="col-sm-8">
								<div class="col-sm-5 control-value">
									<span class="">{{vm.person.macroSlider.sum}}%</span>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-4"></label>
							<div class="col-sm-8">
								<p class="fontGrayed" ng-if="vm.person.macroSlider.sum != 100 || !vm.person.macroSlider.view">Suma makroskładników musi wynosic 100% a aktualnie wynosi <b>{{vm.person.macroSlider.sum}}%</b>. Proszę popraw ustawienia.</p>
							</div>
						</div>
						
						<div class="form-group" class="am-fade" ng-if="vm.person.macroSlider.sum == 100 && vm.person.macroSlider.view">
														<label class="control-label col-sm-4"></label>
							<div class="col-sm-8">
								  <table class="table table-condensed table-striped">
    <thead>
      <tr>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>Email</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
							</div>

						</div>

					</div>
				</div>
			</form>
		</div>

    </div>
</div>