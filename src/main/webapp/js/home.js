/**
 * 
 */
document.getElementById('arrow-down').addEventListener('click', function(e) {
    e.stopPropagation();
    var logoutDiv = document.getElementById('logout');
    if (logoutDiv.style.display === 'none' || logoutDiv.style.display === '') {
        logoutDiv.style.display = 'block';
    } else {
        logoutDiv.style.display = 'none';
    }
});
document.getElementById('Menu').addEventListener('mouseover', function() {
    document.getElementById('header').classList.add('show-before');
});

document.getElementById('Menu').addEventListener('mouseout', function() {
    document.getElementById('header').classList.remove('show-before');
});


$(document).ready(function() {
	$(".catagory-card").click(function(e) {
		e.preventDefault(); // Prevent default form submission behavior
		let isContain = $(this).hasClass("selected");
		var inputValue = $(this).data("value");
		var inputSelected = $(this).data("selected");
		
		$(".catagory-card").each(function(){
			$(this).data('selected', 'false');
			$(this).removeClass('selected');
		});
		
		if (isContain) {
			$(this).data('selected', 'false');
			$(this).removeClass('selected');
		} else {
			$(this).data('selected', 'true');
			$(this).addClass('selected');
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
	});
	
	$("#searchBtn").click(function(e) {
		e.preventDefault(); // Prevent default form submission behavior
		var inputValue = $("#searchField").val();
		$(".catagory-card").each(function(){
			$(this).data('selected', 'false');
			$(this).removeClass('selected');
		});
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