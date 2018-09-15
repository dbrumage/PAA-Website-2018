<?php
if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {

	// if ($_GET['cid']!="") {
	// 	$args = array(
	// 		'post_type' => 'currencies',
	// 		'posts_per_page' => '1',
	// 		'p' => $_GET['cid']
	// 	);
	// 	$the_query = new WP_Query($args);
	// 	while ( $the_query->have_posts() ) : $the_query->the_post();
	// 		$symbol = get_field('currency_symbol');
	// 	endwhile;

	// 	$array = array(
	// 		'symbol' => $symbol
	// 	);

	// 	echo json_encode($array);
    // }
    
    $post_data = array();
    $args = array(
        'post_type' => 'chat',
        'posts_per_page' => '-1',
        'meta_query' => array(
            array(
                'key'     => 'user_input',
                'value'   => $_GET['term'],
                'compare' => 'LIKE',
            ),
        )
    );
    $the_query = new WP_Query($args);
    $i = 1;
    while ( $the_query->have_posts() ) : $the_query->the_post();
        while ( have_rows('chat_data') ) : the_row();

            if (get_sub_field('response_type')=="Text") {
                $post_data[] = array(
                    'response_type' => get_sub_field('response_type'),
                    'requires_answer' => get_sub_field('requires_answer'),
                    'text_response' => get_sub_field('text_response'),
                    'text_response_small_print' => get_sub_field('text_response_small_print'),
                );
            } else if (get_sub_field('response_type')=="Prompt") {
                $prompt_data = array();
                while ( have_rows('prompts') ) : the_row();
                // $prompt_data_array[] = array(
                //     'prompt' => get_sub_field('prompt'),
                //     'prompt_shortcut_key' => get_sub_field('prompt_shortcut_key')
                // );

                $prompt_data_array[] = array(
                    'text' => get_sub_field('prompt'),
                    'value' => get_sub_field('prompt_shortcut_key')
                );
                endwhile;

                $post_data[] = array(
                    'response_type' => get_sub_field('response_type'),
                    'requires_answer' => get_sub_field('requires_answer'),
                    'prompt_response' => get_sub_field('prompt_response'),
                    'prompt_response_small_print' => get_sub_field('prompt_response_small_print'),
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
                    'requires_answer' => get_sub_field('requires_answer'),
                    'user_input_data_array' =>  $input_data_array
                );
            } else if (get_sub_field('response_type')=="Video") {            
                $post_data[] = array(
                    'response_type' => get_sub_field('response_type'),
                    'requires_answer' => get_sub_field('requires_answer'),
                    'video_response' => get_sub_field('video_response')
                );
            }

            // $requires_answer = "";
            // if (get_sub_field('requires_answer')=="true") {
            //     $requires_answer = 'data-no-answer="'.get_sub_field('requires_answer').'"';
            // }

            // if (get_sub_field('response_type')=="Text") {
            //     the_sub_field('text_response');
            // }

            // if (get_sub_field('response_type')=="Prompt") {
            //     the_sub_field('prompt_response');
            // }
        $i++;
        endwhile;
    endwhile;
    echo json_encode( $post_data );

    // ERROR MESSAGES
    if ($the_query->post_count==0) {
        $args = array(
            'post_type' => 'chat',
            'posts_per_page' => '-1',
            'meta_query' => array(
                array(
                    'key'     => 'user_input',
                    'value'   => "error",
                    'compare' => '=',
                ),
            )
        );
        $the_query2 = new WP_Query($args);
        $i = 1;
        while ( $the_query2->have_posts() ) : $the_query2->the_post();
            while ( have_rows('chat_data') ) : the_row();
                if (get_sub_field('response_type')=="Text") {
                    $myString = get_sub_field('text_response');
                    $myArray = explode('|', $myString);
                    echo $myArray[array_rand($myArray)];
                }
            $i++;
            endwhile;
        endwhile;
    }


    // echo $_GET['term'];

} else {
	wp_redirect( home_url() );
	exit;
}
?>
