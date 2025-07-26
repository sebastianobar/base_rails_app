# Copilot Instructions for AI Agents

## Project Overview
This is a Ruby on Rails application with a conventional structure. Key directories include:
- `app/`: Main application code (controllers, models, views, assets, jobs, mailers, helpers, javascript)
- `config/`: Rails configuration, environment settings, initializers, routes
- `db/`: Database schema and seeds
- `bin/`: Custom and Rails-provided executables
- `test/`: Test suite (system, integration, models, controllers, helpers, jobs, mailers)

## Architecture & Patterns
- Follows standard Rails MVC architecture: controllers handle requests, models manage data, views render output.
- Asset pipeline uses Tailwind CSS (`app/assets/builds/tailwind.css`, `app/assets/tailwind/`).
- JavaScript is managed via `app/javascript/` and importmaps (`config/importmap.rb`).
- Background jobs use ActiveJob (`app/jobs/`).
- Mailers are in `app/mailers/`.
- PWA support: see `app/views/pwa/manifest.json.erb` and `service-worker.js`.

## Developer Workflows
- **Start server:** Use `bin/dev` for local development (may use Procfile.dev for multi-process setup).
- **Database:**
  - Migrations: `bin/rails db:migrate`
  - Seeds: `bin/rails db:seed`
- **Testing:**
  - Run all tests: `bin/rails test`
  - System tests: `bin/rails test:system`
- **Linting/Security:**
  - Lint: `bin/rubocop`
  - Security: `bin/brakeman`
- **Assets:**
  - Tailwind builds are in `app/assets/builds/` and `app/assets/tailwind/`.

## Conventions & Integration
- Use `bin/` scripts for all CLI tasks (prefer over `bundle exec ...`).
- Configuration files are in `config/` (see `config/environments/` for env-specific settings).
- External services (queues, cache) are configured in `config/*.yml`.
- Docker support: see `Dockerfile` for containerization.
- Deployment: see `config/deploy.yml` and `bin/kamal` for deployment automation.

## Examples
- To add a new controller: place in `app/controllers/`, update `config/routes.rb`.
- To add a background job: subclass `ApplicationJob` in `app/jobs/`.
- To add a model: subclass `ApplicationRecord` in `app/models/`, run migration.

## References
- See `README.md` for additional setup notes.
- Key entrypoints: `bin/dev`, `config/routes.rb`, `app/controllers/application_controller.rb`.

---
_If any conventions or workflows are unclear, please ask for clarification or examples from the codebase._
