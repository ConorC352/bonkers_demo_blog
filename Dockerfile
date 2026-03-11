FROM ruby:3.3-alpine AS base
RUN apk add --no-cache build-base mysql-dev nodejs bash yaml-dev

WORKDIR /app

FROM base AS deps
COPY Gemfile Gemfile.lock* ./
RUN bundle install --jobs 4 --retry 3

FROM base AS runner
ENV RAILS_ENV=development
COPY --from=deps /usr/local/bundle /usr/local/bundle
COPY . .

EXPOSE 3001
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3001"]