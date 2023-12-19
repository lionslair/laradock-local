#
#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------
#

ARG LARADOCK_PHP_VERSION
FROM php:${LARADOCK_PHP_VERSION}-alpine

LABEL maintainer="Mahmoud Zalt <mahmoud@zalt.me>"

ARG LARADOCK_PHP_VERSION

# If you're in China, or you need to change sources, will be set CHANGE_SOURCE to true in .env.

ARG CHANGE_SOURCE=false
RUN if [ ${CHANGE_SOURCE} = true ]; then \
    # Change application source from dl-cdn.alpinelinux.org to aliyun source
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories \
;fi

RUN apk --update add wget \
  curl \
  git \
  build-base \
  libmcrypt-dev \
  libxml2-dev \
  pcre-dev \
  zlib-dev \
  autoconf \
  cyrus-sasl-dev \
  libgsasl-dev \
  oniguruma-dev \
  supervisor \
  procps; \
  if [ $(php -r "echo PHP_VERSION_ID - PHP_RELEASE_VERSION;") = "50600" ] || \
     [ $(php -r "echo PHP_VERSION_ID - PHP_RELEASE_VERSION;") = "70000" ]; then \
    apk --update add libressl libressl-dev; \
  else \
    apk --update add openssl-dev; \
  fi

RUN pecl channel-update pecl.php.net; \
  docker-php-ext-install mysqli mbstring pdo pdo_mysql xml pcntl exif; \
  if [ $(php -r "echo PHP_MAJOR_VERSION;") = "8" ] && \
     [ $(php -r "echo PHP_VERSION_ID - PHP_RELEASE_VERSION;") != "80000" ]; then \
    php -m | grep -oiE '^tokenizer$'; \
  else \
    docker-php-ext-install tokenizer; \
  fi

# Add a non-root user to help install ffmpeg:
ARG PUID=1000
ENV PUID ${PUID}
ARG PGID=1000
ENV PGID ${PGID}

RUN addgroup -g ${PGID} laradock && \
    adduser -D -G laradock -u ${PUID} laradock

###########################################################################
# Intl:
###########################################################################

ARG INSTALL_INTL=false

RUN if [ ${INSTALL_INTL} = true ]; then \
###    apk add --no-cache autoconf build-base --virtual build_deps && \
##    apk --update add icu && \
##    apk add --no-cache --virtual .php-deps make && \
##    apk add --no-cache --virtual .build-deps $PHPIZE_DEPS zlib-dev icu-dev g++ && \
###    apk --update add icu-dev && \
##    docker-php-ext-configure intl && \
##    docker-php-ext-install intl && \
##    docker-php-ext-enable intl && \
##    { find /usr/local/lib -type f -print0 | xargs -0r strip --strip-all -p 2>/dev/null || true; } && \
##    apk del .build-deps && \
##    rm -rf /tmp/* /usr/local/lib/php/doc/* /var/cache/apk/* \
#    from https://github.com/mlocati/docker-php-extension-installer
#    curl -sSLf \
#            -o /usr/local/bin/install-php-extensions \
#            https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions && \
#        chmod +x /usr/local/bin/install-php-extensions && \
#        IPE_ICU_EN_ONLY=1 install-php-extensions intl \
#    apk add --no-cache icu-dev --repository=https://dl-cdn.alpinelinux.org/alpine/edge/main && \
    apk add icu-dev && \
    docker-php-ext-configure intl && \
    docker-php-ext-install intl && \
    docker-php-ext-enable intl \
;fi

#Install BZ2:
ARG INSTALL_BZ2=false
RUN if [ ${INSTALL_BZ2} = true ]; then \
  apk --update add bzip2-dev; \
  docker-php-ext-install bz2 \
;fi

###########################################################################
# PHP GnuPG:
###########################################################################

ARG INSTALL_GNUPG=false

RUN set -eux; if [ ${INSTALL_GNUPG} = true ]; then \
      apk add --no-cache --no-progress --virtual BUILD_DEPS_PHP_GNUPG gpgme-dev; \
      apk add --no-cache --no-progress gpgme; \
      pecl install gnupg; \
      docker-php-ext-enable gnupg; \
    fi

