This doc aims at helping describe use-caes for pushing docker images vs pushing app through the buildpack staging process.

# buildpack advantages

* composeable through https://github.com/ddollar/heroku-buildpack-multi
* clean separation of roles between
   * provider and consummer
      * provider brings language support and dependency resolution
      * consummer brings app bits
   * build vs run
      * build (through the compile phase)
      * run (through the exec of the release phase)
      * i.e. build tools don't end up into the executed droplet
* solid process for pulling app dependencies (whether docker build process is not yet standardized/mature)
      
# buildpack limitations

* does not work well on desktop computers:
   * lattie still too different from CF CLI
   * bosh-lite install still cumbersome to install + hard to have marketplace services locally run out of the bod
* buildpacks not by default portable among stacks/slugs (no yet centralized/mutualized support for such portability)
* apps staged by buildpacks are not natively portable to other infrastructures than CF (e.g. mesos, K8S, raw Iaas)
* slow to reapply/account for source changed (in the +20s)
* experience of development on local machine (possibly offline) isn't yet great:
   * lattice UX is different from CF UX
   * CF installation on local box (bosh-lite) still heavy and requires bosh skills
* lacking buit-in the live reload experience (that docker enables through mounting sources in volumes)

# Use cases in cloudfoundry 

When to push docker images vs app bit through buildpack in cloudfoundry ?

Depends on the application context, and who is responsible for pushing/operating the app (sometimes called "responsible for the endpoint CI process").
* if ops are responsible for pushing/operating the app, then buildpacks make a nice separation of concerns
* if the developers are responsible for pushing/operating the app, then pushing docker images may provide them more control over buildpacks.
