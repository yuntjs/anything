
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

  $('#random-btn').on('click',function(event){
    var input = $('#zipcode-input').val()
    var data = {zipcode: $('#zipcode-input').val()}
    if(input == ""){
      $( '.input-zipcode' ).effect( "bounce", "slow" );
      return false;
    }

    $.ajax({
      url: '/find',
      data: data,
      method: 'post',
      beforeSend: function() {
         $('#loader').removeClass('hide');
         $( '.input-zipcode' ).hide();
         $('#random-btn').hide();
      }
    })
  })
}

Controller.prototype.findAgain = function(){
  $('#again-btn').on('click',function(){
    var path = window.location.pathname
    var search = window.location.search
    var url = path+search
    $.ajax({
      url: url,
      method: 'get',
      beforeSend: function(){
        $('#loader').removeClass('hide');
        $('.logo').removeClass('hide');
        $('#again-btn').hide();
        $('.result').hide();
      }
    })
    location.reload();
  })
}

Controller.prototype.slideMail = function(){
  var html = "yuntjs@gmail.com"
  $('.gmail').on('click',function(event){
    event.preventDefault();
    $('.email-text').text(html).hide();
    $('.email-text').text(html).show('shake');    
  })
}

Controller.prototype.initialize = function(){
  this.findRest();
  this.findAgain();
  this.slideMail();
}
