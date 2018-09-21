<?php get_header(); ?>
    <section id="main">
        <div class="container">
            <div class="row">
                <div class="col-12">     
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
                                    if (get_sub_field('response_type')=="Text") {
                                        echo '<input type="text" name="home-'.$i.'"  data-conv-question="'.get_sub_field('text_response').'" data-no-answer="true">';
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
	</section>
    <div class="wrapper-user-input">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <form class="convFormDynamic" id="convForm" name="convForm">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text logo">
                                    <img src="<?php echo bloginfo('template_url'); ?>/assets/images/logo-1.png" class="logo-1">
                                    <img src="<?php echo bloginfo('template_url'); ?>/assets/images/logo-2.png" class="logo-2">
                                </span>
                                <span class="input-group-text hamburger-wrapper">
                                <button class="hamburger hamburger--boring" type="button">
                                    <span class="hamburger-box">
                                        <span class="hamburger-inner"></span>
                                    </span>
                                </button>
                                </span>
                            </div>
                            <input autocomplete="off" class="form-control" id="userInput" placeholder="" type="text">
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary button-submit" type="submit">
                                    <img src="<?php echo bloginfo('template_url'); ?>/assets/images/arrow-1.png" class="arrow-1">
                                    <img src="<?php echo bloginfo('template_url'); ?>/assets/images/arrow-2.png" class="arrow-2">
                                </button>
                            </div>
                        </div>
                    </form>
                    <div class="menu-wrapper"></div>
                </div>
            </div>
        </div>
    </div>
<?php get_footer(); ?>
