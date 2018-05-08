FROM ruby:2.5

RUN apt-get update
RUN apt-get install -y apache2

# Install node
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

# Install Rails
RUN gem install rails --version=5.1.3 --no-ri --no-rdoc

# Install Yarn and ChromeDriver
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get install -y yarn
# RUN apt-get install yarn chromium-chromedriver
# RUN ln -s /usr/lib/chromium-browser/chromedriver /usr/local/bin

WORKDIR /usr/src/depot
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN bundle install

EXPOSE 3000
