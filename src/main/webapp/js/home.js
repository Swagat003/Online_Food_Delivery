/**
 * 
 */

$(document).ready(function() {
	$(".catagoryBtn").click(function(e) {
		e.preventDefault(); // Prevent default form submission behavior
		var inputValue = $(this).data("value");
		var inputSelected = $(this).data("selected");
		if (inputSelected == 'false') {
			$(this).data('selected', 'true');
		} else {
			$(this).data('selected', 'false');
		}
		$.ajax({
			url: "HomeServlet", // Servlet mapping URL
			type: "GET",
			data: { value: inputValue, selected: inputSelected },
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
	
	$("#searchBtn").click(function(e) {
		e.preventDefault(); // Prevent default form submission behavior
		var inputValue = $("#searchField").val();
		$.ajax({
			url: "HomeServlet", // Servlet mapping URL
			type: "GET",
			data: { value: inputValue,selected:"searched" },
			success: function(data) {
				$("#food-container").html(data); // Display result
			},
			error: function(xhr, status, error) {
				console.error("Error running function: ", error);
			}
		});
	});
});