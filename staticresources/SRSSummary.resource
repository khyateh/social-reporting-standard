<!-- Name your application -->
var myapp = angular.module("SRSReportSummary", ["ngRoute", "ngSanitize"]);


<!-- Define Controller  -->
var contrl = myapp.controller("summary", function($scope, $location, $sce,
  $interval, $window) {
  $scope.currentPage = 0;
  $scope.reportName = "";
  $scope.reportDesc = "";
  $scope.reportId = $location.absUrl().split('ReportId=')[1].split('#')[0];
  $scope.pagedItems = "";
  $scope.templateName = "";
  $scope.ReportSummary = '';

  $scope.getActive = function(index) {
    if (index == '1')
      return ' active';
  };

  $scope.getActiveTab = function(index) {
    if (index == '1')
      return ' in active';
  };


  $scope.getQuestions = function() {
    console.log('ReportId :' + $scope.reportId);
    khsrs.SRS_Data_Controller.getAllQuestions(
      $scope.reportId,
      function(result, event) {
        if (event.status) {
          $scope.items = result;
          $scope.$apply();

          if ($scope.items != null) {
            $scope.pagedItems = $scope.items[$scope.currentPage];
            $scope.$apply();
          }
        } else if (event.type == "exception") {
          console.log(event.message);
        }
      }, {
        escape: false
      });
  };


  $scope.getSummary = function() {
    console.log('Here: ' + $scope.reportId);
    khsrs.SRS_Data_Controller.getSummary(
      $scope.reportId,
      function(result, event) {
        if (event.status) {
          $scope.ReportSummary = result;
          $scope.$apply();
          console.log($scope.ReportSummary);

        } else if (event.type == "exception") {
          console.log(event.message);
        }
      }, {
        escape: false
      });
  };



  $scope.viewReport = function() {
    $window.location.href = "/apex/ViewSRSReport?ReportId=" + $scope.reportId;
  };

  $scope.getSummary();

});
