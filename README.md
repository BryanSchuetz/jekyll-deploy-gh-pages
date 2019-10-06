
> **This action has been updated from the first beta version of GH Actions to the new beta version of GH Actions. See below for the new structure required in your workflow.**

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

Clones the repo, builds the site, and commits it back to the gh-pages branch of the repository. That's it. Just add the above example to a `main.yml` file in the `.github/workflows` directory of your repository—see caveats below. 

## Caveats

* This uses the v2 of the Actions beta—note the Yaml based workflow syntax—you must have access to the beta release of actions.
* **`GITHUB_TOKEN`, privileges are still being sorted out by the Actions/GH-Pages team. Changes pushed to your GH-pages branch will only be picked up by the Github Pages server if your workflow is in a private repository.**
* Needs a .gemfile
* `destination:` should be set to `./build` in your _config.yml file—as God demands.
* Be sure that any custom gems needed are included in your Gemfile.