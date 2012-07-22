// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .


 function formatar(teclapres, objeto){
var v = objeto.value;	
var tecla = teclapres.keyCode;
var vernegativo = false;
var fazBurley = 0;
var exp;
var casasD = 2;
var separadorDecimal = ",";
var separadorMilhar = ".";

/*if(tecla == Keyboard.SHIFT || tecla == Keyboard.CONTROL)
return;*/

if(objeto.value.indexOf("-") != -1)
{
vernegativo = true;
}
else
{
vernegativo = false;
}
v = v.replace(/\D/g,""); //Fazendo a substituíção de que é Não-Dígito para NADA;
if(v.length > casasD){
var valorEsquerda = v.substr(0,v.length - casasD);
valorEsquerda = parseInt(valorEsquerda).toString();
v = valorEsquerda + v.substr(v.length - casasD,v.length)
}
if(v.length <= (casasD + 6))
fazBurley = 1;
else
fazBurley = Math.floor((v.length - casasD - 1) / 3);
v = v.substr(0,objeto.maxChars);
exp = new RegExp("(\\d{" + casasD +"}\\b)");
v = v.replace(exp,(separadorDecimal + "$1")); //Encontrando os últimos 2 dígitos e concatenando o separador decimal;
var strExpPonto = "(\\d{1,3})(\\d{3})+";
var strReplace = "";
for(var i=2; i<=fazBurley;i++)
{
strExpPonto = strExpPonto.concat("(.\\d{2})+");
}
for(var i=1; i<=fazBurley;i++)
{
strReplace = strReplace.concat("$" + i.toString() + separadorMilhar);
}
strExpPonto = strExpPonto.concat("(.\\d{2})");
strReplace = strReplace.concat("$" + (fazBurley + 1).toString() + "$" + (fazBurley + 2).toString());
exp = new RegExp(strExpPonto,"gm");
v = v.replace(exp,strReplace);
objeto.value = v; //Retornando o valor para o campo no HTML

var negativo = false;
if(negativo == true)	
{	
if(tecla == 109 || tecla == 189)
{
objeto.value = objeto.value.replace("-","");
objeto.value = "-"+ objeto.value;
}	
else
{	
if(vernegativo == true)
{
objeto.value = objeto.value.replace("-","");
objeto.value = "-"+ objeto.value;
}
if(tecla == 107 || tecla == 187)
{
objeto.value = objeto.value.replace("-","");
}
}
}
/*if( Utils.parseCurrencyToFloat(super.text) != new Number(0) &&  tecla != Keyboard.TAB)
	objeto.setSelection(objeto.value.length,objeto.value.length);*/
}