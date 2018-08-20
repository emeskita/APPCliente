$(document).ready(function(){
    $("#cliente_cep").blur(function(){
        cep = $('#cliente_cep').val();   
        $.ajax({
            type: 'post',
            headers: { 
                'X-CSRF-Token': Rails.csrfToken() 
            },
            url: '/clientes/buscacep',
            data: "cep=" + cep,
            dataType: 'JSON',
            beforeSend: function() { $('#wait').show(); },
            complete: function() { $('#wait').hide(); }
        }).done(function (data) {
           $('#cliente_bairro').val(data.neighborhood);
           $('#cliente_cidade').val(data.city);
           $('#cliente_endereco').val(data.address);
           $('#cliente_estado').val(data.state);
           $('#cliente_complmento').val(data.complement);
            
        }).fail(function (data) {
            alert(data.alert);
        });
    });
    
});

//beforeSend : function(){
//09               $("#resultado").html("ENVIANDO...");
//10          }