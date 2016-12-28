function Controller(){
  this._view = new View();
  this._model = new Model();
}

Controller.prototype.view = function(){
  return this._view
}

Controller.prototype.model = function(){
  return this._model
}

Controller.prototype.findRest = function(){

  $('#random-btn').on('click',function(){
    var data = {zipcode: $('#zipcode-input').val()}
    $.ajax({
      url: '/find',
      data: data,
      method: 'post'
    })
  })
}

Controller.prototype.findAgain = function(){
  $('#again-btn').on('click',function(){
    location.reload();
  })
}

Controller.prototype.initialize = function(){
  this.findRest();
  this.findAgain();
}
