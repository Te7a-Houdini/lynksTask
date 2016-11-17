$( document ).ready(function() {

    $('#searchName').on('input',function () {

       searchConditions = getInputsSearchConditions();

        searchAjax(searchConditions,{'styleText' : $.trim($('#searchStyle').val()) , 'nameText' :$.trim( $('#searchName').val()) });


    });

    $('#searchStyle').on('input',function () {

        searchConditions = getInputsSearchConditions();

        searchAjax(searchConditions,{'styleText' : $.trim($(this).val()) , 'nameText' :$.trim( $('#searchName').val()) });
    })


    function getInputsSearchConditions ()
    {
        nameText =$.trim( $('#searchName').val());
        styleText = $.trim( $('#searchStyle').val());

        nameCondition = false
        styleCondition = false

        if (nameText.length >0 )
        {
            nameCondition = true
        }

        if (styleText.length >0 )
        {
            styleCondition = true
        }



        searchConditions = {'name' : nameCondition , 'style' : styleCondition}

        return searchConditions

    }


    function searchAjax (searchConditions,searchText)
    {
        $.ajax({
            'url' : 'bicycles/search',
            'method' : 'get',
            'data':{'conditions' : searchConditions , 'value' : searchText},
            'success' : function (response) {
                $('#searchAjax li').css('display','none')

                for (i=0 ; i< response.result.length ; i++)
                {
                    resultObj = response.result[i];
                    console.log(response.result[i])
                    $('#searchAjax').append('<li> ' +
                        '<figure>' +
                        ' <a class="aa-product-img" href="#"><img height="300" width="250" src="'+resultObj.bicyleObj.image_link.url+'" ></a>' +
                        '<a class="aa-add-card-btn" href="/bicycles/'+resultObj.bicyleObj.id+'"><span class="fa fa-shopping-cart"></span>View Details</a>' +
                        ' <figcaption>' +
                        '<h4 class="aa-product-title"><p>'+resultObj.bicyleObj.name+' ('+resultObj.styleName+' )</p></h4>' +
                        '<span class="aa-product-price">$'+resultObj.bicyleObj.price+'</span>' +
                        ' <div class="aa-product-hvr-content">' +
                        ' <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal-'+resultObj.bicyleObj.id+'"><span class="fa fa-search"></span></a>' +
                        '' +
                        '' +
                        '</div>' +
                        '</figcaption>' +
                        '</figure>' +

                        '' +
                        '</li>')
                }
                console.log(response);
            },
            'error' : function (error){
                console.log('error')
                console.log(error);
            }
        });
    }


});