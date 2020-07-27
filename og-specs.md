# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) - I included several has_many relationships(e.g. in user, challenge, group, and post models)
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) - I included several belongs_to relationships (e.g. in list and post models)
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) - I included more than two has_many through relationships (e.g. user has many challenges through commitments, group has many users through memberships)
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) - I included more than one many-to-many relationships (e.g. user has many challenges through commitments and challenges has many users through commitments, group has many challenges through groupchallenges and challenge has many groups through groupchallenges)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) - I assigned a "through model" a submittable attribute (e.g. commitment has an attiribute "regularity" that is set by user upon committing to a challenge )
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) - I included validations for almost all models (e.g. presence, length or format validations)
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - I included class level AR scope methods in several models (e.g. created method in post model)
- [x] Include signup - I included a signup page and route with related validations
- [x] Include login - Users can log in manually or via third-party providers using omniauth
- [x] Include logout - Users can click on log out link and it clears session hash and logs user out
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) - User can signup/login with his/her facebook, twitter and google account by using omniauth
- [x] Include nested resource show or index (URL e.g. users/2/recipes) - I included a nested resource (e.g. /users/:user_id/posts/:id)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) - Since I included "new forms" in other model's index pages I didn't make separate new forms but I did inclue nested create, edit, show, update and destroy paths as well
- [x] Include form display of validation errors (form URL e.g. /recipes/new) - I displayed validation errors in several forms (e.g. create post form) and included field_with_errors divs by using form_for where appropriate

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate