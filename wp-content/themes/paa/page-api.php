<?php
if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest' && defined('ABSPATH') ) {

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

    if ($_GET['contact']==1) {
        $args = array(
            'post_type' => 'chat',
            'posts_per_page' => '-1',
            'meta_query' => array(
                'relation' => 'AND',
                array(
                    'key'     => 'trigger_%_user_input',
                    'value'   => $_GET['term'],
                    'compare' => '=',
                ),
                array(
                    'key'     => 'dialog_type',
                    'value'   => 'User Input Error',
                    'compare' => '=',
                )
            )
        );
    } else if ($_GET['idol']==1) {
        $args = array(
            'post_type' => 'chat',
            'posts_per_page' => '-1',
            'meta_query' => array(
                'relation' => 'AND',
                array(
                    'key'     => 'trigger_%_user_input',
                    'value'   => $_GET['term'],
                    'compare' => '=',
                ),
                array(
                    'key'     => 'dialog_type',
                    'value'   => 'Follow Up',
                    'compare' => '=',
                )
            )
        );
    } else {
        $args = array(
            'post_type' => 'chat',
            'posts_per_page' => '-1',
            'meta_query' => array(
                'relation' => 'AND',
                array(
                    'key'     => 'trigger_%_user_input',
                    'value'   => $_GET['term'],
                    'compare' => '=',
                ),
                array(
                    'key'     => 'dialog_type',
                    'value'   => 'Response',
                    'compare' => '=',
                )
            )
        );
    }

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
                            'next_field_behaviour' => get_sub_field('next_field_behaviour'),
                            'text_response' => $myArray[array_rand($myArray)],
                            'text_response_small_print' => get_sub_field('text_response_small_print'),
                        );
                    } else {
                        $post_data[] = array(
                            'response_type' => get_sub_field('response_type'),
                            'next_field_behaviour' => get_sub_field('next_field_behaviour'),
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
                        'next_field_behaviour' => get_sub_field('next_field_behaviour'),
                        'prompt_data_array' =>  $prompt_data_array
                    );
                } else if (get_sub_field('response_type')=="User Input") {
                    $post_data[] = array(
                        'response_type' => get_sub_field('response_type'),
                        'next_field_behaviour' => get_sub_field('next_field_behaviour'),
                        'user_input_response_type' => get_sub_field('user_input_response_type'),
                        'user_input_response_text' => get_sub_field('user_input_response_text')
                    );
                } else if (get_sub_field('response_type')=="Video") {            
                    $post_data[] = array(
                        'response_type' => get_sub_field('response_type'),
                        'next_field_behaviour' => get_sub_field('next_field_behaviour'),
                        'video_response' => get_sub_field('video_response')
                    );
                } else if (get_sub_field('response_type')=="Image") {            
                    $post_data[] = array(
                        'response_type' => get_sub_field('response_type'),
                        'next_field_behaviour' => get_sub_field('next_field_behaviour'),
                        'image_response' => get_sub_field('image_response')
                    );
                } else if (get_sub_field('response_type')=="HTML") {            
                    $post_data[] = array(
                        'response_type' => get_sub_field('response_type'),
                        'next_field_behaviour' => get_sub_field('next_field_behaviour'),
                        'html_response' => get_sub_field('html_response')
                    );
                } else if (get_sub_field('response_type')=="Link") {            
                    $post_data[] = array(
                        'response_type' => get_sub_field('response_type'),
                        'next_field_behaviour' => get_sub_field('next_field_behaviour'),
                        'link_response_pre_text' => get_sub_field('link_response_pre_text'),
                        'link_response_text' => get_sub_field('link_response_text'),
                        'link_response_url' => get_sub_field('link_response_url')
                    );
                } else if (get_sub_field('response_type')=="Content") {   
                    if (get_sub_field('content_response_type')=="Work List") {
                        $args = array(
                            'post_type' => 'work',
                            'posts_per_page' => '-1'
                        );
                        $the_query = new WP_Query($args);
                        while ( $the_query->have_posts() ) : $the_query->the_post();
                            if (get_field('case_study')!="") {
                                $csTitle = get_the_title(get_field('case_study'));
                                $csUrl = get_the_permalink(get_field('case_study'));
                            } else {
                                $csTitle = "";
                                $csUrl = "";
                            }
                            $content_data_array[] = array(
                                'title' => get_the_title(),
                                'client' => get_the_title(get_field('client')),
                                'client_logo' => get_field('image', get_field('client')),
                                'case_study_url' => $csUrl,
                                'case_study_title' => $csTitle,
                                'image' => get_field('image'),
                                'content_type' => 'Work List'
                            );
                        endwhile;
                    } else if (get_sub_field('content_response_type')=="Work Items") {
                        $args = array(
                            'post_type' => 'work',
                            'post__in' => get_sub_field('work_items'),
                            'posts_per_page' => '-1'
                        );
                        $the_query = new WP_Query($args);
                        while ( $the_query->have_posts() ) : $the_query->the_post();
                            if (get_field('case_study')!="") {
                                $csTitle = get_the_title(get_field('case_study'));
                                $csUrl = get_the_permalink(get_field('case_study'));
                            } else {
                                $csTitle = "";
                                $csUrl = "";
                            }
                            $content_data_array[] = array(
                                'title' => get_the_title(),
                                'client' => get_the_title(get_field('client')),
                                'client_logo' => get_field('image', get_field('client')),
                                'case_study_url' => $csUrl,
                                'case_study_title' => $csTitle,
                                'image' => get_field('image'),
                                'content_type' => 'Work Items'
                            );
                        endwhile;
                    } else if (get_sub_field('content_response_type')=="Generic Content Items") {
                        $args = array(
                            'post_type' => 'page',
                            'post__in' => get_sub_field('generic_content_items'),
                            'posts_per_page' => '-1'
                        );
                        $the_query = new WP_Query($args);
                        while ( $the_query->have_posts() ) : $the_query->the_post();
                            $content_data_array[] = array(
                                'title' => get_the_title(get_the_ID()),
                                'permalink' => get_the_permalink(get_the_ID()),
                                'image_desktop' => get_field('image_desktop', get_the_ID()),
                                'image_tablet' => get_field('image_tablet', get_the_ID()),
                                'image_mobile' => get_field('image_mobile', get_the_ID()),
                                'content_type' => 'Generic Content Items'
                            );
                        endwhile;
                    } else if (get_sub_field('content_response_type')=="Client List") {
                        $args = array(
                            'post_type' => 'clients',
                            'posts_per_page' => '-1'
                        );
                        $the_query = new WP_Query($args);
                        while ( $the_query->have_posts() ) : $the_query->the_post();
                            $content_data_array[] = array(
                                'title' => get_the_title($postId),
                                'case_study_url' => get_the_permalink(get_field('case_study')),
                                'case_study_title' => get_the_title(get_field('case_study')),
                                'link_type' => get_field('link_type', $postId),
                                'link_text' => get_field('link_text', $postId),
                                'image' => get_field('image_colour', $postId),
                                'content_type' => 'Client List',
                                'work_items' => "blh"
                            );
                        endwhile;
                    } else if (get_sub_field('content_response_type')=="Client Items") {
                        $args = array(
                            'post_type' => 'clients',
                            'post__in' => get_sub_field('client_items'),
                            'posts_per_page' => '-1'
                        );
                        $the_query = new WP_Query($args);
                        while ( $the_query->have_posts() ) : $the_query->the_post();
                            $content_data_array[] = array(
                                'title' => get_the_title($postId),
                                'case_study_url' => get_the_permalink(get_field('case_study')),
                                'case_study_title' => get_the_title(get_field('case_study')),
                                'link_type' => get_field('link_type', $postId),
                                'link_text' => get_field('link_text', $postId),
                                'image' => get_field('image_colour', $postId),
                                'content_type' => 'Client Items',
                                'work_items' => "blh"
                            );
                        endwhile;
                    } else if (get_sub_field('content_response_type')=="Case Study List") {
                        $args = array(
                            'post_type' => 'case_studies',
                            'posts_per_page' => '-1'
                        );
                        $the_query = new WP_Query($args);
                        while ( $the_query->have_posts() ) : $the_query->the_post();
                            $content_data_array[] = array(
                                'title' => get_the_title(),
                                'case_study_url' => get_the_permalink(),
                                'image' => get_field('image'),
                                'content_type' => 'Case Study List'
                            );
                        endwhile;
                    } else if (get_sub_field('content_response_type')=="Case Study Items") {
                        $args = array(
                            'post_type' => 'case_studies',
                            'post__in' => get_sub_field('case_study_items'),
                            'posts_per_page' => '-1'
                        );
                        $the_query = new WP_Query($args);
                        while ( $the_query->have_posts() ) : $the_query->the_post();
                            $content_data_array[] = array(
                                'title' => get_the_title(),
                                'case_study_url' => get_the_permalink(),
                                'image' => get_field('image'),
                                'content_type' => 'Case Study Items'
                            );
                        endwhile;
                    }
                    $post_data[] = array(
                        'response_type' => get_sub_field('response_type'),
                        'next_field_behaviour' => get_sub_field('next_field_behaviour'),
                        'content_response' => $content_data_array
                    );
                }
            endwhile;
        endwhile;

        echo json_encode( $post_data );

    } else if ($the_query->post_count==0 && $_GET['contact']!=1) {
        $args = array(
            'post_type' => 'chat',
            'posts_per_page' => '-1',
            'meta_query' => array(
                'relation' => 'AND',
                array(
                    'key'     => 'trigger_%_user_input',
                    'value'   => 'error',
                    'compare' => '=',
                ),
                array(
                    'key'     => 'dialog_type',
                    'value'   => 'General Error',
                    'compare' => '=',
                )
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
                        'next_field_behaviour' => get_sub_field('next_field_behaviour'),
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
