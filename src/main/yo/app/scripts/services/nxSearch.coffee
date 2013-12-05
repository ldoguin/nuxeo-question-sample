angular.module('nuxeoAngularSampleApp')

.factory "nxSearch", ["$http","$q","nxUrl",($http,$q,nxUrl)->
  
  class nxSearch
    constructor: ()->
      @items = []
      @busy = false
      @isNextPageAvailable = true
      @currentPageIndex = 0
      @pageSize = 20
      @query = undefined
      @bo = undefined
      

    setBOAdapter: (bo)->
      @bo = bo
      @

    setPageSize: (pageSize)->
      @pageSize = pageSize
      @

    setQuery: (query)->
      @query = query
      @

    nextPage: ()->
      if !@query?
        $q.reject("You need to set a query")
        return


      if !@isNextPageAvailable
        return

      if @busy
        return

      @busy = true

      url = nxUrl + "/path/@search"
      if @bo? then url += "/@bo/" + @bo
      url += "?currentPageIndex="+@currentPageIndex+"&pageSize="+@pageSize+"&query=" + @query;

      me = @
      $http.get(url).then (response) -> 
        docs = response.data
        if(angular.isArray(docs.entries))
          me.currentPageIndex = docs.currentPageIndex + 1
          me.isNextPageAvailable = docs.isNextPageAvailable
          me.items.push doc for doc in docs.entries
          me.busy = false
        else
          me.busy = false
          $q.reject("just because")
      

  nxSearch
]
