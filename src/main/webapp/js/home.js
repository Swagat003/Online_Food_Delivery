/**
 * 
 */

$(document).ready(function() {
	$(".catagoryBtn").click(function(e) {
		e.preventDefault(); // Prevent default form submission behavior
		let allBtn = document.querySelectorAll(".catagoryBtn");
		var inputValue = $(this).data("value");
		var inputSelected = $(this).data("selected");
		for(const btn of allBtn){
			btn.classList.remove("selected");
			btn.dataset.selected = 'false';
		}
		$(this).data("selected", inputSelected);
		$(this).addClass('selected');
		if (inputSelected == 'false') {
			$(this).data('selected', 'true');
			$(this).addClass('selected');
		} else {
			$(this).data('selected', 'false');
			$(this).removeClass('selected');
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
		$(this).classList.add('selected');	
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