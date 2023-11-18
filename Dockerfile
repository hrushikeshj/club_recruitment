FROM ruby:2.6.1
WORKDIR /app

# bundle
RUN gem uninstall bundler && gem install bundler -v 1.17.2
COPY ./Gemfile ./Gemfile
COPY ./Gemfile.lock ./Gemfile.lock
RUN bundle install

RUN echo "deb http://archive.debian.org/debian stretch main" > /etc/apt/sources.list
RUN sed -i '/^mozilla\/DST_Root_CA_X3/s/^/!/' /etc/ca-certificates.conf && update-ca-certificates -f

RUN apt-get update && apt-get -y upgrade && apt-get -y install \
    ca-certificates curl gnupg \
    --no-install-recommends


# start node install
ENV NODE_MAJOR=16

RUN mkdir -p /etc/apt/keyrings && \
    apt-get install -y apt-transport-https && \
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y --allow-unauthenticated nodejs yarn


COPY ./yarn.lock ./package.json ./
# ENV NODE_OPTIONS=--openssl-legacy-provider if node >= 18

RUN yarn install
# end node install

# mysql client(reorder)
RUN apt-get install -y default-mysql-client default-libmysqlclient-dev

RUN rm -rf /var/lib/apt/lists/*

CMD ["rails", "s", "-p", "3000", "-b", "0.0.0.0"]
