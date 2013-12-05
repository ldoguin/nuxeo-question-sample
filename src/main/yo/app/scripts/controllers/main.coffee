
angular.module("nuxeoAngularSampleApp")

.controller("HeaderCtrl", 
['$scope','$routeParams','$location','nxHeader'
($scope,$routeParams,$location,nxHeader) ->

  $scope.doSearch = () ->
    if $scope.tagToSearch?
      $location.path("/questions/search/" + $scope.tagToSearch)

  $scope.isActive = (tab)->
    if tab == nxHeader.selectedType
      return true
])


.controller("QuestionsCtrl", 
['$scope','$routeParams','$location','nxSearch','nxHeader'
($scope,$routeParams,$location,nxSearch,nxHeader) ->
  currentLifeCycleState = $routeParams.type
  nxSearch = new nxSearch()
  query = "SELECT * FROM question "
  if nxHeader.getQueryParam()?
    query += nxHeader.getQueryParam()
  nxSearch.setQuery(query)
  .setPageSize(20)
  .setBOAdapter("Question")
  $scope.nxsearch = nxSearch

])

.controller("SingleQuestionCtrl",['$location','$q','$http','$scope', 'nxSession', 'nxSearch', '$routeParams', 'nxUrl'
($location,$q,$http,$scope, nxSession, nxSearch, $routeParams, nxUrl) ->
  $scope.doc = nxSession.getDocument($routeParams.id).fetch(['dublincore','question-schema'])
  $scope.answerDoc = { type:"answer", properties: {}}
  $http.defaults.headers.post = { 'Content-Type' : 'application/json+nxrequest' }

  $scope.updateChildren = () ->
    childrenSearch = new nxSearch()
    .setQuery("SELECT * FROM answer WHERE ecm:parentId = '" + $routeParams.id + "' AND ecm:currentLifeCycleState <> 'deleted' ORDER BY dc:modified DESC")
    .setPageSize(200)
    .setBOAdapter("Answer")
    $scope.answers = childrenSearch.items
    childrenSearch.nextPage()

  $scope.addAnswer = () ->
    $scope.answerDoc.name = "answer"
    $scope.answerDoc.properties["dc:title"]= "answer"
    $scope.wait = true
    nxSession.createDocument($scope.doc.path, $scope.answerDoc).then (answer) -> 
      $scope.updateChildren()
      $scope.wait = false

  $scope.destroy = ()->
    $scope.doc.delete()
    $location.path("/question")

  $scope.destroyAnswer = (answerid)->
    $http.delete(nxUrl + "/id/"+answerid, @)
    $scope.updateChildren()

  $scope.voteUp = (docId) ->
    voteupUrl = nxUrl + "/id/" + docId + "/@op/Question.VoteUp"
    $http.post(voteupUrl, {params:{}, headers: {"Content-Type": "application/json+nxrequest"}}).then ->
      $scope.voteStatus(docId)

  $scope.voteStatus = (docId) ->
    voteupUrl = nxUrl + "/id/" + docId + "/@op/VoteStatus"
    $http.post(voteupUrl, {params:{}, headers: {"Content-Type": "application/json+nxrequest"}}).then (results) ->
      $scope.docVoteStatus = results.data.likesCount

  $scope.voteDown = (docId) ->
    voteupUrl = nxUrl + "/id/" + docId + "/@op/Question.VoteDown"
    $http.post(voteupUrl, {params:{}, headers: {"Content-Type": "application/json+nxrequest"}}).then ->
      $scope.voteStatus(docId)

  $scope.voteStatus($routeParams.id)
  $scope.updateChildren()
])

.controller("AskCtrl", ['$scope', 'nxSession', '$location', 'nxSearch'
 ($scope, nxSession, $location, nxSearch) ->
  $scope.doc = { type:"question", properties: {}}
  communitiesSearch = new nxSearch()
  .setQuery("SELECT * FROM SocialWorkspace WHERE ecm:currentLifeCycleState <> 'deleted'")
  .setPageSize(200)
  $scope.communities = communitiesSearch.items
  communitiesSearch.nextPage()


  $scope.save = () ->
    nxSession.createDocument("/collaboration/questions", $scope.doc).then (question) -> 
      $location.path("/question/" + question.uid + '/view')

])