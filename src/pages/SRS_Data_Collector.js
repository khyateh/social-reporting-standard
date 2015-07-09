<!-- Name your application -->
var myapp = angular.module("SRSDataCollector", ["ngRoute", "textAngular",
  "ngSanitize"
]);


<!-- Define Controller  -->
var contrl = myapp.controller("contrl", function($scope, $location, $sce,
  $interval, $window) {
  $scope.currentPage = 0;
  $scope.reportName = "";
  $scope.reportDesc = "";
  $scope.reportId = $location.absUrl().split('ReportId=')[1].split('#')[0];
  $scope.pagedItems = "";
  $scope.templateName = "";


  $scope.getActive = function(index) {
    if (index == '1')
      return ' active';
  };

  $scope.getActiveTab = function(index) {
    if (index == '1')
      return ' in active';
  };


  $scope.getQuestions = function() {
    kh_srs.SRS_Data_Controller.getAllQuestions(
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
          alert(event.message);
        }
      }, {
        escape: false
      });
  };

  $scope.saveReport = function() {

    var sJson = angular.toJson($scope.items);
    kh_srs.SRS_Data_Controller.saveAnswers(sJson, $scope.reportName,
      $scope.reportId, $scope.reportDesc,
      function(result, event) {
        if (event.status) {
          console.log("Report saved");
          $scope.alertMe("Report saved");
        } else if (event.type == "exception") {
          $scope.alertMe(event.message);
        }
      }
    )
  };

  $scope.range = function(start, end) {
    var ret = [];
    if (!end) {
      end = start;
      start = 0;
    }
    for (var i = start; i < end; i++) {
      ret.push(i);
    }
    return ret;
  };

  $scope.prevPage = function(id) {
    var nextId = id - 1;
    if (nextId >= 1) {
      $('#btnNext').disabled = false;
      $('[href=#' + nextId + ']').tab('show');
    } else {
      $('#btnPrev').disabled = true;
    }
  };

  $scope.nextPage = function(id) {
    //    $scope.saveReport();
    var nextId = id + 1;
    if (nextId <= $scope.items.length) {
      $('#btnPrev').disabled = false;
      $('[href=#' + nextId + ']').tab('show');
    } else {
      $('#btnNext').disabled = true;
      //$('#btnViewReport').style.visibility = 'visible';
    }
  };

  $scope.viewReport = function() {
    $window.location.href = "/apex/ViewSRSReport?ReportId=" + $scope.reportId;
  };

  $scope.decode = function(html) {
    var txt = document.activeElement();
    txt.innerHTML = html;
    return txt.value;
  };

  $scope.alertMe = function(msg) {
    console.log($("#msgBox"));
    document.getElementById("msgBox").innerHTML = msg;
    $("#msgBoxContainer").show();

  };


  $scope.getQuestions();
  $("#msgBoxContainer").hide();

  var autoSave = $interval($scope.saveReport, 120000);

});



myapp.filter('unsafe', function($sce) {
  return function(val) {
    val = $sce.trustAsHtml(val);
    alert(val);
    return val;
  };
});