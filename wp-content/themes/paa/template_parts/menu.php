<div class="menu-wrapper">
    <div class="menu-inner-wrapper">
        <div class="menu-col menu-col-left">
            <div class="menu-col-left-inner">
                <ul class="menu">
                <?php
                $args = array(
                    'post_type' => 'navigation',
                    'posts_per_page' => '-1',
                    'orderby' => 'menu_order',
                    'order' => 'ASC'
                );
                $the_query = new WP_Query($args);
                while ( $the_query->have_posts() ) : $the_query->the_post();
                ?>
                    <li><a href="#" data-trigger="<?php the_title(); ?>"><span class="menu-shortcut-key"><?php the_field('shortcut_key'); ?></span><?php the_title(); ?></a></li>
                <?php endwhile; ?>
                </ul>
            </div>
        </div>
        <div class="menu-col menu-col-right">
            <div class="menu-col-right-inner">
                <div class="copyright-footer">
                    <p>
                        2018 © Partners Andrews Aldridge. All rights reserved.
                        <br />
                        A part of <a href="">Engine Group</a>
                    </p>
                    <p>
                        <a href="">Terms & privacy policy</a>
                        <br />
                        <a href="">How we use cookies on this site</a>
                    </p>
                </div>
                <div class="social-footer-menu">
                    <div class="social-footer-menu-item"><a href=""><i class="fab fa-linkedin"></i></a></div>
                    <div class="social-footer-menu-item"><a href=""><i class="fab fa-medium-m"></i></a></div>
                    <div class="social-footer-menu-item"><a href=""><i class="fab fa-instagram"></i></a></div>
                    <div class="social-footer-menu-item"><a href=""><i class="fab fa-facebook"></i></a></div>
                    <div class="social-footer-menu-item"><a href=""><i class="fab fa-twitter"></i></a></div>
                </div>
            </div>
        </div>
    </div>
</div>