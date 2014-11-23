angular.module('DigApp').controller 'DigsCtrl', ($scope, Dig) ->
  $scope.digs = []
  Dig.index().then (response) ->
    $scope.digs = response.data   #endpoint api, stworzyc glos

  $scope.vote = (amount, dig) ->
    Dig.vote(amount, dig).then (response) ->
      dig.rating = dig.rating + amount

  $scope.edit = (dig) ->
    dig._edit = true

  $scope.save = (dig) ->
    if dig._edit
      Dig.update(dig)
    dig._edit = false

  $scope.newDig = {}

  $scope.submit = ->
    Dig.create($scope.newDig).then (response) ->
      $scope.newDig.id = response.data.id
      $scope.newDig.rating = 0
      $scope.digs.push($scope.newDig)
      $scope.newDig = {}




  $scope.delete = (dig) ->
    i = 0
    angular.forEach $scope.digs, (val) ->
      if val.id == dig.id
        $scope.digs.splice(i,1)
        Dig.delete(dig)
      i += 1
