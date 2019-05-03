# Objective

The goal of this app is to complete a coding test for Objective.

## Notable files:
- lib/objective_web/templates/page/index.html.eex
  - Has all of the HTML to generate the page
  ---
- lib/objective_web/views/page_view.ex
  - Has the functions that are called in the eex markup
  ---
- lib/objective_web/controllers/page_controller.ex
  - Mostly notable for how clean it is
  ---
- lib/objective/data.ex
  - CRUD functions, and function to populate database from JSON
  ---
- priv/repo/seeds.exs
  - The script that actually imports the data
  ---
- lib/objective_web/templates/layout/app.html.eex
  - Notable because I had to directly pull in the css scripts because they were blocked for not being over https