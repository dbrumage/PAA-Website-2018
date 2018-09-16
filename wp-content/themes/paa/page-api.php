<?php
if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {

    function trigger_posts_where( $where ) {
        global $wpdb;
        $where = str_replace(
            "meta_key = 'trigger_%", 
            "meta_key LIKE 'trigger_%",
            $wpdb->remove_placeholder_escape($where)
        );
        return $where;
    }
    
    add_filter('posts_where', 'trigger_posts_where');

    $post_data = array();
    $args = array(
        'post_type' => 'chat',
        'posts_per_page' => '-1',
        'meta_query' => array(
            array(
                'key'     => 'trigger_%_user_input',
                'value'   => $_GET['term'],
                'compare' => '=',
            ),
        )
    );
    $the_query = new WP_Query($args);

    if ($the_query->post_count>0) {
        while ( $the_query->have_posts() ) : $the_query->the_post();
            while ( have_rows('chat_data') ) : the_row();
                if (get_sub_field('response_type')=="Text") {
                    if (strpos(get_sub_field('text_response'), '|') !== false) {
                        $myString = get_sub_field('text_response');
                        $myArray = explode('|', $myString);
                        $post_data[] = array(
                            'response_type' => get_sub_field('response_type'),
                            'text_response' => $myArray[array_rand($myArray)],
                            'text_response_small_print' => get_sub_field('text_response_small_print'),
                        );
                    } else {
                        $post_data[] = array(
                            'response_type' => get_sub_field('response_type'),
                            'text_response' => get_sub_field('text_response'),
                            'text_response_small_print' => get_sub_field('text_response_small_print'),
                        );
                    }
                } else if (get_sub_field('response_type')=="Prompt") {
                    $prompt_data_array = array();
                    while ( have_rows('prompts') ) : the_row();
                        $prompt_data_array[] = array(
                            'prompt' => get_sub_field('prompt'),
                            'prompt_shortcut_key' => get_sub_field('prompt_shortcut_key')
                        );
                    endwhile;
                    $post_data[] = array(
                        'response_type' => get_sub_field('response_type'),
                        'prompt_data_array' =>  $prompt_data_array
                    );
                } else if (get_sub_field('response_type')=="User Input") {
                    $input_data = array();
                    while ( have_rows('user_input_response') ) : the_row();
                        $input_data_array[] = array(
                            'user_input_response_type' => get_sub_field('user_input_response_type'),
                            'user_input_response_text' => get_sub_field('user_input_response_text')
                        );
                    endwhile;
                    $post_data[] = array(
                        'response_type' => get_sub_field('response_type'),
                        'user_input_data_array' =>  $input_data_array
                    );
                } else if (get_sub_field('response_type')=="Video") {            
                    $post_data[] = array(
                        'response_type' => get_sub_field('response_type'),
                        'video_response' => get_sub_field('video_response')
                    );
                } else if (get_sub_field('response_type')=="Content") {   
                    if (get_sub_field('content_response_type')=="Work List") {
                       $args = array(
                            'post_type' => 'work',
                            'posts_per_page' => '-1'
                        );
                        $the_query = new WP_Query($args);
                        while ( $the_query->have_posts() ) : $the_query->the_post();
                            $content_data_array[] = array(
                                'title' => get_the_title(),
                                'client' => get_field('client'),
                                'case_study' => get_field('case_study'),
                                'image' => get_field('image')
                            );
                        endwhile;
                    }
                    $post_data[] = array(
                        'response_type' => get_sub_field('response_type'),
                        'content_response' => $content_data_array
                    );
                }
            endwhile;
        endwhile;
        echo json_encode( $post_data );

    } else if ($the_query->post_count==0) {
        $args = array(
            'post_type' => 'chat',
            'posts_per_page' => '-1',
            'meta_query' => array(
                array(
                    'key'     => 'trigger_%_user_input',
                    'value'   => "error",
                    'compare' => '=',
                ),
            )
        );
        $the_query = new WP_Query($args);
        while ( $the_query->have_posts() ) : $the_query->the_post();
            while ( have_rows('chat_data') ) : the_row();
                if (get_sub_field('response_type')=="Text") {
                    $myString = get_sub_field('text_response');
                    $myArray = explode('|', $myString);
                    $post_data[] = array(
                        'response_type' => get_sub_field('response_type'),
                        'text_response' => $myArray[array_rand($myArray)]
                    );
                }
            endwhile;
        endwhile;
        echo json_encode( $post_data );
    }

} else {
	wp_redirect( home_url() );
	exit;
}
?>
