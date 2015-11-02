

# CF weaknesses/limitations over docker orchestrations ?

* developer experience does not support offline work
* developer experience lacks a fast feedback loop (live reloads)
* high bar to become data service providers:
   * need to turn into platform operations (learning bosh, owning a bosh instance)
* limited app eligibility (e.g. advanced networking such as multi-cast/broadcast networking used in hazelcast client)
* limited marketplace (w.r.t. docker hub available images) and community contributing to it.

# How can we improve CF to fix these limitations ?

* developer experience does not support offline work
   * => improve packaging of CF to make it affordeable to run on desktop (lattice, bosh-lite ?)
   * => find a way to have online service exposed in the marketplace support an offline mode (e.g. their service broker catalog provides in its meta-data, a docker image reference that can be automatically started on a local development box)
   
   
* clear separation among CF consummers and platform providers (inc. service providers) is 
does not work well on desktop computers:

    lattice UX is too different from CF CLI UX
    CF installation on local box (bosh-lite) still heavy and requires bosh skills
        + hard to have marketplace services locally run out of the bod

