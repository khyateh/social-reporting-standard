<!-- Name your application -->
var myapp = angular.module("SRSReportGen", ["ngSanitize", "ngRoute", ]);

<!-- Define Controller  -->
var reportController = myapp.controller("reportController", function($scope,
  $location, $sce) {
  $scope.currentPage = 0;
  $scope.reportName = "";
  $scope.reportDesc = "";
  $scope.reportId = "";
  $scope.reportId = $location.absUrl().split('ReportId=')[1];
  $scope.pagedItems = "";
  $scope.report = "";
  $scope.prevSection = "";

  $scope.fetchReport = function() {

    kh_srs.SRS_Data_Controller.fetchReportById($scope.reportId, function(
      result, event) {
      if (event.status) {
        $scope.report = result;
        $scope.$apply();
      } else if (event.type == "exception") {
        alert(event.message);
      }
    });
  };


  $scope.fetchReportDetails = function() {

    kh_srs.SRS_Data_Controller.fetchReportDetails($scope.reportId,
      function(result, event) {
        if (event.status) {
          $scope.items = result;
          $scope.$apply();
        } else if (event.type == "exception") {
          alert(event.message);
        }
      });
  };

  $scope.printPage = function() {
    window.print();
  };

  $scope.fetchReport();
  $scope.fetchReportDetails();

  $scope.decode = function(html) {
    var txt = document.createElement("textarea");
    txt.innerHTML = html;
    return txt.value;
  };

  $scope.getSection = function(section) {
    //Set history section
    console.log(section);
    if ($scope.prevSection == null || $scope.prevSection == '') {
      //Previous section not set;
      $scope.prevSection = section;
      return $scope.prevSection;
    } else {
      if ($scope.prevSection == section) {
        return null;
      } else {
        //Section title has changed
        $scope.prevSection = section;
        return $scope.prevSection;
      }
    }
  };
});
