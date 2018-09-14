jQuery(function ($) {
	var count = 0;
	var convForm = $('#chat').convform({
		eventList: {
			onInputSubmit: function (convState, ready) {
				console.log(convState);
				//here you send the response to your API, get the results and build the next question
				//when ready, call 'ready' callback (passed as the second parameter)
				
				
				if (convState.current.answer.value === 'end') {

					convState.current.next = false;
					//emulating random response time (100-600ms)
					setTimeout(ready, Math.random() * 500 + 100);

				} else {

					jQuery.ajax({
						type: 'POST',
						dataType: 'html',
						url: 'chat-query?term=' + convState.current.answer.value,
						success: function (response) {
							// console.log(response);
							// jQuery(".typing").hide();
							// jQuery("body").find('#messages').append('<div class="message to ready">'+response+'</div>');
							convState.current.next = convState.newState({
								type: 'text',
								name: 'dynamic-question',
								questions: [response],
								// answers: [
								//     {text: 'Answer 1', value: '1'},
								//     {text: 'Answer 2', value: '2'},
								//     {text: 'END', value: 'end'}
								// ]
							});
							setTimeout(ready, Math.random() * 500 + 100);
							
						},
						error: function (XMLHttpRequest, textStatus, errorThrown) {
							// console.log("Status: " + textStatus); console.log("Error: " + errorThrown);
						}
					});

					// var str = convState.current.answer.value;
					// if (str.includes('work')) {
					// 	$response = "Heres some work 👇👇👇<br/><br/><img src='http://gifimage.net/wp-content/uploads/2018/06/zach-galifianakis-calculations-gif-6.gif' width='100%'>";
					// } else {
					// 	$response = "This response is dynamically loaded from the database API using the term (" + escapeHtml(convState.current.answer.text) + ")";
					// }
					
					//emulating random response time (100-600ms)
					
				}
				count++;
			}
		},
		placeHolder: "Start typing here",
		typeInputUi: "input",
		buttonText: "→"
		// timeOutFirstQuestion: 15000
	});
});
// var segment_str = window.location.pathname;
// var segment_array = segment_str.split( '/' );
// var second_to_last = segment_array[segment_array.length - 2];
// var last_segment = segment_array.pop();

// if (last_segment === "top_untrending") {

// 	jQuery.ajax({
// 		type: 'POST',
// 		dataType: 'json',
// 		url: window.resourceUrl+'/assets/data/data-top-untrending-'+window.lang+'.json',
// 		success: function(response) {

// 			var data = { topUntrending: response };
// 			var results = jlinq.from(data.topUntrending)
// 			.select();

// 			$(".top-untrending-items").html(
// 				$("#topUntrendingTemplate").render(results)
// 			);

// 		},
// 	    error: function(XMLHttpRequest, textStatus, errorThrown) {
// 	        console.log("Status: " + textStatus); console.log("Error: " + errorThrown);
// 	    }
// 	});
// }

// if (second_to_last === "top_untrending") {
// 	jQuery.ajax({
// 		type: 'POST',
// 		dataType: 'json',
// 		url: window.resourceUrl+'/assets/data/data-top-untrending-'+window.lang+'.json',
// 		success: function(response) {
// 			var data = { topUntrending: response };
// 			var results = jlinq.from(data.topUntrending)
// 			.starts("url", last_segment)
// 			.select();

// 			$("#top-untrending-single-result").html(
// 				$("#topUntrendingSingleTemplate").render(results)
// 			);

// 			$('.maps iframe').addClass('scrolloff');

// 			$('.maps').on("mouseup",function() {
// 				$('.maps iframe').addClass('scrolloff');
// 			});

// 			$('.maps').on("mousedown",function() {
// 				$('.maps iframe').removeClass('scrolloff');
// 			});

// 			$(".maps iframe").mouseleave(function () {
// 				$('.maps iframe').addClass('scrolloff');
// 			});

// 		}
// 	});
// }

