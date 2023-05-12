PrimeFaces.locales['pt_BR'] = {
    closeText: 'Fechar',
    prevText: 'Anterior',
    nextText: 'Próximo',
    currentText: 'Hoje',
    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun', 'Jul','Ago','Set','Out','Nov','Des'],
    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb'],
    dayNamesMin: ['D','S','T','Q','Q','S','S'],
    weekHeader: 'Semana',
    firstDay: 0,
    isRTL: false,
    showMonthAfterYear: false,
    yearSuffix: '',
    timeOnlyTitle: 'Só Horário',
    timeText: 'Horário',
    hourText: 'Hora',
    minuteText: 'Minuto',
    secondText: 'Segundo',
    ampm: false,
    month: 'Mês',
    week: 'Semana',
    day: 'Dia',
    allDayText : 'O dia todo'
}; 

$(function() {
	// Destacando linhas quando o mouse passa por elas
	applyStyleLine();
    
    // Ajustar tamanho do SelectOneMenu para deixa-lo com o maior
    // tamanho dos elementos da lista. Esta abordagem NAO EH RESPONSIVA
    ajustarTamanhoSelectOneMenu();
});

function applyStyleLine(){
	$('table tbody.ui-datatable-data .ui-widget-content[role="row"]').hover(
		function(){$(this).addClass("ui-state-hover");},
		function(){$(this).removeClass("ui-state-hover");}
	);
	$('table tbody.ui-datatable-data .ui-widget-content[role="row"]').click(function() {
	    $(this).toggleClass('ui-state-highlight')
	});
}

// Ajustar tamanho do SelectOneMenu para deixa-lo com o maior
// tamanho dos elementos da lista. Esta abordagem NAO EH RESPONSIVA
function ajustarTamanhoSelectOneMenu(){
    $('.ui-selectonemenu').each(function(){  
        var $this = $(this);
        var width = $this.find('div select').width(); 
        $this.css('width', width);
    });
}

function onblurInput(el, texto){
    if(el.value=='') el.value = texto;
}

function onfocusInput(el, texto){
    if(el.value==texto) el.value='';
}

// INTERCEPTADOR DE REQUISIÇÕES AJAX
(function(open) {
   XMLHttpRequest.prototype.open = function(method, url, async, user, pass) {
	 //console.log('Ajax Interception!');
	 
     open.call(this, method, url, async, user, pass);
     
     // Funcoes para serem aplicadas a cada requisicao ajax
     
	 applyStyleLine();
     
     ajustarTamanhoSelectOneMenu();
   };
})(XMLHttpRequest.prototype.open);
