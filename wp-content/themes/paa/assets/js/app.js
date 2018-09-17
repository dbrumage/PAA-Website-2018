function scrollPage() {
	jQuery("html, body").animate({
		scrollTop: document.body.scrollHeight
	}, 600);
}

function createNext(count, content, type, answers, length, link_response_pre_text, link_response_text, link_response_url) {

	// DISABLE INPUT SOMEWHERE
	// jQuery('#convForm button').attr('disabled');

	setTimeout(function () {

		jQuery(".message.to.typing").remove();

		if (type == "Text") {
			jQuery("body").find('#messages').append('<div class="message to ready">' + content + '</div>');
		}
		
		if (type == "Video") {
			jQuery("body").find('#messages').append('<div class="message-video"><div class="embed-container"><iframe src="https://player.vimeo.com/video/' + content + '?autoplay=1&color=fbfbfb&title=0&byline=0&portrait=0" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div></div>');
		}

		if (type == "Image") {
			jQuery("body").find('#messages').append('<div class="message to ready"><img src="' + content + '" width="100%"></div>');
		}

		if (type == "HTML") {
			jQuery("body").find('#messages').append('' + content + '');
		}
		
		if (type === "Content") {
			for (var i in content) {
				jQuery("body").find('#messages').append('<div class="message to ready"><img src="' + content[i].image + '" width="100%"><br />' + content[i].client + '<br /><a href="' + content[i].case_study_url + '">' + content[i].case_study_title + '</a></div>');
			}
		}
		
		if (type === "Prompt") {
			for (var i in answers) {
				jQuery("body").find('#messages').append('<div class="option" data-value="' + answers[i].prompt + '"><div class="shortcut-key">' + answers[i].prompt_shortcut_key + '</div>' + answers[i].prompt + '</div>');
			}
		}

		if (type == "Link") {
			jQuery("body").find('#messages').append('<div class="message to ready link">' + link_response_pre_text + '<a href="' + link_response_url + '" class="message-link" target="_blank">' + link_response_text + '</a></div>');
		}

		// SORT THIS HACK, ADD BEFORE TRIGGERS
		if (type === "User Input" || content === "Great. To start, give us your name." || content === "Enter your email address so Laura can get back to you.") {

		} else {
			setTimeout(function () {
				jQuery("body").find('#messages').append('<div class="message to typing"><div class="typing_loader"></div></div>');
			}, 300);
		}

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

	var convForm = jQuery('#chat').convform({
		eventList: {
			onInputSubmit: function (convState, ready) {
				// console.log(convState);
				scrollPage();

				if (convState.current.answer.value === 'end') {
					convState.current.next = false;
					setTimeout(ready, Math.random() * 500 + 100);
				} else {
					if (jQuery("input[data-user-input='Name']").length) {
						var api_value = "user-email";
					} else if (jQuery("input[data-user-input='Email']").length) {
						var api_value = "form-submitted";
						jQuery("#userInput").removeAttr('data-user-input');
					} else {
						var api_value = convState.current.answer.value;
					}

					jQuery.ajax({
						type: 'POST',
						dataType: 'JSON',
						url: 'api?term=' + api_value,
						success: function (response) {

							console.log(response);

							var count = 0;
					
							for (var i in response) {

								var type = response[i].response_type;
								var length = response.length;

								if (type==="Text") {
									var content = response[i].text_response;
								} else if (type === "Prompt") {
									var answers = response[i].prompt_data_array;
								} else if (type === "User Input") {
									var user_input_response_type = response[i].user_input_response_type;
									var user_input_response_text = response[i].user_input_response_text;
									jQuery("#userInput").attr('data-user-input', user_input_response_type);
								} else if (type === "Video") {
									var content = response[i].video_response;
								} else if (type === "Image") {
									var content = response[i].image_response;
								} else if (type === "HTML") {
									var content = response[i].html_response;
								} else if (type === "Link") {
									var link_response_pre_text = response[i].link_response_pre_text;
									var link_response_text = response[i].link_response_text;
									var link_response_url = response[i].link_response_url;
								} else if (type === "Content") {
									var content = response[i].content_response;
								}

								createNext(count, content, type, answers, length, link_response_pre_text, link_response_text, link_response_url);

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
