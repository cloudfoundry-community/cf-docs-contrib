---
title: Deploying from Travis-CI
---

Automating deployment of your Travis CI build to your test server is extremely convienient, 
and with Cloud Foundry, also very simple.

In fact, [every successful Travis CI build of the master branch of this site is automatically deployed using exactly the process
described below](https://travis-ci.org/mrdavidlaing/cf-docs-contrib).

### The deployment script

Create a bash script that automates your Cloud Foundry deployment, assuming:

1. Running on a fresh/clean Ubuntu machine (ie., you must `gem install vmc`)
1. Your Cloud Foundry password will be available in an environment variable 

Consider the following [`deploy_to_cloudfoundry.sh`](https://github.com/mrdavidlaing/cf-docs-contrib/blob/master/deploy_to_cloudfoundry.sh) script:

```
#!/usr/bin/env bash
export CLOUDFOUNDRY_USERNAME=me@example.com
if [ -z "$CLOUDFOUNDRY_PASSWORD" ]; then
    echo "CLOUDFOUNDRY_PASSWORD must be set to $CLOUDFOUNDRY_USERNAME's cloudfoundry password "
    echo "==== Your current environment====="
    env
    exit 1
fi
gem install vmc
vmc target https://api.cloudfoundry.com
vmc login $CLOUDFOUNDRY_USERNAME --password $CLOUDFOUNDRY_PASSWORD
vmc push cf-docs-contrib
```

You might also want to have a `manifest.yml` containing the rest of your CF deployment options.

### The Travis hook

Next, make sure that your [`.travis.yml`](https://github.com/mrdavidlaing/cf-docs-contrib/blob/master/.travis.yml) contains the following elements:

```
env:
  global:
    - secure: "AurP4QaJAZox2KwKpymG6prbOILjN7ynoSlR7y7csNZI3*********redacted**************pxVAB5GgUAu0i/DMjM\nWEYccNDHsc7M+zFuMPXvhf65D2XRhKDzsRHHGxcWAT+QyGkE77w="

...snip...

after_success:
  - if [[ "$TRAVIS_BRANCH" != "master" ]]; then echo "Deployments are only done for the master branch. "; exit 0; fi
  - echo "Deploying build $TRAVIS_BUILD_NUMBER"
  - ./deploy_to_cloudfoundry.sh
```

The `env.global.secure` element [contains an encrypted version of the CLOUDFOUNDRY_PASSWORD environment variable](http://about.travis-ci.org/docs/user/encryption-keys/) (so it can be made public), and is generated using the `travis` gem:

```
$ travis encrypt -r owner/project CLOUDFOUNDRY_PASSWORD=***yourpassword***
```

The `after_success` hook is only triggered after a successful build.  It should contain:

1. A guard to ensure only selected branches are deployed
1. A call to the deployment script above

And that's it.  Every successful build will now be deployed to Cloud Foundry directly from Travis CI - no manual intervention required!

### References

1.  [Deploying to Heroku with Travis CI](http://www.neilmiddleton.com/deploying-to-heroku-from-travis-ci/) - @neilmiddleton