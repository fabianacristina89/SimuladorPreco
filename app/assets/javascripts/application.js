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
var tecla = teclapres==null?null:teclapres.keyCode;
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
if(tecla != null && (tecla == 109 || tecla == 189))
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
if(tecla != null && (tecla == 107 || tecla == 187))
{
objeto.value = objeto.value.replace("-","");
}
}
}
/*if( Utils.parseCurrencyToFloat(super.text) != new Number(0) &&  tecla != Keyboard.TAB)
	objeto.setSelection(objeto.value.length,objeto.value.length);*/
}

function parseFloatToCurrency(vlr){
	if(vlr == '' || vlr == null){
		return '';
	}else{
		vlr = vlr.replace(",","");	
		vlr = vlr.replace(".",",");
		return parseFloat(vlr);
	}
}
function parseCurrencyToFloat(vlr){
	if(vlr == '' || vlr == null){
		return 0;
	}else{
		vlr = vlr.replace(".","");	
		vlr = vlr.replace(",",".");
		return parseFloat(vlr);
	}
}

function filter (phrase, _id, cellNr){
  var suche = phrase.value.toLowerCase();
  var table = document.getElementById(_id);
  var ele;
  for (var r = 1; r < table.rows.length; r++){
        ele = table.rows[r].cells[cellNr].innerHTML.replace(/<[^>]+>/g,"");
        if (ele.toLowerCase().indexOf(suche)>=0 )
    		table.rows[r].style.display = '';
        else table.rows[r].style.display = 'none';
  }
}
function recalcularTabelaDePrecos(event){
  var arrayLinhas = document.getElementById('tabela_precos').getElementsByTagName('tr');
  for(var i = 0; i<arrayLinhas.length; i++){
    recalcularProduto(event, arrayLinhas[i].id.split("_")[1]);
    definirCor(arrayLinhas[i].id.split("_")[1]);
  }
}
function redefinirCorTabela(){
  var arrayLinhas = document.getElementById('tabela_precos').getElementsByTagName('tr');
  for(var i = 0; i<arrayLinhas.length; i++){
    definirCor(arrayLinhas[i].id.split("_")[1]);
  }
}

function calcularValor(event,input, id_produto_vpsa){
  formatar(event,input);  
  recalcularProduto(event, id_produto_vpsa);
  

}

function recalcularProduto(event,id_produto_vpsa){
   var arrayDespesasFixas = document.getElementsByClassName("despesa_variavel_" + id_produto_vpsa);
  var somaPorcentagem = 0;

  for(var i = 0; i<arrayDespesasFixas.length; i++){
    somaPorcentagem = somaPorcentagem + parseCurrencyToFloat(arrayDespesasFixas[i].value)
  }
  somaPorcentagem = somaPorcentagem + parseCurrencyToFloat(document.getElementById("simulacao_despesas_fixas").value);
  somaPorcentagem = somaPorcentagem + parseCurrencyToFloat(document.getElementById("simulacao_margem_lucro").value);

  var markup = 100 - somaPorcentagem;
  var valor = parseCurrencyToFloat(document.getElementsByClassName("preco_compra_"+id_produto_vpsa)[0].value)/(markup/100);

  document.getElementsByClassName("valor_calculado_" + id_produto_vpsa)[0].value = valor.toFixed(2);
  
  formatar(event,document.getElementsByClassName("valor_calculado_"+id_produto_vpsa)[0]);
  definirCor(id_produto_vpsa);
}
function definirCor(id_produto_vpsa){
  var valor_calculado = parseCurrencyToFloat(document.getElementsByClassName("valor_calculado_" + id_produto_vpsa)[0].value);
  var valor_vpsa = parseCurrencyToFloat(document.getElementsByClassName("valor_vpsa_" + id_produto_vpsa)[0].value);
  var diferenca = (Math.abs(valor_vpsa - valor_calculado) * 100)/valor_vpsa;
  if(diferenca > 40){
    document.getElementsByClassName("valor_calculado_" + id_produto_vpsa)[0].style.color="red";
  }else if(diferenca > 20){
    document.getElementsByClassName("valor_calculado_" + id_produto_vpsa)[0].style.color="#E06812";
  }else{
      document.getElementsByClassName("valor_calculado_" + id_produto_vpsa)[0].style.color="black";
  
  }

  
}