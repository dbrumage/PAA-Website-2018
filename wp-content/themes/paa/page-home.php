<?php get_header(); ?>

    <section id="demo">
	    <div class="vertical-align">
	        <div class="container">
	            <div class="row">
	                <div class="col-sm-12">     
                        <div id="chat">
                            <form action="" method="GET" class="hidden">
                                <?php
                                $args = array(
                                    'post_type' => 'chat',
                                    'posts_per_page' => '-1',
                                    'meta_query' => array(
                                        array(
                                            'key'     => 'default_page',
                                            'value'   => 'Home',
                                            'compare' => '=',
                                        ),
                                    )
                                );
                                $the_query = new WP_Query($args);
                                $i = 1;
                                while ( $the_query->have_posts() ) : $the_query->the_post();
                                    while ( have_rows('chat_data') ) : the_row();
                                        $requires_answer = "";
                                        if (get_sub_field('requires_answer')=="true") {
                                            $requires_answer = 'data-no-answer="'.get_sub_field('requires_answer').'"';
                                        }
                                        if (get_sub_field('response_type')=="Text") {
                                            echo '<input type="text" name="home-'.$i.'"  data-conv-question="'.get_sub_field('text_response').'" '.$requires_answer.'>';
                                        }
                                    $i++;
                                    endwhile;
                                endwhile;
                                ?>
                                <!-- <select data-conv-question="Hello! This is an example use of the plugin to dynamically generate questions (like using an API). This is the only question that was written on the initial HTML. To end the loop, select END." name="first-question">
                                    <option value="understood">Understood</option>
                                    <option value="okay">Okay, captain!</option>
                                </select> -->
                                <!-- <input type="text" data-conv-question="convForm also supports regex patterns. Look:" data-no-answer="true">
	                                <input data-conv-question="Type in your e-mail" data-pattern="^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$" id="email" type="email" name="email" required placeholder="What's your e-mail?">
	                                <input data-conv-question="Now tell me a secret (like a password)" type="password" data-minlength="6" id="senha" name="password" required placeholder="password">
									<select data-conv-question="Selects also support callback functions. For example, try one of these:">
											<option value="google" data-callback="google">Google</option>
											<option value="bing" data-callback="bing">Bing</option>
									</select> -->
                            </form>
                        </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>

<?php get_footer(); ?>
