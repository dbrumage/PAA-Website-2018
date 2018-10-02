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

var getUrlParameter = function getUrlParameter(sParam) {
	var sPageURL = decodeURIComponent(window.location.search.substring(1)),
		sURLVariables = sPageURL.split('&'),
		sParameterName,
		i;

	for (i = 0; i < sURLVariables.length; i++) {
		sParameterName = sURLVariables[i].split('=');

		if (sParameterName[0] === sParam) {
			return sParameterName[1] === undefined ? true : sParameterName[1];
		}
	}
};

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
			jQuery("body").find('#messages').append('<div class="message to ready done">' + content + '</div>');
		}
		
		if (type == "Video") {
			jQuery("body").find('#messages').append('<div class="message-video"><div class="embed-container"><iframe src="https://player.vimeo.com/video/' + content + '?autoplay=1&color=fbfbfb&title=0&byline=0&portrait=0" width="640" height="360" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe></div></div>');
		}

		if (type == "Image") {
			jQuery("body").find('#messages').append('<div class="message to ready done"><img src="' + content + '" width="100%"></div>');
		}

		if (type == "HTML") {
			jQuery("body").find('#messages').append('' + content + '');
		}
		
		if (type === "Content") {
			var random = Math.floor((Math.random() * 999999999999999) + 1);
			var loopCount = 0;
			jQuery("body").find('#messages').append('<div class="work-hero-wrapper work-hero-wrapper-'+random+'"><div class="work-hero-row"></div></div>');

			for (var i in content) {
				if (content[i].content_type === "Work List" || content[i].content_type === "Work Items") {
					if (content[i].case_study_title!="") {
						var caseStudy = '<a href="' + content[i].case_study_url + '" class="btn btn-primary modal-link">' + content[i].case_study_title + '</a>';
					} else {
						var caseStudy = '';
					}

					jQuery("body").find('.work-hero-wrapper-' + random + ' .work-hero-row').append('<div class="message to ready work-hero-col"><div class="work-hero"><img src="' + content[i].image + '" class="work-hero-image"><div class="work-hero-text"><img src="' + content[i].client_logo + '" class="client-logo" /><h2>' + content[i].title + '</h2>'+caseStudy+'</div></div></div>');
				}
				if (content[i].content_type === "Client List" || content[i].content_type === "Client Items") {
					jQuery("body").find('#messages').append('<div class="message to ready content-hero"><img src="' + content[i].image + '"><br />' + content[i].title + '<br /><a href="' + content[i].case_study_url + '">' + content[i].case_study_title + '</a></div>');
				}
				if (content[i].content_type === "Case Study List" || content[i].content_type === "Case Study Items") {
					jQuery("body").find('#messages').append('<div class="message to ready content-hero"><img src="' + content[i].image + '"><br />' + content[i].title + '<br /><a href="' + content[i].case_study_url + '">Case Study URL</a></div>');
				}
				if (content[i].content_type === "Generic Content Items") {
					var subType = "Generic Content Items";
					jQuery("body").find('#messages').append('<div class="message to ready content-hero"><img src="' + content[i].image_desktop + '" class="content-hero-img-desktop"><img src="' + content[i].image_tablet + '" class="content-hero-img-tablet"><img src="' + content[i].image_mobile + '" class="content-hero-img-mobile"><div class="content-hero-text"><h2>' + content[i].title + '</h2></div><a href="' + content[i].permalink + '" class="btn btn-primary modal-link close-content">Expand section</a></div>');

				}
				loopCount++;
			}
			jQuery('.work-hero-wrapper-' + random + ' .work-hero-row .work-hero-col').each(function (i, e) {
				if (i % 2 == 0) div = jQuery('<div/>').addClass('work-hero-items-row').appendTo('.work-hero-wrapper-' + random + ' .work-hero-row');
				div.append(e);
			});
		}
		
		if (type === "Prompt") {
			for (var i in answers) {
				jQuery("body").find('#messages').append('<div class="option" data-value="' + answers[i].prompt + '"><div class="shortcut-key">' + answers[i].prompt_shortcut_key + '</div>' + answers[i].prompt + '</div>');
			}
		}

		if (type == "Link") {
			jQuery("body").find('#messages').append('<div class="message to ready done link">' + link_response_pre_text + '<a href="' + link_response_url + '" class="message-link" target="_blank">' + link_response_text + '</a></div>');
		}

		if (type === "User Input" || next_field_behaviour === "Next field is user input") {
		} else {
			setTimeout(function () {
				jQuery("body").find('#messages').append('<div class="message to typing"><div class="typing_loader"></div></div>');
			}, 300);
		}

		/* TODO */
		if (type != "Content") {
			scrollPage();
		} else if(subType != "Generic Content Items") {
			var y = jQuery(window).scrollTop();
			jQuery(window).scrollTop(y + 120);
		}

		if (subType === "Generic Content Items") {
			scrollPage();
		}

		/* TODO */
		if (count === length - 1) {
			jQuery(".message.to.typing").addClass('d-none');
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
	if (idleTime > 10) {
		ajaxCall('api?term=user-idol&idol=1');
	}
}

