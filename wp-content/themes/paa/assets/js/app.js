jQuery(function ($) {

	jQuery('body').on('click', '.option', function () {
		jQuery('#userInput').attr('value', 'watch the showreel');
		jQuery("button").click();
	});

	function do_something(j, content, type, answers) {
		setTimeout(function () {
			jQuery("body").find('#messages').append('<div class="message to typing"><div class="typing_loader"></div></div>');
			jQuery("body").find('#messages').append('<div class="message to ready">' + content + '</div>');
			
			jQuery(".message.to.typing").remove();

			console.log(j);
			if (j===5) {
				jQuery("body").find('#convForm .options').append('<div class="option">prompt 1</div><div class="option">prompt 2</div>');
			}

			jQuery("#messages").scrollDown;
			// convState.current.next = convState.newState({
			// 	type: type,
			// 	name: 'dynamic-question-' + count,
			// 	questions: [content],
			// 	answers: answers
			// });
			// setTimeout(ready, Math.random() * 500 + 100);

		}, 2000 * j);
	}

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
						dataType: 'JSON',
						url: 'chat-query?term=' + convState.current.answer.value,
						success: function (response) {
							

							

							console.log(response);
							var count = 0;
					
							for (var i in response) {

								var type = response[i].response_type;

								if (type==="Text") {
									var content = response[i].text_response;
								} else if (type === "Prompt") {
									var content = response[i].prompt_response;
									var answers = response[i].prompt_data_array;
								} else if (type === "User Input") {
									var content = "something";
									var answers = response[i].user_input_data_array;
								} else if (type === "Video") {
									var content = response[i].video_response;
								}
								
								// if (type === "Prompt") {
								// 	var type = "select";
								// }
								
								do_something(count, content, type, answers);
								
								
								// convState.current.next = convState.newState({
								// 	type: type,
								// 	name: 'dynamic-question-' + count,
								// 	questions: [content],
								// 	answers: answers
								// });
								// setTimeout(ready, Math.random() * 500 + 100);	
									

								count++;
							}

							// function doSetTimeout(i, cont) {
							// 	setTimeout(function () {
									
							// 	}, 1000);
							// }

							// console.log(response[5].response_type);

							
							// console.log(content);
							

							// console.log(response[5].response_type);
							// jQuery(".typing").hide();
							// jQuery("body").find('#messages').append('<div class="message to ready">'+response+'</div>');
							
						},
						error: function (XMLHttpRequest, textStatus, errorThrown) {
							console.log("Status: " + textStatus); console.log("Error: " + errorThrown);
						}
					});
					
				}
			
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
