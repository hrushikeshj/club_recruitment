# Installing

Install ruby, yarn, nodejs and MySql

## Clone the repo
```git
git clone https://<your_username>@github.com/hrushikeshj/club_recruitment 
```
> cd into the folder club_recruitment 

## Install rails
```bash
bundle
```

## Install npm package
```
yarn install
```

### Update the database username and password
File path: `config/database.yml`
```yml
...
...
default: &default
  adapter: mysql2
  encoding: utf8mb4
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: <db_username>
  password: <db_password>
  socket: /var/run/mysqld/mysqld.sock

development:
  <<: *default
  database: club_recruitment_development
...
...
```
Replace `<db_username>` and `<db_password>`.

### Migrate
```bash
rails db:create
rails db:migrate
```

### Run rails
```bash
rails s
```

If everything went right you can vist the app at 
[http://localhost:3000](http://localhost:3000/)

# TODO
- [x] Login/Sign-up
- [x] Scaffold User, Application, Role, ApplicationSubmission, Club
- [ ] Authorization
- [ ] UI
- [ ] Apply for clubs
  - [ ] Club Priority
  - [ ] Assigning marks
  - [ ] Selecting students

# Sync repo
```bash
git pull origin
```