$( document ).ready(function() {

    $('#searchBox').on('input',function () {
        console.log($(this).val())
        nameSearch = $("#nameSearch").is(':checked');
        styleSearch = $("#styleSearch").is(':checked') ;

       searchConditions = {'name' : nameSearch , 'style' : styleSearch}

        $.ajax({
            'url' : 'bicycles/search',
            'method' : 'get',
            'data':{'conditions' : searchConditions , 'value' : $(this).val()},
            'success' : function (response) {
                console.log('success')
                console.log(response);
            },
            'error' : function (error){
                console.log('error')
                console.log(error);
            }
        });
    })


});