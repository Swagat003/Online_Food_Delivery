/**
 * 
 */

 $(document).ready(function() {
	$("#addBtn").click(function(e) {
		e.preventDefault(); // Prevent default form submission behavior
		var Value = $(this).data("food_id");
		$.ajax({
			url: "AddToCartServlet", // Servlet mapping URL
			type: "GET",
			data: { id: Value},
			success: function(data) {
				//$("#food-container").html(data); // Display result
			},
			error: function(xhr, status, error) {
				console.error("Error running function: ", error);
			}
		});
	});
	
});