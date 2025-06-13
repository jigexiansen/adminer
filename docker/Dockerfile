FROM php:7.4-apache

# 安装必要的系统包和PHP扩展
RUN apt-get update && apt-get install -y --no-install-recommends \
    zip unzip git && \
    docker-php-ext-install mysqli pdo pdo_mysql && \
    docker-php-ext-enable mysqli pdo_mysql && \
    rm -rf /var/lib/apt/lists/*

# 安装Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 设置工作目录
WORKDIR /var/www/html

# 复制并安装依赖
COPY src/composer.json ./
RUN composer install --no-dev --optimize-autoloader

# 复制入口文件和CSS文件
COPY src/index.php .
COPY src/adminer.css .

# 设置文件权限
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

# 健康检查
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost/ || exit 1

# 暴露端口
EXPOSE 80

# 启动Apache
CMD ["apache2-foreground"] 