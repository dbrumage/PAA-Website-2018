<?php get_header(); ?>
<?php if(empty($_SERVER['HTTP_X_REQUESTED_WITH'])) { ?>
    <a href="<?php bloginfo('url'); ?>" class="close-modal-page"></a>
<?php } ?>
<?php the_post(); ?>
<?php the_content(); ?>

<?php
if(empty($_SERVER['HTTP_X_REQUESTED_WITH'])) {
    include "template_parts/chat-input.php"; 
}
?>
<?php get_footer(); ?>
