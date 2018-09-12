<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'paa');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'root');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'A-~R*OC 2QM8A8+[D({@R<tV[+*m~|=,zp*PupB<{0t*Rc>6UI=q(x|Wmq}J,@K%');
define('SECURE_AUTH_KEY',  '[%8Nqj/,3VfG?C0IPDqNt(JCN}p%rFCjNDz/.M<6#T1>,2I82++t0:$E#4Tzq`~k');
define('LOGGED_IN_KEY',    'Wsgo+RLE=Wo6MBZB&]*dbLul&B{iV7LO3FnUiLAi-L.Ylz()P|<jV-;u;8w.!&L1');
define('NONCE_KEY',        'R7he{wsBS|J+%CT!Lv`3so|0}<a|i5u~L/vj-shq_0`=x[9!4-VS}$|mY}:^?gs2');
define('AUTH_SALT',        'zTF|sKb;.[BOL%y2wfEbHPKEv@J[_a6dSK%gYp_r_u*(d:_gdnV|7JP-wpxvwd-%');
define('SECURE_AUTH_SALT', 'V0||4jcFB~1Kzu!y?|CE60EU|0@*Q0ANLN}n1w.TasJ+(|_|C+-3U1[$_q 2[3MO');
define('LOGGED_IN_SALT',   '+iQ9l~xNSvfEJ_6J-k,($DDkQXA-%5F||(-[&@#+|r3 t41%gY-?wS^~iiltD*>L');
define('NONCE_SALT',       '^(0Pf`U|mWF+:7C-=A99&Az^tfH@0)x#(N3-Ai}qG_|9p%c[83=DlnB6|3w23k(Y');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
