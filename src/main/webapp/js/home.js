/**
 * 
 */

  		$(document).ready(function() {
            $(".catagoryBtn").click(function(e) {
                e.preventDefault(); // Prevent default form submission behavior
                var inputValue = $(this).data("value");
                var inputSelected = $(this).data("selected");
                if(inputSelected=='0'){
					$(this).data('selected', '1');
				}else{
					$(this).data('selected', '0');
				}
                $.ajax({
                    	url: "HomeServlet", // Servlet mapping URL
                    	type: "GET",
                    	data: { value: inputValue , selected: inputSelected },
                    	success: function(data) {
                        	$("#food-container").html(data); // Display result
                    	},
                    	error: function(xhr, status, error) {
                        	console.error("Error running function: ", error);
                    	}
                	});
                	                
                // Toggle the selected class on the button
                $(this).toggleClass('selected');
            });
        });