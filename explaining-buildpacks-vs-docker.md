This doc aims at helping describe use-caes for pushing docker images vs pushing app through the buildpack staging process.

# buildpack advantages

* composeable throug https://github.com/ddollar/heroku-buildpack-multi
* clean separation of roles between
   * provider and consummer
      * provider brings language support and dependency resolution
      * consummer brings app bits
   * build vs run
      * build (through the compile phase)
      * run (through the exec of the release phase)
      * i.e. build tools don't end up into the executed droplet
      
# buildpack limitations

* does not work well on desktop computers:
   * lattie still too different from CF CLI
   * bosh-lite install still cumbersome to install + hard to have marketplace services locally run out of the bod
* buildpacks not by default portable among stacks/slugs (no yet centralized/mutualized support for such portability)
* slow to reapply/account for source changed (in the +20s)
