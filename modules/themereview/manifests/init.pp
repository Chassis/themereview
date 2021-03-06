#A Chassis extension that gets your WordPress install setup for WordPress Theme Reviews
class themereview (
  $path = '/vagrant/extensions/themereview'
) {
  file { '/vagrant/content':
    ensure => 'directory',
  }
  file { '/vagrant/content/themes':
    ensure => 'directory',
  }
  file { '/vagrant/content/plugins':
    ensure => 'directory',
  }
  wp::plugin { 'theme-check':
    ensure   => enabled,
    location => '/vagrant/wp',
    require  => Class['wp'],
  }
  wp::plugin { 'debug-bar':
    ensure   => enabled,
    location => '/vagrant/wp',
    require  => Class['wp'],
  }
  wp::plugin { 'log-deprecated-notices':
    ensure   => enabled,
    location => '/vagrant/wp',
    require  => Class['wp'],
  }
  wp::plugin { 'monster-widget':
    ensure   => enabled,
    location => '/vagrant/wp',
    require  => Class['wp'],
  }
  wp::plugin { 'wordpress-beta-tester':
    ensure   => enabled,
    location => '/vagrant/wp',
    require  => Class['wp'],
  }
  wp::plugin { 'regenerate-thumbnails':
    ensure   => enabled,
    location => '/vagrant/wp',
    require  => Class['wp'],
  }
  wp::rewrite { '/%year%/%monthnum%/%postname%/':
    location => '/vagrant/wp',
    require  => Class['wp'],
  }
  wp::option { 'blogname':
    ensure   => equal,
    value    => "'A very long title for a WordPress blog'",
    location => '/vagrant/wp',
    require  => Class['wp'],
  }
  wp::option { 'blogdescription':
    ensure   => equal,
    value    => "'A very long tagline for this WordPress blog because we need to test it properly'",
    location => '/vagrant/wp',
    require  => Class['wp'],
  }
  wp::option { 'posts_per_page':
    ensure   => equal,
    value    => '5',
    location => '/vagrant/wp',
    require  => Class['wp'],
  }
  wp::option { 'thread_comments_depth':
    ensure   => equal,
    value    => '3',
    location => '/vagrant/wp',
    require  => Class['wp'],
  }
  wp::option { 'page_comments':
    ensure   => equal,
    value    => '1',
    location => '/vagrant/wp',
    require  => Class['wp'],
  }
  wp::option { 'comments_per_page':
    ensure   => equal,
    value    => '5',
    location => '/vagrant/wp',
    require  => Class['wp'],
  }
  exec { '/usr/bin/wp option delete medium_size_h':
    onlyif  => '/usr/bin/wp option get medium_size_h',
    require => Class['wp'],
    user    => 'www-data',
    cwd     => '/vagrant/wp',
  }
  exec { '/usr/bin/wp option delete medium_size_w':
    onlyif  => '/usr/bin/wp option get medium_size_w',
    require => Class['wp'],
    user    => 'www-data',
    cwd     => '/vagrant/wp',
  }
  exec { '/usr/bin/wp option delete large_size_h':
    onlyif  => '/usr/bin/wp option get large_size_h',
    require => Class['wp'],
    user    => 'www-data',
    cwd     => '/vagrant/wp',
  }
  exec { '/usr/bin/wp option delete large_size_w':
    onlyif  => '/usr/bin/wp option get large_size_w',
    require => Class['wp'],
    user    => 'www-data',
    cwd     => '/vagrant/wp',
  }
  wp::plugin { 'wordpress-importer':
    ensure   => enabled,
    location => '/vagrant/wp',
    require  => Class['wp'],
  }
  wp::command { 'import':
    location => '/vagrant/wp',
    command  => "import ${path}/theme-unit-test-data.xml --authors=create",
    require  => Wp::Plugin['wordpress-importer']
  }
}
