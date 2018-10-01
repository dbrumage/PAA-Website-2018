<?php get_header(); ?>
<?php the_post(); ?>
<?php the_content(); ?>
    <section id="main">
        <img src="<?php bloginfo('template_url'); ?>/assets/images/dude-1.png" class="person-1" />
        <div class="container">
            <div class="row">
                <div class="col-12">     
                    <div id="chat">
                        <form action="" method="GET" class="d-none">
                            <?php
                            if ($_GET['q']!="") {
                            
                            } else {
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
                                        if (get_sub_field('response_type')=="Text") {
                                            echo '<input type="text" name="home-'.$i.'"  data-conv-question="'.get_sub_field('text_response').'" data-no-answer="true">';
                                        }
                                    $i++;
                                    endwhile;
                                endwhile;
                            }
                            ?>
                        </form>
                        <?php
                        if ($_GET['q']!="") {
                            echo '<div class="wrapper-messages"><div id="messages"></div></div>';
                        }
                        ?>
                    </div>
                </div>
            </div>
        </div>
	</section>
   <?php include "template_parts/chat-input.php"; ?>
<?php get_footer(); ?>
