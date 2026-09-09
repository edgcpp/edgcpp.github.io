# edgcpp.org Website

Source code for [edgcpp.org](https://edgcpp.org), the website for EDG's
transition to open source under a fiscal sponsorship agreement with
[The C++ Alliance](https://cppalliance.org). It is a Jekyll 4 project
published as a fully static site through GitHub Pages.

The site is a single page. Its content lives in `index.html`, built on a
small Jekyll scaffold:

- `_layouts/default.html` – page shell
- `_includes/head.html`, `header.html`, `footer.html` – shared chrome
- `assets/css/main.css` – plain CSS, no Sass
- `assets/img/favicon.svg`

Site-wide links (the GitHub organization, this repository, and The C++
Alliance) are set in `_config.yml`. The history section of the page is a
marked placeholder until that content is collected.

The project was bootstrapped from
[cppalliance.github.io](https://github.com/cppalliance/cppalliance.github.io).

## Local Development

```bash
bundle install
bundle exec jekyll serve
```

## Deployment

Deployments are handled by GitHub Actions
(`.github/workflows/build_and_deploy.yml`):

1. Commit source changes to the `develop` branch and push to GitHub.
2. CI builds the site with `bundle exec jekyll build`.
3. On `develop`, the deploy job removes everything from the working tree
   except `_site` and `.git`, moves the built `_site` output to the
   repository root, and force-pushes the result to `master`.

The `master` branch is therefore generated build output; never edit it
directly. GitHub Pages serves the site from `master`, and `CNAME` binds
the deployment to `edgcpp.org`.
