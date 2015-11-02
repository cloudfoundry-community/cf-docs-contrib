

# CF weaknesses/limitations over docker orchestrations ?

* developer experience does not support offline work
* developer experience lacks a fast feedback loop (live reloads)
* CF experience does not cover "build phase" (e.g. running integration tests in jenkins against same php/apache dependencies as the ones provided in the php buildpack in CF)
* high bar to become data service providers:
   * need to turn into platform operations (learning bosh, owning a bosh instance)
* limited app eligibility (e.g. advanced networking such as multi-cast/broadcast networking used in hazelcast client)
* limited marketplace (w.r.t. docker hub available images) and limited community contributing to it.

# How can we improve CF to fix these limitations ?

* developer experience does not support offline work
   * => improve packaging of CF to make it affordeable to run on desktop (lattice, bosh-lite ?)
   * => find a way to have online service exposed in the marketplace support an offline mode (e.g. their service broker catalog provides in its meta-data, a docker image reference that can be automatically started on a local development box)
* developer experience lacks a fast feedback loop (live reloads)
   * => cloudrocker supports live reloading of sources by mounting them within a docker volume
   * => ssh-fs mounts local development box sources in the CF app container
* high bar to become data service providers:
   * need to turn into platform operations (learning bosh, owning a bosh instance)
   * => See https://github.com/cloudfoundry-community/cf-docs-contrib/blob/master/ways-to-implement-data-services.md
      * contribute improvements to https://github.com/cf-platform-eng/docker-boshrelease/
         * accept docker images are service instance params (to enable wider contributor base)
         * add declarative storage requirements (whether the images needs a storage, which reqs for this storage) e.g. implemented through:
            * dynamically instanciated bosh release (docker host + associated volumes dedicated to services)
            * dynamically attached volumes (e.g. scale.io or ceph technology)
         * add standard mechanisms to signaling data app within the docker image (restart and drain signals)
         * add standard ways to support backup/snapshot/restore of data services (e.g https://github.com/Orange-OpenSource/service-db-dumper )
         * add standard ways to have data services generate metrics and logs visible to app developers

   


