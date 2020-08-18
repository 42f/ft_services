<?php
include '.env.php';
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
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wp' );

/** MySQL database username */
define( 'DB_USER', 'wp_admin' );

/** MySQL database password */
define( 'DB_PASSWORD', '42' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql:3306' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '3gmL|N)zoKBt$c2uj7U|]g7>X)%F*1&-VeRLtTuYPCtm^(XqSy2GTi&XK-nbh:OO');
define('SECURE_AUTH_KEY',  '$$~ftiV|q:e)(Hh=kMVVy7s%HN2--{mL%|D6Q`n.xq^mv`aPVu@yn&6L`buBPx,_');
define('LOGGED_IN_KEY',    'lOXSN)|}SuW%P,dQC(Mg]ePW NMo[%C;{iK?vat7/^t-D[r6G|:DTl:Y|tX]x/t&');
define('NONCE_KEY',        '!_#L-Wt-ZpH?$GQ;{>so%a4|&M@tA%|c+F>+Xdp+KmSuMoZ}]Z;*,Rg?|TVa3}Zr');
define('AUTH_SALT',        'NZo&#%,Oi0[}1SNodg*;sq|5G-Op(-2-MOOB,evq_%U<jCNxPX*Uec0rrQA>9vHf');
define('SECURE_AUTH_SALT', 'lm,qcwJJR8qDwW&fC6Z+8J6YjX=g|zVjo*T/W|h_}5Mi`X*p$m+I-O;[b{}tbLN-');
define('LOGGED_IN_SALT',   'iP?!}f*N<cghP_oij2z*^p^z#iW :Yv|kt?Te^U-%(#rbaD~s}PJLhucAx5pX8bY');
define('NONCE_SALT',       'vyf8-)O-nWR&)?J=mcPVTOv,l{rt2tG0I>=~eY9`` LYL_|vqy.3ZpfX1?N+#*s@');
/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
*/

 define( 'WP_DEBUG', true );
 define( 'WP_DEBUG_LOG', true );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
