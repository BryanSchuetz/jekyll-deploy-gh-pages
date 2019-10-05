
> **This action has been updated from the HCL version of Actions to the new YAML syntax.**

# A GitHub Action for Custom Jekyll Builds on GitHub Pages

A GitHub Action for building and deploying a Jekyll repo back to its `gh-pages` branch. 

**Why not just let GitHub Pages build it? Becaues this way we can use our own custom Jekyll plugins and build scripts.**

## Secrets
* `GITHUB_TOKEN`: Access key scoped to the repository, we need this to push the site files back to the repo. (specify in workflow)
  
## Environment Variables
* `GITHUB_ACTOR`: Username of repo owner or object intiating the action (GitHub Provides)
* `GITHUB_REPO`: Owner/Repository (GitHub Provides)

## Example

```yml
name: Jekyll Deploy

on: [push]

jobs: 
  build_and_deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - name: Build & Deploy to GitHub Pages
        env: 
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
          GITHUB_REPOSITORY: ${{ secrets.GITHUB_REPOSITORY }}
          GITHUB_ACTOR: ${{ secrets.GITHUB_ACTOR }}
        uses: BryanSchuetz/jekyll-deploy-gh-pages@master
```

Clones the repo, builds the site, and commits it back to the gh-pages branch of the repository.

## Caveats

* This uses the v2 of the Actions beta—note the Yaml based workflow syntax.
* **`GITHUB_TOKEN`, privilages are still being sorted out by the Actions/GH-Pages team.** While it's privilages are sufficient for pushing to your gh-pages branch, that push will not trigger the github pages server to pick up the new static assets.
* Needs a .gemfile
* `destination:` should be set to `./build` in your _config.yml file—as God demands.
* Be sure that any custom gems needed are included in your Gemfile.
* If you're looking to seperate out the build/deploy steps of this action so you can throw your own actions in between them, look at the limited build and deploy actions in this rpo.