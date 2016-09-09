<div class="row">
    <div class="col-md-10 col-md-offset-1">

		<div bs-active-pane="vm.options.activeTab" bs-tabs>
			<div ng-repeat="tab in vm.tabs" data-title="{{ tab.title }}" disabled="{{ tab.disabled }}" bs-pane>
				<div ng-include src="tab.template"></div>
			</div>
		</div>
	
		<div class="col-sm-12 margintop10">
			<button class="btn btn-default pull-left" ng-click="vm.clear()"><i class="fa fa-times" aria-hidden="true"></i> Wyczyść formularz</button>
			<button class="btn btn-success pull-right" ng-click="vm.submit()"><i class="fa fa-check" aria-hidden="true"></i> Oblicz zapotrzebowanie kaloryczne</button>
		</div>

	</div>

</div>