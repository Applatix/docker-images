<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */
// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');
/** MySQL database username */
define('DB_USER', 'master_user');
/** MySQL database password */
define('DB_PASSWORD', '');
/** MySQL hostname */
define('DB_HOST', 'ax-rds-dev.applatix.com');
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
define('AUTH_KEY',         'yi-N$ktG=53#|%dvF|XQ{dw(-tr+LIFy~wdw|oqSil#ZS`$u0=N7~#QrS9*4pfEj');
define('SECURE_AUTH_KEY',  'gv1[o0|Zv}BEs9J^/nQfQu-f2g&3cb*)p`Zcunj%H[7HQTrN5t`ja)wAv&N!sU6w');
define('LOGGED_IN_KEY',    '<R6do[ymW|!eo./x:1rH}{2qy/tk>!wz)e]-/#+?x8yW]$Z3u#5eYi 0I[fhFi# ');
define('NONCE_KEY',        '*Mn4t8y5->0W_Z^|*|$/C*Tj1b{XBbef5Z~Ch`31G_+$zg<yu=n9C$_TJc-Jcq+E');
define('AUTH_SALT',        'o7$bR!(DT{,Mt^.bihJaA?xosmBZ||E&8]-bQJzlW/^X:CkcP%Y#Q,m<-lrjr&(H');
define('SECURE_AUTH_SALT', '>CAV&tzu#7pjSWi~B|3=~`m/2UwT @1Kug@>Z$#49G(wpEp+3Y]0[*>`bh:$k||1');
define('LOGGED_IN_SALT',   'ge+sl9,P+k5lQsR#@0BZ?G>m@$qO0UY{P<icf_-0JMuduA%OH[q=czc(4BD.F ?:');
define('NONCE_SALT',       '1>:<.lKEiWZw /oW8izVu#}Q_p<Do#-e;)oDt&sY+RG3G4mF@,!JW]1+pE~!:F_~');

/**#@-*/
/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';
/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');
/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);
/* That's all, stop editing! Happy blogging. */
/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');
/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
/** change permisssions for plugin installation */
define("FS_METHOD","direct");
define("FS_CHMOD_DIR", 0777);
define("FS_CHMOD_FILE", 0777);