function store(id, contenedor){
	sessionStorage.setItem(id, JSON.stringify(contenedor,replacer));
}

function retrieveContenedorFromUrl(url,callBack){
    var AJAX_req = new XMLHttpRequest();
    AJAX_req.open( "GET", url, true );
    AJAX_req.setRequestHeader("Content-type", "application/json");
 
    AJAX_req.onreadystatechange = function(){
        if( AJAX_req.readyState === 4 && AJAX_req.status === 200 ){
            jsonText=AJAX_req.responseText;
            var object = JSON.parse( jsonText,revive );
            callBack(object);
        }
    };
    AJAX_req.send();
}

function retrieve(id){
  var jsonContenedor = sessionStorage.getItem(id);
  if(jsonContenedor === null){
	return new Contenedor();
  }
  else{
	return JSON.parse(jsonContenedor,revive);
  }
}

function revive(k,v) {
	if (v instanceof Object && v._class == 'Usuario') {
		return Usuario.from(v);
	}
        if (v instanceof Object && v._class == 'Funcionario') {
		return Funcionario.from(v);
	}
        if (v instanceof Object && v._class == 'Policia') {
		return Policia.from(v);
	}
    return v;
}

function replacer(k,v) {
	if (v instanceof Usuario) {
		return Usuario.to(v);
	}
        if (v instanceof Funcionario) {
		return Funcionario.to(v);
	}
        if (v instanceof Policia) {
		return Policia.to(v);
	}
        
	return v;
}

