if [ ! -f "/var/www/wordpress/wp-config.php" ]; then

	wp core config \
		--dbname=$WP_DATABASE \
		--dbuser=$WP_MDB_USER \
		--dbpass=$WP_MDB_PASSWORD \
		--dbhost=$WP_HOST \
		--dbprefix='wp_' \
		--dbcharset="utf8" \
		--dbcollate="utf8_general_ci" --allow-root

    wp core install \
        --url=$WP_URL \
        --title=$WP_TITLE \
        --admin_user=$WP_ADMIN_USER \
        --admin_password=$WP_ADMIN_PASSWORD \
        --admin_email=$WP_ADMIN_EMAIL \
        --skip-email --allow-root
	wp user create $WP_USER $WP_EMAIL --user_pass=$WP_PASSWORD --role=subscriber --porcelain --allow-root
fi
php-fpm -F
