FROM ruby:2.3-slim
# Install our dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
      build-essential nodejs libpq-dev
# Set our patch
ENV INSTALL_PATH /team-messenger
# Create directory
RUN mkdir -p $INSTALL_PATH
# Set our path as the main directory
WORKDIR $INSTALL_PATH
# Copy our Gemfile into the container.
COPY Gemfile ./
# Set the path to the gems
ENV BUNDLE_PATH /box
# Copy our code into the container
COPY . .