# Step 1: Use the official PHP image with Apache
FROM php:8.1-apache

<<<<<<< HEAD
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
=======
# Step 2: Install necessary PHP extensions (if required)
RUN docker-php-ext-install pdo pdo_mysql

# Step 3: Copy the PHP application files into the container
COPY . /var/www/html/

# Step 4: Expose port 80 (default HTTP port)
EXPOSE 80

# Step 5: Set the working directory to /var/www/html (Apache's default root directory)
WORKDIR /var/www/html

# Step 6: Ensure permissions are correct for files/folders
RUN chown -R www-data:www-data /var/www/html

# Step 7: Start Apache when the container runs
>>>>>>> 6b2630f7 (initial commit)
CMD ["apache2-foreground"]
