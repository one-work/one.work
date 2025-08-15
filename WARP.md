# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Overview

This is Work Design (work.design), a comprehensive Ruby on Rails 8.0 SaaS application built using a modular engine-based architecture. The application provides organizational management, ERP, e-commerce, CMS, and WeChat ecosystem integration services.

## Architecture

### Engine-Based Modular Design
The application follows Rails Engine architecture with over 30 modular engines located in the `engine/` directory. Each engine is a self-contained Rails component with its own models, controllers, views, and dependencies.

Key engines include:
- `rails_com` - Core utilities and common functionality
- `rails_auth` - Authentication and authorization
- `rails_crm` - Customer relationship management
- `rails_cms` - Content management system
- `rails_trade` - E-commerce and trading functionality
- `rails_org` - Organization management
- `rails_wechat` - WeChat integration
- `rails_finance` - Financial management
- `rails_design` - UI components and design system

### Database Architecture
Uses PostgreSQL with three separate databases:
- **Primary**: Main application data (`work_development`)
- **Queue**: Job queue data using Solid Queue (`work_queue_development`)
- **Cache**: Caching data using Solid Cache (`work_cache_development`)

### Frontend Architecture
- **CSS Framework**: Bulma for styling
- **JavaScript**: Hotwire (Turbo + Stimulus) for progressive enhancement
- **Build Tools**: esbuild for JavaScript bundling, Sass for CSS compilation
- **Asset Pipeline**: Propshaft (Rails 8.0 default)

## Development Commands

### Initial Setup
```bash
# Install Ruby dependencies
bundle install

# Install Node.js dependencies
npm install

# Setup database credentials
bin/rails credentials:edit
# Add your local database configuration for db_development and db_test

# Create and setup databases
bin/rails db:create
bin/rails db:schema:load  # Use schema:load instead of migrate as migrations are auto-generated
```

### Development Server
```bash
# Start all development processes (recommended)
bin/dev

# Or start individual processes:
bin/rails s -p 3000 -b 0.0.0.0  # Rails server
bin/jobs                         # Background job processor
npm run build -- --sourcemap --watch     # JavaScript build watcher
npm run build:css -- --watch --poll      # CSS build watcher
```

### Database Management
```bash
# Create databases
bin/rails db:create

# Load schema (preferred over migrations)
bin/rails db:schema:load

# Reset database
bin/rails db:drop db:create db:schema:load

# Access Rails console
bin/rails c

# Access database console
bin/rails dbconsole
```

### Testing
```bash
# Run all tests
bin/rails test

# Run specific test file
bin/rails test test/path/to/test_file.rb

# Run tests with system test setup (uses Capybara + Selenium)
bin/rails test:system
```

### Asset Management
```bash
# Build JavaScript assets
npm run build

# Build CSS assets
npm run build:css

# Build both with watch mode
npm run build -- --watch
npm run build:css -- --watch
```

### Code Quality
```bash
# Security analysis
bundle exec brakeman

# Interactive debugging (if debug gem is available)
# Add 'debugger' statement in code and use Rails console
```

## Deployment

The application uses Kamal 2.7.0 for deployment with the following commands:

```bash
# Deploy to production
bin/kamal deploy

# Setup initial deployment
bin/kamal setup

# Check deployment status
bin/kamal app logs

# Access production console
bin/kamal app exec -i 'bin/rails c'

# Database operations on production
bin/kamal accessory exec postgres 'psql -U postgres work_production'
```

## Key Configuration

### Application Configuration
- **Time Zone**: Beijing (Asia/Shanghai)
- **Locale**: Chinese (zh) as default
- **Job Queue**: Solid Queue with dedicated database
- **Cache**: Solid Cache with dedicated database
- **SSL**: Enabled with HSTS for subdomains

### Environment Variables
Development requires:
- `POSTGRES_PASSWORD` - Database password

Production additionally requires:
- `RAILS_MASTER_KEY` - Rails credentials key
- `KAMAL_REGISTRY_USERNAME` - Docker registry username
- `KAMAL_REGISTRY_PASSWORD` - Docker registry password

### Subdomain Routing
The application handles multiple subdomains:
- `panel.*` - Panel management interface
- `admin.*` - Administrative interface
- `agent.*` - Agent interface
- Root domain - Main application

## Engine Development

When working with engines:

```bash
# Navigate to specific engine
cd engine/rails_com

# Test engine in isolation
bundle exec rake test

# Generate engine components
bin/rails generate model ModelName
bin/rails generate controller ControllerName
```

Each engine has its own `package.gemspec` file and can be developed independently while being integrated into the main application through the Gemfile's path references.

## Important Notes

- Use `bin/rails db:schema:load` instead of `db:migrate` as migrations are auto-generated
- The application uses Rails 8.0 features including Solid Queue and Solid Cache
- WeChat integration is a major component with dedicated engines for different WeChat services
- The modular engine architecture allows for independent development and testing of business components
- Asset compilation uses modern tools (esbuild, Sass) with file watching for development
