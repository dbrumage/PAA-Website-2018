<?php

if (!defined('ABSPATH')) exit;
/**
 * Sets up theme defaults and registers support for various WordPress features.
 */
function paa_setup() {
    /**
     * Enqueue styles.
     */
    function load_styles()
    {
        wp_enqueue_style(
            'bootstrap',
            get_template_directory_uri() . '/assets/css/bootstrap.min.css',
            array(),
            '4.1.0'
        );

        // wp_enqueue_style(
        //     'styles',
        //     get_template_directory_uri() . '/assets/css/styles.css',
        //     array(),
        //     '1.0.0'
        // );

    }
    add_action( 'wp_enqueue_scripts', 'load_styles' );

    /**
     * Enqueue scripts.
     */
    function load_scripts()
    {
        wp_enqueue_script(
            'bootstrap',
            get_template_directory_uri() . '/assets/js/bootstrap.min.js',
            array('jquery'),
            '4.1.0',
            true
        );

        // wp_enqueue_script(
        //     'custom-scripts',
        //     get_template_directory_uri() . '/assets/js/scripts.js',
        //     array('jquery'),
        //     '1.0.0',
        //     true
        // );
    }
    add_action( 'wp_enqueue_scripts', 'load_scripts' );

    /**
     * Register Work Post Type
     */
    function post_type_work() {

        $labels = array(
            'name'                => _x( 'Work', 'Post Type General Name', 'post_type_work' ),
            'singular_name'       => _x( 'Work', 'Post Type Singular Name', 'post_type_work' ),
            'menu_name'           => __( 'Work', 'post_type_work' ),
            'parent_item_colon'   => __( 'Parent Work Item:', 'post_type_work' ),
            'all_items'           => __( 'All Work', 'post_type_work' ),
            'view_item'           => __( 'View Work Item', 'post_type_work' ),
            'add_new_item'        => __( 'Add Work', 'post_type_work' ),
            'add_new'             => __( 'Add Work', 'post_type_work' ),
            'edit_item'           => __( 'Edit Work', 'post_type_work' ),
            'update_item'         => __( 'Update Work', 'post_type_work' ),
            'search_items'        => __( 'Search Work', 'post_type_work' ),
            'not_found'           => __( 'Not found', 'post_type_work' ),
            'not_found_in_trash'  => __( 'Not found in Trash', 'post_type_work' ),
        );
        $args = array(
            'label'               => __( 'work', 'work' ),
            'description'         => __( 'Work', 'work' ),
            'labels'              => $labels,
            'supports'            => array( 'title', 'page-attributes', 'editor', 'author', 'excerpt', ),
            'hierarchical'        => true,
            'public'              => true,
            'show_ui'             => true,
            'show_in_menu'        => true,
            'show_in_nav_menus'   => true,
            'show_in_admin_bar'   => true,
            'menu_position'       => 20,
            'can_export'          => true,
            'has_archive'         => true,
            'exclude_from_search' => false,
            'publicly_queryable'  => true,
            'capability_type'     => 'page',
            'menu_icon'           => 'dashicons-laptop',
            'show_in_rest'        => true,
  		    'rest_base'           => 'work-api',
  		    'rest_controller_class' => 'WP_REST_Posts_Controller',
            'rewrite' => array('slug' => '/work','with_front' => FALSE)
        );
        register_post_type( 'work', $args );
    }
    add_action( 'init', 'post_type_work', 0 );

    /**
     * Register Case Studies Post Type
     */
    function post_type_case_studies() {

        $labels = array(
            'name'                => _x( 'Case Studies', 'Post Type General Name', 'post_type_case_studies' ),
            'singular_name'       => _x( 'Case Study', 'Post Type Singular Name', 'post_type_case_studies' ),
            'menu_name'           => __( 'Case Studies', 'post_type_case_studies' ),
            'parent_item_colon'   => __( 'Parent Case Study:', 'post_type_case_studies' ),
            'all_items'           => __( 'All Case Studies', 'post_type_case_studies' ),
            'view_item'           => __( 'View Case Study', 'post_type_case_studies' ),
            'add_new_item'        => __( 'Add Case Study', 'post_type_case_studies' ),
            'add_new'             => __( 'Add Case Study', 'post_type_case_studies' ),
            'edit_item'           => __( 'Edit Case Study', 'post_type_case_studies' ),
            'update_item'         => __( 'Update Case Study', 'post_type_case_studies' ),
            'search_items'        => __( 'Search Case Studies', 'post_type_case_studies' ),
            'not_found'           => __( 'Not found', 'post_type_case_studies' ),
            'not_found_in_trash'  => __( 'Not found in Trash', 'post_type_case_studies' ),
        );
        $args = array(
            'label'               => __( 'case-studies', 'case-studies' ),
            'description'         => __( 'Case Studies', 'case-studies' ),
            'labels'              => $labels,
            'supports'            => array( 'title', 'page-attributes', 'editor', 'author', 'excerpt', ),
            'hierarchical'        => true,
            'public'              => true,
            'show_ui'             => true,
            'show_in_menu'        => true,
            'show_in_nav_menus'   => true,
            'show_in_admin_bar'   => true,
            'menu_position'       => 20,
            'can_export'          => true,
            'has_archive'         => true,
            'exclude_from_search' => false,
            'publicly_queryable'  => true,
            'capability_type'     => 'page',
            'menu_icon'           => 'dashicons-schedule',
            'show_in_rest'        => true,
  		    'rest_base'           => 'casestudies-api',
  		    'rest_controller_class' => 'WP_REST_Posts_Controller',
            'rewrite' => array('slug' => '/case-study','with_front' => FALSE)
        );
        register_post_type( 'case_studies', $args );
    }
    add_action( 'init', 'post_type_case_studies', 0 );

    /**
     * Register Clients Post Type
     */
    function post_type_clients() {

        $labels = array(
            'name'                => _x( 'Clients', 'Post Type General Name', 'post_type_clients' ),
            'singular_name'       => _x( 'Client', 'Post Type Singular Name', 'post_type_clients' ),
            'menu_name'           => __( 'Clients', 'post_type_clients' ),
            'parent_item_colon'   => __( 'Parent Client:', 'post_type_clients' ),
            'all_items'           => __( 'All Clients', 'post_type_clients' ),
            'view_item'           => __( 'View Client', 'post_type_clients' ),
            'add_new_item'        => __( 'Add Client', 'post_type_clients' ),
            'add_new'             => __( 'Add Client', 'post_type_clients' ),
            'edit_item'           => __( 'Edit Client', 'post_type_clients' ),
            'update_item'         => __( 'Update Client', 'post_type_clients' ),
            'search_items'        => __( 'Search Clients', 'post_type_clients' ),
            'not_found'           => __( 'Not found', 'post_type_clients' ),
            'not_found_in_trash'  => __( 'Not found in Trash', 'post_type_clients' ),
        );
        $args = array(
            'label'               => __( 'clients', 'clients' ),
            'description'         => __( 'Clients', 'clients' ),
            'labels'              => $labels,
            'supports'            => array( 'title', 'page-attributes', 'editor', 'author', 'excerpt', ),
            'hierarchical'        => true,
            'public'              => true,
            'show_ui'             => true,
            'show_in_menu'        => true,
            'show_in_nav_menus'   => true,
            'show_in_admin_bar'   => true,
            'menu_position'       => 20,
            'can_export'          => true,
            'has_archive'         => true,
            'exclude_from_search' => false,
            'publicly_queryable'  => true,
            'capability_type'     => 'page',
            'menu_icon'           => 'dashicons-groups',
            'rewrite' => array('slug' => '/client','with_front' => FALSE)
        );
        register_post_type( 'clients', $args );
    }
    add_action( 'init', 'post_type_clients', 0 );

    /**
     * Register Chat Post Type
     */
    function post_type_chat() {

        $labels = array(
            'name'                => _x( 'Chat', 'Post Type General Name', 'post_type_chat' ),
            'singular_name'       => _x( 'Chat', 'Post Type Singular Name', 'post_type_chat' ),
            'menu_name'           => __( 'Chat', 'post_type_chat' ),
            'parent_item_colon'   => __( 'Parent Chat Item:', 'post_type_chat' ),
            'all_items'           => __( 'All Chat Items', 'post_type_chat' ),
            'view_item'           => __( 'View Chat Item', 'post_type_chat' ),
            'add_new_item'        => __( 'Add Chat Item', 'post_type_chat' ),
            'add_new'             => __( 'Add Chat Item', 'post_type_chat' ),
            'edit_item'           => __( 'Edit Chat Item', 'post_type_chat' ),
            'update_item'         => __( 'Update Chat Item', 'post_type_chat' ),
            'search_items'        => __( 'Search Chat Items', 'post_type_chat' ),
            'not_found'           => __( 'Not found', 'post_type_chat' ),
            'not_found_in_trash'  => __( 'Not found in Trash', 'post_type_chat' ),
        );
        $args = array(
            'label'               => __( 'chat', 'chat' ),
            'description'         => __( 'Chat', 'chat' ),
            'labels'              => $labels,
            'supports'            => array( 'title' ),
            'hierarchical'        => true,
            'public'              => true,
            'show_ui'             => true,
            'show_in_menu'        => true,
            'show_in_nav_menus'   => true,
            'show_in_admin_bar'   => true,
            'menu_position'       => 20,
            'can_export'          => true,
            'has_archive'         => true,
            'exclude_from_search' => false,
            'publicly_queryable'  => true,
            'capability_type'     => 'page',
            'menu_icon'           => 'dashicons-admin-comments',
            'rewrite' => array('slug' => '/chat','with_front' => FALSE)
        );
        register_post_type( 'chat', $args );
    }
    add_action( 'init', 'post_type_chat', 0 );


    /**
     * Remove unused items from admin
     */
    function remove_menus(){
        remove_menu_page( 'edit.php' );
        remove_menu_page( 'edit-comments.php' ); 
    }
    add_action( 'admin_menu', 'remove_menus' );

}

add_action( 'after_setup_theme', 'paa_setup' );