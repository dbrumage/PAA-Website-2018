var entityMap = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#39;',
    '/': '&#x2F;',
    '`': '&#x60;',
    '=': '&#x3D;'
};

function escapeHtml(string) {
    return String(string).replace(/[&<>"'`=\/]/g, function (s) {
        return entityMap[s];
    });
}

function SingleConvState(input){
    this.input = input;
    this.answer = '';
    this.next = false;
    return this;
};
SingleConvState.prototype.hasNext = function(){
    return this.next;
};
function ConvState(wrapper, SingleConvState, form, params) {
    this.form = form;
    this.wrapper = wrapper;
    this.current = SingleConvState;
    this.answers = {};
    this.parameters = params;
    this.scrollDown = function() {
        jQuery(this.wrapper).find('#messages').stop().animate({scrollTop: jQuery(this.wrapper).find('#messages')[0].scrollHeight}, 600);
    }.bind(this);
};
ConvState.prototype.newState = function(options) {
    var input = jQuery.extend(true, {}, {
        name: '',
        noAnswer: false,
        required: true,
        questions: ['You forgot the question!'],
        type: 'text',
        multiple: false,
        selected: "",
        answers: []
    }, options);
    input.element = jQuery('<input type="text" name="'+input.name+'"/>');
    return new SingleConvState(input);
};
ConvState.prototype.next = function(){
    if(this.current.input.hasOwnProperty('callback')) {
        window[this.current.input.callback](this);
    }
    if(this.current.hasNext()){
        this.current = this.current.next;
        if(this.current.input.hasOwnProperty('fork') && this.current.input.hasOwnProperty('case')){
            if(this.answers.hasOwnProperty(this.current.input.fork) && this.answers[this.current.input.fork].value != this.current.input.case) {
                return this.next();
            }
            if(!this.answers.hasOwnProperty(this.current.input.fork)) {
                return this.next();
            }
        }
        return true;
    } else {
        return false;
    }
};
ConvState.prototype.printQuestion = function(){
    var questions = this.current.input.questions;
    var question = questions[Math.floor(Math.random() * questions.length)]; //get a random question from questions array
    var ansWithin = question.match(/\{(.*?)\}(\:(\d)*)?/g); // searches for string replacements for answers and replaces them with previous aswers (warning: not checking if answer exists)
    for(var key in ansWithin){
        if(ansWithin.hasOwnProperty(key)){
            var ansKey = ansWithin[key].replace(/\{|\}/g, "");
            var ansFinalKey = ansKey;
            var index = false;
            if(ansKey.indexOf(':')!=-1){
                ansFinalKey = ansFinalKey.split(':')[0];
                index = ansKey.split(':')[1];
            }
            if(index!==false){
                var replacement = this.answers[ansFinalKey].text.split(' ');
                if(replacement.length >= index){
                    question = question.replace(ansWithin[key], replacement[index]);
                } else {
                    question = question.replace(ansWithin[key], this.answers[ansFinalKey].text);
                }
            } else {
                question = question.replace(ansWithin[key], this.answers[ansFinalKey].text);
            }
        }
    }
    var messageObj = jQuery(this.wrapper).find('.message.typing');
    setTimeout(function(){
        messageObj.html(question);
        messageObj.removeClass('typing').addClass('ready');
        if(this.current.input.type=="select"){
            this.printAnswers(this.current.input.answers, this.current.input.multiple);
        }
        this.scrollDown();
        if(this.current.input.hasOwnProperty('noAnswer') && this.current.input.noAnswer===true) {
            if(this.next()){
                setTimeout(function(){
                    var messageObj = jQuery('<div class="message to typing"><div class="typing_loader"></div></div>');
                    jQuery(this.wrapper).find('#messages').append(messageObj);
                    this.scrollDown();
                    this.printQuestion();
                }.bind(this),200);
            } else {
                this.parameters.eventList.onSubmitForm(this);
            }
        }
        jQuery(this.wrapper).find(this.parameters.inputIdHashTagName).focus();
    }.bind(this), 500);
};
ConvState.prototype.printAnswers = function(answers, multiple){
    this.wrapper.find('div.options div.option').remove();
    if(multiple){
        for(var i in answers){
            if(answers.hasOwnProperty(i)){
                var option = jQuery('<div class="option">'+answers[i].text+'</div>')
                    .data("answer", answers[i])
                    .click(function(event){
                        var indexOf = this.current.input.selected.indexOf(jQuery(event.target).data("answer").value);
                        if(indexOf == -1){
                            this.current.input.selected.push(jQuery(event.target).data("answer").value);
                            jQuery(event.target).addClass('selected');
                        } else {
                            this.current.input.selected.splice(indexOf, 1);
                            jQuery(event.target).removeClass('selected');
                        }
                        this.wrapper.find(this.parameters.inputIdHashTagName).removeClass('error');
                        this.wrapper.find(this.parameters.inputIdHashTagName).val('');
                        if(this.current.input.selected.length > 0) {
                            this.wrapper.find('button.submit').addClass('glow');
                        } else {
                            this.wrapper.find('button.submit').removeClass('glow');
                        }
                    }.bind(this));
                this.wrapper.find('div.options').append(option);
                jQuery(window).trigger('dragreset');
            }
        }
    } else {
        for(var i in answers){
            if(answers.hasOwnProperty(i)){
                var option = jQuery('<div class="option">'+answers[i].text+'</div>')
                    .data("answer", answers[i])
                    .click(function(event){
                        this.current.input.selected = jQuery(event.target).data("answer").value;
                        this.wrapper.find(this.parameters.inputIdHashTagName).removeClass('error');
                        this.wrapper.find(this.parameters.inputIdHashTagName).val('');
                        this.answerWith(jQuery(event.target).data("answer").text, jQuery(event.target).data("answer"));
                        this.wrapper.find('div.options div.option').remove();
                    }.bind(this));
                this.wrapper.find('div.options').append(option);
                jQuery(window).trigger('dragreset');
            }
        }
    }
    var diff = jQuery(this.wrapper).find('div.options').height();
    jQuery(this.wrapper).find('#messages').css({paddingBottom: diff});

};
ConvState.prototype.answerWith = function(answerText, answerObject) {
    //console.log('previous answer: ', answerObject);
    //puts answer inside answers array to give questions access to previous answers
    if(this.current.input.hasOwnProperty('name')){
        if(typeof answerObject == 'string') {
            if(this.current.input.type == 'tel')
                answerObject = answerObject.replace(/\s|\(|\)|-/g, "");
            this.answers[this.current.input.name] = {text: answerText, value: answerObject};
            this.current.answer = {text: answerText, value: answerObject};
            //console.log('previous answer: ', answerObject);
        } else {
            this.answers[this.current.input.name] = answerObject;
            this.current.answer = answerObject;
        }
        if(this.current.input.type == 'select' && !this.current.input.multiple) {
            jQuery(this.current.input.element).val(answerObject.value).change();
        } else {
            jQuery(this.current.input.element).val(answerObject).change();
        }
    }
    //prints answer within messages wrapper
    if(this.current.input.type == 'password')
        answerText = answerText.replace(/./g, '*');
    var message = jQuery('<div class="message from">' +escapeHtml(answerText)+'</div>');

    //removes options before appending message so scroll animation runs without problems
    jQuery(this.wrapper).find("div.options div.option").remove();


    var diff = jQuery(this.wrapper).find('div.options').height();
    jQuery(this.wrapper).find('#messages').css({paddingBottom: diff});
    jQuery(this.wrapper).find(this.parameters.inputIdHashTagName).focus();
    if (answerObject.hasOwnProperty('callback')) {
        window[answerObject.callback](this);
    }
    setTimeout(function(){
        jQuery(this.wrapper).find("#messages").append(message);
        this.scrollDown();
    }.bind(this), 100);

    jQuery(this.form).append(this.current.input.element);
    var messageObj = jQuery('<div class="message to typing"><div class="typing_loader"></div></div>');
    setTimeout(function(){
        jQuery(this.wrapper).find('#messages').append(messageObj);
        this.scrollDown();
    }.bind(this), 150);

    this.parameters.eventList.onInputSubmit(this, function(){
        //goes to next state and prints question
        if(this.next()){
            setTimeout(function(){
                this.printQuestion();
            }.bind(this), 300);
        } else {
            this.parameters.eventList.onSubmitForm(this);
        }
    }.bind(this));
};

(function(jQuery){
    jQuery.fn.convform = function(options){
        var wrapper = this;
        jQuery(this).addClass('conv-form-wrapper');

        var parameters = jQuery.extend(true, {}, {
            placeHolder : 'Type Here',
            typeInputUi : 'textarea',
            timeOutFirstQuestion : 1200,
            buttonClassStyle : 'icon2-arrow',
            eventList : {
                onSubmitForm : function(convState) {
                    console.log('completed');
                    convState.form.submit();
                    return true;
                },
                onInputSubmit : function(convState, readyCallback) {readyCallback()}
            },
            formIdName : 'convForm',
            inputIdName : 'userInput',
            loadSpinnerVisible : '',
            buttonText: '→'
        }, options);

        /*
        * this will create an array with all inputs, selects and textareas found
        * inside the wrapper, in order of appearance
        */
        var inputs = jQuery(this).find('input, select, textarea').map(function(){
            var input = {};
            if(jQuery(this).attr('name'))
                input['name'] = jQuery(this).attr('name');
            if(jQuery(this).attr('data-no-answer'))
                input['noAnswer'] = true;
            if(jQuery(this).attr('required'))
                input['required'] = true;
            if(jQuery(this).attr('type'))
                input['type'] = jQuery(this).attr('type');
            input['questions'] = jQuery(this).attr('data-conv-question').split("|");
            if(jQuery(this).attr('data-pattern'))
                input['pattern'] = jQuery(this).attr('data-pattern');
            if(jQuery(this).attr('data-callback'))
                input['callback'] = jQuery(this).attr('data-callback');
            if(jQuery(this).is('select')) {
                input['type'] = 'select';
                input['answers'] = jQuery(this).find('option').map(function(){
                    var answer = {};
                    answer['text'] = jQuery(this).text();
                    answer['value'] = jQuery(this).val();
                    if(jQuery(this).attr('data-callback'))
                        answer['callback'] = jQuery(this).attr('data-callback');
                    return answer;
                }).get();
                if(jQuery(this).prop('multiple')){
                    input['multiple'] = true;
                    input['selected'] = [];
                } else {
                    input['multiple'] = false;
                    input['selected'] = "";
                }
            }
            if(jQuery(this).parent('div[data-conv-case]').length) {
                input['case'] = jQuery(this).parent('div[data-conv-case]').attr('data-conv-case');
                input['fork'] = jQuery(this).parent('div[data-conv-case]').parent('div[data-conv-fork]').attr('data-conv-fork');
            }
            input['element'] = this;
            jQuery(this).detach();
            return input;
        }).get();

        if(inputs.length) {
            //hides original form so users cant interact with it
            var form = jQuery(wrapper).find('form').hide();

            var inputForm;
            parameters.inputIdHashTagName = '#' + parameters.inputIdName;

            switch(parameters.typeInputUi) {
                case 'input':
                    inputForm = jQuery('<form id="' + parameters.formIdName + '" class="convFormDynamic"><div class="options dragscroll"></div><input id="' + parameters.inputIdName + '" type="text" placeholder="'+ parameters.placeHolder +'" class="userInputDynamic"></><button type="submit" class="submit">'+parameters.buttonText+'</button><span class="clear"></span></form>');
                    break;
                case 'textarea':
                    inputForm = jQuery('<form id="' + parameters.formIdName + '" class="convFormDynamic"><div class="options dragscroll"></div><textarea id="' + parameters.inputIdName + '" rows="1" placeholder="'+ parameters.placeHolder +'" class="userInputDynamic"></textarea><button type="submit" class="submit">'+parameters.buttonText+'</button><span class="clear"></span></form>');
                    break;
                default :
                    console.log('typeInputUi must be input or textarea');
                    return false;
            }

            //appends messages wrapper and newly created form with the spinner load
            jQuery(wrapper).append('<div class="wrapper-messages"><div class="spinLoader ' + parameters.loadSpinnerVisible + ' "></div><div id="messages"></div></div>');
            jQuery(wrapper).append(inputForm);

            //creates new single state with first input
            var singleState = new SingleConvState(inputs[0]);
            //creates new wrapper state with first singlestate as current and gives access to wrapper element
            var state = new ConvState(wrapper, singleState, form, parameters);
            //creates all new single states with inputs in order
            for(var i in inputs) {
                if(i != 0 && inputs.hasOwnProperty(i)){
                    singleState.next = new SingleConvState(inputs[i]);
                    singleState = singleState.next;
                }
            }

            //prints first question
            setTimeout(function() {
                jQuery.when(jQuery('div.spinLoader').addClass('d-none')).done(function() {
                    var messageObj = jQuery('<div class="message to typing"><div class="typing_loader"></div></div>');
                    jQuery(state.wrapper).find('#messages').append(messageObj);
                    state.scrollDown();
                    state.printQuestion();
                });
            }, parameters.timeOutFirstQuestion);

            //binds enter to answer submit and change event to search for select possible answers
            jQuery(inputForm).find(parameters.inputIdHashTagName).keypress(function(e){
                if(e.which == 13) {
                    var input = jQuery(this).val();
                    e.preventDefault();
                    if(state.current.input.type=="select" && !state.current.input.multiple){
                        if(state.current.input.required) {
                            state.wrapper.find('#userInputBot').addClass('error');
                        } else {
                            var results = state.current.input.answers.filter(function (el) {
                                return el.text.toLowerCase().indexOf(input.toLowerCase()) != -1;
                            });
                            if (results.length) {
                                state.current.input.selected = results[0];
                                jQuery(this).parent('form').submit();
                            } else {
                                state.wrapper.find(parameters.inputIdHashTagName).addClass('error');
                            }
                        }
                    } else if(state.current.input.type=="select" && state.current.input.multiple) {
                        if(input.trim() != "") {
                            var results = state.current.input.answers.filter(function(el){
                                return el.text.toLowerCase().indexOf(input.toLowerCase()) != -1;
                            });
                            if(results.length){
                                if(state.current.input.selected.indexOf(results[0].value) == -1){
                                    state.current.input.selected.push(results[0].value);
                                    state.wrapper.find(parameters.inputIdHashTagName).val("");
                                } else {
                                    state.wrapper.find(parameters.inputIdHashTagName).val("");
                                }
                            } else {
                                state.wrapper.find(parameters.inputIdHashTagName).addClass('error');
                            }
                        } else {
                            if(state.current.input.selected.length) {
                                jQuery(this).parent('form').submit();
                            }
                        }
                    } else {
                        if(input.trim()!='' && !state.wrapper.find(parameters.inputIdHashTagName).hasClass("error")) {
                            jQuery(this).parent('form').submit();
                        } else {
                            jQuery(state.wrapper).find(parameters.inputIdHashTagName).focus();
                        }
                    }
                }
                autosize.update(jQuery(state.wrapper).find(parameters.inputIdHashTagName));
            }).on('input', function(e){
                if(state.current.input.type=="select"){
                    var input = jQuery(this).val();
                    var results = state.current.input.answers.filter(function(el){
                        return el.text.toLowerCase().indexOf(input.toLowerCase()) != -1;
                    });
                    if(results.length){
                        state.wrapper.find(parameters.inputIdHashTagName).removeClass('error');
                        state.printAnswers(results, state.current.input.multiple);
                    } else {
                        state.wrapper.find(parameters.inputIdHashTagName).addClass('error');
                    }
                } else if(state.current.input.hasOwnProperty('pattern')) {
                    var reg = new RegExp(state.current.input.pattern, 'i');
                    if(reg.test(jQuery(this).val())) {
                        state.wrapper.find(parameters.inputIdHashTagName).removeClass('error');
                    } else {
                        state.wrapper.find(parameters.inputIdHashTagName).addClass('error');
                    }
                }
            });

            jQuery(inputForm).find('button.submit').click(function(e){
                var input = jQuery(state.wrapper).find(parameters.inputIdHashTagName).val();
                e.preventDefault();
                if(state.current.input.type=="select" && !state.current.input.multiple){
                    if(state.current.input.required) {
                        return false;
                    } else {
                        if (input == parameters.placeHolder) input = '';
                        var results = state.current.input.answers.filter(function (el) {
                            return el.text.toLowerCase().indexOf(input.toLowerCase()) != -1;
                        });
                        if (results.length) {
                            state.current.input.selected = results[0];
                            jQuery(this).parent('form').submit();
                        } else {
                            state.wrapper.find(parameters.inputIdHashTagName).addClass('error');
                        }
                    }
                } else if(state.current.input.type=="select" && state.current.input.multiple) {
                    if(state.current.input.required) {
                        return false;
                    } else {
                        if (input.trim() != "" && input != parameters.placeHolder) {
                            var results = state.current.input.answers.filter(function (el) {
                                return el.text.toLowerCase().indexOf(input.toLowerCase()) != -1;
                            });
                            if (results.length) {
                                if (state.current.input.selected.indexOf(results[0].value) == -1) {
                                    state.current.input.selected.push(results[0].value);
                                    state.wrapper.find(parameters.inputIdHashTagName).val("");
                                } else {
                                    state.wrapper.find(parameters.inputIdHashTagName).val("");
                                }
                            } else {
                                state.wrapper.find(parameters.inputIdHashTagName).addClass('error');
                            }
                        } else {
                            if (state.current.input.selected.length) {
                                jQuery(this).removeClass('glow');
                                jQuery(this).parent('form').submit();
                            }
                        }
                    }
                } else {
                    if(input.trim() != '' && !state.wrapper.find(parameters.inputIdHashTagName).hasClass("error")){
                        jQuery(this).parent('form').submit();
                    } else {
                        jQuery(state.wrapper).find(parameters.inputIdHashTagName).focus();
                    }
                }
                autosize.update(jQuery(state.wrapper).find(parameters.inputIdHashTagName));
            });

            //binds form submit to state functions
            jQuery(inputForm).submit(function(e){
                e.preventDefault();
                var answer = jQuery(this).find(parameters.inputIdHashTagName).val();
                jQuery(this).find(parameters.inputIdHashTagName).val("");
                if(state.current.input.type == 'select'){
                    if(!state.current.input.multiple){
                        state.answerWith(state.current.input.selected.text, state.current.input.selected);
                    } else {
                        state.answerWith(state.current.input.selected.join(', '), state.current.input.selected);
                    }
                } else {
                    state.answerWith(answer, answer);
                }
            });


            if(typeof autosize == 'function') {
                jQuerytextarea = jQuery(state.wrapper).find(parameters.inputIdHashTagName);
                autosize(jQuerytextarea);
            }

            return state;
        } else {
            return false;
        }
    }
})( jQuery );
