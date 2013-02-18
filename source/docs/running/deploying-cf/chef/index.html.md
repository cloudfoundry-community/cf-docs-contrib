---
title: Deploying Cloud Foundry with Chef
---

A set of Chef cookbooks exist that allow you to set up a production-ready
Cloud Foundry PaaS.

### Requirements

All the cookbooks work best with Chef client connected to a Chef server; they
also work with chef-solo but may require more configuration.

The cookbooks have been tested with Chef 10.14.4; they should also work with
more recent versions in the 10.x series.

### Cookbooks

#### Generic components:

<table class="table table-hover table-striped table-bordered table-condensed">
  <thead>
    <th>Component name</th>
    <th>Cookbook</th>
    <th>Status</th>
    <th>Source</th>
    <th>Notes</th>
    <th width="100px">TravisCI</th>
  </thead>
  <tbody>
    <tr>
      <td>cloud_controller</td>
      <td><a href="http://ckbk.it/cloudfoundry-cloud_controller" target="_blank">cloudfoundry-cloud_controller</a></td>
      <td>Released</td>
      <td><a href="https://github.com/zephirworks/cloudfoundry-cloud_controller-cookbook" target="_blank">GitHub</a></td>
      <td>Supports only cloud_controller v1 at this time; cloud_controller v2 coming soon.</td>
      <td><a href="https://travis-ci.org/zephirworks/cloudfoundry-cloud_controller-cookbook"><img alt="Build Status" src="https://travis-ci.org/zephirworks/cloudfoundry-cloud_controller-cookbook.png?branch=master"></a></td>
    </tr>
    <tr>
      <td>health_manager</td>
      <td><a href="http://ckbk.it/cloudfoundry-health_manager" target="_blank">cloudfoundry-health_manager</a></td>
      <td>Released</td>
      <td><a href="https://github.com/zephirworks/cloudfoundry-health_manager-cookbook" target="_blank">GitHub</a></td>
      <td>Supports only health_manager "next".</td>
      <td><a href="https://travis-ci.org/zephirworks/cloudfoundry-health_manager-cookbook"><img alt="Build Status" src="https://travis-ci.org/zephirworks/cloudfoundry-health_manager-cookbook.png?branch=master"></a></td>
    </tr>
    <tr>
      <td>DEA</td>
      <td><a href="http://ckbk.it/cloudfoundry-dea" target="_blank">cloudfoundry-dea</a></td>
      <td>Released</td>
      <td><a href="https://github.com/zephirworks/cloudfoundry-dea-cookbook" target="_blank">GitHub</a></td>
      <td>Supports only the legacy DEA. Support for DEA ng coming soon.</td>
      <td><a href="https://travis-ci.org/zephirworks/cloudfoundry-dea-cookbook"><img alt="Build Status" src="https://travis-ci.org/zephirworks/cloudfoundry-dea-cookbook.png?branch=master"></a></td>
    </tr>
    <tr>
      <td rowspan="2">router</td>
      <td><a href="http://ckbk.it/cloudfoundry-nginx" target="_blank">cloudfoundry-nginx</a></td>
      <td>Released</td>
      <td><a href="https://github.com/zephirworks/cloudfoundry-nginx-cookbook" target="_blank">GitHub</a></td>
      <td>Installs nginx 1.2.x for use by the router.</td>
      <td><a href="https://travis-ci.org/zephirworks/cloudfoundry-nginx-cookbook"><img alt="Build Status" src="https://travis-ci.org/zephirworks/cloudfoundry-nginx-cookbook.png?branch=master"></a></td>
    </tr>
    <tr>
      <td><a href="http://ckbk.it/cloudfoundry-router" target="_blank">cloudfoundry-router</a></td>
      <td>Released</td>
      <td><a href="https://github.com/zephirworks/cloudfoundry-router-cookbook" target="_blank">GitHub</a></td>
      <td></td>
      <td><a href="https://travis-ci.org/zephirworks/cloudfoundry-router-cookbook"><img alt="Build Status" src="https://travis-ci.org/zephirworks/cloudfoundry-router-cookbook.png?branch=master"></a></td>
    </tr>
    <tr>
      <td>stager</td>
      <td><a href="http://ckbk.it/cloudfoundry-stager" target="_blank">cloudfoundry-stager</a></td>
      <td>Released</td>
      <td><a href="https://github.com/zephirworks/cloudfoundry-stager-cookbook" target="_blank">GitHub</a></td>
      <td></td>
      <td><a href="https://travis-ci.org/zephirworks/cloudfoundry-stager-cookbook"><img alt="Build Status" src="https://travis-ci.org/zephirworks/cloudfoundry-stager-cookbook.png?branch=master"></a></td>
    </tr>
  </thead>
</table>

#### Runtimes:

<table class="table table-hover table-striped table-bordered table-condensed">
  <thead>
    <th>Runtime name</th>
    <th>Cookbook</th>
    <th>State</th>
    <th>Source</th>
    <th>Notes</th>
    <th width="100px">TravisCI</th>
  </thead>
  <tbody>
    <tr>
      <td>Ruby</td>
      <td><a href="http://ckbk.it/cloudfoundry-ruby-runtime" target="_blank">cloudfoundry-ruby-runtime</a></td>
      <td>Released</td>
      <td><a href="https://github.com/zephirworks/cloudfoundry-ruby-runtime-cookbook" target="_blank">GitHub</a></td>
      <td>Supports MRI Ruby 1.8.7, 1.9.2 and 1.9.3.</td>
      <td><a href="https://travis-ci.org/zephirworks/cloudfoundry-ruby-runtime-cookbook"><img alt="Build Status" src="https://travis-ci.org/zephirworks/cloudfoundry-ruby-runtime-cookbook.png?branch=master"></a></td>
    </tr>
    <tr>
      <td>NodeJS</td>
      <td></td>
      <td>In progress</td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>

