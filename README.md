# edgcpp.org Website

Source code for [edgcpp.org](https://edgcpp.org), the EDGCPP open-source
project website. It is a Jekyll 4 project published as a fully static
site through GitHub Pages.

The site is currently a barebones placeholder. It was bootstrapped from
[cppalliance.github.io](https://github.com/cppalliance/cppalliance.github.io),
and content (layouts, styling, navigation, etc.) may be taken from that
repository as needed.

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
