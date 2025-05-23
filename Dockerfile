# Use the official PHP 8.1 image with Apache web server
FROM php:8.1-apache

# Install necessary PHP extensions (pdo, pdo_mysql)
RUN docker-php-ext-install pdo pdo_mysql

# Copy the entire project into Apache's default web directory
COPY . /var/www/html/

# Expose port 80 for web traffic
EXPOSE 80

# Set working directory to Apache's root directory
WORKDIR /var/www/html

# Ensure Apache has proper ownership on project files
RUN chown -R www-data:www-data /var/www/html

# Start Apache in the foreground when the container runs
CMD ["apache2-foreground"]
