# Requirements:

- Docker 18.02.0+
- Docker-compose 1.23.2+


# installation steps

- In the first step, we need to create and apply migrations to the database, using the following command:

`docker-compose run --rm web rails db:create db:migrate`. 

- Then, we need to precompile the assets:

`docker-compose run --rm web rails assets:precompile`

- Creating an admin user cannot be done through the web interface. Therefore, we need to execude a command for that:

`docker-compose run --rm  web bundle exec rails runner "User.new(username: '<USERNAME>', password: '<PASSWORD>', user_type: 'admin').save"`

Replace `<USERNAME>` and `<PASSWORD>`. Note that the password should contain at least 6 characters.

- Finally, to run the application: `docker-compose up web`

# Test execution

- To execute the tests:

`docker-compose run  -e DATABASE_URL=db/test.sqlite3 --rm  web rails test`