jQuery(function ($) {
	// console.log(jQuery('.dude').attr('src'));

	// setTimeout(function () {
	// 	jQuery('#messages').append('<img src="'+jQuery('.dude').attr('src')+'" class="newdude" />');
	// }, 1200);

	jQuery('#userInput').focus();

	// if (window.location.href.indexOf("q") > -1) {
	// 	api_url = window.siteUrl + '/api?term='+getUrlParameter('q');
	// 	ajaxCall(api_url);
	// 	jQuery('#userInput')
	// } 

	setTimeout(function () {
		jQuery('.person').fadeIn();
	}, 1200);

	// var idleInterval = setInterval(timerIncrement, 10000);

	// $(this).mousemove(function (e) {
	// 	idleTime = 0;
	// });
	// $(this).keypress(function (e) {
	// 	idleTime = 0;
	// });

	jQuery(document).on("mouseenter", ".work-hero-items-row", function () {
		jQuery(this).addClass('work-hero-items-row-hover');
		jQuery('.work-hero', this).addClass('work-hero-hover');
		jQuery('.work-hero-text', this).addClass('work-hero-text-hover');
		jQuery('.btn', this).fadeIn();
	});

	jQuery(document).on("mouseleave", ".work-hero-items-row", function () {
		jQuery('.work-hero-items-row').removeClass('work-hero-items-row-hover');
		jQuery('.work-hero').removeClass('work-hero-hover');
		jQuery('.work-hero-text', this).removeClass('work-hero-text-hover');
		jQuery('.work-hero .btn').hide();
	});
	
	jQuery('body').on('click', '.menu li a', function (event) {
		event.preventDefault();
		jQuery('#userInput').val(jQuery(this).attr('data-trigger'));
		jQuery('.button-submit').click();
	});

	/* TODO SORT THIS */
	jQuery('body').on('click', '.close-modal', function (event) {
		event.preventDefault();
		if (jQuery(this).hasClass('close-content')){ 
			api_url = window.siteUrl+'/api?term=modal-close';
			ajaxCall(api_url);
		}
		if (jQuery(this).hasClass('close-work')){ 
			// api_url = window.siteUrl+'/api?term=modal-close';
			// ajaxCall(api_url);
		}
		jQuery('.convFormDynamic').removeClass('modal-shadow');
		jQuery('.close-modal').hide();
	});

	jQuery('body').on('click', '.modal-link', function (event) {
		event.preventDefault();
		jQuery('.convFormDynamic').addClass('modal-shadow');
		setTimeout(function () {
			jQuery('.close-modal').fadeIn();
		}, 800);
		if (jQuery(this).hasClass('close-work')){ 
			setTimeout(function () {
				jQuery('.close-modal').addClass('close-work');
				jQuery('.close-modal').removeClass('close-content');
			}, 1500);
		}
		if (jQuery(this).hasClass('close-content')){ 
			setTimeout(function () {
				jQuery('.close-modal').addClass('close-content');
				jQuery('.close-modal').removeClass('close-work');
			}, 1500);
		}
	});

	jQuery('body').on('click', '.button-submit', function () {

		// if (jQuery('.person-2').is(":hidden") && jQuery('.person-1').is(":visible")) {
		// 	jQuery('.person-1').fadeOut();
		// 	jQuery('.person-2').fadeIn();
		// } else {
		// 	jQuery('.person-2').fadeOut();
		// }

		jQuery('.person').fadeOut();

		jQuery('.button-submit').removeClass("button-submit-invert");
		if (jQuery('.menu-wrapper').is(":hidden")) {
			jQuery('.logo').removeClass("logo-invert");
		} else {
			jQuery('.logo').removeClass("logo-invert");
			jQuery(".hamburger").toggleClass("is-active");
			jQuery(".hamburger-wrapper").removeClass("hamburger-wrapper-invert");
			jQuery(".hamburger-inner").removeClass("hamburger-inner-invert");
			jQuery('.menu-wrapper').slideToggle();
			// if (jQuery('.menu-wrapper').is(':visible')) {
			// 	jQuery('.menu-wrapper').velocity("slideUp", function () {
			// 		duration: 1500
			// 	});
			// } else {
			// 	jQuery('.menu-wrapper').velocity("slideDown", function () {
			// 		duration: 1500
			// 	});
			// }

			setTimeout(function () {
				jQuery('.logo').removeClass('no-left-border-bottom-radius');
				jQuery('.button-submit').removeClass('no-right-border-bottom-radius');
			}, 400);
		}
		jQuery('.button-arrow').removeClass('button-arrow-invert');
		jQuery('#userInput').focus();
	});

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
			}
			jQuery('.button-arrow').addClass('button-arrow-invert');
		} else {
			jQuery('.button-submit').removeClass("button-submit-invert");
			if (jQuery('.menu-wrapper').is(":hidden")) {
				jQuery('.logo').removeClass("logo-invert");
			}
			jQuery('.button-arrow').removeClass('button-arrow-invert');
		}
	});

	jQuery(".hamburger").on("click", function (e) {

		jQuery(this).toggleClass("is-active");

		jQuery('.menu-wrapper').slideToggle();
		
		// if (jQuery('.menu-wrapper').is(':visible')) {
		// 	jQuery('.menu-wrapper').velocity("slideUp", function () {
		// 		duration: 1500
		// 	});
		// } else {
		// 	jQuery('.menu-wrapper').velocity("slideDown", function () {
		// 		duration: 1500
		// 	});
		// }

		if (jQuery('#userInput').val() === "") {
			jQuery('.logo').toggleClass("logo-invert");
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
										// TODO STORE IN HIDDEN INPUT HERE
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