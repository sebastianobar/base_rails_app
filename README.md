# Base Rails App Starter

This repository provides a preconfigured Ruby on Rails application, designed as a project starting point. It includes:

- **Latest Ruby & Dependencies:** Uses the most recent stable Ruby and up-to-date gems.
- **Standard Rails Features:** All conventional Rails directories and features (MVC, assets, jobs, mailers, helpers, PWA support).
- **Devcontainer Setup:** Ready-to-use `.devcontainer` for VS Code, enabling seamless development in containers.
- **Solid Queue, Solid Cache, Solid Cable:** Fully configured for development and production, including local development support.
- **Tailwind CSS:** Asset pipeline and builds are preconfigured.
- **Docker Support:** Includes `Dockerfile` for containerization.
- **Procfile.dev:** Multi-process development setup via `bin/dev`.

## Getting Started

1. **Clone the repository:**
   ```bash
   git clone <repo-url>
   ```
2. **Open in VS Code:**
   - Use the Dev Container feature for instant setup.
3. **Start development server:**
   ```bash
   bin/dev
   ```
4. **Database setup:**
   ```bash
   bin/rails db:create db:migrate db:seed
   ```
5. **Run tests:**
   ```bash
   bin/rails test
   ```

## Features

- **Job Queues:** Solid Queue (see `config/queue.yml`)
- **Cache:** Solid Cache (see `config/cache.yml`)
- **Cable:** Solid Cable (see `config/cable.yml`)
- **Assets:** Tailwind CSS, importmaps for JS
- **Background Jobs:** ActiveJob
- **Mailers:** ActionMailer
- **PWA:** Manifest and service worker included

## Deployment

- See `config/deploy.yml` and use `bin/kamal` for deployment automation.

## References

- See `README.md` for setup notes
- Entrypoints: `bin/dev`, `config/routes.rb`, `app/controllers/application_controller.rb`

---
This template is ideal for quickly starting new Rails projects with modern defaults and full development tooling.
