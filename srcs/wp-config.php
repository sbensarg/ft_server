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
define('DB_NAME', 'wordpress');
/** MySQL database username */
define('DB_USER', 'wordpressuser');
/** MySQL database password */
define('DB_PASSWORD', 'azerty');
/** MySQL hostname */
define('FS_METHOD', 'direct');
define( 'DB_HOST', 'localhost' );

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
define('AUTH_KEY',         '!n`D=DPU:mJ?| kUZc;Q-@2*XkW,3U/j}BOCQL2-e9w!@@FA=4a,my0o:ZpN)@kl');
define('SECURE_AUTH_KEY',  'FQLX[-T`-7$~jF1iw0|{kOZ;8Ut,8&:L*)GB5(s|F+_[Tt7yY$n*J<$u7F5gk/4T');
define('LOGGED_IN_KEY',    '}q#~SYT0:YA#IR:o^H7)|(iX4Wn8--Hpkd~.la9YxZ+UF?%m}]l7o].]Wn87<q+U');
define('NONCE_KEY',        '#KWlaX:;!$Hh7xoaLT4&>KP$;k;/d6@Z?CJVthR6[L(5/lp;RSPg[es4.;]%/9Li');
define('AUTH_SALT',        '168DPu>? |qqaExs-H>]!s-07R`CA-7X&o[Yw4yic2< j?G/uU(5}W%4%&X^~s8~');
define('SECURE_AUTH_SALT', 'llwK&-jd*9pe?v62029qg|%$/s6!wKo!gC7!X3e)dX03*zPb{oGjBlGb~<xL:WF0');
define('LOGGED_IN_SALT',   'P9f=BDrH!KqMq;isW.d2!8fN%-`Sur#@bWBy>MO8!muY3vv>1~i.Gg^nCu.H!-lZ');
define('NONCE_SALT',       'Q-<B65,J$EWT1SxHB@^*#>PQ@JAjtaowpPaH5Cs+Plo[~@cgj=d3LR;ht%@Lobn_');
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
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );