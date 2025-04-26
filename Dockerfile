# Step 1: Use the official PHP image with Apache
FROM php:8.1-apache

# Step 2: Install necessary PHP extensions (adjust as needed)
RUN docker-php-ext-install pdo pdo_mysql

# Step 3: Copy the project files into the Docker container
COPY . /var/www/html/

# Step 4: Expose port 80 for web traffic
EXPOSE 80

# Step 5: Set the working directory to the Apache web root
WORKDIR /var/www/html

# Step 6: Ensure Apache has proper file permissions
RUN chown -R www-data:www-data /var/www/html

# Step 7: Run Apache in the foreground
CMD ["apache2-foreground"]
