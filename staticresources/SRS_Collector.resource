<!-- Name your application -->
var myapp = angular.module("SRSReportSearchApp", ["ngRoute", "ngSanitize"]);

<!-- Define Controller  -->
var reportController = myapp.controller("reportSearchController", function(
  $scope, $location, $sce, $window) {
  $scope.currentPage = 0;
  $scope.reportName = "";
  $scope.reportDesc = "";
  $scope.reportId = "";
  $scope.pagedItems = "";
  $scope.searchString = "";

  $scope.setTemplateId = function(id) {
    $scope.reportId = id;
    console.log('Template applied: ' + $scope.reportId);
  };

  $scope.searchReports = function() {

    khsrs.SRS_Data_Controller.searchReports($scope.searchString,
      function(result, event) {
        $('#login-error').innerHtml = "Hello";
        $('#login-error').show();

        if (event.status) {
          $scope.items = result;
          $scope.$apply();
        } else if (event.type == "exception") {
          showInfo(event.message, true);
        }
      });
  };


  $scope.searchReports();

  $scope.createFromTemplate = function() {
    khsrs.SRS_Data_Controller.createFromTemplate($scope.reportId, $scope
      .reportName, $scope.reportDesc,
      function(result, event) {
        if (event.status) {
          //Redirect to SRS Data Collector
          $scope.items = result;
          $scope.$apply();
          $window.location.href = "/apex/SRS_Data_Collector?ReportId=" +
            result;
        } else if (event.type == "exception") {
          console.log(event.message);
        }
      });
  };

  $scope.decode = function(html) {
    var txt = document.createElement("textarea");
    txt.innerHTML = html;
    return txt.value;
  };
});

function showInfo(msg, isError) {
  alert($("#srsMsg"));
  //var el = document.getElementById("srsMsg");
  $("#srsMsg").innerHTML = "<br/>" + msg + "<br/>";

};

$('.alert .close').on('click', function(e) {
  $(this).parent().hide();
});

$.ready(function() {
  console.log("Loaded")
});
