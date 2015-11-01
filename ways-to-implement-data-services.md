
This describes ways to implement data services to be exposed in cloudfoundry marketplace.

This is contributed from a related session during the cfsummit berlin 2015 unconference

* package as a bosh release
   * a single multi-tenant bosh deployment
   * a dedicated bosh deployment per service instance
   * with an associated dedicated bosh instance (+ iaas tenant) for each service provider team (bosh not being multi-tenant)
* package as a docker image, and attach persist volume(s) to it, and expose though a service broker
   * attach persistent volumes
      * in a declarative mode, similar to https://hashicorp.com/blog/otto.html
      * with different semantics for attached volumes (whether HA or not, ...)
   * how ?
      * implement your own framework for this
      * contribute improvements to https://github.com/cf-platform-eng/docker-boshrelease/
         * declarative storage requirements, implemented through
            * dynamically instanciated bosh release (docker host + associated volumes dedicated to services)
            * dynamically attached volumes (e.g. scale.io or ceph technology)
         * accept docker images are service instance params (to enable wider contributor base)
         * add standard mechanisms to signaling data app (restart and drain signals)
      * leverage container orchestration solutions (e.g. K8S + flocker backends)
* [in the future] package as a diego 12 factor data app ?
