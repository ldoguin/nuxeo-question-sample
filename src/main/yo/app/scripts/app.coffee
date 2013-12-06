"use strict"
angular.module("nuxeoAngularSampleApp", ['infinite-scroll'])
.value("nxUrl", "/nuxeo/api/v1" )
.factory("nxSession", ["nxSessionFactory","nxUrl",(nxSessionFactory,nxUrl)->
  nxSessionFactory(
    apiRootPath: nxUrl
  )
])
.config ["$routeProvider", ($routeProvider) ->
  $routeProvider
  .when("/questions"
    templateUrl: "views/questions.html"
    controller: "QuestionsCtrl"
  )
  .when("/questions/search/:searchtag"
    templateUrl: "views/questions.html"
    controller: "QuestionsCtrl"
  )
  .when("/questions/:type/"
    templateUrl: "views/questions.html"
    controller: "QuestionsCtrl"
  )
  .when("/question/:id/view"
    templateUrl: "views/question.html"
    controller: "SingleQuestionCtrl"
  )
  .when("/question/ask"
    templateUrl: "views/ask.html"
    controller: "AskCtrl"
  )
  
  .otherwise redirectTo: "/questions/"
]