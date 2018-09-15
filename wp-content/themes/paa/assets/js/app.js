jQuery(function ($) {

	jQuery('body').on('click', '.option', function () {
		jQuery('#userInput').attr('value', 'watch the showreel');
		jQuery("button").click();
	});

	function createNext(count, content, type, answers, length) {
		setTimeout(function () {
			
			jQuery(".message.to.typing").remove();
			
			jQuery("body").find('#messages').append('<div class="message to ready">' + content + '</div>');
			
			setTimeout(function () {
				jQuery("body").find('#messages').append('<div class="message to typing"><div class="typing_loader"></div></div>');
			}, 300);

			if (count === length-1) {
				setTimeout(function () {
					jQuery(".message.to.typing").remove();
				}, 300);
			}

			// ADD IF PROMPT/INPUT LOGIC
			if (count===5) {
				jQuery("body").find('#convForm .options').append('<div class="option">prompt 1</div><div class="option">prompt 2</div>');
			}
			
			jQuery("#messages").animate({ scrollTop: jQuery('#messages').prop("scrollHeight") }, 300);

		}, 1500 * count);
	}

	var convForm = $('#chat').convform({
		eventList: {
			onInputSubmit: function (convState, ready) {
				console.log(convState);
				if (convState.current.answer.value === 'end') {
					convState.current.next = false;
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

								createNext(count, content, type, answers, response.length);

								count++;
							}
							
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
