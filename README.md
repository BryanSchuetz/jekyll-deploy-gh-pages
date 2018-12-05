# A GitHub Action for Custom Jekyll Builds on GitHub Pages

A GitHub Action for building and deploying a Jekyll repo back to its `gh-pages` branch. 

**Why not just let GitHub Pages build it? Becaues this way we can use our own custom Jekyll plugins and build scripts.**

## Secrets
* `GITHUB_TOKEN`: Access key scoped to the repository, we need this to push the site files back to the repo. (specify in workflow)
  
## Environment Variables
* `GITHUB_ACTOR`: Username of repo owner or object intiating the action (GitHub Provides)
* `GITHUB_REPO`: Owner/Repository (GitHub Provides)

## Examples

```hcl
workflow "Deploy Site" {
  on = "push"
  resolves = ["Build and Deploy Jekyll"]
}

action "Build and Deploy Jekyll" {
  uses = "BryanSchuetz/jekyll-deploy-gh-pages@master"
  secrets = ["GITHUB_TOKEN"]
}
```

Clone's the repo, builds the site and, commits it back to the gh-pages branch of the repository. Be sure that any custome gems needed are included in the Gemfile.
