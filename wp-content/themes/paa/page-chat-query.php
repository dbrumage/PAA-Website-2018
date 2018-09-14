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
            $requires_answer = "";
            if (get_sub_field('requires_answer')=="true") {
                $requires_answer = 'data-no-answer="'.get_sub_field('requires_answer').'"';
            }
            if (get_sub_field('response_type')=="Text") {
                the_sub_field('text_response');
            }

            if (get_sub_field('response_type')=="Prompt") {
                the_sub_field('prompt_response');
            }
        $i++;
        endwhile;
    endwhile;

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