#Install LDAP
ARG INSTALL_LDAP=false;
RUN set -eux; if [ ${INSTALL_LDAP} = true ]; then \
      apk add --no-cache --no-progress openldap-dev; \
      docker-php-ext-install ldap; \
      php -m | grep -oiE '^ldap$'; \
    fi

#Install GD package:
# future ref https://github.com/laradock/php-fpm/blob/master/Dockerfile-8.1
ARG INSTALL_GD=false
RUN if [ ${INSTALL_GD} = true ]; then \
   apk add --update --no-cache freetype-dev libjpeg-turbo-dev jpeg-dev libpng-dev; \
   if [ $(php -r "echo PHP_MAJOR_VERSION;") = "8" ] || [ $(php -r "echo PHP_VERSION_ID - PHP_RELEASE_VERSION;") = "70400" ]; then \
# do not use this from upstream. seems to break gd
#   if [ $(php -r "echo PHP_VERSION_ID - PHP_RELEASE_VERSION;") = "80000" ] || [ $(php -r "echo PHP_VERSION_ID - PHP_RELEASE_VERSION;") = "70400" ]; then \
     docker-php-ext-configure gd --with-freetype --with-jpeg; \
   else \
     docker-php-ext-configure gd --with-freetype-dir=/usr/lib/ --with-jpeg-dir=/usr/lib/ --with-png-dir=/usr/lib/; \
   fi && \
   docker-php-ext-install gd \
;fi

#Install ImageMagick package:
ARG INSTALL_IMAGEMAGICK=false
ARG IMAGEMAGICK_VERSION=latest
ENV IMAGEMAGICK_VERSION ${IMAGEMAGICK_VERSION}
RUN set -eux; \
  if [ ${INSTALL_IMAGEMAGICK} = true ]; then \
    apk add --update --no-cache imagemagick-dev imagemagick; \
    if [ $(php -r "echo PHP_MAJOR_VERSION;") = "8" ]; then \
      cd /tmp && \
      if [ ${IMAGEMAGICK_VERSION} = "latest" ]; then \
        git clone https://github.com/Imagick/imagick; \
      else \
        git clone --branch ${IMAGEMAGICK_VERSION} https://github.com/Imagick/imagick; \
      fi && \
      cd imagick && \
      phpize && \
      ./configure && \
      make && \
      make install && \
      rm -r /tmp/imagick; \
    else \
      pecl install imagick; \
    fi && \
    docker-php-ext-enable imagick; \
    php -m | grep -q 'imagick'; \
  fi

#Install GMP package:
ARG INSTALL_GMP=false
RUN if [ ${INSTALL_GMP} = true ]; then \
   apk add --update --no-cache gmp gmp-dev; \
   docker-php-ext-install gmp \
;fi

# might need to make this by the version number
COPY ./policy.xml /etc/ImageMagick-6/policy.xml

#Install BCMath package:
ARG INSTALL_BCMATH=false
RUN if [ ${INSTALL_BCMATH} = true ]; then \
  docker-php-ext-install bcmath \
  ;fi

#Install Sockets package:
ARG INSTALL_SOCKETS=false
RUN if [ ${INSTALL_SOCKETS} = true ]; then \
  docker-php-ext-install sockets \
  ;fi

# Install PostgreSQL drivers:
ARG INSTALL_PGSQL=false
RUN if [ ${INSTALL_PGSQL} = true ]; then \
  apk --update add postgresql-dev \
  && docker-php-ext-install pdo_pgsql \
  ;fi

# Install ZipArchive:
ARG INSTALL_ZIP_ARCHIVE=false
RUN set -eux; \
  if [ ${INSTALL_ZIP_ARCHIVE} = true ]; then \
    apk --update add libzip-dev && \
    if [ ${LARADOCK_PHP_VERSION} = "7.3" ] || [ ${LARADOCK_PHP_VERSION} = "7.4" ] || [ $(php -r "echo PHP_MAJOR_VERSION;") = "8" ]; then \
      docker-php-ext-configure zip; \
    else \
      docker-php-ext-configure zip --with-libzip; \
    fi && \
    # Install the zip extension
    docker-php-ext-install zip \
