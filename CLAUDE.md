# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.


## Project Overview

Static HTML/CSS portfolio website deployed to AWS using S3 and CloudFront, provisioned with Terraform, and automated via GitHub Actions.

**Stack**: Pure HTML/CSS/JavaScript. No build tools, no backend, no dependencies. Just static assets served via HTTP.


## Architecture

- Pure HTML5 and CSS3
- No JavaScript
- No build step
- No framework


## File Structure

- `index.html` — main portfolio page with hero, about, services, courses, books, community, and contact sections
- `style.css` — all styling (responsive design, animations, dark/light patterns)
- `privacy.html`, `terms.html` — static policy pages
- `images/` — logos, course thumbnails, profile photos, banners
- `README.md` — deployment instructions and DMI-specific ownership proof requirements



## Commands

- terraform init
- terraform plan
- terraform apply


## Conventions

- All infrastructure changes go through Terraform — never modify AWS resources manually
- No JavaScript in this project
- CSS uses mobile-first approach with breakpoints at 900px, 768px, and 600px


## Safety

Never put secrets in this file. No API keys, passwords, or AWS credentials.


## Key Requirements for DMI Deployment

Before deploying to production, **edit the footer in index.html** (around line 604) and add a deployment ownership proof line:

```html
<p><strong>Deployed by:</strong> [Your Name] | [Cohort/Group] | [Date]</p>
```

This proof must be visible in your browser screenshot submission. Failing to add this will not meet DMI requirements.

## Deployment

The project is designed for Nginx on Ubuntu VM:

```bash
# Copy files to web root
sudo cp -r . /var/www/html/

# Start/enable Nginx
sudo systemctl start nginx
sudo systemctl enable nginx
```

Access via `http://<public-ip>`. Site must remain live for 24 hours for DMI completion.

Alternative hosting: GitHub Pages, Netlify, S3, or any static file server.

## Development

No build step. Open `index.html` in a browser to preview locally. Use any HTTP server:

```bash
# Python 3
python -m http.server 8000

# Node.js
npx http-server
```

Edit HTML/CSS directly; changes are immediately visible in the browser (refresh page).

## Notes

- This is a learning project—expect basic DevOps/hosting practices, not production enterprise patterns.
- External dependencies: Font Awesome 6.5.0 (CDN), Google Fonts (if any), Udemy/Amazon affiliate links.
- No tests, linting, or CI/CD pipeline (scope of DMI is manual deployment).
- Responsive design supports mobile and desktop via CSS media queries.
