<?php get_header(); ?>
    <section id="main">
        <div class="container">
            <div class="row">
                <div class="col-12">     
                    <div id="chat">
                        <form action="" method="GET" class="hidden" style="display:none;">
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
                    <div class="menu-wrapper">
                        <div class="menu-inner-wrapper">
                            <div class="menu-col menu-col-left">
                                <div class="menu-col-inner">
                                    <ul class="menu">
                                        <li><a href=""><span class="menu-shortcut-key">A</span>Who we are</a></li>
                                        <li><a href=""><span class="menu-shortcut-key">S</span>What we do</a></li>
                                        <li><a href=""><span class="menu-shortcut-key">W</span>Work we’re proud of</a></li>
                                        <li><a href=""><span class="menu-shortcut-key">C</span>Clients we work with</a></li>
                                        <li><a href=""><span class="menu-shortcut-key">P</span>Partners’ people</a></li>
                                        <li><a href=""><span class="menu-shortcut-key">T</span>Some of our thoughts</a></li>
                                        <li><a href=""><span class="menu-shortcut-key">G</span>Get in touch</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="menu-col menu-col-right">
                                <div class="menu-col-inner">
                                    <p>
                                        2018 © Partners Andrews Aldridge. All rights reserved.
                                        <br />
                                        A part of Engine Group
                                    </p>

                                    <p>
                                        <strong>
                                            Terms & privacy policy
                                            <br />
                                            How we use cookies on this site
                                        </strong>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php get_footer(); ?>