// if (last_segment === "untrend_yourself") {
// 	jQuery.ajax({
// 		type: 'POST',
// 		dataType: 'json',
// 		url: window.resourceUrl+'/assets/data/data-untrend-yourself-'+window.lang+'.json',
// 		success: function(response) {

// 			var data = { countries: response };
// 			var results = jlinq.from(data.countries)
// 			.select();

// 			var uniqueCountries = [];
// 			$.each(results, function(index, value) {
// 				if ($.inArray(value.country, uniqueCountries) === -1) {
// 					uniqueCountries.push(value.country);
// 				}
// 			});

// 			$("#countries").html(
// 				$("#untrendCountriesTemplate").render(uniqueCountries.sort())
// 			);

// 		}
// 	});
// }

// $(document).ready(function() {

// 	$('#country-select').on('change', function(event) {
// 		event.preventDefault();

// 		jQuery.ajax({
// 	        type: 'POST',
// 	        dataType: 'json',
// 	        url: window.resourceUrl+'/assets/data/data-untrend-yourself-'+window.lang+'.json',
// 	        success: function(response) {

// 				if ($(event.target).val()==="Spain") {
// 					var data = { locations: response };
// 					var results = jlinq.from(data.locations)
// 					.starts("country", "Spa")
// 					.ends("country", "in")
// 					.select();
// 				} else if ($(event.target).val()==="Italy") {
// 					var data = { locations: response };
// 					var results = jlinq.from(data.locations)
// 					.starts("country", "Ita")
// 					.ends("country", "ly")
// 					.select();
// 				} else {
// 					var data = { locations: response };
// 					var results = jlinq.from(data.locations)
// 					.starts("country", $(event.target).val())
// 					.select();
// 				}

// 				var uniqueLocations = [];
// 				$.each(results, function(index, value) {
// 				    if ($.inArray(value.avisHubLocation, uniqueLocations) === -1) {
// 				        uniqueLocations.push(value.avisHubLocation);
// 				    }
// 				});

// 				$("#container-untrend-hubs-cta .container .row").html(
// 					$("#locationsTemplate").render(uniqueLocations)
// 				);

// 				$('#container-untrend-yourself').slideUp('fast');
// 				$('#container-untrend-hubs-cta').slideDown();
// 				setTimeout(function () {
// 					$('html,body').animate({scrollTop: $('#container-untrend-hubs-cta').offset().top},'slow');
// 				}, 500);

// 	        }
// 	    });

// 	});

// 	$(document).on('click', '.container-untrend-hubs-cta a', function(event) {
// 		event.preventDefault();
// 		var clickedValue = $(this).attr('id');

// 		jQuery.ajax({
// 			type: 'POST',
// 			dataType: 'json',
// 			url: window.resourceUrl+'/assets/data/data-untrend-yourself-'+window.lang+'.json',
// 			success: function(response) {

// 				var data = { locations: response };
// 				var results = jlinq.from(data.locations)
// 				.starts("avisHubLocation", clickedValue)
// 				.select();

// 				$("#container-untrend-yourself .row").html(
// 					$("#untrendLocationsTemplate").render(results)
// 				);

// 				$('.container-untrend-hubs-cta a').removeClass('active');
// 				$(this).addClass('active');

// 				$('#container-untrend-yourself').slideDown();
// 				setTimeout(function () {
// 					$('html,body').animate({scrollTop: $('#container-untrend-yourself').offset().top},300);
// 				}, 600);

// 				$('.maps iframe').addClass('scrolloff');

// 				$('.maps').on("mouseup",function() {
// 					$('.maps iframe').addClass('scrolloff');
// 				});

// 				$('.maps').on("mousedown",function() {
// 					$('.maps iframe').removeClass('scrolloff');
// 				});

// 				$(".maps iframe").mouseleave(function () {
// 					$('.maps iframe').addClass('scrolloff');
// 				});

// 			}
// 		});

// 	});

// 	$(document).on('click', '#country-select', function(event) {
// 		$(this).find('option').css('color', '#666666');
// 	});

// });
