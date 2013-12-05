angular.module('nuxeoAngularSampleApp')

.factory "nxHeader", ['$routeParams','$location',"nxUrl",($routeParams,$location,nxUrl)->
  
  class nxHeader
    constructor: ()->
      @selectedType = undefined

    getQueryParam: ()->
      if $routeParams.searchtag?
        @selectedType = undefined
        return "WHERE ecm:fulltext = '" + $routeParams.searchtag + "'"
      if $routeParams.type?
        @selectedType = $routeParams.type
        return "WHERE ecm:currentLifeCycleState = '" + $routeParams.type + "'"
      @selectedType = 'latest'
      return

  return new nxHeader()
]
