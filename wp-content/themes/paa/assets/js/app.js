function scrollPage() {
	jQuery("html, body").animate({
		scrollTop: document.body.scrollHeight
	}, 600);
}
function validateEmail(email) {
	var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
	return emailReg.test(email);
}

function validateName(name) {
	var nameReg = /^[a-z][a-z '-.,]{0,31}$|^$/i;
	return nameReg.test(name);
}

function validateMessage(message) {
	var messageReg = /^[a-z][a-z '-.,]{0,31}$|^$/i;
	return messageReg.test(message);
}

function ajaxCall(api_url) {
	jQuery.ajax({
		type: 'POST',
		dataType: 'JSON',
		url: api_url,
		success: function (response) {
			console.log(response);
			var count = 0;

			for (var i in response) {
				var type = response[i].response_type;
				var next_field_behaviour = response[i].next_field_behaviour;
				var length = response.length;

				if (type === "Text") {
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

				createNext(count, content, type, next_field_behaviour, answers, length, link_response_pre_text, link_response_text, link_response_url);

				count++;
			}

		}
	});
}

function createNext(count, content, type, next_field_behaviour, answers, length, link_response_pre_text, link_response_text, link_response_url) {

	// TODO DISABLE INPUT SOMEWHERE
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
				if (content[i].content_type === "Work List" || content[i].content_type === "Work Items") {
					jQuery("body").find('#messages').append('<div class="message to ready"><img src="' + content[i].image + '" width="100%"><br />' + content[i].title + '<br />' + content[i].client + '<br /><a href="' + content[i].case_study_url + '">' + content[i].case_study_title + '</a></div>');
				}
				if (content[i].content_type === "Client List" || content[i].content_type === "Client Items") {
					jQuery("body").find('#messages').append('<div class="message to ready"><img src="' + content[i].image + '" width="100%"><br />' + content[i].title + '<br /><a href="' + content[i].case_study_url + '">' + content[i].case_study_title + '</a></div>');
				}
				if (content[i].content_type === "Case Study List" || content[i].content_type === "Case Study Items") {
					jQuery("body").find('#messages').append('<div class="message to ready"><img src="' + content[i].image + '" width="100%"><br />' + content[i].title + '<br /><a href="' + content[i].case_study_url + '">Case Study URL</a></div>');
				}
				if (content[i].content_type === "Generic Content Items") {
					jQuery("body").find('#messages').append('<div class="message to ready"><img src="' + content[i].image + '" width="100%"><br />' + content[i].title + '<br /><a href="' + content[i].permalink + '">Expand section</a></div>');
				}
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

		if (type === "User Input" || next_field_behaviour === "Next field is user input") {
		} else {
			setTimeout(function () {
				jQuery("body").find('#messages').append('<div class="message to typing"><div class="typing_loader"></div></div>');
			}, 300);
		}

		if (type != "Content") {
			scrollPage();
		}

		if (count === length - 1) {
			setTimeout(function () {
				jQuery(".message.to.typing").remove();
			}, 300);
		}

	}, 1500 * count);

	// TODO DISABLE INPUT SOMEWHERE
	// setTimeout(function () {

	// 	jQuery('#convForm button').removeAttr('disabled');

	// }, 1200 * length - 1);
}

var idleTime = 0;

function timerIncrement() {
	idleTime = idleTime + 1;
	if (idleTime > 4) {
		ajaxCall('api?term=user-idol&idol=1');
	}
}

jQuery(function ($) {

	jQuery('#userInput').focus();

	// var idleInterval = setInterval(timerIncrement, 10000);

	// $(this).mousemove(function (e) {
	// 	idleTime = 0;
	// });
	// $(this).keypress(function (e) {
	// 	idleTime = 0;
	// });

	jQuery('body').on('click', '.option', function () {
		jQuery('#userInput').attr('value', jQuery(this).attr('data-value'));
		jQuery(".button-submit").click();
	});

	jQuery('body').on('focus', '#userInput', function () {
		jQuery('#userInput').attr('placeholder', '');
	});

	var empty = true;
	jQuery('#userInput').on('keyup', function () {
		if (jQuery('#userInput').attr('placeholder') === "") {
			if (jQuery('.hamburger').hasClass("is-active")) {
				jQuery('#userInput').attr('placeholder', 'Choose a section, or type what you\'re looking for here');
			}
		} 
		if (jQuery(this).val() != "") {
			jQuery('.button-submit').addClass("button-submit-invert");
			if (jQuery('.menu-wrapper').is(":hidden")) {
				jQuery('.logo').addClass("logo-invert");
				jQuery('.logo-1').hide();
				jQuery('.logo-2').show();
			}
			jQuery('.arrow-1').hide();
			jQuery('.arrow-2').show();
		} else {
			jQuery('.button-submit').removeClass("button-submit-invert");
			if (jQuery('.menu-wrapper').is(":hidden")) {
				jQuery('.logo').removeClass("logo-invert");
				jQuery('.logo-1').show();
				jQuery('.logo-2').hide();
			}
			jQuery('.arrow-1').show();
			jQuery('.arrow-2').hide();
		}
	});

	// jQuery('body').on('focusout', '#userInput', function () {
	// 	jQuery('#userInput').attr('placeholder', '');
	// 	if (jQuery(this).val() == '') {
	// 		jQuery(this).attr('placeholder', 'Start typing here');
	// 	}
	// });

	jQuery(".hamburger").on("click", function (e) {

		jQuery(this).toggleClass("is-active");
		jQuery('.menu-wrapper').slideToggle();
		if (jQuery('#userInput').val() === "") {
			jQuery('.logo').toggleClass("logo-invert");
			jQuery('.logo-1').toggle();
			jQuery('.logo-2').toggle();
		}
		jQuery('.hamburger-wrapper').toggleClass("hamburger-wrapper-invert");
		jQuery('.hamburger-inner').toggleClass("hamburger-inner-invert");
		setTimeout(function () {
			jQuery('.logo').toggleClass('no-left-border-bottom-radius');
			jQuery('.button-submit').toggleClass('no-right-border-bottom-radius');
		}, 400);

		if (jQuery('#userInput').attr('placeholder')==="") {
			if (jQuery('.hamburger').hasClass("is-active")) {
				jQuery('#userInput').attr('placeholder', 'Choose a section, or type what you\'re looking for here');
			}
		} else {
			jQuery('#userInput').attr('placeholder', '');
			jQuery('#userInput').focus();
		}

	});

	var convForm = jQuery('#chat').convform({
		eventList: {
			onInputSubmit: function (convState, ready) {

				scrollPage();

				if (convState.current.answer.value === 'end') {

					convState.current.next = false;
					setTimeout(ready, Math.random() * 500 + 100);

				} else {
					
					var userInput = convState.current.answer.value;
					var api_value;
					var api_url;

					if (jQuery("input[data-user-input='Name']").length) {
						jQuery.ajax({
							type: 'POST',
							dataType: 'JSON',
							url: 'api?contact=1&term=' + userInput,
							success: function (response) {
								if (response == null) {
									if (validateName(userInput) === false) {
										api_value = userInput;
										api_url = 'api?contact=1&term=no';
										jQuery("#userInput").removeAttr('data-user-input');
									} else {
										var contactName = userInput;
										// STORE IN HIDDEN INPUT HERE
										api_value = "contact-email";
										api_url = 'api?term=' + api_value;
									}
									ajaxCall(api_url);
								}
								else {
									api_value = userInput;
									api_url = 'api?contact=1&term=' + api_value;
									jQuery("#userInput").removeAttr('data-user-input');
									ajaxCall(api_url);
								}
							}
						});
					} else if (jQuery("input[data-user-input='Email']").length) {
						jQuery("#userInput").removeAttr('data-user-input');
						if (validateEmail(userInput) === false) {
							api_value = userInput;
							api_url = 'api?contact=1&term=email-error';
							jQuery("#userInput").removeAttr('data-user-input');
							ajaxCall(api_url);
						} else if (validateEmail(userInput) === true) {
							var contactEmail = userInput;
							// STORE IN HIDDEN INPUT HERE
							api_value = "contact-message";
							api_url = 'api?term=' + api_value;
							ajaxCall(api_url);
						}
					} else if (jQuery("input[data-user-input='Message']").length) {
						jQuery("#userInput").removeAttr('data-user-input');
							var contactMessage = escapeHtml(userInput);
							// STORE IN HIDDEN INPUT HERE
							api_value = "contact-thankyou";
							api_url = 'api?term=' + api_value;
							ajaxCall(api_url);
					} else {
						var api_value = userInput;
						var api_url = 'api?term=' + api_value;
						ajaxCall(api_url);
					}
					
				}
			
			}
		},
		placeHolder: "Start typing here",
		typeInputUi: "input",
		buttonText: "→"
		// timeOutFirstQuestion: 15000
	});

});

// TODO CODE FOR CHAT PAGES
if (window.location.hash) {
	var hash = window.location.hash.substring(1);
	// console.log(hash);
}