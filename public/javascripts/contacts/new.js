
<script type="text/javascript">
    $(document).ready(function(){
        $("select#contact_order_type_id").change(function(){
            var id_value_string = $(this).val();
		               
			alert(id_value_string);
			
            if (id_value_string == "") { 
                // if the id is empty remove all the sub_selection options from being selectable and do not do any ajax
                $("select#contact_order_id option").remove();
                var row = "<option value=\"" + "" + "\">" + "" + "</option>";
                $(row).appendTo("select#contact_order_id");
			                   
            }
            else {
                // Send the request and update sub category dropdown 
                $.ajax({
                    dataType: "json",
                    cache: false,
                    url: '/orders/for_order_types/' + id_value_string,
                    timeout: 2000,
                    error: function(XMLHttpRequest, errorTextStatus, error){
                        alert("Failed to submit : "+ errorTextStatus+" ;"+error);
                    },
                    success: function(data){  
	                  	
                        // Clear all options from sub category select 
                        $("select#contact_order_id option").remove();
                        //put in a empty default line
                        var row = "<option value=\"" + "" + "\">" + "" + "</option>";
                        $(row).appendTo("select#contact_order_id");  
						                      
                        // Fill sub category select 
                        $.each(data, function(i, j){
                            row = "<option value=\"" + j.order.id + "\">" + j.order.company + "</option>";   
                            $(row).appendTo("select#contact_order_id"); 
							            
                        }); 
						                    
                     }
                });
            };
        });

		$("select#contact_order_id").change(function(){
            var id_value_string = $(this).val();
		
                // Send the request and update sub category dropdown 
                $.ajax({
                    dataType: "json",
                    cache: false,
                    url: '/orders/get_criteria_for/' + id_value_string,
                    timeout: 2000,
                    error: function(XMLHttpRequest, errorTextStatus, error){
                        alert("Failed to submit : "+ errorTextStatus+" ;"+error);
                    },
                    success: function(data){  
	                  	
                        // Clear all options from sub category select 
                        //$("select#contact_order_id option").remove();
                        //put in a empty default line
                        //var row = "<option value=\"" + "" + "\">" + "" + "</option>";
                        //$(row).appendTo("select#contact_order_id");                        
                        // Fill sub category select 
                        $.each(data, function(i, j){
                        //    row = "<option value=\"" + j.order.id + "\">" + j.order.company + "</option>";   
                           
                    		$('#criteria').val(j.order.Description); 
                        });             
                     }
                });
            
        });



    });
</script>