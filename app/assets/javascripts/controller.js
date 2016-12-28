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

Controller.prototype.initialize = function(){

}
