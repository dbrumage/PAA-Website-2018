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
                            </form>
                        </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
<?php get_footer(); ?>
