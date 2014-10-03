#Currently Work In Progress

This extension is currently still under development. To get this extenion to work you'll need to [modify puppet-wp](https://github.com/Chassis/themereview/issues/2) then if it's a fresh install you'll need to run `vagrant up` and then `vagrant provision`.

# Theme Review
A [Chassis](https://github.com/Chassis/Chassis) extension to install and configure your Chassis WP install for [WordPress Theme Reviews](https://make.wordpress.org/themes/about-old/how-to-join-wptrt/).

## What's this plugin do

This Chassis extension installs and activates the following plugins:

1. [Theme Check](https://wordpress.org/plugins/theme-check/)
2. [Debug Bar](https://wordpress.org/plugins/debug-bar/)
3. [Log Deprecated Notices](https://wordpress.org/plugins/log-deprecated-notices/)
4. [Monster Widget](https://wordpress.org/plugins/monster-widget/)
5. [WordPress Beta Tester](https://wordpress.org/plugins/wordpress-beta-tester/)
6. [Regenerate Thumbnails](https://wordpress.org/plugins/regenerate-thumbnails/)

The extension also does the following as recommended in [Chip Bennetts Theme Review Guide](http://www.chipbennett.net/2011/04/20/a-guide-to-reviewing-themes-for-the-wordpress-theme-repository/):

1. Sets the blog title to "A very long title for a WordPress blog"
2. Sets the tagline to "A very long tagline for this WordPress blog because we need to test it properly"
3. Sets the "Blog pages show at most" to 5.
4. Sets "Threaded Comments" depth to 3.
5. Enables "Break comments into pages" and sets it to 5 comments per page.
6. Sets a blank value for Max Width & Max Height for "Medium size" and "Large size" under Media Settings.
7. Imports the WordPress [Theme Unit Test](http://codex.wordpress.org/Theme_Unit_Test) Data

## Usage
1. Clone Chassis `git clone --recursive https://github.com/Chassis/Chassis themereview`
2. Add this extension to your extensions directory `cd themereview && git clone git@github.com:Chassis/themereview.git extensions/themereview`
3. Run `vagrant up`
4. Browse to [http://vagrant.local](http://vagrant.local/)