#### Services:

<table class="table table-hover table-striped table-bordered table-condensed">
  <thead>
    <th>Service name</th>
    <th>Cookbook</th>
    <th>State</th>
    <th>Source</th>
    <th>Notes</th>
    <th width="100px">TravisCI</th>
  </thead>
  <tbody>
    <tr>
      <td>Filesystem</td>
      <td><a href="http://ckbk.it/cloudfoundry-filesystem-service" target="_blank">cloudfoundry-filesystem-service</a></td>
      <td>Released</td>
      <td><a href="https://github.com/zephirworks/cloudfoundry-filesystem-service-cookbook" target="_blank">GitHub</a></td>
      <td>Supports only the "legacy" service.</td>
      <td><a href="https://travis-ci.org/zephirworks/cloudfoundry-filesystem-service-cookbook"><img alt="Build Status" src="https://travis-ci.org/zephirworks/cloudfoundry-filesystem-service-cookbook.png?branch=master"></a></td>
    </tr>
    <tr>
      <td>MongoDB</td>
      <td><a href="http://ckbk.it/cloudfoundry-mongodb-service" target="_blank">cloudfoundry-mongodb-service</a></td>
      <td>Released</td>
      <td><a href="https://github.com/zephirworks/cloudfoundry-mongodb-service-cookbook" target="_blank">GitHub</a></td>
      <td>Supports only the "legacy" service.</td>
      <td><a href="https://travis-ci.org/zephirworks/cloudfoundry-mongodb-service-cookbook"><img alt="Build Status" src="https://travis-ci.org/zephirworks/cloudfoundry-mongodb-service-cookbook.png?branch=master"></a></td>
    </tr>
    <tr>
      <td>RabbitMQ</td>
      <td><a href="http://ckbk.it/cloudfoundry-rabbitmq-service" target="_blank">cloudfoundry-rabbitmq-service</a></td>
      <td>Released</td>
      <td><a href="https://github.com/zephirworks/cloudfoundry-rabbitmq-service-cookbook" target="_blank">GitHub</a></td>
      <td>Supports only the "legacy" service.</td>
      <td><a href="https://travis-ci.org/zephirworks/cloudfoundry-rabbitmq-service-cookbook"><img alt="Build Status" src="https://travis-ci.org/zephirworks/cloudfoundry-rabbitmq-service-cookbook.png?branch=master"></a></td>
    </tr>
    <tr>
      <td>Service broker</td>
      <td><a href="http://ckbk.it/cloudfoundry-service_broker" target="_blank">cloudfoundry-service_broker</a></td>
      <td>Released</td>
      <td><a href="https://github.com/zephirworks/cloudfoundry-service_broker-cookbook" target="_blank">GitHub</a></td>
      <td>Supports only the "legacy" service.</td>
      <td><a href="https://travis-ci.org/zephirworks/cloudfoundry-service_broker-cookbook"><img alt="Build Status" src="https://travis-ci.org/zephirworks/cloudfoundry-service_broker-cookbook.png?branch=master"></a></td>
    </tr>
    <tr>
      <td>MySQL</td>
      <td></td>
      <td>In progress</td>
      <td></td>
      <td></td>
    </tr>
  </tbody>
</table>

#### Framework cookbooks:

These cookbooks are required because the other cookbooks depend on them, but
they usually have no serviceable parts:

<table class="table table-hover table-striped table-bordered table-condensed">
  <thead>
    <th>Cookbook</th>
    <th>Status</th>
    <th>Source</th>
    <th>Notes</th>
    <th width="100px">TravisCI</th>
  </thead>
  <tbody>
    <tr>
      <td><a href="http://ckbk.it/cloudfoundry" target="_blank">cloudfoundry</a></td>
      <td>Released</td>
      <td><a href="https://github.com/zephirworks/cloudfoundry-cookbook" target="_blank">GitHub</a></td>
      <td>Mandatory dependency for all other cookbooks.</td>
      <td><a href="https://travis-ci.org/zephirworks/cloudfoundry-cookbook"><img alt="Build Status" src="https://travis-ci.org/zephirworks/cloudfoundry-cookbook.png?branch=master"></a></td>
    </tr>
    <tr>
      <td><a href="http://ckbk.it/cloudfoundry_service" target="_blank">cloudfoundry_service</a></td>
      <td>Released</td>
      <td><a href="https://github.com/zephirworks/cloudfoundry_service-cookbook" target="_blank">GitHub</a></td>
      <td>Mandatory dependency for all service cookbooks.</td>
      <td><a href="https://travis-ci.org/zephirworks/cloudfoundry_service-cookbook"><img alt="Build Status" src="https://travis-ci.org/zephirworks/cloudfoundry_service-cookbook.png?branch=master"></a></td>
    </tr>
  </tbody>
</table>


