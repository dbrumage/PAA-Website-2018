function scrollPage() {
	var y = jQuery(window).scrollTop();
	jQuery("html, body").animate({ scrollTop: y + jQuery(window).height() }, 800);
}

function createNext(count, content, type, answers, length) {

	// DISABLE INPUT SOMEWHERE
	// jQuery('#convForm button').attr('disabled');

	setTimeout(function () {

		jQuery(".message.to.typing").remove();

		if (type == "Text") {
			jQuery("body").find('#messages').append('<div class="message to ready">' + content + '</div>');
		} else if (type == "User Input") {
			jQuery("body").find('#messages').append('<div class="message to ready">' + content + '</div>');
		} else if (type == "Video") {
			jQuery("body").find('#messages').append('<div class="message-video"><div class="embed-container"><iframe src="https://player.vimeo.com/video/' + content + '?autoplay=1&color=fbfbfb&title=0&byline=0&portrait=0" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div></div>');
		} else if (type === "Content") {
			for (var i in content) {
				jQuery("body").find('#messages').append('<div class="message to ready"><img src="' + content[i].image + '" width="100%"></div>');
			}
		}
		
		if (type === "Prompt") {
			for (var i in answers) {
				jQuery("body").find('#messages').append('<div class="option" data-value="' + answers[i].prompt + '"><div class="shortcut-key">' + answers[i].prompt_shortcut_key + '</div>' + answers[i].prompt + '</div>');
			}
		}

		setTimeout(function () {
			jQuery("body").find('#messages').append('<div class="message to typing"><div class="typing_loader"></div></div>');
		}, 300);

		if (count === length - 1) {
			setTimeout(function () {
				jQuery(".message.to.typing").remove();
			}, 300);
		}
		scrollPage();

	}, 1500 * count);

	// DISABLE INPUT SOMEWHERE
	// setTimeout(function () {

	// 	jQuery('#convForm button').removeAttr('disabled');

	// }, 1200 * length - 1);
}

jQuery(function ($) {

	jQuery('body').on('click', '.option', function () {
		jQuery('#userInput').attr('value', jQuery(this).attr('data-value'));
		jQuery("button").click();
	});

	var convForm = $('#chat').convform({
		eventList: {
			onInputSubmit: function (convState, ready) {
				// console.log(convState);
				scrollPage();

				if (convState.current.answer.value === 'end') {
					convState.current.next = false;
					setTimeout(ready, Math.random() * 500 + 100);
				} else {
					jQuery.ajax({
						type: 'POST',
						dataType: 'JSON',
						url: 'api?term=' + convState.current.answer.value,
						success: function (response) {

							console.log(response);
							var count = 0;
					
							for (var i in response) {

								var type = response[i].response_type;

								if (type==="Text") {
									var content = response[i].text_response;
								} else if (type === "Prompt") {
									var answers = response[i].prompt_data_array;
								} else if (type === "User Input") {
									var content = "something";
									var answers = response[i].user_input_data_array;
								} else if (type === "Video") {
									var content = response[i].video_response;
								} else if (type === "Content") {
									var content = response[i].content_response;
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