;fi

# Install PhpRedis package:
ARG INSTALL_PHPREDIS=false
RUN if [ ${INSTALL_PHPREDIS} = true ]; then \
    # Install Php Redis Extension
    if [ $(php -r "echo PHP_MAJOR_VERSION;") = "5" ]; then \
      printf "\n" | pecl install -o -f redis-4.3.0; \
    else \
      printf "\n" | pecl install -o -f redis; \
    fi; \
    rm -rf /tmp/pear; \
    docker-php-ext-enable redis; \
fi

ARG INSTALL_FFMPEG=false
RUN if [ ${INSTALL_FFMPEG} = true ]; then \
   # Add ffmpeg to horizon
    apk add ffmpeg \
;fi

# Install BBC Audio Waveform Image Generator:
ARG INSTALL_AUDIOWAVEFORM=false
RUN if [ ${INSTALL_AUDIOWAVEFORM} = true ]; then \
   apk add git make cmake gcc g++ libmad-dev libid3tag-dev libsndfile-dev gd-dev boost-dev libgd libpng-dev zlib-dev \
   && apk add autoconf automake libtool gettext \
   && wget https://github.com/xiph/flac/archive/1.3.3.tar.gz \
   && tar xzf 1.3.3.tar.gz \
   && cd flac-1.3.3 \
   && ./autogen.sh \
   && ./configure --enable-shared=no \
   && make \
   && make install \
   && cd .. \
   && git clone https://github.com/bbc/audiowaveform.git \
   && cd audiowaveform \
   && wget https://github.com/google/googletest/archive/release-1.10.0.tar.gz \
   && tar xzf release-1.10.0.tar.gz \
   && ln -s googletest-release-1.10.0/googletest googletest \
   && ln -s googletest-release-1.10.0/googlemock googlemock \
   && mkdir build \
   && cd build \
   && cmake .. \
   && make \
   && make install \
;fi

#####################################
# poppler-utils:
#####################################
USER root

ARG INSTALL_POPPLER_UTILS=false

RUN if [ ${INSTALL_POPPLER_UTILS} = true ]; then \
  apk add --update --no-cache poppler-utils antiword \
;fi

# Install packages not yet updated for the current alpine version TODO remove when no longer needed
# wkhtmltopdf midding from alpine-3.15 plus
#RUN echo 'https://dl-cdn.alpinelinux.org/alpine/v3.14/community' >> /etc/apk/repositories
#RUN echo 'https://dl-cdn.alpinelinux.org/alpine/v3.14/main' >> /etc/apk/repositories
RUN #apk add --no-cache wkhtmltopdf

# Install Cassandra drivers:
ARG INSTALL_CASSANDRA=false
RUN if [ ${INSTALL_CASSANDRA} = true ]; then \
  if [ $(php -r "echo PHP_MAJOR_VERSION;") = "8" ]; then \
    echo "PHP Driver for Cassandra is not supported for PHP 8.0."; \
  else \
    apk add --update --no-cache cassandra-cpp-driver libuv gmp \
    && apk add --update --no-cache cassandra-cpp-driver-dev gmp-dev --virtual .build-sec \
    && cd /usr/src \
    && git clone https://github.com/datastax/php-driver.git \
    && cd php-driver/ext \
    && phpize \
    && mkdir -p /usr/src/php-driver/build \
    && cd /usr/src/php-driver/build \
    && ../ext/configure > /dev/null \
    && make clean > /dev/null \
    && make > /dev/null 2>&1 \
    && make install \
    && docker-php-ext-enable cassandra \
    && apk del .build-sec; \
  fi \
;fi

# Install MongoDB drivers:
ARG INSTALL_MONGO=false
RUN if [ ${INSTALL_MONGO} = true ]; then \
      if [ $(php -r "echo PHP_MAJOR_VERSION;") = "5" ]; then \
        pecl install mongo; \
        docker-php-ext-enable mongo; \
      else \
        pecl install mongodb; \
        docker-php-ext-enable mongodb; \
      fi; \
    fi

