var estado = document.getElementById('estado');
var tipoDocumento = document.getElementById('tipoDocumento');
var error =document.getElementById('error');

function validarDatos(){
	console.log(">>> Enviando....");
	var mensajesError = [];
	
	if(tipoDocumento.value  == "0"|| tipoDocumento.value  == " "){
		
		mensajesError.push(" Seleccione un tipo de documento v&aacutelido.");
		error.innerHTML = mensajesError.join(' , ');
		return false
	}
	
	else if(estado.value  == "0" || estado.value  == " "){
		
		mensajesError.push("  Seleccione un estado v&aacutelido.");
		error.innerHTML = mensajesError.join(' , ');
		return false
	} 

	else return true;
};





	
