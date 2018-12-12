# A GitHub Action for Just Deploying a Site back to GitHub Pages

We're only deploying the site here. Site files should be sitting in `build` having presumably just been built, post-processed, etc.

## Secrets
* `GITHUB_TOKEN`: Access key scoped to the repository, we need this to push the site files back to the repo. (specify in workflow)
  
## Environment Variables
* `GITHUB_ACTOR`: Username of repo owner or object intiating the action (GitHub Provides)
* `GITHUB_REPO`: Owner/Repository (GitHub Provides)

## Examples

```hcl
workflow "Deploy Jekyll" {
  on = "push"
  resolves = ["Deploy Jekyll"]
}

action "Deploy Jekyll" {
  uses = "BryanSchuetz/jekyll-deploy-gh-pages/deploy@master"
  secrets = ["GITHUB_TOKEN"]
  needs = "BryanSchuetz/jekyll-deploy-gh-pages/build@master"
}
```

Grabs the site files in `build` and commits them to the gh-pages branch of the same repo.

## Caveats

* `destination:` should have beeen set to `./build` in your _config.yml file—as God demands.
* Remember when adding this action to a workflow that will also use a build action, you need to define that action in the `needs` paramater.
