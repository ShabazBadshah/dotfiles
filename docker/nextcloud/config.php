<?php
$CONFIG = array (
  'htaccess.RewriteBase' => '/',
  'memcache.local' => '\\OC\\Memcache\\APCu',
  'apps_paths' => 
  array (
    0 => 
    array (
      'path' => '/var/www/html/apps',
      'url' => '/apps',
      'writable' => false,
    ),
    1 => 
    array (
      'path' => '/var/www/html/custom_apps',
      'url' => '/custom_apps',
      'writable' => true,
    ),
  ),
  'instanceid' => 'ocidmipzj4hi',
  'passwordsalt' => '+Qmw0BxGtMSftrM1KeTyhIIrZPNA+2',
  'secret' => '+nnrTuC8h9XVEj55cOatlPYj/dta+DsTZg0GVdLeg4FPOma7',
  'trusted_domains' => 
  array (
    0 => 'cloud.shabazbadshah.com',
    1 => 'apollo',
  ),
  'datadirectory' => '/var/www/html/data',
  'dbtype' => 'mysql',
  'version' => '20.0.10.1',
  'overwrite.cli.url' => 'http://apollo',
  'dbname' => 'nextcloud',
  'dbhost' => 'db',
  'dbport' => '',
  'dbtableprefix' => 'oc_',
  'mysql.utf8mb4' => true,
  'dbuser' => 'nextcloud',
  'dbpassword' => 'secret',
  'installed' => true,
);