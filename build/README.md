# A GitHub Action For Just Building Jekyll Sites

We're only building the site here. If you want to do some other stuff with those site files like deploying them, or running some build scripts on them—you'll have to connect up some other actions to your workflow.

## Secrets

None needed

## Examples

```hcl
workflow "Build Site" {
  on = "push"
  resolves = ["Build Jekyll"]
}

action "Build Jekyll" {
  uses = "BryanSchuetz/jekyll-deploy-gh-pages/build@master"
  secrets = [""]
}
```

Clones the repo and builds the site—that's it.

## Caveats

* Needs a .gemfile
* Be sure that any custom gems needed are included in your Gemfile.