###########################################################################
# YAML: extension
###########################################################################

ARG INSTALL_YAML=false

RUN if [ ${INSTALL_YAML} = true ]; then \
     apk --update add -U --no-cache --virtual temp yaml-dev \
     && apk add --no-cache yaml \
     && docker-php-source extract; \
      if [ $(php -r "echo PHP_MAJOR_VERSION;") = "5" ]; then \
        pecl install yaml-1.3.2; \
      elif [ $(php -r "echo PHP_MAJOR_VERSION;") = "7" ] && [ $(php -r "echo PHP_MINOR_VERSION;") = "0" ]; then \
        pecl install yaml-2.0.4; \
      else \
        pecl install yaml; \
      fi \
     && docker-php-ext-enable yaml \
     && pecl clear-cache \
     && docker-php-source delete \
     && apk del temp \
;fi

###########################################################################
# PHP Memcached:
###########################################################################

ARG INSTALL_MEMCACHED=false

RUN if [ ${INSTALL_MEMCACHED} = true ]; then \
  apk --update add libmemcached-dev; \
  # Install the php memcached extension
  if [ $(php -r "echo PHP_MAJOR_VERSION;") = "5" ]; then \
    pecl install memcached-2.2.0; \
  else \
    pecl install memcached; \
  fi; \
  docker-php-ext-enable memcached; \
  php -m | grep -r 'memcached'; \
fi

#--------------------------------------------------------------------------
# Clean up
#--------------------------------------------------------------------------

RUN rm /var/cache/apk/* \
  && mkdir -p /var/www

#
#--------------------------------------------------------------------------
# Optional Supervisord Configuration
#--------------------------------------------------------------------------
#
# Modify the ./supervisor.conf file to match your App's requirements.
# Make sure you rebuild your container with every change.
#

COPY supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisord.conf"]

#
#--------------------------------------------------------------------------
# Optional Software's Installation
#--------------------------------------------------------------------------
#
# If you need to modify this image, feel free to do it right here.
#
# -- Your awesome modifications go here -- #

# Install laravel legacy version
#RUN echo "@testing https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
#RUN apk --update add php7@testing \
#    php7-cli@testing \
#    php7-curl@testing \
#    php7-intl@testing \
#    php7-json@testing \
#    php7-xml@testing \
#    php7-mbstring@testing \
#    php7-mysqli@testing \
#    php7-pgsql@testing \
#    php7-redis@testing \
#    php7-pdo@testing \
#    php7-pcntl@testing \
#    php7-sqlite3@testing \
#    php7-zip@testing \
#    php7-bcmath@testing \
#    php7-memcached@testing \
#    php7-memcached@testing \
#    php7-gd@testing \
#    php7-memcached@testing \
#    php7-dev@testing

###########################################################################
# Image optimizers:
# # https://github.com/docker-library/php/issues/912#issuecomment-559918036
###########################################################################

ARG INSTALL_IMAGE_OPTIMIZERS=false

RUN if [ ${INSTALL_IMAGE_OPTIMIZERS} = true ]; then \
    if [ ${INSTALL_NODE} = true ]; then \
        exec bash && . ~/.bashrc && npm install -g svgo \
    ;fi && \
    apk --update add jpegoptim optipng pngquant gifsicle libpng libpng-dev jpeg-dev \
    freetype freetype-dev libjpeg-turbo libjpeg-turbo-dev libxpm-dev libvpx-dev && \
     docker-php-ext-configure gd \
        --with-freetype \
        --with-jpeg && \
      NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
      docker-php-ext-install -j${NPROC} gd \
;fi

#
#--------------------------------------------------------------------------
# Check PHP version
#--------------------------------------------------------------------------
#

#RUN php -v | head -n 1 | grep -q "PHP ${PHP_VERSION}."

#
#--------------------------------------------------------------------------
# Final Touch
#--------------------------------------------------------------------------
#

WORKDIR /etc/supervisor/conf.d/
