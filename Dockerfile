# Use the official Ruby image as base
# This matches your Ruby version
FROM ruby:3.3.4

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  nodejs \
  postgresql-client \
  npm \
  yarn \
  build-essential \
  libpq-dev \
  && rm -rf /var/lib/apt/lists/*

# Set working directory in the container
WORKDIR /app

# Copy Gemfile first (Docker caches this layer if Gemfile hasn't changed)
COPY Gemfile Gemfile.lock ./

# Install Ruby dependencies
RUN bundle install

# Copy the rest of the application
COPY . .

# Precompile assets (for production)
RUN bundle exec rails assets:precompile

# Expose port 3000 (Rails default)
EXPOSE 3000

# Default command to run when container starts
CMD ["rails", "server", "-b", "0.0.0.0"]
