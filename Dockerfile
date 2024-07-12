# Используем базовый образ с нужной версией Ruby
FROM ruby:3.2.3

# Устанавливаем необходимые пакеты
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# Создаем директорию для приложения
RUN mkdir /blog1

# Устанавливаем рабочую директорию
WORKDIR /blog1

# Копируем Gemfile и Gemfile.lock в рабочую директорию
COPY Gemfile Gemfile.lock ./

# Устанавливаем зависимости
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Копируем оставшуюся часть приложения
COPY . .

# Создаем пользователя 'app'
RUN useradd -ms /bin/bash app

# Устанавливаем права для пользователя 'app'
RUN chown -R app:app /blog1

# Запускаем приложение от имени пользователя 'app'
USER app

# Указываем команду для запуска приложения
CMD ["rails", "server", "-b", "0.0.0.0"]
