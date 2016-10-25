# Superheroes

## GA Rails Weekend Project

### Synopsis - GA Project Requirements

- Must have 2 models
- Must have 1 association between models
- Have complete RESTful routes for at least 1 model
- Include Error Handling & Validations for all models (try to break it!)

**Stretch Goals Accomplished:**
- 3 Models, a many-to-many association
- Deployment

### Deployment

See this project live on heroku: https://morning-cove-63345.herokuapp.com/

### Installation

1 - Fork and clone this repository.

2 - CD into the project directory.

3 - Install gems: ```> bundle install```

4 - Create the database: ```> rake db:create```

5 - Migrate the database: ```> rake db:migrate```

6 - Run the server: ```> rails s```

7 - Visit: http://localhost:3000/ to see your app live.

### Screenshots
Main Page - List of Superhero Teams:

<img src='http://i.imgur.com/JYF0mJL.png' height='500px'>

Team Page - List of Superheroes:

<img src='http://i.imgur.com/t0t4Jox.png' height='500px'>

Superhero Page - Attributes and List of Superpowers

<img src='http://i.imgur.com/Zd0S1Rv.png' height='500px'>

Superpower Page - Description and List of Superheroes with this Power

<img src='http://i.imgur.com/d3C7jVS.png' height='500px'>

### Challenges

I ran into a lot of trouble with the 'superhero#new' route. After much lost sleep, it turned out that "superheroes" is an irregular plural and Rails was looking for 'superheros' instead of 'superhero'.

My solution was as follows.

1 - Create a new migration:

```ruby
class RenameTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :superheros, :superheroes
  end
end
```

2 - Add the folowing to **/config/initializers/inflections**:

```ruby
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'superhero', 'superheroes'
end
```

That was a doozy. To see the evolution of my unraveling, see StackOverflow: 
http://stackoverflow.com/questions/40194139/rails-nested-form-for-errors-actioncontrollerurlgenerationerror
