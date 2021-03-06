-- phpMyAdmin SQL Dump
-- version 4.6.5.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Sep 17, 2018 at 04:15 AM
-- Server version: 5.6.34
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `paa`
--

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost:8888/paa', 'yes'),
(2, 'home', 'http://localhost:8888/paa', 'yes'),
(3, 'blogname', 'Partners Andrews Aldridge', 'yes'),
(4, 'blogdescription', 'Just another WordPress site', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'jellyfyi@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'jS F Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'jS F Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:155:{s:8:\"/work/?$\";s:24:\"index.php?post_type=work\";s:38:\"/work/feed/(feed|rdf|rss|rss2|atom)/?$\";s:41:\"index.php?post_type=work&feed=$matches[1]\";s:33:\"/work/(feed|rdf|rss|rss2|atom)/?$\";s:41:\"index.php?post_type=work&feed=$matches[1]\";s:25:\"/work/page/([0-9]{1,})/?$\";s:42:\"index.php?post_type=work&paged=$matches[1]\";s:14:\"/case-study/?$\";s:32:\"index.php?post_type=case_studies\";s:44:\"/case-study/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?post_type=case_studies&feed=$matches[1]\";s:39:\"/case-study/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?post_type=case_studies&feed=$matches[1]\";s:31:\"/case-study/page/([0-9]{1,})/?$\";s:50:\"index.php?post_type=case_studies&paged=$matches[1]\";s:10:\"/client/?$\";s:27:\"index.php?post_type=clients\";s:40:\"/client/feed/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=clients&feed=$matches[1]\";s:35:\"/client/(feed|rdf|rss|rss2|atom)/?$\";s:44:\"index.php?post_type=clients&feed=$matches[1]\";s:27:\"/client/page/([0-9]{1,})/?$\";s:45:\"index.php?post_type=clients&paged=$matches[1]\";s:8:\"/chat/?$\";s:24:\"index.php?post_type=chat\";s:38:\"/chat/feed/(feed|rdf|rss|rss2|atom)/?$\";s:41:\"index.php?post_type=chat&feed=$matches[1]\";s:33:\"/chat/(feed|rdf|rss|rss2|atom)/?$\";s:41:\"index.php?post_type=chat&feed=$matches[1]\";s:25:\"/chat/page/([0-9]{1,})/?$\";s:42:\"index.php?post_type=chat&paged=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:30:\"work/.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:40:\"work/.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:60:\"work/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:55:\"work/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:55:\"work/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:36:\"work/.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:19:\"work/(.+?)/embed/?$\";s:37:\"index.php?work=$matches[1]&embed=true\";s:23:\"work/(.+?)/trackback/?$\";s:31:\"index.php?work=$matches[1]&tb=1\";s:43:\"work/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?work=$matches[1]&feed=$matches[2]\";s:38:\"work/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?work=$matches[1]&feed=$matches[2]\";s:31:\"work/(.+?)/page/?([0-9]{1,})/?$\";s:44:\"index.php?work=$matches[1]&paged=$matches[2]\";s:38:\"work/(.+?)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?work=$matches[1]&cpage=$matches[2]\";s:27:\"work/(.+?)(?:/([0-9]+))?/?$\";s:43:\"index.php?work=$matches[1]&page=$matches[2]\";s:36:\"case-study/.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"case-study/.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"case-study/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"case-study/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"case-study/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:42:\"case-study/.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:25:\"case-study/(.+?)/embed/?$\";s:45:\"index.php?case_studies=$matches[1]&embed=true\";s:29:\"case-study/(.+?)/trackback/?$\";s:39:\"index.php?case_studies=$matches[1]&tb=1\";s:49:\"case-study/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?case_studies=$matches[1]&feed=$matches[2]\";s:44:\"case-study/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:51:\"index.php?case_studies=$matches[1]&feed=$matches[2]\";s:37:\"case-study/(.+?)/page/?([0-9]{1,})/?$\";s:52:\"index.php?case_studies=$matches[1]&paged=$matches[2]\";s:44:\"case-study/(.+?)/comment-page-([0-9]{1,})/?$\";s:52:\"index.php?case_studies=$matches[1]&cpage=$matches[2]\";s:33:\"case-study/(.+?)(?:/([0-9]+))?/?$\";s:51:\"index.php?case_studies=$matches[1]&page=$matches[2]\";s:32:\"client/.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:42:\"client/.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:62:\"client/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"client/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:57:\"client/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:38:\"client/.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:21:\"client/(.+?)/embed/?$\";s:40:\"index.php?clients=$matches[1]&embed=true\";s:25:\"client/(.+?)/trackback/?$\";s:34:\"index.php?clients=$matches[1]&tb=1\";s:45:\"client/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?clients=$matches[1]&feed=$matches[2]\";s:40:\"client/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:46:\"index.php?clients=$matches[1]&feed=$matches[2]\";s:33:\"client/(.+?)/page/?([0-9]{1,})/?$\";s:47:\"index.php?clients=$matches[1]&paged=$matches[2]\";s:40:\"client/(.+?)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?clients=$matches[1]&cpage=$matches[2]\";s:29:\"client/(.+?)(?:/([0-9]+))?/?$\";s:46:\"index.php?clients=$matches[1]&page=$matches[2]\";s:30:\"chat/.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:40:\"chat/.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:60:\"chat/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:55:\"chat/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:55:\"chat/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:36:\"chat/.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:19:\"chat/(.+?)/embed/?$\";s:37:\"index.php?chat=$matches[1]&embed=true\";s:23:\"chat/(.+?)/trackback/?$\";s:31:\"index.php?chat=$matches[1]&tb=1\";s:43:\"chat/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?chat=$matches[1]&feed=$matches[2]\";s:38:\"chat/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?chat=$matches[1]&feed=$matches[2]\";s:31:\"chat/(.+?)/page/?([0-9]{1,})/?$\";s:44:\"index.php?chat=$matches[1]&paged=$matches[2]\";s:38:\"chat/(.+?)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?chat=$matches[1]&cpage=$matches[2]\";s:27:\"chat/(.+?)(?:/([0-9]+))?/?$\";s:43:\"index.php?chat=$matches[1]&page=$matches[2]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:40:\"index.php?&page_id=106&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"([^/]+)/embed/?$\";s:37:\"index.php?name=$matches[1]&embed=true\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:24:\"([^/]+)(?:/([0-9]+))?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:22:\"[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:2:{i:0;s:34:\"advanced-custom-fields-pro/acf.php\";i:1;s:33:\"duplicate-post/duplicate-post.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'paa', 'yes'),
(41, 'stylesheet', 'paa', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '1', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'widget_text', 'a:0:{}', 'yes'),
(80, 'widget_rss', 'a:0:{}', 'yes'),
(81, 'uninstall_plugins', 'a:0:{}', 'no'),
(82, 'timezone_string', 'Europe/London', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '106', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '0', 'yes'),
(93, 'initial_db_version', '38590', 'yes'),
(94, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:74:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:11:\"edit_blocks\";b:1;s:18:\"edit_others_blocks\";b:1;s:14:\"publish_blocks\";b:1;s:19:\"read_private_blocks\";b:1;s:11:\"read_blocks\";b:1;s:13:\"delete_blocks\";b:1;s:21:\"delete_private_blocks\";b:1;s:23:\"delete_published_blocks\";b:1;s:20:\"delete_others_blocks\";b:1;s:19:\"edit_private_blocks\";b:1;s:21:\"edit_published_blocks\";b:1;s:13:\"create_blocks\";b:1;s:10:\"copy_posts\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:47:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:11:\"edit_blocks\";b:1;s:18:\"edit_others_blocks\";b:1;s:14:\"publish_blocks\";b:1;s:19:\"read_private_blocks\";b:1;s:11:\"read_blocks\";b:1;s:13:\"delete_blocks\";b:1;s:21:\"delete_private_blocks\";b:1;s:23:\"delete_published_blocks\";b:1;s:20:\"delete_others_blocks\";b:1;s:19:\"edit_private_blocks\";b:1;s:21:\"edit_published_blocks\";b:1;s:13:\"create_blocks\";b:1;s:10:\"copy_posts\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:17:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:11:\"edit_blocks\";b:1;s:14:\"publish_blocks\";b:1;s:11:\"read_blocks\";b:1;s:13:\"delete_blocks\";b:1;s:23:\"delete_published_blocks\";b:1;s:21:\"edit_published_blocks\";b:1;s:13:\"create_blocks\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:6:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:11:\"read_blocks\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'WPLANG', 'en_GB', 'yes'),
(97, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(98, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(99, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(100, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(101, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'sidebars_widgets', 'a:2:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(103, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(107, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(108, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'cron', 'a:5:{i:1537152935;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1537181735;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1537224991;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1537224996;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(113, 'theme_mods_twentyseventeen', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1536627943;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}', 'yes'),
(124, '_site_transient_timeout_browser_7a5fdab9624d5d5509eeeb78d380fba5', '1537224944', 'no'),
(125, '_site_transient_browser_7a5fdab9624d5d5509eeeb78d380fba5', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"69.0.3497.81\";s:8:\"platform\";s:9:\"Macintosh\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(130, 'can_compress_scripts', '1', 'no'),
(142, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/en_GB/wordpress-4.9.8.zip\";s:6:\"locale\";s:5:\"en_GB\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/en_GB/wordpress-4.9.8.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.9.8\";s:7:\"version\";s:5:\"4.9.8\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1537148145;s:15:\"version_checked\";s:5:\"4.9.8\";s:12:\"translations\";a:0:{}}', 'no'),
(144, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1537148146;s:7:\"checked\";a:4:{s:3:\"paa\";s:0:\"\";s:13:\"twentyfifteen\";s:3:\"2.0\";s:15:\"twentyseventeen\";s:3:\"1.7\";s:13:\"twentysixteen\";s:3:\"1.5\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}', 'no'),
(145, 'recently_activated', 'a:2:{s:23:\"gutenberg/gutenberg.php\";i:1536881908;s:83:\"acf-repeater-flexible-content-collapser/acf-repeater-flexible-content-collapser.php\";i:1536716839;}', 'yes'),
(152, '_transient_twentyseventeen_categories', '1', 'yes'),
(157, 'current_theme', 'BLANK Theme', 'yes'),
(158, 'theme_mods_paa', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(159, 'theme_switched', '', 'yes'),
(164, 'category_children', 'a:0:{}', 'yes'),
(168, 'acf_version', '5.7.4', 'yes'),
(290, '_transient_timeout_acf_plugin_updates', '1537224938', 'no'),
(291, '_transient_acf_plugin_updates', 'a:4:{s:7:\"plugins\";a:1:{s:34:\"advanced-custom-fields-pro/acf.php\";a:8:{s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:6:\"plugin\";s:34:\"advanced-custom-fields-pro/acf.php\";s:11:\"new_version\";s:5:\"5.7.6\";s:3:\"url\";s:37:\"https://www.advancedcustomfields.com/\";s:6:\"tested\";s:5:\"4.9.9\";s:7:\"package\";s:0:\"\";s:5:\"icons\";a:1:{s:7:\"default\";s:63:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png\";}s:7:\"banners\";a:1:{s:7:\"default\";s:66:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg\";}}}s:10:\"expiration\";i:86400;s:6:\"status\";i:1;s:7:\"checked\";a:1:{s:34:\"advanced-custom-fields-pro/acf.php\";s:5:\"5.7.4\";}}', 'no'),
(298, '_transient_timeout_plugin_slugs', '1537234551', 'no'),
(299, '_transient_plugin_slugs', 'a:2:{i:0;s:34:\"advanced-custom-fields-pro/acf.php\";i:1;s:33:\"duplicate-post/duplicate-post.php\";}', 'no'),
(300, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1537158077', 'no'),
(301, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'O:8:\"stdClass\":100:{s:6:\"widget\";a:3:{s:4:\"name\";s:6:\"widget\";s:4:\"slug\";s:6:\"widget\";s:5:\"count\";i:4505;}s:11:\"woocommerce\";a:3:{s:4:\"name\";s:11:\"woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:5:\"count\";i:2996;}s:4:\"post\";a:3:{s:4:\"name\";s:4:\"post\";s:4:\"slug\";s:4:\"post\";s:5:\"count\";i:2586;}s:5:\"admin\";a:3:{s:4:\"name\";s:5:\"admin\";s:4:\"slug\";s:5:\"admin\";s:5:\"count\";i:2450;}s:5:\"posts\";a:3:{s:4:\"name\";s:5:\"posts\";s:4:\"slug\";s:5:\"posts\";s:5:\"count\";i:1884;}s:9:\"shortcode\";a:3:{s:4:\"name\";s:9:\"shortcode\";s:4:\"slug\";s:9:\"shortcode\";s:5:\"count\";i:1680;}s:8:\"comments\";a:3:{s:4:\"name\";s:8:\"comments\";s:4:\"slug\";s:8:\"comments\";s:5:\"count\";i:1673;}s:7:\"twitter\";a:3:{s:4:\"name\";s:7:\"twitter\";s:4:\"slug\";s:7:\"twitter\";s:5:\"count\";i:1459;}s:6:\"images\";a:3:{s:4:\"name\";s:6:\"images\";s:4:\"slug\";s:6:\"images\";s:5:\"count\";i:1404;}s:6:\"google\";a:3:{s:4:\"name\";s:6:\"google\";s:4:\"slug\";s:6:\"google\";s:5:\"count\";i:1402;}s:8:\"facebook\";a:3:{s:4:\"name\";s:8:\"facebook\";s:4:\"slug\";s:8:\"facebook\";s:5:\"count\";i:1397;}s:5:\"image\";a:3:{s:4:\"name\";s:5:\"image\";s:4:\"slug\";s:5:\"image\";s:5:\"count\";i:1334;}s:7:\"sidebar\";a:3:{s:4:\"name\";s:7:\"sidebar\";s:4:\"slug\";s:7:\"sidebar\";s:5:\"count\";i:1283;}s:3:\"seo\";a:3:{s:4:\"name\";s:3:\"seo\";s:4:\"slug\";s:3:\"seo\";s:5:\"count\";i:1243;}s:7:\"gallery\";a:3:{s:4:\"name\";s:7:\"gallery\";s:4:\"slug\";s:7:\"gallery\";s:5:\"count\";i:1115;}s:4:\"page\";a:3:{s:4:\"name\";s:4:\"page\";s:4:\"slug\";s:4:\"page\";s:5:\"count\";i:1072;}s:5:\"email\";a:3:{s:4:\"name\";s:5:\"email\";s:4:\"slug\";s:5:\"email\";s:5:\"count\";i:1043;}s:6:\"social\";a:3:{s:4:\"name\";s:6:\"social\";s:4:\"slug\";s:6:\"social\";s:5:\"count\";i:1038;}s:9:\"ecommerce\";a:3:{s:4:\"name\";s:9:\"ecommerce\";s:4:\"slug\";s:9:\"ecommerce\";s:5:\"count\";i:923;}s:5:\"login\";a:3:{s:4:\"name\";s:5:\"login\";s:4:\"slug\";s:5:\"login\";s:5:\"count\";i:894;}s:5:\"links\";a:3:{s:4:\"name\";s:5:\"links\";s:4:\"slug\";s:5:\"links\";s:5:\"count\";i:834;}s:7:\"widgets\";a:3:{s:4:\"name\";s:7:\"widgets\";s:4:\"slug\";s:7:\"widgets\";s:5:\"count\";i:816;}s:5:\"video\";a:3:{s:4:\"name\";s:5:\"video\";s:4:\"slug\";s:5:\"video\";s:5:\"count\";i:807;}s:8:\"security\";a:3:{s:4:\"name\";s:8:\"security\";s:4:\"slug\";s:8:\"security\";s:5:\"count\";i:734;}s:7:\"content\";a:3:{s:4:\"name\";s:7:\"content\";s:4:\"slug\";s:7:\"content\";s:5:\"count\";i:704;}s:10:\"buddypress\";a:3:{s:4:\"name\";s:10:\"buddypress\";s:4:\"slug\";s:10:\"buddypress\";s:5:\"count\";i:696;}s:4:\"spam\";a:3:{s:4:\"name\";s:4:\"spam\";s:4:\"slug\";s:4:\"spam\";s:5:\"count\";i:690;}s:3:\"rss\";a:3:{s:4:\"name\";s:3:\"rss\";s:4:\"slug\";s:3:\"rss\";s:5:\"count\";i:689;}s:6:\"slider\";a:3:{s:4:\"name\";s:6:\"slider\";s:4:\"slug\";s:6:\"slider\";s:5:\"count\";i:682;}s:5:\"pages\";a:3:{s:4:\"name\";s:5:\"pages\";s:4:\"slug\";s:5:\"pages\";s:5:\"count\";i:667;}s:10:\"e-commerce\";a:3:{s:4:\"name\";s:10:\"e-commerce\";s:4:\"slug\";s:10:\"e-commerce\";s:5:\"count\";i:659;}s:9:\"analytics\";a:3:{s:4:\"name\";s:9:\"analytics\";s:4:\"slug\";s:9:\"analytics\";s:5:\"count\";i:659;}s:5:\"media\";a:3:{s:4:\"name\";s:5:\"media\";s:4:\"slug\";s:5:\"media\";s:5:\"count\";i:648;}s:6:\"jquery\";a:3:{s:4:\"name\";s:6:\"jquery\";s:4:\"slug\";s:6:\"jquery\";s:5:\"count\";i:645;}s:4:\"form\";a:3:{s:4:\"name\";s:4:\"form\";s:4:\"slug\";s:4:\"form\";s:5:\"count\";i:618;}s:6:\"search\";a:3:{s:4:\"name\";s:6:\"search\";s:4:\"slug\";s:6:\"search\";s:5:\"count\";i:617;}s:4:\"feed\";a:3:{s:4:\"name\";s:4:\"feed\";s:4:\"slug\";s:4:\"feed\";s:5:\"count\";i:616;}s:4:\"ajax\";a:3:{s:4:\"name\";s:4:\"ajax\";s:4:\"slug\";s:4:\"ajax\";s:5:\"count\";i:606;}s:8:\"category\";a:3:{s:4:\"name\";s:8:\"category\";s:4:\"slug\";s:8:\"category\";s:5:\"count\";i:600;}s:4:\"menu\";a:3:{s:4:\"name\";s:4:\"menu\";s:4:\"slug\";s:4:\"menu\";s:5:\"count\";i:598;}s:5:\"embed\";a:3:{s:4:\"name\";s:5:\"embed\";s:4:\"slug\";s:5:\"embed\";s:5:\"count\";i:575;}s:10:\"javascript\";a:3:{s:4:\"name\";s:10:\"javascript\";s:4:\"slug\";s:10:\"javascript\";s:5:\"count\";i:553;}s:3:\"css\";a:3:{s:4:\"name\";s:3:\"css\";s:4:\"slug\";s:3:\"css\";s:5:\"count\";i:545;}s:4:\"link\";a:3:{s:4:\"name\";s:4:\"link\";s:4:\"slug\";s:4:\"link\";s:5:\"count\";i:542;}s:7:\"youtube\";a:3:{s:4:\"name\";s:7:\"youtube\";s:4:\"slug\";s:7:\"youtube\";s:5:\"count\";i:532;}s:5:\"share\";a:3:{s:4:\"name\";s:5:\"share\";s:4:\"slug\";s:5:\"share\";s:5:\"count\";i:527;}s:6:\"editor\";a:3:{s:4:\"name\";s:6:\"editor\";s:4:\"slug\";s:6:\"editor\";s:5:\"count\";i:518;}s:5:\"theme\";a:3:{s:4:\"name\";s:5:\"theme\";s:4:\"slug\";s:5:\"theme\";s:5:\"count\";i:516;}s:7:\"comment\";a:3:{s:4:\"name\";s:7:\"comment\";s:4:\"slug\";s:7:\"comment\";s:5:\"count\";i:515;}s:10:\"responsive\";a:3:{s:4:\"name\";s:10:\"responsive\";s:4:\"slug\";s:10:\"responsive\";s:5:\"count\";i:511;}s:12:\"contact-form\";a:3:{s:4:\"name\";s:12:\"contact form\";s:4:\"slug\";s:12:\"contact-form\";s:5:\"count\";i:500;}s:9:\"dashboard\";a:3:{s:4:\"name\";s:9:\"dashboard\";s:4:\"slug\";s:9:\"dashboard\";s:5:\"count\";i:496;}s:6:\"custom\";a:3:{s:4:\"name\";s:6:\"custom\";s:4:\"slug\";s:6:\"custom\";s:5:\"count\";i:492;}s:10:\"categories\";a:3:{s:4:\"name\";s:10:\"categories\";s:4:\"slug\";s:10:\"categories\";s:5:\"count\";i:487;}s:9:\"affiliate\";a:3:{s:4:\"name\";s:9:\"affiliate\";s:4:\"slug\";s:9:\"affiliate\";s:5:\"count\";i:481;}s:3:\"ads\";a:3:{s:4:\"name\";s:3:\"ads\";s:4:\"slug\";s:3:\"ads\";s:5:\"count\";i:480;}s:6:\"button\";a:3:{s:4:\"name\";s:6:\"button\";s:4:\"slug\";s:6:\"button\";s:5:\"count\";i:460;}s:4:\"tags\";a:3:{s:4:\"name\";s:4:\"tags\";s:4:\"slug\";s:4:\"tags\";s:5:\"count\";i:458;}s:4:\"user\";a:3:{s:4:\"name\";s:4:\"user\";s:4:\"slug\";s:4:\"user\";s:5:\"count\";i:454;}s:7:\"contact\";a:3:{s:4:\"name\";s:7:\"contact\";s:4:\"slug\";s:7:\"contact\";s:5:\"count\";i:446;}s:6:\"mobile\";a:3:{s:4:\"name\";s:6:\"mobile\";s:4:\"slug\";s:6:\"mobile\";s:5:\"count\";i:443;}s:3:\"api\";a:3:{s:4:\"name\";s:3:\"api\";s:4:\"slug\";s:3:\"api\";s:5:\"count\";i:438;}s:5:\"photo\";a:3:{s:4:\"name\";s:5:\"photo\";s:4:\"slug\";s:5:\"photo\";s:5:\"count\";i:422;}s:5:\"users\";a:3:{s:4:\"name\";s:5:\"users\";s:4:\"slug\";s:5:\"users\";s:5:\"count\";i:421;}s:6:\"events\";a:3:{s:4:\"name\";s:6:\"events\";s:4:\"slug\";s:6:\"events\";s:5:\"count\";i:420;}s:7:\"payment\";a:3:{s:4:\"name\";s:7:\"payment\";s:4:\"slug\";s:7:\"payment\";s:5:\"count\";i:419;}s:5:\"stats\";a:3:{s:4:\"name\";s:5:\"stats\";s:4:\"slug\";s:5:\"stats\";s:5:\"count\";i:417;}s:9:\"slideshow\";a:3:{s:4:\"name\";s:9:\"slideshow\";s:4:\"slug\";s:9:\"slideshow\";s:5:\"count\";i:415;}s:6:\"photos\";a:3:{s:4:\"name\";s:6:\"photos\";s:4:\"slug\";s:6:\"photos\";s:5:\"count\";i:409;}s:10:\"navigation\";a:3:{s:4:\"name\";s:10:\"navigation\";s:4:\"slug\";s:10:\"navigation\";s:5:\"count\";i:389;}s:10:\"statistics\";a:3:{s:4:\"name\";s:10:\"statistics\";s:4:\"slug\";s:10:\"statistics\";s:5:\"count\";i:388;}s:15:\"payment-gateway\";a:3:{s:4:\"name\";s:15:\"payment gateway\";s:4:\"slug\";s:15:\"payment-gateway\";s:5:\"count\";i:375;}s:8:\"calendar\";a:3:{s:4:\"name\";s:8:\"calendar\";s:4:\"slug\";s:8:\"calendar\";s:5:\"count\";i:374;}s:4:\"news\";a:3:{s:4:\"name\";s:4:\"news\";s:4:\"slug\";s:4:\"news\";s:5:\"count\";i:371;}s:10:\"shortcodes\";a:3:{s:4:\"name\";s:10:\"shortcodes\";s:4:\"slug\";s:10:\"shortcodes\";s:5:\"count\";i:366;}s:5:\"popup\";a:3:{s:4:\"name\";s:5:\"popup\";s:4:\"slug\";s:5:\"popup\";s:5:\"count\";i:364;}s:4:\"chat\";a:3:{s:4:\"name\";s:4:\"chat\";s:4:\"slug\";s:4:\"chat\";s:5:\"count\";i:361;}s:9:\"marketing\";a:3:{s:4:\"name\";s:9:\"marketing\";s:4:\"slug\";s:9:\"marketing\";s:5:\"count\";i:361;}s:12:\"social-media\";a:3:{s:4:\"name\";s:12:\"social media\";s:4:\"slug\";s:12:\"social-media\";s:5:\"count\";i:354;}s:7:\"plugins\";a:3:{s:4:\"name\";s:7:\"plugins\";s:4:\"slug\";s:7:\"plugins\";s:5:\"count\";i:348;}s:9:\"multisite\";a:3:{s:4:\"name\";s:9:\"multisite\";s:4:\"slug\";s:9:\"multisite\";s:5:\"count\";i:348;}s:10:\"newsletter\";a:3:{s:4:\"name\";s:10:\"newsletter\";s:4:\"slug\";s:10:\"newsletter\";s:5:\"count\";i:348;}s:4:\"code\";a:3:{s:4:\"name\";s:4:\"code\";s:4:\"slug\";s:4:\"code\";s:5:\"count\";i:343;}s:4:\"meta\";a:3:{s:4:\"name\";s:4:\"meta\";s:4:\"slug\";s:4:\"meta\";s:5:\"count\";i:339;}s:3:\"url\";a:3:{s:4:\"name\";s:3:\"url\";s:4:\"slug\";s:3:\"url\";s:5:\"count\";i:338;}s:4:\"list\";a:3:{s:4:\"name\";s:4:\"list\";s:4:\"slug\";s:4:\"list\";s:5:\"count\";i:334;}s:8:\"redirect\";a:3:{s:4:\"name\";s:8:\"redirect\";s:4:\"slug\";s:8:\"redirect\";s:5:\"count\";i:329;}s:5:\"forms\";a:3:{s:4:\"name\";s:5:\"forms\";s:4:\"slug\";s:5:\"forms\";s:5:\"count\";i:328;}s:11:\"advertising\";a:3:{s:4:\"name\";s:11:\"advertising\";s:4:\"slug\";s:11:\"advertising\";s:5:\"count\";i:312;}s:16:\"custom-post-type\";a:3:{s:4:\"name\";s:16:\"custom post type\";s:4:\"slug\";s:16:\"custom-post-type\";s:5:\"count\";i:309;}s:6:\"simple\";a:3:{s:4:\"name\";s:6:\"simple\";s:4:\"slug\";s:6:\"simple\";s:5:\"count\";i:309;}s:11:\"performance\";a:3:{s:4:\"name\";s:11:\"performance\";s:4:\"slug\";s:11:\"performance\";s:5:\"count\";i:308;}s:12:\"notification\";a:3:{s:4:\"name\";s:12:\"notification\";s:4:\"slug\";s:12:\"notification\";s:5:\"count\";i:305;}s:3:\"tag\";a:3:{s:4:\"name\";s:3:\"tag\";s:4:\"slug\";s:3:\"tag\";s:5:\"count\";i:303;}s:7:\"adsense\";a:3:{s:4:\"name\";s:7:\"adsense\";s:4:\"slug\";s:7:\"adsense\";s:5:\"count\";i:303;}s:4:\"html\";a:3:{s:4:\"name\";s:4:\"html\";s:4:\"slug\";s:4:\"html\";s:5:\"count\";i:302;}s:16:\"google-analytics\";a:3:{s:4:\"name\";s:16:\"google analytics\";s:4:\"slug\";s:16:\"google-analytics\";s:5:\"count\";i:301;}s:8:\"tracking\";a:3:{s:4:\"name\";s:8:\"tracking\";s:4:\"slug\";s:8:\"tracking\";s:5:\"count\";i:300;}s:6:\"author\";a:3:{s:4:\"name\";s:6:\"author\";s:4:\"slug\";s:6:\"author\";s:5:\"count\";i:298;}s:14:\"contact-form-7\";a:3:{s:4:\"name\";s:14:\"contact form 7\";s:4:\"slug\";s:14:\"contact-form-7\";s:5:\"count\";i:294;}}', 'no'),
(302, '_site_transient_timeout_theme_roots', '1537149085', 'no'),
(303, '_site_transient_theme_roots', 'a:4:{s:3:\"paa\";s:7:\"/themes\";s:13:\"twentyfifteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";}', 'no'),
(305, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1537148149;s:7:\"checked\";a:2:{s:34:\"advanced-custom-fields-pro/acf.php\";s:5:\"5.7.4\";s:33:\"duplicate-post/duplicate-post.php\";s:5:\"3.2.2\";}s:8:\"response\";a:1:{s:34:\"advanced-custom-fields-pro/acf.php\";O:8:\"stdClass\":8:{s:4:\"slug\";s:26:\"advanced-custom-fields-pro\";s:6:\"plugin\";s:34:\"advanced-custom-fields-pro/acf.php\";s:11:\"new_version\";s:5:\"5.7.6\";s:3:\"url\";s:37:\"https://www.advancedcustomfields.com/\";s:6:\"tested\";s:5:\"4.9.9\";s:7:\"package\";s:0:\"\";s:5:\"icons\";a:1:{s:7:\"default\";s:63:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png\";}s:7:\"banners\";a:1:{s:7:\"default\";s:66:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg\";}}}s:12:\"translations\";a:1:{i:0;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:14:\"duplicate-post\";s:8:\"language\";s:5:\"en_GB\";s:7:\"version\";s:5:\"3.2.2\";s:7:\"updated\";s:19:\"2017-12-06 02:08:42\";s:7:\"package\";s:81:\"https://downloads.wordpress.org/translation/plugin/duplicate-post/3.2.2/en_GB.zip\";s:10:\"autoupdate\";b:1;}}s:9:\"no_update\";a:1:{s:33:\"duplicate-post/duplicate-post.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:28:\"w.org/plugins/duplicate-post\";s:4:\"slug\";s:14:\"duplicate-post\";s:6:\"plugin\";s:33:\"duplicate-post/duplicate-post.php\";s:11:\"new_version\";s:5:\"3.2.2\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/duplicate-post/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/duplicate-post.3.2.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/duplicate-post/assets/icon-256x256.png?rev=1612753\";s:2:\"1x\";s:67:\"https://ps.w.org/duplicate-post/assets/icon-128x128.png?rev=1612753\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:69:\"https://ps.w.org/duplicate-post/assets/banner-772x250.png?rev=1612986\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no'),
(306, 'duplicate_post_copytitle', '1', 'yes'),
(307, 'duplicate_post_copydate', '', 'yes'),
(308, 'duplicate_post_copystatus', '', 'yes'),
(309, 'duplicate_post_copyslug', '', 'yes'),
(310, 'duplicate_post_copyexcerpt', '1', 'yes'),
(311, 'duplicate_post_copycontent', '1', 'yes'),
(312, 'duplicate_post_copythumbnail', '1', 'yes'),
(313, 'duplicate_post_copytemplate', '1', 'yes'),
(314, 'duplicate_post_copyformat', '1', 'yes'),
(315, 'duplicate_post_copyauthor', '', 'yes'),
(316, 'duplicate_post_copypassword', '', 'yes'),
(317, 'duplicate_post_copyattachments', '', 'yes'),
(318, 'duplicate_post_copychildren', '', 'yes'),
(319, 'duplicate_post_copycomments', '', 'yes'),
(320, 'duplicate_post_copymenuorder', '1', 'yes'),
(321, 'duplicate_post_taxonomies_blacklist', '', 'yes'),
(322, 'duplicate_post_blacklist', '', 'yes'),
(323, 'duplicate_post_types_enabled', 'a:7:{i:0;s:4:\"post\";i:1;s:4:\"page\";i:2;s:4:\"work\";i:3;s:12:\"case_studies\";i:4;s:7:\"clients\";i:5;s:4:\"chat\";i:6;s:15:\"acf-field-group\";}', 'yes'),
(324, 'duplicate_post_show_row', '1', 'yes'),
(325, 'duplicate_post_show_adminbar', '1', 'yes'),
(326, 'duplicate_post_show_submitbox', '1', 'yes'),
(327, 'duplicate_post_show_bulkactions', '1', 'yes'),
(328, 'duplicate_post_version', '3.2.2', 'yes'),
(329, 'duplicate_post_show_notice', '', 'no'),
(330, 'duplicate_post_title_prefix', '', 'yes'),
(331, 'duplicate_post_title_suffix', '', 'yes'),
(332, 'duplicate_post_increase_menu_order_by', '', 'yes'),
(333, 'duplicate_post_roles', 'a:2:{i:0;s:13:\"administrator\";i:1;s:6:\"editor\";}', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(5, 5, '_oembed_85fbb30061e6c2be3e051d8ebd59db5e', '<iframe src=\"https://player.vimeo.com/video/22439234?app_id=122963\" width=\"525\" height=\"295\" frameborder=\"0\" title=\"The Mountain\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'),
(6, 5, '_oembed_time_85fbb30061e6c2be3e051d8ebd59db5e', '1536620253'),
(7, 5, '_edit_lock', '1536620368:1'),
(8, 5, '_oembed_fb03bb0b9c9e7bf69eccd1e749e55745', '<iframe src=\"https://player.vimeo.com/video/22439234?app_id=122963\" width=\"500\" height=\"281\" frameborder=\"0\" title=\"The Mountain\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'),
(9, 5, '_oembed_time_fb03bb0b9c9e7bf69eccd1e749e55745', '1536629208'),
(10, 27, '_edit_last', '1'),
(12, 27, 'position', 'normal'),
(13, 27, 'layout', 'default'),
(14, 27, 'hide_on_screen', ''),
(15, 27, '_edit_lock', '1536695833:1'),
(17, 27, 'field_5b981e6eb4cae', 'a:13:{s:3:\"key\";s:19:\"field_5b981e6eb4cae\";s:5:\"label\";s:7:\"Queries\";s:4:\"name\";s:7:\"queries\";s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:10:\"sub_fields\";a:1:{i:0;a:15:{s:3:\"key\";s:19:\"field_5b981e96b4caf\";s:5:\"label\";s:5:\"Query\";s:4:\"name\";s:5:\"query\";s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";s:1:\"0\";s:12:\"column_width\";s:0:\"\";s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:10:\"formatting\";s:4:\"none\";s:9:\"maxlength\";s:0:\"\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:2:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:0;}}s:7:\"row_min\";s:0:\"\";s:9:\"row_limit\";s:0:\"\";s:6:\"layout\";s:3:\"row\";s:12:\"button_label\";s:9:\"Add Query\";s:17:\"conditional_logic\";a:3:{s:6:\"status\";s:1:\"0\";s:5:\"rules\";a:1:{i:0;a:2:{s:5:\"field\";s:4:\"null\";s:8:\"operator\";s:2:\"==\";}}s:8:\"allorany\";s:3:\"all\";}s:8:\"order_no\";i:0;}'),
(18, 27, 'rule', 'a:5:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"chat\";s:8:\"order_no\";i:0;s:8:\"group_no\";i:0;}'),
(19, 28, '_edit_lock', '1537149687:1'),
(20, 28, '_edit_last', '1'),
(21, 100, '_edit_last', '1'),
(22, 100, '_edit_lock', '1537137742:1'),
(23, 100, 'dialog_0_user_input', ''),
(24, 100, '_dialog_0_user_input', 'field_5b99babc718f9'),
(25, 100, 'dialog_0_response_type', 'Text'),
(26, 100, '_dialog_0_response_type', 'field_5b9824e74f2fd'),
(27, 100, 'dialog_0_response_trigger', 'Intro'),
(28, 100, '_dialog_0_response_trigger', 'field_5b986781c90d5'),
(29, 100, 'dialog_0_response_behaviour', 'Answer Not Required'),
(30, 100, '_dialog_0_response_behaviour', 'field_5b99bb37d51ed'),
(31, 100, 'dialog_0_text_response', 'Hello. We’re Partners.'),
(32, 100, '_dialog_0_text_response', 'field_5b9825164f2fe'),
(33, 100, 'dialog_0_text_response_small_print', ''),
(34, 100, '_dialog_0_text_response_small_print', 'field_5b986635b1ac0'),
(35, 100, 'dialog_1_user_input', ''),
(36, 100, '_dialog_1_user_input', 'field_5b99babc718f9'),
(37, 100, 'dialog_1_response_type', 'Text'),
(38, 100, '_dialog_1_response_type', 'field_5b9824e74f2fd'),
(39, 100, 'dialog_1_response_trigger', 'Intro'),
(40, 100, '_dialog_1_response_trigger', 'field_5b986781c90d5'),
(41, 100, 'dialog_1_response_behaviour', 'Answer Not Required'),
(42, 100, '_dialog_1_response_behaviour', 'field_5b99bb37d51ed'),
(43, 100, 'dialog_1_text_response', 'We’re a creative business, focused on the customer.'),
(44, 100, '_dialog_1_text_response', 'field_5b9825164f2fe'),
(45, 100, 'dialog_1_text_response_small_print', ''),
(46, 100, '_dialog_1_text_response_small_print', 'field_5b986635b1ac0'),
(47, 100, 'dialog_2_user_input', ''),
(48, 100, '_dialog_2_user_input', 'field_5b99babc718f9'),
(49, 100, 'dialog_2_response_type', 'Text'),
(50, 100, '_dialog_2_response_type', 'field_5b9824e74f2fd'),
(51, 100, 'dialog_2_response_trigger', 'Intro'),
(52, 100, '_dialog_2_response_trigger', 'field_5b986781c90d5'),
(53, 100, 'dialog_2_response_behaviour', 'Answer Not Required'),
(54, 100, '_dialog_2_response_behaviour', 'field_5b99bb37d51ed'),
(55, 100, 'dialog_2_text_response', 'Ask us anything you like in the box below.'),
(56, 100, '_dialog_2_text_response', 'field_5b9825164f2fe'),
(57, 100, 'dialog_2_text_response_small_print', ''),
(58, 100, '_dialog_2_text_response_small_print', 'field_5b986635b1ac0'),
(59, 100, 'dialog_3_user_input', ''),
(60, 100, '_dialog_3_user_input', 'field_5b99babc718f9'),
(61, 100, 'dialog_3_response_type', 'Text'),
(62, 100, '_dialog_3_response_type', 'field_5b9824e74f2fd'),
(63, 100, 'dialog_3_response_trigger', 'Intro'),
(64, 100, '_dialog_3_response_trigger', 'field_5b986781c90d5'),
(65, 100, 'dialog_3_response_behaviour', 'Answer Required'),
(66, 100, '_dialog_3_response_behaviour', 'field_5b99bb37d51ed'),
(67, 100, 'dialog_3_text_response', 'Go ahead, we won’t bite.'),
(68, 100, '_dialog_3_text_response', 'field_5b9825164f2fe'),
(69, 100, 'dialog_3_text_response_small_print', ''),
(70, 100, '_dialog_3_text_response_small_print', 'field_5b986635b1ac0'),
(71, 100, 'dialog', '4'),
(72, 100, '_dialog', 'field_5b9824b34f2fc'),
(76, 106, '_edit_last', '1'),
(77, 106, '_edit_lock', '1536881776:1'),
(78, 100, 'default_page', 'Home'),
(79, 100, '_default_page', 'field_5b9af643b8a48'),
(80, 100, 'chat_data_0_user_input', ''),
(81, 100, '_chat_data_0_user_input', 'field_5b99babc718f9'),
(82, 100, 'chat_data_0_response_type', 'Text'),
(83, 100, '_chat_data_0_response_type', 'field_5b9824e74f2fd'),
(84, 100, 'chat_data_0_response_trigger', 'Intro'),
(85, 100, '_chat_data_0_response_trigger', 'field_5b986781c90d5'),
(86, 100, 'chat_data_0_response_behaviour', 'Answer Not Required'),
(87, 100, '_chat_data_0_response_behaviour', 'field_5b99bb37d51ed'),
(88, 100, 'chat_data_0_text_response', 'Hello. We’re Partners.|Hey. We’re Partners.'),
(89, 100, '_chat_data_0_text_response', 'field_5b9825164f2fe'),
(90, 100, 'chat_data_0_text_response_small_print', ''),
(91, 100, '_chat_data_0_text_response_small_print', 'field_5b986635b1ac0'),
(92, 100, 'chat_data_1_user_input', ''),
(93, 100, '_chat_data_1_user_input', 'field_5b99babc718f9'),
(94, 100, 'chat_data_1_response_type', 'Text'),
(95, 100, '_chat_data_1_response_type', 'field_5b9824e74f2fd'),
(96, 100, 'chat_data_1_response_trigger', 'Intro'),
(97, 100, '_chat_data_1_response_trigger', 'field_5b986781c90d5'),
(98, 100, 'chat_data_1_response_behaviour', 'Answer Not Required'),
(99, 100, '_chat_data_1_response_behaviour', 'field_5b99bb37d51ed'),
(100, 100, 'chat_data_1_text_response', 'We’re a creative business, focused on the customer.'),
(101, 100, '_chat_data_1_text_response', 'field_5b9825164f2fe'),
(102, 100, 'chat_data_1_text_response_small_print', ''),
(103, 100, '_chat_data_1_text_response_small_print', 'field_5b986635b1ac0'),
(104, 100, 'chat_data_2_user_input', ''),
(105, 100, '_chat_data_2_user_input', 'field_5b99babc718f9'),
(106, 100, 'chat_data_2_response_type', 'Text'),
(107, 100, '_chat_data_2_response_type', 'field_5b9824e74f2fd'),
(108, 100, 'chat_data_2_response_trigger', 'Intro'),
(109, 100, '_chat_data_2_response_trigger', 'field_5b986781c90d5'),
(110, 100, 'chat_data_2_response_behaviour', 'Answer Not Required'),
(111, 100, '_chat_data_2_response_behaviour', 'field_5b99bb37d51ed'),
(112, 100, 'chat_data_2_text_response', 'Ask us anything you like in the box below.'),
(113, 100, '_chat_data_2_text_response', 'field_5b9825164f2fe'),
(114, 100, 'chat_data_2_text_response_small_print', ''),
(115, 100, '_chat_data_2_text_response_small_print', 'field_5b986635b1ac0'),
(116, 100, 'chat_data_3_user_input', ''),
(117, 100, '_chat_data_3_user_input', 'field_5b99babc718f9'),
(118, 100, 'chat_data_3_response_type', 'Text'),
(119, 100, '_chat_data_3_response_type', 'field_5b9824e74f2fd'),
(120, 100, 'chat_data_3_response_trigger', 'Intro'),
(121, 100, '_chat_data_3_response_trigger', 'field_5b986781c90d5'),
(122, 100, 'chat_data_3_response_behaviour', 'Answer Not Required'),
(123, 100, '_chat_data_3_response_behaviour', 'field_5b99bb37d51ed'),
(124, 100, 'chat_data_3_text_response', 'Go ahead, we won’t bite.'),
(125, 100, '_chat_data_3_text_response', 'field_5b9825164f2fe'),
(126, 100, 'chat_data_3_text_response_small_print', ''),
(127, 100, '_chat_data_3_text_response_small_print', 'field_5b986635b1ac0'),
(128, 100, 'chat_data', '4'),
(129, 100, '_chat_data', 'field_5b9824b34f2fc'),
(130, 100, 'chat_data_0_requires_answer', 'true'),
(131, 100, '_chat_data_0_requires_answer', 'field_5b99bb37d51ed'),
(132, 100, 'chat_data_1_requires_answer', 'true'),
(133, 100, '_chat_data_1_requires_answer', 'field_5b99bb37d51ed'),
(134, 100, 'chat_data_2_requires_answer', 'true'),
(135, 100, '_chat_data_2_requires_answer', 'field_5b99bb37d51ed'),
(136, 100, 'chat_data_3_requires_answer', 'false'),
(137, 100, '_chat_data_3_requires_answer', 'field_5b99bb37d51ed'),
(138, 109, '_edit_last', '1'),
(139, 109, '_edit_lock', '1537116779:1'),
(140, 109, 'user_input', 'error'),
(141, 109, '_user_input', 'field_5b99babc718f9'),
(142, 109, 'default_page', ''),
(143, 109, '_default_page', 'field_5b9af643b8a48'),
(144, 109, 'chat_data_0_response_type', 'Text'),
(145, 109, '_chat_data_0_response_type', 'field_5b9824e74f2fd'),
(146, 109, 'chat_data_0_response_trigger', 'Error'),
(147, 109, '_chat_data_0_response_trigger', 'field_5b986781c90d5'),
(148, 109, 'chat_data_0_requires_answer', 'true'),
(149, 109, '_chat_data_0_requires_answer', 'field_5b99bb37d51ed'),
(150, 109, 'chat_data_0_text_response', 'I don\'t know that one yet.|Come again?|Huh?|Hmm, didn\'t catch that.'),
(151, 109, '_chat_data_0_text_response', 'field_5b9825164f2fe'),
(152, 109, 'chat_data_0_text_response_small_print', ''),
(153, 109, '_chat_data_0_text_response_small_print', 'field_5b986635b1ac0'),
(154, 109, 'chat_data', '1'),
(155, 109, '_chat_data', 'field_5b9824b34f2fc'),
(156, 110, '_edit_last', '1'),
(157, 110, '_edit_lock', '1537124950:1'),
(158, 100, 'user_input', 'home'),
(159, 100, '_user_input', 'field_5b99babc718f9'),
(160, 112, '_edit_last', '1'),
(161, 112, '_edit_lock', '1537131309:1'),
(162, 112, 'user_input', ''),
(163, 112, '_user_input', 'field_5b99babc718f9'),
(164, 112, 'default_page', ''),
(165, 112, '_default_page', 'field_5b9af643b8a48'),
(166, 112, 'chat_data_0_response_type', 'Text'),
(167, 112, '_chat_data_0_response_type', 'field_5b9824e74f2fd'),
(168, 112, 'chat_data_0_response_trigger', 'User Input'),
(169, 112, '_chat_data_0_response_trigger', 'field_5b986781c90d5'),
(170, 112, 'chat_data_0_requires_answer', 'false'),
(171, 112, '_chat_data_0_requires_answer', 'field_5b99bb37d51ed'),
(172, 112, 'chat_data_0_prompt_response', 'We’d love to. Do you want the greatest hits, or all our work?|Sounds like a plan. Do you want the greatest hits, or all our work?'),
(173, 112, '_chat_data_0_prompt_response', 'field_5b98262066635'),
(174, 112, 'chat_data_0_prompt_response_small_print', ''),
(175, 112, '_chat_data_0_prompt_response_small_print', 'field_5b98667bb1ac1'),
(176, 112, 'chat_data_0_prompts_0_prompt', 'Watch the showreel'),
(177, 112, '_chat_data_0_prompts_0_prompt', 'field_5b986bca1b829'),
(178, 112, 'chat_data_0_prompts_0_prompt_shortcut_key', 'S'),
(179, 112, '_chat_data_0_prompts_0_prompt_shortcut_key', 'field_5b98256b4b393'),
(180, 112, 'chat_data_0_prompts_1_prompt', 'See all our work'),
(181, 112, '_chat_data_0_prompts_1_prompt', 'field_5b986bca1b829'),
(182, 112, 'chat_data_0_prompts_1_prompt_shortcut_key', 'W'),
(183, 112, '_chat_data_0_prompts_1_prompt_shortcut_key', 'field_5b98256b4b393'),
(184, 112, 'chat_data_0_prompts', '2'),
(185, 112, '_chat_data_0_prompts', 'field_5b9825324b391'),
(186, 112, 'chat_data', '2'),
(187, 112, '_chat_data', 'field_5b9824b34f2fc'),
(190, 100, 'chat_data_4_response_trigger', 'User Input'),
(191, 100, '_chat_data_4_response_trigger', 'field_5b986781c90d5'),
(192, 100, 'chat_data_4_requires_answer', 'false'),
(193, 100, '_chat_data_4_requires_answer', 'field_5b99bb37d51ed'),
(194, 100, 'chat_data_4_prompt_response', 'Go ahead, we won’t bite. Go ahead, we won’t bite. Go ahead, we won’t bite. Go ahead, we won’t bite.'),
(195, 100, '_chat_data_4_prompt_response', 'field_5b98262066635'),
(196, 100, 'chat_data_4_prompt_response_small_print', ''),
(197, 100, '_chat_data_4_prompt_response_small_print', 'field_5b98667bb1ac1'),
(256, 113, '_edit_last', '1'),
(257, 113, '_edit_lock', '1537128617:1'),
(258, 113, 'user_input', ''),
(259, 113, '_user_input', 'field_5b99babc718f9'),
(260, 113, 'default_page', ''),
(261, 113, '_default_page', 'field_5b9af643b8a48'),
(262, 113, 'chat_data_0_response_type', 'Text'),
(263, 113, '_chat_data_0_response_type', 'field_5b9824e74f2fd'),
(264, 113, 'chat_data_0_response_trigger', 'User Input'),
(265, 113, '_chat_data_0_response_trigger', 'field_5b986781c90d5'),
(266, 113, 'chat_data_0_requires_answer', 'true'),
(267, 113, '_chat_data_0_requires_answer', 'field_5b99bb37d51ed'),
(268, 113, 'chat_data_0_video_response', '<iframe src=\"https://player.vimeo.com/video/289199908\" width=\"640\" height=\"258\" frameborder=\"0\" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'),
(269, 113, '_chat_data_0_video_response', 'field_5b99712a65ed8'),
(270, 113, 'chat_data', '2'),
(271, 113, '_chat_data', 'field_5b9824b34f2fc'),
(272, 113, 'chat_data_0_text_response', 'Here you go, check this shizzle out'),
(273, 113, '_chat_data_0_text_response', 'field_5b9825164f2fe'),
(274, 113, 'chat_data_0_text_response_small_print', ''),
(275, 113, '_chat_data_0_text_response_small_print', 'field_5b986635b1ac0'),
(276, 113, 'chat_data_1_response_type', 'Video'),
(277, 113, '_chat_data_1_response_type', 'field_5b9824e74f2fd'),
(278, 113, 'chat_data_1_response_trigger', 'User Input'),
(279, 113, '_chat_data_1_response_trigger', 'field_5b986781c90d5'),
(280, 113, 'chat_data_1_requires_answer', 'true'),
(281, 113, '_chat_data_1_requires_answer', 'field_5b99bb37d51ed'),
(282, 113, 'chat_data_1_video_response', '289371414'),
(283, 113, '_chat_data_1_video_response', 'field_5b99712a65ed8'),
(284, 114, '_edit_last', '1'),
(285, 114, 'user_input', ''),
(286, 114, '_user_input', 'field_5b99babc718f9'),
(287, 114, 'default_page', ''),
(288, 114, '_default_page', 'field_5b9af643b8a48'),
(289, 114, 'chat_data_0_response_type', 'Text'),
(290, 114, '_chat_data_0_response_type', 'field_5b9824e74f2fd'),
(291, 114, 'chat_data_0_response_trigger', 'User Input'),
(292, 114, '_chat_data_0_response_trigger', 'field_5b986781c90d5'),
(293, 114, 'chat_data_0_requires_answer', 'true'),
(294, 114, '_chat_data_0_requires_answer', 'field_5b99bb37d51ed'),
(295, 114, 'chat_data_0_text_response', '<img src=\"https://i.imgflip.com/cs5mr.jpg\" width=\"100%\">'),
(296, 114, '_chat_data_0_text_response', 'field_5b9825164f2fe'),
(297, 114, 'chat_data_0_text_response_small_print', ''),
(298, 114, '_chat_data_0_text_response_small_print', 'field_5b986635b1ac0'),
(299, 114, 'chat_data', '2'),
(300, 114, '_chat_data', 'field_5b9824b34f2fc'),
(301, 114, '_edit_lock', '1537148369:1'),
(323, 114, 'chat_data_1_response_type', 'Text'),
(324, 114, '_chat_data_1_response_type', 'field_5b9824e74f2fd'),
(325, 114, 'chat_data_1_response_trigger', 'User Input'),
(326, 114, '_chat_data_1_response_trigger', 'field_5b986781c90d5'),
(327, 114, 'chat_data_1_requires_answer', 'true'),
(328, 114, '_chat_data_1_requires_answer', 'field_5b99bb37d51ed'),
(329, 114, 'chat_data_1_text_response', 'Try again..... and next time, be nice! 🧐'),
(330, 114, '_chat_data_1_text_response', 'field_5b9825164f2fe'),
(331, 114, 'chat_data_1_text_response_small_print', ''),
(332, 114, '_chat_data_1_text_response_small_print', 'field_5b986635b1ac0'),
(333, 117, '_edit_last', '1'),
(334, 117, '_edit_lock', '1537148775:1'),
(335, 123, '_edit_last', '1'),
(336, 123, '_edit_lock', '1537065403:1'),
(337, 124, '_edit_last', '1'),
(338, 124, '_edit_lock', '1537148819:1'),
(339, 127, '_wp_attached_file', '2018/09/pexels-photo-1414741.jpeg'),
(340, 127, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1050;s:6:\"height\";i:700;s:4:\"file\";s:33:\"2018/09/pexels-photo-1414741.jpeg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:33:\"pexels-photo-1414741-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:33:\"pexels-photo-1414741-300x200.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:33:\"pexels-photo-1414741-768x512.jpeg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:34:\"pexels-photo-1414741-1024x683.jpeg\";s:5:\"width\";i:1024;s:6:\"height\";i:683;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(341, 126, '_edit_last', '1'),
(342, 126, 'client', '123'),
(343, 126, '_client', 'field_5b9dc18d9edf5'),
(344, 126, 'case_study', '124'),
(345, 126, '_case_study', 'field_5b9dc1bf9edf6'),
(346, 126, 'image', '127'),
(347, 126, '_image', 'field_5b9dc1d19edf7'),
(348, 126, '_edit_lock', '1537116948:1'),
(349, 128, '_edit_last', '1'),
(350, 128, '_edit_lock', '1537128584:1'),
(351, 128, 'user_input', ''),
(352, 128, '_user_input', 'field_5b99babc718f9'),
(353, 128, 'default_page', ''),
(354, 128, '_default_page', 'field_5b9af643b8a48'),
(355, 128, 'chat_data_0_response_type', 'Text'),
(356, 128, '_chat_data_0_response_type', 'field_5b9824e74f2fd'),
(357, 128, 'chat_data_0_response_trigger', 'User Input'),
(358, 128, '_chat_data_0_response_trigger', 'field_5b986781c90d5'),
(359, 128, 'chat_data_0_requires_answer', 'true'),
(360, 128, '_chat_data_0_requires_answer', 'field_5b99bb37d51ed'),
(361, 128, 'chat_data_0_content_response_type', 'Work List'),
(362, 128, '_chat_data_0_content_response_type', 'field_5b983044ad07e'),
(363, 128, 'chat_data', '2'),
(364, 128, '_chat_data', 'field_5b9824b34f2fc'),
(365, 128, 'chat_data_0_text_response', 'Here’s our latest and greatest work.'),
(366, 128, '_chat_data_0_text_response', 'field_5b9825164f2fe'),
(367, 128, 'chat_data_0_text_response_small_print', ''),
(368, 128, '_chat_data_0_text_response_small_print', 'field_5b986635b1ac0'),
(369, 128, 'chat_data_1_response_type', 'Content'),
(370, 128, '_chat_data_1_response_type', 'field_5b9824e74f2fd'),
(371, 128, 'chat_data_1_response_trigger', 'User Input'),
(372, 128, '_chat_data_1_response_trigger', 'field_5b986781c90d5'),
(373, 128, 'chat_data_1_requires_answer', 'true'),
(374, 128, '_chat_data_1_requires_answer', 'field_5b99bb37d51ed'),
(375, 128, 'chat_data_1_content_response_type', 'Work List'),
(376, 128, '_chat_data_1_content_response_type', 'field_5b983044ad07e'),
(377, 129, '_edit_last', '1'),
(378, 129, '_edit_lock', '1537067671:1'),
(379, 130, '_wp_attached_file', '2018/09/pexels-photo-813269.jpeg'),
(380, 130, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1227;s:6:\"height\";i:700;s:4:\"file\";s:32:\"2018/09/pexels-photo-813269.jpeg\";s:5:\"sizes\";a:4:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:32:\"pexels-photo-813269-150x150.jpeg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:32:\"pexels-photo-813269-300x171.jpeg\";s:5:\"width\";i:300;s:6:\"height\";i:171;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:32:\"pexels-photo-813269-768x438.jpeg\";s:5:\"width\";i:768;s:6:\"height\";i:438;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:33:\"pexels-photo-813269-1024x584.jpeg\";s:5:\"width\";i:1024;s:6:\"height\";i:584;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(381, 129, 'client', '123'),
(382, 129, '_client', 'field_5b9dc18d9edf5'),
(383, 129, 'case_study', '124'),
(384, 129, '_case_study', 'field_5b9dc1bf9edf6'),
(385, 129, 'image', '130'),
(386, 129, '_image', 'field_5b9dc1d19edf7'),
(387, 100, 'trigger_0_user_input', 'home'),
(388, 100, '_trigger_0_user_input', 'field_5b9e777f2de52'),
(389, 100, 'trigger_1_user_input', 'welcome'),
(390, 100, '_trigger_1_user_input', 'field_5b9e777f2de52'),
(391, 100, 'trigger_2_user_input', 'start'),
(392, 100, '_trigger_2_user_input', 'field_5b9e777f2de52'),
(393, 100, 'trigger', '7'),
(394, 100, '_trigger', 'field_5b9e776b2de51'),
(395, 114, 'trigger_0_user_input', 'fuck'),
(396, 114, '_trigger_0_user_input', 'field_5b9e777f2de52'),
(397, 114, 'trigger_1_user_input', 'shit'),
(398, 114, '_trigger_1_user_input', 'field_5b9e777f2de52'),
(399, 114, 'trigger_2_user_input', 'cunt'),
(400, 114, '_trigger_2_user_input', 'field_5b9e777f2de52'),
(401, 114, 'trigger', '8'),
(402, 114, '_trigger', 'field_5b9e776b2de51'),
(403, 128, 'trigger_0_user_input', 'See all our work'),
(404, 128, '_trigger_0_user_input', 'field_5b9e777f2de52'),
(405, 128, 'trigger_1_user_input', 'see work'),
(406, 128, '_trigger_1_user_input', 'field_5b9e777f2de52'),
(407, 128, 'trigger_2_user_input', 'show all work'),
(408, 128, '_trigger_2_user_input', 'field_5b9e777f2de52'),
(409, 128, 'trigger', '4'),
(410, 128, '_trigger', 'field_5b9e776b2de51'),
(411, 112, 'trigger_0_user_input', 'work'),
(412, 112, '_trigger_0_user_input', 'field_5b9e777f2de52'),
(413, 112, 'trigger_1_user_input', 'show me work'),
(414, 112, '_trigger_1_user_input', 'field_5b9e777f2de52'),
(415, 112, 'trigger', '4'),
(416, 112, '_trigger', 'field_5b9e776b2de51'),
(417, 113, 'trigger_0_user_input', 'watch the showreel'),
(418, 113, '_trigger_0_user_input', 'field_5b9e777f2de52'),
(419, 113, 'trigger_1_user_input', 'watch showreel'),
(420, 113, '_trigger_1_user_input', 'field_5b9e777f2de52'),
(421, 113, 'trigger_2_user_input', 'showreel'),
(422, 113, '_trigger_2_user_input', 'field_5b9e777f2de52'),
(423, 113, 'trigger', '4'),
(424, 113, '_trigger', 'field_5b9e776b2de51'),
(425, 109, 'trigger_0_user_input', 'error'),
(426, 109, '_trigger_0_user_input', 'field_5b9e777f2de52'),
(427, 109, 'trigger', '1'),
(428, 109, '_trigger', 'field_5b9e776b2de51'),
(429, 114, 'trigger_3_user_input', 'motherfucker'),
(430, 114, '_trigger_3_user_input', 'field_5b9e777f2de52'),
(431, 114, 'trigger_4_user_input', 'bollocks'),
(432, 114, '_trigger_4_user_input', 'field_5b9e777f2de52'),
(433, 114, 'trigger_5_user_input', 'bastard'),
(434, 114, '_trigger_5_user_input', 'field_5b9e777f2de52'),
(435, 114, 'trigger_6_user_input', 'dick'),
(436, 114, '_trigger_6_user_input', 'field_5b9e777f2de52'),
(437, 112, 'trigger_2_user_input', 'show work'),
(438, 112, '_trigger_2_user_input', 'field_5b9e777f2de52'),
(439, 112, 'trigger_3_user_input', 'view work'),
(440, 112, '_trigger_3_user_input', 'field_5b9e777f2de52'),
(441, 112, 'chat_data_0_text_response', 'We’d love to. Do you want the greatest hits, or all our work?|Sounds like a plan. Do you want the greatest hits, or all our work?'),
(442, 112, '_chat_data_0_text_response', 'field_5b9825164f2fe'),
(443, 112, 'chat_data_0_text_response_small_print', ''),
(444, 112, '_chat_data_0_text_response_small_print', 'field_5b986635b1ac0'),
(445, 112, 'chat_data_1_response_type', 'Prompt'),
(446, 112, '_chat_data_1_response_type', 'field_5b9824e74f2fd'),
(447, 112, 'chat_data_1_prompt_response', 'We’d love to. Do you want the greatest hits, or all our work?|Sounds like a plan. Do you want the greatest hits, or all our work?'),
(448, 112, '_chat_data_1_prompt_response', 'field_5b98262066635'),
(449, 112, 'chat_data_1_prompt_response_small_print', ''),
(450, 112, '_chat_data_1_prompt_response_small_print', 'field_5b98667bb1ac1'),
(451, 112, 'chat_data_1_prompts_0_prompt', 'Watch the showreel'),
(452, 112, '_chat_data_1_prompts_0_prompt', 'field_5b986bca1b829'),
(453, 112, 'chat_data_1_prompts_0_prompt_shortcut_key', 'S'),
(454, 112, '_chat_data_1_prompts_0_prompt_shortcut_key', 'field_5b98256b4b393'),
(455, 112, 'chat_data_1_prompts_1_prompt', 'See all our work'),
(456, 112, '_chat_data_1_prompts_1_prompt', 'field_5b986bca1b829'),
(457, 112, 'chat_data_1_prompts_1_prompt_shortcut_key', 'W'),
(458, 112, '_chat_data_1_prompts_1_prompt_shortcut_key', 'field_5b98256b4b393'),
(459, 112, 'chat_data_1_prompts', '2'),
(460, 112, '_chat_data_1_prompts', 'field_5b9825324b391'),
(461, 113, 'trigger_3_user_input', 'S'),
(462, 113, '_trigger_3_user_input', 'field_5b9e777f2de52'),
(465, 128, 'trigger_3_user_input', 'W'),
(466, 128, '_trigger_3_user_input', 'field_5b9e777f2de52'),
(467, 100, 'trigger_3_user_input', 'hello'),
(468, 100, '_trigger_3_user_input', 'field_5b9e777f2de52'),
(469, 100, 'trigger_4_user_input', 'hi'),
(470, 100, '_trigger_4_user_input', 'field_5b9e777f2de52'),
(471, 100, 'trigger_5_user_input', 'hey'),
(472, 100, '_trigger_5_user_input', 'field_5b9e777f2de52'),
(473, 100, 'trigger_6_user_input', 'restart'),
(474, 100, '_trigger_6_user_input', 'field_5b9e777f2de52'),
(475, 136, '_edit_last', '1'),
(476, 136, '_edit_lock', '1537149624:1'),
(477, 136, 'default_page', 'Contact'),
(478, 136, '_default_page', 'field_5b9af643b8a48'),
(479, 136, 'trigger_0_user_input', 'contact us'),
(480, 136, '_trigger_0_user_input', 'field_5b9e777f2de52'),
(481, 136, 'trigger_1_user_input', 'contact'),
(482, 136, '_trigger_1_user_input', 'field_5b9e777f2de52'),
(483, 136, 'trigger_2_user_input', 'get in touch'),
(484, 136, '_trigger_2_user_input', 'field_5b9e777f2de52'),
(485, 136, 'trigger', '3'),
(486, 136, '_trigger', 'field_5b9e776b2de51'),
(487, 136, 'chat_data_0_response_type', 'Text'),
(488, 136, '_chat_data_0_response_type', 'field_5b9824e74f2fd'),
(489, 136, 'chat_data_0_text_response', 'Let’s talk.'),
(490, 136, '_chat_data_0_text_response', 'field_5b9825164f2fe'),
(491, 136, 'chat_data_0_text_response_small_print', ''),
(492, 136, '_chat_data_0_text_response_small_print', 'field_5b986635b1ac0'),
(493, 136, 'chat_data_1_response_type', 'Text'),
(494, 136, '_chat_data_1_response_type', 'field_5b9824e74f2fd'),
(495, 136, 'chat_data_1_text_response', 'We’re just off Oxford Circus. Pop into the shops on your way to see us, we won’t tell.'),
(496, 136, '_chat_data_1_text_response', 'field_5b9825164f2fe'),
(497, 136, 'chat_data_1_text_response_small_print', ''),
(498, 136, '_chat_data_1_text_response_small_print', 'field_5b986635b1ac0'),
(499, 136, 'chat_data_2_response_type', 'Link'),
(500, 136, '_chat_data_2_response_type', 'field_5b9824e74f2fd'),
(501, 136, 'chat_data_2_text_response', 'We’re just off Oxford Circus. Pop into the shops on your way to see us, we won’t tell.'),
(502, 136, '_chat_data_2_text_response', 'field_5b9825164f2fe'),
(503, 136, 'chat_data_2_text_response_small_print', ''),
(504, 136, '_chat_data_2_text_response_small_print', 'field_5b986635b1ac0'),
(505, 136, 'chat_data_3_response_type', 'Text'),
(506, 136, '_chat_data_3_response_type', 'field_5b9824e74f2fd'),
(507, 136, 'chat_data_3_text_response', 'We’d love to hear from you. Would you like to discuss new business, or do you have a general inquiry?'),
(508, 136, '_chat_data_3_text_response', 'field_5b9825164f2fe'),
(509, 136, 'chat_data_3_text_response_small_print', ''),
(510, 136, '_chat_data_3_text_response_small_print', 'field_5b986635b1ac0'),
(511, 136, 'chat_data_4_response_type', 'Prompt'),
(512, 136, '_chat_data_4_response_type', 'field_5b9824e74f2fd'),
(513, 136, 'chat_data_4_text_response', 'We’d love to hear from you. Would you like to discuss new business, or do you have a general inquiry?'),
(514, 136, '_chat_data_4_text_response', 'field_5b9825164f2fe'),
(515, 136, 'chat_data_4_text_response_small_print', ''),
(516, 136, '_chat_data_4_text_response_small_print', 'field_5b986635b1ac0'),
(529, 136, 'chat_data', '5'),
(530, 136, '_chat_data', 'field_5b9824b34f2fc'),
(531, 137, '_edit_last', '1'),
(532, 137, '_edit_lock', '1537146166:1'),
(533, 137, 'default_page', ''),
(534, 137, '_default_page', 'field_5b9af643b8a48'),
(535, 137, 'trigger_0_user_input', 'New business'),
(536, 137, '_trigger_0_user_input', 'field_5b9e777f2de52'),
(537, 137, 'trigger_1_user_input', 'N'),
(538, 137, '_trigger_1_user_input', 'field_5b9e777f2de52'),
(539, 137, 'trigger', '2'),
(540, 137, '_trigger', 'field_5b9e776b2de51'),
(541, 137, 'chat_data_0_response_type', 'Text'),
(542, 137, '_chat_data_0_response_type', 'field_5b9824e74f2fd'),
(543, 137, 'chat_data_0_text_response', 'Great. To start, give us your name.'),
(544, 137, '_chat_data_0_text_response', 'field_5b9825164f2fe'),
(545, 137, 'chat_data_0_text_response_small_print', ''),
(546, 137, '_chat_data_0_text_response_small_print', 'field_5b986635b1ac0'),
(547, 137, 'chat_data_1_response_type', 'User Input'),
(548, 137, '_chat_data_1_response_type', 'field_5b9824e74f2fd'),
(549, 137, 'chat_data_1_user_input_response_0_user_input_response_type', 'Name'),
(550, 137, '_chat_data_1_user_input_response_0_user_input_response_type', 'field_5b985f4e50138'),
(551, 137, 'chat_data_1_user_input_response_0_user_input_response_text', 'Your name'),
(552, 137, '_chat_data_1_user_input_response_0_user_input_response_text', 'field_5b985edd50137'),
(553, 137, 'chat_data_1_user_input_response_0_user_input_response_small_print', ''),
(554, 137, '_chat_data_1_user_input_response_0_user_input_response_small_print', 'field_5b9866e4e5978'),
(555, 137, 'chat_data_1_user_input_response', '1'),
(556, 137, '_chat_data_1_user_input_response', 'field_5b985757ee726'),
(569, 137, 'chat_data_3_user_input_response_0_user_input_response_small_print', ''),
(570, 137, '_chat_data_3_user_input_response_0_user_input_response_small_print', 'field_5b9866e4e5978'),
(573, 137, 'chat_data', '2'),
(574, 137, '_chat_data', 'field_5b9824b34f2fc'),
(575, 138, '_edit_last', '1'),
(576, 138, '_edit_lock', '1537148153:1'),
(577, 138, 'default_page', ''),
(578, 138, '_default_page', 'field_5b9af643b8a48'),
(579, 138, 'trigger_0_user_input', 'user-email'),
(580, 138, '_trigger_0_user_input', 'field_5b9e777f2de52'),
(581, 138, 'trigger', '1'),
(582, 138, '_trigger', 'field_5b9e776b2de51'),
(583, 138, 'chat_data_0_response_type', 'Text'),
(584, 138, '_chat_data_0_response_type', 'field_5b9824e74f2fd'),
(585, 138, 'chat_data_0_text_response', 'Enter your email address so Laura can get back to you.'),
(586, 138, '_chat_data_0_text_response', 'field_5b9825164f2fe'),
(587, 138, 'chat_data_0_text_response_small_print', 'We don’t like spam either, so we’ll keep your details safe. See our privacy policy for details.'),
(588, 138, '_chat_data_0_text_response_small_print', 'field_5b986635b1ac0'),
(589, 138, 'chat_data', '2'),
(590, 138, '_chat_data', 'field_5b9824b34f2fc'),
(591, 137, 'chat_data_1_user_input_response_type', 'Name'),
(592, 137, '_chat_data_1_user_input_response_type', 'field_5b985f4e50138'),
(593, 137, 'chat_data_1_user_input_response_text', 'Your name'),
(594, 137, '_chat_data_1_user_input_response_text', 'field_5b985edd50137'),
(595, 138, 'chat_data_1_response_type', 'User Input'),
(596, 138, '_chat_data_1_response_type', 'field_5b9824e74f2fd'),
(597, 138, 'chat_data_1_user_input_response_type', 'Email'),
(598, 138, '_chat_data_1_user_input_response_type', 'field_5b985f4e50138'),
(599, 138, 'chat_data_1_user_input_response_text', 'Your email address'),
(600, 138, '_chat_data_1_user_input_response_text', 'field_5b985edd50137'),
(601, 139, '_edit_last', '1'),
(602, 139, '_edit_lock', '1537147282:1'),
(603, 139, 'default_page', ''),
(604, 139, '_default_page', 'field_5b9af643b8a48'),
(605, 139, 'trigger_0_user_input', 'form-submitted'),
(606, 139, '_trigger_0_user_input', 'field_5b9e777f2de52'),
(607, 139, 'trigger', '1'),
(608, 139, '_trigger', 'field_5b9e776b2de51'),
(609, 139, 'chat_data_0_response_type', 'Text'),
(610, 139, '_chat_data_0_response_type', 'field_5b9824e74f2fd'),
(611, 139, 'chat_data_0_text_response', 'Thanks, we will get back to you asap!'),
(612, 139, '_chat_data_0_text_response', 'field_5b9825164f2fe'),
(613, 139, 'chat_data_0_text_response_small_print', ''),
(614, 139, '_chat_data_0_text_response_small_print', 'field_5b986635b1ac0'),
(615, 139, 'chat_data', '1'),
(616, 139, '_chat_data', 'field_5b9824b34f2fc'),
(623, 140, '_edit_last', '1'),
(624, 140, '_edit_lock', '1537148805:1'),
(628, 5, '_wp_trash_meta_status', 'publish'),
(629, 5, '_wp_trash_meta_time', '1537147402'),
(630, 5, '_wp_desired_post_slug', 'welcome-to-the-gutenberg-editor'),
(631, 1, '_wp_trash_meta_status', 'publish'),
(632, 1, '_wp_trash_meta_time', '1537147402'),
(633, 1, '_wp_desired_post_slug', 'hello-world'),
(634, 136, 'chat_data_4_link_response_text', 'Google Maps'),
(635, 136, '_chat_data_4_link_response_text', 'field_5b98541f51940'),
(636, 136, 'chat_data_4_link_response_url', 'https://goo.gl/maps/Vom5fMFyUpx'),
(637, 136, '_chat_data_4_link_response_url', 'field_5b98544f51941'),
(654, 145, 'default_page', ''),
(655, 145, '_default_page', 'field_5b9af643b8a48'),
(656, 145, 'trigger_0_user_input', 'General Inquiry'),
(657, 145, '_trigger_0_user_input', 'field_5b9e777f2de52'),
(658, 145, 'trigger_1_user_input', 'G'),
(659, 145, '_trigger_1_user_input', 'field_5b9e777f2de52'),
(660, 145, 'trigger', '2'),
(661, 145, '_trigger', 'field_5b9e776b2de51'),
(662, 145, 'chat_data_0_response_type', 'Text'),
(663, 145, '_chat_data_0_response_type', 'field_5b9824e74f2fd'),
(664, 145, 'chat_data_0_text_response', 'Great. To start, give us your name.'),
(665, 145, '_chat_data_0_text_response', 'field_5b9825164f2fe'),
(666, 145, 'chat_data_0_text_response_small_print', ''),
(667, 145, '_chat_data_0_text_response_small_print', 'field_5b986635b1ac0'),
(668, 145, 'chat_data_1_response_type', 'User Input'),
(669, 145, '_chat_data_1_response_type', 'field_5b9824e74f2fd'),
(670, 145, 'chat_data_1_user_input_response_0_user_input_response_type', 'Name'),
(671, 145, '_chat_data_1_user_input_response_0_user_input_response_type', 'field_5b985f4e50138'),
(672, 145, 'chat_data_1_user_input_response_0_user_input_response_text', 'Your name'),
(673, 145, '_chat_data_1_user_input_response_0_user_input_response_text', 'field_5b985edd50137'),
(674, 145, 'chat_data_1_user_input_response_0_user_input_response_small_print', ''),
(675, 145, '_chat_data_1_user_input_response_0_user_input_response_small_print', 'field_5b9866e4e5978'),
(676, 145, 'chat_data_1_user_input_response', '1'),
(677, 145, '_chat_data_1_user_input_response', 'field_5b985757ee726'),
(678, 145, 'chat_data_3_user_input_response_0_user_input_response_small_print', ''),
(679, 145, '_chat_data_3_user_input_response_0_user_input_response_small_print', 'field_5b9866e4e5978'),
(680, 145, 'chat_data', '2'),
(681, 145, '_chat_data', 'field_5b9824b34f2fc'),
(682, 145, 'chat_data_1_user_input_response_type', 'Name'),
(683, 145, '_chat_data_1_user_input_response_type', 'field_5b985f4e50138'),
(684, 145, 'chat_data_1_user_input_response_text', 'Your name'),
(685, 145, '_chat_data_1_user_input_response_text', 'field_5b985edd50137'),
(686, 145, '_dp_original', '137'),
(687, 145, '_edit_lock', '1537148229:1'),
(688, 145, '_edit_last', '1'),
(728, 114, 'trigger_7_user_input', 'bitch'),
(729, 114, '_trigger_7_user_input', 'field_5b9e777f2de52'),
(730, 136, 'chat_data_3_link_response_pre_text', 'Partners Andrews Aldridge\\r\\n60 Great Portland Street\\r\\nLondon\\r\\nW1W 7RT'),
(731, 136, '_chat_data_3_link_response_pre_text', 'field_5b9f08505f945'),
(732, 136, 'chat_data_3_link_response_url', 'https://goo.gl/maps/Vom5fMFyUpx'),
(733, 136, '_chat_data_3_link_response_url', 'field_5b98544f51941'),
(734, 136, 'chat_data_3_link_response_text', 'Google Maps'),
(735, 136, '_chat_data_3_link_response_text', 'field_5b98541f51940'),
(736, 136, 'chat_data_2_link_response_pre_text', 'Partners Andrews Aldridge\\r\\n60 Great Portland Street\\r\\nLondon\\r\\nW1W 7RT'),
(737, 136, '_chat_data_2_link_response_pre_text', 'field_5b9f08505f945'),
(738, 136, 'chat_data_2_link_response_url', 'https://goo.gl/maps/Vom5fMFyUpx'),
(739, 136, '_chat_data_2_link_response_url', 'field_5b98544f51941'),
(740, 136, 'chat_data_2_link_response_text', 'Google Maps'),
(741, 136, '_chat_data_2_link_response_text', 'field_5b98541f51940'),
(742, 136, 'chat_data_4_prompts_0_prompt', 'New business'),
(743, 136, '_chat_data_4_prompts_0_prompt', 'field_5b986bca1b829'),
(744, 136, 'chat_data_4_prompts_0_prompt_shortcut_key', 'N'),
(745, 136, '_chat_data_4_prompts_0_prompt_shortcut_key', 'field_5b98256b4b393'),
(746, 136, 'chat_data_4_prompts_1_prompt', 'General inquiry'),
(747, 136, '_chat_data_4_prompts_1_prompt', 'field_5b986bca1b829'),
(748, 136, 'chat_data_4_prompts_1_prompt_shortcut_key', 'G'),
(749, 136, '_chat_data_4_prompts_1_prompt_shortcut_key', 'field_5b98256b4b393'),
(750, 136, 'chat_data_4_prompts', '2'),
(751, 136, '_chat_data_4_prompts', 'field_5b9825324b391');

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2018-09-10 23:55:35', '2018-09-10 22:55:35', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'trash', 'open', 'open', '', 'hello-world__trashed', '', '', '2018-09-17 02:23:22', '2018-09-17 01:23:22', '', 0, 'http://localhost:8888/paa/?p=1', 0, 'post', '', 0),
(4, 1, '2018-09-10 23:55:44', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-09-10 23:55:44', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?p=4', 0, 'post', '', 0),
(5, 1, '2018-09-10 23:57:33', '2018-09-10 22:57:33', '<!-- wp:cover-image {\"url\":\"https://cldup.com/Fz-ASbo2s3.jpg\",\"align\":\"wide\"} -->\\n<div class=\"wp-block-cover-image has-background-dim alignwide\" style=\"background-image:url(https://cldup.com/Fz-ASbo2s3.jpg)\"><p class=\"wp-block-cover-image-text\">Of Mountains &amp; Printing Presses</p></div>\\n<!-- /wp:cover-image -->\\n\\n<!-- wp:paragraph -->\\n<p>The goal of this new editor is to make adding rich content to WordPress simple and enjoyable. This whole post is composed of <em>pieces of content</em>—somewhat similar to LEGO bricks—that you can move around and interact with. Move your cursor around and you’ll notice the different blocks light up with outlines and arrows. Press the arrows to reposition blocks quickly, without fearing about losing things in the process of copying and pasting.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>What you are reading now is a <strong>text block</strong> the most basic block of all. The text block has its own controls to be moved freely around the post...</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph {\"align\":\"right\"} -->\\n<p style=\"text-align:right\">... like this one, which is right-aligned.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Headings are separate blocks as well, which helps with the outline and organisation of your content.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:heading -->\\n<h2>A Picture is Worth a Thousand Words</h2>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph -->\\n<p>Handling images and media with the utmost care is a primary focus of the new editor. Hopefully, you’ll find aspects of adding captions or going full-width with your pictures much easier and robust than before.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:image {\"align\":\"center\"} -->\\n<div class=\"wp-block-image\"><figure class=\"aligncenter\"><img src=\"https://cldup.com/cXyG__fTLN.jpg\" alt=\"Beautiful landscape\"/><figcaption>If your theme supports it, you’ll see the \"wide\" button on the image toolbar. Give it a try.</figcaption></figure></div>\\n<!-- /wp:image -->\\n\\n<!-- wp:paragraph -->\\n<p>Try selecting and removing or editing the caption, now you don’t have to be careful about selecting the image or other text by mistake and ruining the presentation.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:heading -->\\n<h2>The <em>Inserter</em> Tool</h2>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph -->\\n<p>Imagine everything that WordPress can do is available to you quickly and in the same place on the interface. No need to figure out HTML tags, classes, or remember complicated shortcode syntax. That’s the spirit behind the inserter—the <code>(+)</code> button you’ll see around the editor—which allows you to browse all available content blocks and add them into your post. Plugins and themes are able to register their own, opening up all sort of possibilities for rich editing and publishing.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Go give it a try, you may discover things WordPress can already add into your posts that you didn’t know about. Here’s a short list of what you can currently find there:</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:list -->\\n<ul>\\n	<li>Text &amp; Headings</li>\\n	<li>Images &amp; Videos</li>\\n	<li>Galleries</li>\\n	<li>Embeds, like YouTube, Tweets, or other WordPress posts.</li>\\n	<li>Layout blocks, like Buttons, Hero Images, Separators, etc.</li>\\n	<li>And <em>Lists</em> like this one of course :)</li>\\n</ul>\\n<!-- /wp:list -->\\n\\n<!-- wp:separator -->\\n<hr class=\"wp-block-separator\"/>\\n<!-- /wp:separator -->\\n\\n<!-- wp:heading -->\\n<h2>Visual Editing</h2>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph -->\\n<p>A huge benefit of blocks is that you can edit them in place and manipulate your content directly. Instead of having fields for editing things like the source of a quote, or the text of a button, you can directly change the content. Try editing the following quote:</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:quote -->\\n<blockquote class=\"wp-block-quote\"><p>The editor will endeavour to create a new page and post building experience that makes writing rich posts effortless, and has “blocks” to make it easy what today might take shortcodes, custom HTML, or “mystery meat” embed discovery.</p><cite>Matt Mullenweg, 2017</cite></blockquote>\\n<!-- /wp:quote -->\\n\\n<!-- wp:paragraph -->\\n<p>The information corresponding to the source of the quote is a separate text field, similar to captions under images, so the structure of the quote is protected even if you select, modify, or remove the source. It’s always easy to add it back.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Blocks can be anything you need. For instance, you may want to add a subdued quote as part of the composition of your text, or you may prefer to display a giant stylised one. All of these options are available in the inserter.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:gallery {\"columns\":2} -->\\n<ul class=\"wp-block-gallery columns-2 is-cropped\"><li class=\"blocks-gallery-item\"><figure><img src=\"https://cldup.com/n0g6ME5VKC.jpg\" alt=\"\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"https://cldup.com/ZjESfxPI3R.jpg\" alt=\"\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"https://cldup.com/EKNF8xD2UM.jpg\" alt=\"\"/></figure></li></ul>\\n<!-- /wp:gallery -->\\n\\n<!-- wp:paragraph -->\\n<p>You can change the number of columns in your galleries by dragging a slider in the block inspector in the sidebar.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:heading -->\\n<h2>Media Rich</h2>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph -->\\n<p>If you combine the new <strong>wide</strong> and <strong>full-wide</strong> alignments with galleries, you can create a very media-rich layout, very quickly:</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:image {\"align\":\"full\"} -->\\n<figure class=\"wp-block-image alignfull\"><img src=\"https://cldup.com/8lhI-gKnI2.jpg\" alt=\"Accessibility is important — don’t forget image alt attribute\"/></figure>\\n<!-- /wp:image -->\\n\\n<!-- wp:paragraph -->\\n<p>Sure, the full-wide image can be pretty big. But sometimes the image is worth it.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:gallery {\"align\":\"wide\"} -->\\n<ul class=\"wp-block-gallery alignwide columns-2 is-cropped\"><li class=\"blocks-gallery-item\"><figure><img src=\"https://cldup.com/_rSwtEeDGD.jpg\" alt=\"\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"https://cldup.com/L-cC3qX2DN.jpg\" alt=\"\"/></figure></li></ul>\\n<!-- /wp:gallery -->\\n\\n<!-- wp:paragraph -->\\n<p>The above is a gallery with just two images. It’s an easier way to create visually appealing layouts, without having to deal with floats. You can also easily convert the gallery back to individual images again, by using the block switcher.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Any block can opt into these alignments. The embed block has them also, and is responsive out of the box:</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:core-embed/vimeo {\"url\":\"https://vimeo.com/22439234\",\"type\":\"video\",\"providerNameSlug\":\"vimeo\",\"align\":\"wide\"} -->\\n<figure class=\"wp-block-embed-vimeo alignwide wp-block-embed is-type-video is-provider-vimeo\">\\nhttps://vimeo.com/22439234\\n</figure>\\n<!-- /wp:core-embed/vimeo -->\\n\\n<!-- wp:paragraph -->\\n<p>You can build any block you like, static or dynamic, decorative or plain. Here’s a pullquote block:</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:pullquote -->\\n<blockquote class=\"wp-block-pullquote\"><p>Code is Poetry</p><cite>The WordPress community</cite></blockquote>\\n<!-- /wp:pullquote -->\\n\\n<!-- wp:paragraph {\"align\":\"center\"} -->\\n<p style=\"text-align:center\">\\n	<em>\\n		If you want to learn more about how to build additional blocks, or if you are interested in helping with the project, head over to the <a href=\"%s\">GitHub repository</a>.	</em>\\n</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:button {\"align\":\"center\"} -->\\n<div class=\"wp-block-button aligncenter\"><a class=\"wp-block-button__link\" href=\"https://github.com/WordPress/gutenberg\">Help build Gutenberg</a></div>\\n<!-- /wp:button -->\\n\\n<!-- wp:separator -->\\n<hr class=\"wp-block-separator\"/>\\n<!-- /wp:separator -->\\n\\n<!-- wp:paragraph {\"align\":\"center\"} -->\\n<p style=\"text-align:center\">Thanks for testing Gutenberg!</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph {\"align\":\"center\"} -->\\n<p style=\"text-align:center\"><img draggable=\"false\" class=\"emoji\" alt=\"👋\" src=\"https://s.w.org/images/core/emoji/2.3/svg/1f44b.svg\"/></p>\\n<!-- /wp:paragraph -->', 'Welcome to the Gutenberg Editor', '', 'trash', 'open', 'open', '', 'welcome-to-the-gutenberg-editor__trashed', '', '\\nhttps://vimeo.com/22439234', '2018-09-17 02:23:22', '2018-09-17 01:23:22', '', 0, 'http://localhost:8888/paa/?p=5', 0, 'post', '', 0),
(6, 1, '2018-09-10 23:57:33', '2018-09-10 22:57:33', '<!-- wp:cover-image {\"url\":\"https://cldup.com/Fz-ASbo2s3.jpg\",\"align\":\"wide\"} -->\\n<div class=\"wp-block-cover-image has-background-dim alignwide\" style=\"background-image:url(https://cldup.com/Fz-ASbo2s3.jpg)\"><p class=\"wp-block-cover-image-text\">Of Mountains &amp; Printing Presses</p></div>\\n<!-- /wp:cover-image -->\\n\\n<!-- wp:paragraph -->\\n<p>The goal of this new editor is to make adding rich content to WordPress simple and enjoyable. This whole post is composed of <em>pieces of content</em>—somewhat similar to LEGO bricks—that you can move around and interact with. Move your cursor around and you’ll notice the different blocks light up with outlines and arrows. Press the arrows to reposition blocks quickly, without fearing about losing things in the process of copying and pasting.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>What you are reading now is a <strong>text block</strong> the most basic block of all. The text block has its own controls to be moved freely around the post...</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph {\"align\":\"right\"} -->\\n<p style=\"text-align:right\">... like this one, which is right-aligned.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Headings are separate blocks as well, which helps with the outline and organisation of your content.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:heading -->\\n<h2>A Picture is Worth a Thousand Words</h2>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph -->\\n<p>Handling images and media with the utmost care is a primary focus of the new editor. Hopefully, you’ll find aspects of adding captions or going full-width with your pictures much easier and robust than before.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:image {\"align\":\"center\"} -->\\n<div class=\"wp-block-image\"><figure class=\"aligncenter\"><img src=\"https://cldup.com/cXyG__fTLN.jpg\" alt=\"Beautiful landscape\"/><figcaption>If your theme supports it, you’ll see the \"wide\" button on the image toolbar. Give it a try.</figcaption></figure></div>\\n<!-- /wp:image -->\\n\\n<!-- wp:paragraph -->\\n<p>Try selecting and removing or editing the caption, now you don’t have to be careful about selecting the image or other text by mistake and ruining the presentation.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:heading -->\\n<h2>The <em>Inserter</em> Tool</h2>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph -->\\n<p>Imagine everything that WordPress can do is available to you quickly and in the same place on the interface. No need to figure out HTML tags, classes, or remember complicated shortcode syntax. That’s the spirit behind the inserter—the <code>(+)</code> button you’ll see around the editor—which allows you to browse all available content blocks and add them into your post. Plugins and themes are able to register their own, opening up all sort of possibilities for rich editing and publishing.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Go give it a try, you may discover things WordPress can already add into your posts that you didn’t know about. Here’s a short list of what you can currently find there:</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:list -->\\n<ul>\\n	<li>Text &amp; Headings</li>\\n	<li>Images &amp; Videos</li>\\n	<li>Galleries</li>\\n	<li>Embeds, like YouTube, Tweets, or other WordPress posts.</li>\\n	<li>Layout blocks, like Buttons, Hero Images, Separators, etc.</li>\\n	<li>And <em>Lists</em> like this one of course :)</li>\\n</ul>\\n<!-- /wp:list -->\\n\\n<!-- wp:separator -->\\n<hr class=\"wp-block-separator\"/>\\n<!-- /wp:separator -->\\n\\n<!-- wp:heading -->\\n<h2>Visual Editing</h2>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph -->\\n<p>A huge benefit of blocks is that you can edit them in place and manipulate your content directly. Instead of having fields for editing things like the source of a quote, or the text of a button, you can directly change the content. Try editing the following quote:</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:quote -->\\n<blockquote class=\"wp-block-quote\"><p>The editor will endeavour to create a new page and post building experience that makes writing rich posts effortless, and has “blocks” to make it easy what today might take shortcodes, custom HTML, or “mystery meat” embed discovery.</p><cite>Matt Mullenweg, 2017</cite></blockquote>\\n<!-- /wp:quote -->\\n\\n<!-- wp:paragraph -->\\n<p>The information corresponding to the source of the quote is a separate text field, similar to captions under images, so the structure of the quote is protected even if you select, modify, or remove the source. It’s always easy to add it back.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Blocks can be anything you need. For instance, you may want to add a subdued quote as part of the composition of your text, or you may prefer to display a giant stylised one. All of these options are available in the inserter.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:gallery {\"columns\":2} -->\\n<ul class=\"wp-block-gallery columns-2 is-cropped\"><li class=\"blocks-gallery-item\"><figure><img src=\"https://cldup.com/n0g6ME5VKC.jpg\" alt=\"\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"https://cldup.com/ZjESfxPI3R.jpg\" alt=\"\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"https://cldup.com/EKNF8xD2UM.jpg\" alt=\"\"/></figure></li></ul>\\n<!-- /wp:gallery -->\\n\\n<!-- wp:paragraph -->\\n<p>You can change the number of columns in your galleries by dragging a slider in the block inspector in the sidebar.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:heading -->\\n<h2>Media Rich</h2>\\n<!-- /wp:heading -->\\n\\n<!-- wp:paragraph -->\\n<p>If you combine the new <strong>wide</strong> and <strong>full-wide</strong> alignments with galleries, you can create a very media-rich layout, very quickly:</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:image {\"align\":\"full\"} -->\\n<figure class=\"wp-block-image alignfull\"><img src=\"https://cldup.com/8lhI-gKnI2.jpg\" alt=\"Accessibility is important — don’t forget image alt attribute\"/></figure>\\n<!-- /wp:image -->\\n\\n<!-- wp:paragraph -->\\n<p>Sure, the full-wide image can be pretty big. But sometimes the image is worth it.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:gallery {\"align\":\"wide\"} -->\\n<ul class=\"wp-block-gallery alignwide columns-2 is-cropped\"><li class=\"blocks-gallery-item\"><figure><img src=\"https://cldup.com/_rSwtEeDGD.jpg\" alt=\"\"/></figure></li><li class=\"blocks-gallery-item\"><figure><img src=\"https://cldup.com/L-cC3qX2DN.jpg\" alt=\"\"/></figure></li></ul>\\n<!-- /wp:gallery -->\\n\\n<!-- wp:paragraph -->\\n<p>The above is a gallery with just two images. It’s an easier way to create visually appealing layouts, without having to deal with floats. You can also easily convert the gallery back to individual images again, by using the block switcher.</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph -->\\n<p>Any block can opt into these alignments. The embed block has them also, and is responsive out of the box:</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:core-embed/vimeo {\"url\":\"https://vimeo.com/22439234\",\"type\":\"video\",\"providerNameSlug\":\"vimeo\",\"align\":\"wide\"} -->\\n<figure class=\"wp-block-embed-vimeo alignwide wp-block-embed is-type-video is-provider-vimeo\">\\nhttps://vimeo.com/22439234\\n</figure>\\n<!-- /wp:core-embed/vimeo -->\\n\\n<!-- wp:paragraph -->\\n<p>You can build any block you like, static or dynamic, decorative or plain. Here’s a pullquote block:</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:pullquote -->\\n<blockquote class=\"wp-block-pullquote\"><p>Code is Poetry</p><cite>The WordPress community</cite></blockquote>\\n<!-- /wp:pullquote -->\\n\\n<!-- wp:paragraph {\"align\":\"center\"} -->\\n<p style=\"text-align:center\">\\n	<em>\\n		If you want to learn more about how to build additional blocks, or if you are interested in helping with the project, head over to the <a href=\"%s\">GitHub repository</a>.	</em>\\n</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:button {\"align\":\"center\"} -->\\n<div class=\"wp-block-button aligncenter\"><a class=\"wp-block-button__link\" href=\"https://github.com/WordPress/gutenberg\">Help build Gutenberg</a></div>\\n<!-- /wp:button -->\\n\\n<!-- wp:separator -->\\n<hr class=\"wp-block-separator\"/>\\n<!-- /wp:separator -->\\n\\n<!-- wp:paragraph {\"align\":\"center\"} -->\\n<p style=\"text-align:center\">Thanks for testing Gutenberg!</p>\\n<!-- /wp:paragraph -->\\n\\n<!-- wp:paragraph {\"align\":\"center\"} -->\\n<p style=\"text-align:center\"><img draggable=\"false\" class=\"emoji\" alt=\"👋\" src=\"https://s.w.org/images/core/emoji/2.3/svg/1f44b.svg\"/></p>\\n<!-- /wp:paragraph -->', 'Welcome to the Gutenberg Editor', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2018-09-10 23:57:33', '2018-09-10 22:57:33', '', 5, 'http://localhost:8888/paa/2018/09/10/5-revision-v1/', 0, 'revision', '', 0),
(7, 1, '2018-09-11 02:22:53', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-09-11 02:22:53', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?p=7', 0, 'post', '', 0),
(8, 1, '2018-09-11 02:23:15', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-09-11 02:23:15', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?p=8', 0, 'post', '', 0),
(9, 1, '2018-09-11 02:27:07', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-09-11 02:27:07', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?p=9', 0, 'post', '', 0),
(10, 1, '2018-09-11 02:28:58', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 02:28:58', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=proposal&p=10', 0, 'proposal', '', 0),
(11, 1, '2018-09-11 02:30:56', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 02:30:56', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=proposal&p=11', 0, 'proposal', '', 0),
(12, 1, '2018-09-11 02:32:37', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 02:32:37', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=proposal&p=12', 0, 'proposal', '', 0),
(14, 1, '2018-09-11 02:45:24', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 02:45:24', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=work&p=14', 0, 'work', '', 0),
(15, 1, '2018-09-11 02:45:29', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 02:45:29', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=work&p=15', 0, 'work', '', 0),
(16, 1, '2018-09-11 02:45:32', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 02:45:32', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=work&p=16', 0, 'work', '', 0),
(17, 1, '2018-09-11 02:46:38', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 02:46:38', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=work&p=17', 0, 'work', '', 0),
(18, 1, '2018-09-11 02:46:45', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 02:46:45', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=work&p=18', 0, 'work', '', 0),
(19, 1, '2018-09-11 02:55:56', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 02:55:56', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=case_studies&p=19', 0, 'case_studies', '', 0),
(20, 1, '2018-09-11 02:56:16', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 02:56:16', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=case_studies&p=20', 0, 'case_studies', '', 0),
(21, 1, '2018-09-11 03:03:22', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 03:03:22', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=case_studies&p=21', 0, 'case_studies', '', 0),
(23, 1, '2018-09-11 03:05:44', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 03:05:44', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=acf&p=23', 0, 'acf', '', 0),
(24, 1, '2018-09-11 04:08:42', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 04:08:42', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=24', 0, 'chat', '', 0),
(25, 1, '2018-09-11 04:09:59', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 04:09:59', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=case_studies&p=25', 0, 'case_studies', '', 0),
(26, 1, '2018-09-11 20:55:44', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 20:55:44', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=26', 0, 'chat', '', 0),
(27, 1, '2018-09-11 20:56:26', '2018-09-11 19:56:26', '', 'Chat', '', 'publish', 'closed', 'closed', '', 'acf_chat', '', '', '2018-09-11 20:59:35', '2018-09-11 19:59:35', '', 0, 'http://localhost:8888/paa/?post_type=acf&#038;p=27', 0, 'acf', '', 0),
(28, 1, '2018-09-11 21:15:31', '2018-09-11 20:15:31', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"chat\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'Chat Data', 'chat-data', 'publish', 'closed', 'closed', '', 'group_5b982263972ef', '', '', '2018-09-17 03:03:49', '2018-09-17 02:03:49', '', 0, 'http://localhost:8888/paa/?post_type=acf-field-group&#038;p=28', 0, 'acf-field-group', '', 0),
(31, 1, '2018-09-11 21:15:49', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 21:15:49', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=31', 0, 'chat', '', 0),
(32, 1, '2018-09-11 21:16:00', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 21:16:00', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=32', 0, 'chat', '', 0),
(37, 1, '2018-09-11 21:20:29', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 21:20:29', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=37', 0, 'chat', '', 0),
(38, 1, '2018-09-11 21:27:21', '2018-09-11 20:27:21', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:3:\"row\";s:12:\"button_label\";s:13:\"Add Chat Item\";}', 'Chat Data', 'chat_data', 'publish', 'closed', 'closed', '', 'field_5b9824b34f2fc', '', '', '2018-09-16 17:55:58', '2018-09-16 16:55:58', '', 28, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=38', 2, 'acf-field', '', 0),
(39, 1, '2018-09-11 21:27:21', '2018-09-11 20:27:21', 'a:13:{s:4:\"type\";s:6:\"select\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"choices\";a:8:{s:4:\"Text\";s:4:\"Text\";s:6:\"Prompt\";s:6:\"Prompt\";s:7:\"Content\";s:7:\"Content\";s:4:\"Link\";s:4:\"Link\";s:10:\"User Input\";s:10:\"User Input\";s:5:\"Video\";s:5:\"Video\";s:5:\"Image\";s:5:\"Image\";s:4:\"HTML\";s:4:\"HTML\";}s:13:\"default_value\";a:0:{}s:10:\"allow_null\";i:0;s:8:\"multiple\";i:0;s:2:\"ui\";i:0;s:13:\"return_format\";s:5:\"value\";s:4:\"ajax\";i:0;s:11:\"placeholder\";s:0:\"\";}', 'Response Type', 'response_type', 'publish', 'closed', 'closed', '', 'field_5b9824e74f2fd', '', '', '2018-09-14 01:55:20', '2018-09-14 00:55:20', '', 38, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=39', 0, 'acf-field', '', 0),
(40, 1, '2018-09-11 21:27:21', '2018-09-11 20:27:21', 'a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:9:\"new_lines\";s:2:\"br\";s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_5b9824e74f2fd\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"Text\";}}}}', 'Text Response', 'text_response', 'publish', 'closed', 'closed', '', 'field_5b9825164f2fe', '', '', '2018-09-16 23:48:40', '2018-09-16 22:48:40', '', 38, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=40', 1, 'acf-field', '', 0),
(41, 1, '2018-09-11 21:28:41', '2018-09-11 20:28:41', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:3:\"row\";s:12:\"button_label\";s:10:\"Add Prompt\";s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_5b9824e74f2fd\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:6:\"Prompt\";}}}}', 'Prompts', 'prompts', 'publish', 'closed', 'closed', '', 'field_5b9825324b391', '', '', '2018-09-16 20:23:40', '2018-09-16 19:23:40', '', 38, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=41', 3, 'acf-field', '', 0),
(43, 1, '2018-09-11 21:28:41', '2018-09-11 20:28:41', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Prompt Shortcut Key', 'prompt_shortcut_key', 'publish', 'closed', 'closed', '', 'field_5b98256b4b393', '', '', '2018-09-12 02:29:06', '2018-09-12 01:29:06', '', 41, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=43', 1, 'acf-field', '', 0),
(44, 1, '2018-09-11 21:28:46', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 21:28:46', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=44', 0, 'chat', '', 0),
(46, 1, '2018-09-11 21:32:02', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 21:32:02', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=46', 0, 'chat', '', 0),
(47, 1, '2018-09-11 21:41:25', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 21:41:25', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=47', 0, 'chat', '', 0),
(49, 1, '2018-09-11 22:16:40', '2018-09-11 21:16:40', 'a:13:{s:4:\"type\";s:6:\"select\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"choices\";a:7:{s:9:\"Work List\";s:9:\"Work List\";s:10:\"Work Items\";s:12:\"Work Item(s)\";s:11:\"Client List\";s:11:\"Client List\";s:12:\"Client Items\";s:14:\"Client Item(s)\";s:15:\"Case Study List\";s:15:\"Case Study List\";s:16:\"Case Study Items\";s:18:\"Case Study Item(s)\";s:20:\"Generic Content Item\";s:23:\"Generic Content Item(s)\";}s:13:\"default_value\";a:0:{}s:10:\"allow_null\";i:0;s:8:\"multiple\";i:0;s:2:\"ui\";i:0;s:13:\"return_format\";s:5:\"value\";s:4:\"ajax\";i:0;s:11:\"placeholder\";s:0:\"\";s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_5b9824e74f2fd\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:7:\"Content\";}}}}', 'Content Response Type', 'content_response_type', 'publish', 'closed', 'closed', '', 'field_5b983044ad07e', '', '', '2018-09-16 20:23:40', '2018-09-16 19:23:40', '', 38, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=49', 4, 'acf-field', '', 0),
(50, 1, '2018-09-11 22:16:44', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 22:16:44', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=50', 0, 'chat', '', 0),
(51, 1, '2018-09-11 22:17:27', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 22:17:27', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=51', 0, 'chat', '', 0),
(52, 1, '2018-09-11 22:34:46', '2018-09-11 21:34:46', 'a:11:{s:4:\"type\";s:11:\"post_object\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:4:\"work\";}s:8:\"taxonomy\";s:0:\"\";s:10:\"allow_null\";i:0;s:8:\"multiple\";i:1;s:13:\"return_format\";s:6:\"object\";s:2:\"ui\";i:1;s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_5b983044ad07e\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:10:\"Work Items\";}}}}', 'Work Item(s)', 'work_items', 'publish', 'closed', 'closed', '', 'field_5b9833b79802e', '', '', '2018-09-16 20:23:41', '2018-09-16 19:23:41', '', 38, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=52', 5, 'acf-field', '', 0),
(54, 1, '2018-09-11 22:40:32', '2018-09-11 21:40:32', 'a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}', 'Text Response', 'text_response', 'publish', 'closed', 'closed', '', 'field_5b98363a75993', '', '', '2018-09-11 22:40:32', '2018-09-11 21:40:32', '', 40, 'http://localhost:8888/paa/?post_type=acf-field&p=54', 0, 'acf-field', '', 0),
(55, 1, '2018-09-11 22:40:36', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 22:40:36', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=55', 0, 'chat', '', 0),
(56, 1, '2018-09-11 22:57:01', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 22:57:01', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=56', 0, 'chat', '', 0),
(57, 1, '2018-09-11 22:57:47', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 22:57:47', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=57', 0, 'chat', '', 0),
(58, 1, '2018-09-11 23:01:12', '2018-09-11 22:01:12', 'a:11:{s:4:\"type\";s:11:\"post_object\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:7:\"clients\";}s:8:\"taxonomy\";s:0:\"\";s:10:\"allow_null\";i:0;s:8:\"multiple\";i:1;s:13:\"return_format\";s:6:\"object\";s:2:\"ui\";i:1;s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_5b983044ad07e\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:12:\"Client Items\";}}}}', 'Client Item(s)', 'client_items', 'publish', 'closed', 'closed', '', 'field_5b983afdd1fc4', '', '', '2018-09-16 20:23:41', '2018-09-16 19:23:41', '', 38, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=58', 6, 'acf-field', '', 0),
(59, 1, '2018-09-11 23:01:18', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 23:01:18', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=59', 0, 'chat', '', 0),
(60, 1, '2018-09-11 23:18:20', '2018-09-11 22:18:20', 'a:11:{s:4:\"type\";s:11:\"post_object\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:12:\"case_studies\";}s:8:\"taxonomy\";s:0:\"\";s:10:\"allow_null\";i:0;s:8:\"multiple\";i:1;s:13:\"return_format\";s:6:\"object\";s:2:\"ui\";i:1;s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_5b983044ad07e\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:16:\"Case Study Items\";}}}}', 'Case Study Item(s)', 'case_study_items', 'publish', 'closed', 'closed', '', 'field_5b983eff7429c', '', '', '2018-09-16 20:23:41', '2018-09-16 19:23:41', '', 38, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=60', 7, 'acf-field', '', 0),
(61, 1, '2018-09-11 23:21:32', '2018-09-11 22:21:32', 'a:11:{s:4:\"type\";s:11:\"post_object\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:4:\"page\";}s:8:\"taxonomy\";s:0:\"\";s:10:\"allow_null\";i:0;s:8:\"multiple\";i:1;s:13:\"return_format\";s:6:\"object\";s:2:\"ui\";i:1;s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_5b983044ad07e\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:20:\"Generic Content Item\";}}}}', 'Generic Content Item(s)', 'generic_content_items', 'publish', 'closed', 'closed', '', 'field_5b983fc257063', '', '', '2018-09-16 20:23:41', '2018-09-16 19:23:41', '', 38, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=61', 8, 'acf-field', '', 0),
(62, 1, '2018-09-11 23:21:41', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 23:21:41', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=62', 0, 'chat', '', 0),
(63, 1, '2018-09-11 23:26:09', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 23:26:09', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=63', 0, 'chat', '', 0),
(64, 1, '2018-09-11 23:57:48', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-11 23:57:48', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=64', 0, 'chat', '', 0),
(65, 1, '2018-09-12 00:48:52', '2018-09-11 23:48:52', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_5b9824e74f2fd\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"Link\";}}}}', 'Link Response Text', 'link_response_text', 'publish', 'closed', 'closed', '', 'field_5b98541f51940', '', '', '2018-09-17 02:50:51', '2018-09-17 01:50:51', '', 38, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=65', 11, 'acf-field', '', 0),
(66, 1, '2018-09-12 00:48:52', '2018-09-11 23:48:52', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_5b9824e74f2fd\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"Link\";}}}}', 'Link Response URL', 'link_response_url', 'publish', 'closed', 'closed', '', 'field_5b98544f51941', '', '', '2018-09-17 02:50:51', '2018-09-17 01:50:51', '', 38, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=66', 10, 'acf-field', '', 0),
(67, 1, '2018-09-12 00:48:59', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-12 00:48:59', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=67', 0, 'chat', '', 0),
(69, 1, '2018-09-12 01:36:02', '2018-09-12 00:36:02', 'a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_5b9824e74f2fd\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:10:\"User Input\";}}}}', 'User Input Response Text', 'user_input_response_text', 'publish', 'closed', 'closed', '', 'field_5b985edd50137', '', '', '2018-09-17 02:50:51', '2018-09-17 01:50:51', '', 38, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=69', 13, 'acf-field', '', 0),
(70, 1, '2018-09-12 01:36:02', '2018-09-12 00:36:02', 'a:13:{s:4:\"type\";s:6:\"select\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"choices\";a:2:{s:4:\"Name\";s:4:\"Name\";s:5:\"Email\";s:5:\"Email\";}s:13:\"default_value\";a:0:{}s:10:\"allow_null\";i:0;s:8:\"multiple\";i:0;s:2:\"ui\";i:0;s:13:\"return_format\";s:5:\"value\";s:4:\"ajax\";i:0;s:11:\"placeholder\";s:0:\"\";s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_5b9824e74f2fd\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:10:\"User Input\";}}}}', 'User Input Response Type', 'user_input_response_type', 'publish', 'closed', 'closed', '', 'field_5b985f4e50138', '', '', '2018-09-17 02:50:51', '2018-09-17 01:50:51', '', 38, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=70', 12, 'acf-field', '', 0),
(71, 1, '2018-09-12 01:36:09', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-12 01:36:09', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=71', 0, 'chat', '', 0),
(72, 1, '2018-09-12 02:06:35', '2018-09-12 01:06:35', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_5b9824e74f2fd\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"Text\";}}}}', 'Text Response Small Print', 'text_response_small_print', 'publish', 'closed', 'closed', '', 'field_5b986635b1ac0', '', '', '2018-09-16 16:31:39', '2018-09-16 15:31:39', '', 38, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=72', 2, 'acf-field', '', 0),
(75, 1, '2018-09-12 02:08:26', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-12 02:08:26', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=75', 0, 'chat', '', 0),
(77, 1, '2018-09-12 02:13:23', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-12 02:13:23', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=77', 0, 'chat', '', 0),
(78, 1, '2018-09-12 02:15:53', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-12 02:15:53', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=78', 0, 'chat', '', 0),
(79, 1, '2018-09-12 02:26:35', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-12 02:26:35', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=79', 0, 'chat', '', 0),
(80, 1, '2018-09-12 02:29:06', '2018-09-12 01:29:06', 'a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}', 'Prompt', 'prompt', 'publish', 'closed', 'closed', '', 'field_5b986bca1b829', '', '', '2018-09-12 02:29:06', '2018-09-12 01:29:06', '', 41, 'http://localhost:8888/paa/?post_type=acf-field&p=80', 0, 'acf-field', '', 0),
(82, 1, '2018-09-12 02:40:18', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-12 02:40:18', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=82', 0, 'chat', '', 0),
(83, 1, '2018-09-12 02:41:15', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-12 02:41:15', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=83', 0, 'chat', '', 0),
(84, 1, '2018-09-12 02:41:38', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-12 02:41:38', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=84', 0, 'chat', '', 0),
(85, 1, '2018-09-12 02:42:52', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-12 02:42:52', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=85', 0, 'chat', '', 0),
(86, 1, '2018-09-12 02:43:40', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-12 02:43:40', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=86', 0, 'chat', '', 0),
(87, 1, '2018-09-12 02:45:21', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-12 02:45:21', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=87', 0, 'chat', '', 0),
(88, 1, '2018-09-12 02:48:30', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-12 02:48:30', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=88', 0, 'chat', '', 0),
(89, 1, '2018-09-12 21:05:05', '2018-09-12 20:05:05', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_5b9824e74f2fd\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:5:\"Video\";}}}}', 'Vimeo ID', 'video_response', 'publish', 'closed', 'closed', '', 'field_5b99712a65ed8', '', '', '2018-09-17 02:50:51', '2018-09-17 01:50:51', '', 38, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=89', 14, 'acf-field', '', 0),
(90, 1, '2018-09-12 21:05:05', '2018-09-12 20:05:05', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:6:\"medium\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_5b9824e74f2fd\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:5:\"Image\";}}}}', 'Image Response', 'image_response', 'publish', 'closed', 'closed', '', 'field_5b99714465ed9', '', '', '2018-09-17 03:03:49', '2018-09-17 02:03:49', '', 38, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=90', 15, 'acf-field', '', 0),
(91, 1, '2018-09-12 21:05:53', '2018-09-12 20:05:53', 'a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_5b9824e74f2fd\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"HTML\";}}}}', 'HTML Response', 'html_response', 'publish', 'closed', 'closed', '', 'field_5b997179bd61a', '', '', '2018-09-17 02:50:51', '2018-09-17 01:50:51', '', 38, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=91', 16, 'acf-field', '', 0),
(92, 1, '2018-09-12 21:06:06', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-12 21:06:06', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=92', 0, 'chat', '', 0),
(93, 1, '2018-09-13 02:16:24', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-13 02:16:24', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=93', 0, 'chat', '', 0),
(95, 1, '2018-09-13 02:18:16', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-13 02:18:16', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=95', 0, 'chat', '', 0),
(97, 1, '2018-09-13 02:22:41', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-13 02:22:41', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=97', 0, 'chat', '', 0),
(98, 1, '2018-09-13 02:23:39', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-13 02:23:39', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=98', 0, 'chat', '', 0),
(99, 1, '2018-09-13 22:46:47', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-13 22:46:47', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=99', 0, 'chat', '', 0),
(100, 1, '2018-09-13 22:49:40', '2018-09-13 21:49:40', '', 'Homepage Welcome', '', 'publish', 'closed', 'closed', '', 'homepage-welcome', '', '', '2018-09-16 23:44:43', '2018-09-16 22:44:43', '', 0, 'http://localhost:8888/paa/?post_type=chat&#038;p=100', 0, 'chat', '', 0),
(102, 1, '2018-09-14 00:37:05', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-14 00:37:05', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?page_id=102', 0, 'page', '', 0),
(103, 1, '2018-09-14 00:37:27', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-14 00:37:27', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?page_id=103', 0, 'page', '', 0),
(105, 1, '2018-09-14 00:38:14', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-14 00:38:14', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?page_id=105', 0, 'page', '', 0),
(106, 1, '2018-09-14 00:38:38', '2018-09-13 23:38:38', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2018-09-14 00:38:38', '2018-09-13 23:38:38', '', 0, 'http://localhost:8888/paa/?page_id=106', 0, 'page', '', 0);
INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(107, 1, '2018-09-14 00:38:38', '2018-09-13 23:38:38', '', 'Home', '', 'inherit', 'closed', 'closed', '', '106-revision-v1', '', '', '2018-09-14 00:38:38', '2018-09-13 23:38:38', '', 106, 'http://localhost:8888/paa/106-revision-v1/', 0, 'revision', '', 0),
(108, 1, '2018-09-14 00:46:02', '2018-09-13 23:46:02', 'a:13:{s:4:\"type\";s:6:\"select\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"choices\";a:8:{s:4:\"Home\";s:4:\"Home\";s:10:\"Who We Are\";s:10:\"Who We Are\";s:10:\"What We Do\";s:10:\"What We Do\";s:4:\"Work\";s:4:\"Work\";s:7:\"Clients\";s:7:\"Clients\";s:8:\"Partners\";s:8:\"Partners\";s:4:\"Blog\";s:4:\"Blog\";s:7:\"Contact\";s:7:\"Contact\";}s:13:\"default_value\";a:0:{}s:10:\"allow_null\";i:1;s:8:\"multiple\";i:0;s:2:\"ui\";i:0;s:13:\"return_format\";s:5:\"value\";s:4:\"ajax\";i:0;s:11:\"placeholder\";s:0:\"\";}', 'Default Page', 'default_page', 'publish', 'closed', 'closed', '', 'field_5b9af643b8a48', '', '', '2018-09-16 17:34:23', '2018-09-16 16:34:23', '', 28, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=108', 0, 'acf-field', '', 0),
(109, 1, '2018-09-14 01:57:29', '2018-09-14 00:57:29', '', 'Error Messages', '', 'publish', 'closed', 'closed', '', 'error-messages', '', '', '2018-09-16 17:28:15', '2018-09-16 16:28:15', '', 0, 'http://localhost:8888/paa/?post_type=chat&#038;p=109', 0, 'chat', '', 0),
(110, 1, '2018-09-14 02:03:12', '2018-09-14 01:03:12', '', 'API [DO NOT DELETE!!!!]', '', 'publish', 'closed', 'closed', '', 'api', '', '', '2018-09-16 20:11:06', '2018-09-16 19:11:06', '', 0, 'http://localhost:8888/paa/?page_id=110', 0, 'page', '', 0),
(111, 1, '2018-09-14 02:03:12', '2018-09-14 01:03:12', '', 'Chat Query', '', 'inherit', 'closed', 'closed', '', '110-revision-v1', '', '', '2018-09-14 02:03:12', '2018-09-14 01:03:12', '', 110, 'http://localhost:8888/paa/110-revision-v1/', 0, 'revision', '', 0),
(112, 1, '2018-09-14 03:31:26', '2018-09-14 02:31:26', '', 'Show Me Work', '', 'publish', 'closed', 'closed', '', 'show-me-work', '', '', '2018-09-16 20:34:54', '2018-09-16 19:34:54', '', 0, 'http://localhost:8888/paa/?post_type=chat&#038;p=112', 0, 'chat', '', 0),
(113, 1, '2018-09-14 23:41:05', '2018-09-14 22:41:05', '', 'Showreel Video', '', 'publish', 'closed', 'closed', '', 'showreel-video', '', '', '2018-09-16 20:34:26', '2018-09-16 19:34:26', '', 0, 'http://localhost:8888/paa/?post_type=chat&#038;p=113', 0, 'chat', '', 0),
(114, 1, '2018-09-15 22:37:26', '2018-09-15 21:37:26', '', 'Curse Words', '', 'publish', 'closed', 'closed', '', 'curse-words', '', '', '2018-09-17 02:41:05', '2018-09-17 01:41:05', '', 0, 'http://localhost:8888/paa/?post_type=chat&#038;p=114', 0, 'chat', '', 0),
(116, 1, '2018-09-16 03:35:05', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-16 03:35:05', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=work&p=116', 0, 'work', '', 0),
(117, 1, '2018-09-16 03:37:23', '2018-09-16 02:37:23', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"work\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'Work Data', 'work-data', 'publish', 'closed', 'closed', '', 'group_5b9dc17f63ee1', '', '', '2018-09-16 04:07:59', '2018-09-16 03:07:59', '', 0, 'http://localhost:8888/paa/?post_type=acf-field-group&#038;p=117', 0, 'acf-field-group', '', 0),
(118, 1, '2018-09-16 03:37:23', '2018-09-16 02:37:23', 'a:11:{s:4:\"type\";s:11:\"post_object\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:7:\"clients\";}s:8:\"taxonomy\";s:0:\"\";s:10:\"allow_null\";i:0;s:8:\"multiple\";i:0;s:13:\"return_format\";s:2:\"id\";s:2:\"ui\";i:1;}', 'Client', 'client', 'publish', 'closed', 'closed', '', 'field_5b9dc18d9edf5', '', '', '2018-09-16 04:07:53', '2018-09-16 03:07:53', '', 117, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=118', 0, 'acf-field', '', 0),
(119, 1, '2018-09-16 03:37:23', '2018-09-16 02:37:23', 'a:11:{s:4:\"type\";s:11:\"post_object\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:12:\"case_studies\";}s:8:\"taxonomy\";s:0:\"\";s:10:\"allow_null\";i:0;s:8:\"multiple\";i:0;s:13:\"return_format\";s:2:\"id\";s:2:\"ui\";i:1;}', 'Case Study', 'case_study', 'publish', 'closed', 'closed', '', 'field_5b9dc1bf9edf6', '', '', '2018-09-16 04:07:59', '2018-09-16 03:07:59', '', 117, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=119', 1, 'acf-field', '', 0),
(120, 1, '2018-09-16 03:37:23', '2018-09-16 02:37:23', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:6:\"medium\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'Image', 'image', 'publish', 'closed', 'closed', '', 'field_5b9dc1d19edf7', '', '', '2018-09-16 03:37:23', '2018-09-16 02:37:23', '', 117, 'http://localhost:8888/paa/?post_type=acf-field&p=120', 2, 'acf-field', '', 0),
(121, 1, '2018-09-16 03:38:21', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-16 03:38:21', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=clients&p=121', 0, 'clients', '', 0),
(122, 1, '2018-09-16 03:38:29', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-16 03:38:29', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=work&p=122', 0, 'work', '', 0),
(123, 1, '2018-09-16 03:39:03', '2018-09-16 02:39:03', '', 'Test Client', '', 'publish', 'closed', 'closed', '', 'test-client', '', '', '2018-09-16 03:39:03', '2018-09-16 02:39:03', '', 0, 'http://localhost:8888/paa/?post_type=clients&#038;p=123', 0, 'clients', '', 0),
(124, 1, '2018-09-16 03:39:15', '2018-09-16 02:39:15', '', 'Test Case Study', '', 'publish', 'closed', 'closed', '', 'test-case-study', '', '', '2018-09-16 03:39:15', '2018-09-16 02:39:15', '', 0, 'http://localhost:8888/paa/?post_type=case_studies&#038;p=124', 0, 'case_studies', '', 0),
(125, 1, '2018-09-16 03:39:18', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-16 03:39:18', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=work&p=125', 0, 'work', '', 0),
(126, 1, '2018-09-16 03:43:01', '2018-09-16 02:43:01', '', 'Test Work 1', '', 'publish', 'closed', 'closed', '', 'test-work-1', '', '', '2018-09-16 04:08:19', '2018-09-16 03:08:19', '', 0, 'http://localhost:8888/paa/?post_type=work&#038;p=126', 0, 'work', '', 0),
(127, 1, '2018-09-16 03:42:57', '2018-09-16 02:42:57', '', 'pexels-photo-1414741', '', 'inherit', 'open', 'closed', '', 'pexels-photo-1414741', '', '', '2018-09-16 03:42:57', '2018-09-16 02:42:57', '', 126, 'http://localhost:8888/paa/wp-content/uploads/2018/09/pexels-photo-1414741.jpeg', 0, 'attachment', 'image/jpeg', 0),
(128, 1, '2018-09-16 03:43:49', '2018-09-16 02:43:49', '', 'All Work', '', 'publish', 'closed', 'closed', '', 'all-work', '', '', '2018-09-16 20:35:27', '2018-09-16 19:35:27', '', 0, 'http://localhost:8888/paa/?post_type=chat&#038;p=128', 0, 'chat', '', 0),
(129, 1, '2018-09-16 03:46:01', '2018-09-16 02:46:01', '', 'Test Work 2', '', 'publish', 'closed', 'closed', '', 'test-work-2', '', '', '2018-09-16 04:08:27', '2018-09-16 03:08:27', '', 0, 'http://localhost:8888/paa/?post_type=work&#038;p=129', 0, 'work', '', 0),
(130, 1, '2018-09-16 03:45:57', '2018-09-16 02:45:57', '', 'pexels-photo-813269', '', 'inherit', 'open', 'closed', '', 'pexels-photo-813269', '', '', '2018-09-16 03:45:57', '2018-09-16 02:45:57', '', 129, 'http://localhost:8888/paa/wp-content/uploads/2018/09/pexels-photo-813269.jpeg', 0, 'attachment', 'image/jpeg', 0),
(131, 1, '2018-09-16 16:32:49', '2018-09-16 15:32:49', 'a:10:{s:4:\"type\";s:8:\"repeater\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"collapsed\";s:0:\"\";s:3:\"min\";s:0:\"\";s:3:\"max\";s:0:\"\";s:6:\"layout\";s:3:\"row\";s:12:\"button_label\";s:11:\"Add Trigger\";}', 'Trigger', 'trigger', 'publish', 'closed', 'closed', '', 'field_5b9e776b2de51', '', '', '2018-09-16 17:34:23', '2018-09-16 16:34:23', '', 28, 'http://localhost:8888/paa/?post_type=acf-field&#038;p=131', 1, 'acf-field', '', 0),
(132, 1, '2018-09-16 16:32:49', '2018-09-16 15:32:49', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'User Input', 'user_input', 'publish', 'closed', 'closed', '', 'field_5b9e777f2de52', '', '', '2018-09-16 16:32:49', '2018-09-16 15:32:49', '', 131, 'http://localhost:8888/paa/?post_type=acf-field&p=132', 0, 'acf-field', '', 0),
(133, 1, '2018-09-16 20:04:16', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-16 20:04:16', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=chat&p=133', 0, 'chat', '', 0),
(134, 1, '2018-09-16 20:10:42', '2018-09-16 19:10:42', '', 'API [[[DO NOT DELETE]]]', '', 'inherit', 'closed', 'closed', '', '110-revision-v1', '', '', '2018-09-16 20:10:42', '2018-09-16 19:10:42', '', 110, 'http://localhost:8888/paa/110-revision-v1/', 0, 'revision', '', 0),
(135, 1, '2018-09-16 20:11:06', '2018-09-16 19:11:06', '', 'API [DO NOT DELETE!!!!]', '', 'inherit', 'closed', 'closed', '', '110-revision-v1', '', '', '2018-09-16 20:11:06', '2018-09-16 19:11:06', '', 110, 'http://localhost:8888/paa/110-revision-v1/', 0, 'revision', '', 0),
(136, 1, '2018-09-16 23:47:50', '2018-09-16 22:47:50', '', 'Contact', '', 'publish', 'closed', 'closed', '', 'contact', '', '', '2018-09-17 03:01:43', '2018-09-17 02:01:43', '', 0, 'http://localhost:8888/paa/?post_type=chat&#038;p=136', 0, 'chat', '', 0),
(137, 1, '2018-09-16 23:53:27', '2018-09-16 22:53:27', '', 'New Business Contact Name', '', 'publish', 'closed', 'closed', '', 'new-business-1', '', '', '2018-09-17 01:56:01', '2018-09-17 00:56:01', '', 0, 'http://localhost:8888/paa/?post_type=chat&#038;p=137', 0, 'chat', '', 0),
(138, 1, '2018-09-16 23:57:12', '2018-09-16 22:57:12', '', 'New Business Contact Email', '', 'publish', 'closed', 'closed', '', 'new-business-contact-email', '', '', '2018-09-17 00:07:18', '2018-09-16 23:07:18', '', 0, 'http://localhost:8888/paa/?post_type=chat&#038;p=138', 0, 'chat', '', 0),
(139, 1, '2018-09-17 00:08:29', '2018-09-16 23:08:29', '', 'Contact Thank You', '', 'publish', 'closed', 'closed', '', 'contact-thank-you', '', '', '2018-09-17 00:08:29', '2018-09-16 23:08:29', '', 0, 'http://localhost:8888/paa/?post_type=chat&#038;p=139', 0, 'chat', '', 0),
(140, 1, '2018-09-17 02:22:06', '2018-09-17 01:22:06', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:7:\"clients\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'Client Data', 'client-data', 'publish', 'closed', 'closed', '', 'group_5b9f01a8a2428', '', '', '2018-09-17 02:49:03', '2018-09-17 01:49:03', '', 0, 'http://localhost:8888/paa/?post_type=acf-field-group&#038;p=140', 0, 'acf-field-group', '', 0),
(141, 1, '2018-09-17 02:22:06', '2018-09-17 01:22:06', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:6:\"medium\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'Image', 'image', 'publish', 'closed', 'closed', '', 'field_5b9f01b1985dc', '', '', '2018-09-17 02:22:06', '2018-09-17 01:22:06', '', 140, 'http://localhost:8888/paa/?post_type=acf-field&p=141', 0, 'acf-field', '', 0),
(142, 1, '2018-09-17 02:22:45', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-17 02:22:45', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=case_studies&p=142', 0, 'case_studies', '', 0),
(144, 1, '2018-09-17 02:23:22', '2018-09-17 01:23:22', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2018-09-17 02:23:22', '2018-09-17 01:23:22', '', 1, 'http://localhost:8888/paa/1-revision-v1/', 0, 'revision', '', 0),
(145, 1, '2018-09-17 02:37:18', '2018-09-17 01:37:18', '', 'General Inquiry Contact Name', '', 'publish', 'closed', 'closed', '', 'general-inquiry-contact-name', '', '', '2018-09-17 02:37:18', '2018-09-17 01:37:18', '', 0, 'http://localhost:8888/paa/?post_type=chat&#038;p=145', 0, 'chat', '', 0),
(147, 1, '2018-09-17 02:49:03', '2018-09-17 01:49:03', 'a:11:{s:4:\"type\";s:11:\"post_object\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:9:\"post_type\";a:1:{i:0;s:12:\"case_studies\";}s:8:\"taxonomy\";s:0:\"\";s:10:\"allow_null\";i:0;s:8:\"multiple\";i:0;s:13:\"return_format\";s:2:\"id\";s:2:\"ui\";i:1;}', 'Case Study', 'case_study', 'publish', 'closed', 'closed', '', 'field_5b9f07fc9f063', '', '', '2018-09-17 02:49:03', '2018-09-17 01:49:03', '', 140, 'http://localhost:8888/paa/?post_type=acf-field&p=147', 1, 'acf-field', '', 0),
(148, 1, '2018-09-17 02:49:11', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-09-17 02:49:11', '0000-00-00 00:00:00', '', 0, 'http://localhost:8888/paa/?post_type=clients&p=148', 0, 'clients', '', 0),
(149, 1, '2018-09-17 02:50:51', '2018-09-17 01:50:51', 'a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:9:\"new_lines\";s:2:\"br\";s:17:\"conditional_logic\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"field\";s:19:\"field_5b9824e74f2fd\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"Link\";}}}}', 'Link Response Pre Text', 'link_response_pre_text', 'publish', 'closed', 'closed', '', 'field_5b9f08505f945', '', '', '2018-09-17 02:50:51', '2018-09-17 01:50:51', '', 38, 'http://localhost:8888/paa/?post_type=acf-field&p=149', 9, 'acf-field', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorised', 'uncategorised', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(5, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'false'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'wp496_privacy'),
(15, 1, 'show_welcome_panel', '0'),
(16, 1, 'session_tokens', 'a:2:{s:64:\"9e4785db1ad532484d6c19cca3f205367c219323ced82c191932ea2042b75f71\";a:4:{s:10:\"expiration\";i:1536792943;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36\";s:5:\"login\";i:1536620143;}s:64:\"fc28723cd73009df629f283109510843bfebc578d8ed45a58424cfa0584c485b\";a:4:{s:10:\"expiration\";i:1537900759;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36\";s:5:\"login\";i:1536691159;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '4'),
(18, 1, 'show_try_gutenberg_panel', '0'),
(19, 1, 'closedpostboxes_chat', 'a:0:{}'),
(20, 1, 'metaboxhidden_chat', 'a:1:{i:0;s:7:\"slugdiv\";}'),
(21, 1, 'closedpostboxes_acf-field-group', 'a:1:{i:0;s:22:\"plugins-by-dreihochzwo\";}'),
(22, 1, 'metaboxhidden_acf-field-group', 'a:1:{i:0;s:7:\"slugdiv\";}'),
(23, 1, 'closedpostboxes_work', 'a:0:{}'),
(24, 1, 'metaboxhidden_work', 'a:2:{i:0;s:23:\"acf-group_5b982263972ef\";i:1;s:7:\"slugdiv\";}'),
(25, 1, 'wp_user-settings', 'libraryContent=browse'),
(26, 1, 'wp_user-settings-time', '1537065776');

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Dumping data for table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BfJPB5vOEAJfdFTRsDSUS1O/F9KNeX1', 'admin', 'jellyfyi@gmail.com', '', '2018-09-10 22:55:35', '', 0, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=337;
--
-- AUTO_INCREMENT for table `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=752;
--
-- AUTO_INCREMENT for table `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;
--
-- AUTO_INCREMENT for table `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
