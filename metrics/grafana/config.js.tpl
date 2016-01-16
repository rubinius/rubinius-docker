
define(['settings'], function(Settings) {
  return new Settings({
      
      /* Data sources
      * ========================================================
      * Datasources are used to fetch metrics, annotations, and serve as dashboard storage
      *  - You can have multiple of the same type.
      *  - grafanaDB: true    marks it for use for dashboard storage
      *  - default: true      marks the datasource as the default metric source (if you have multiple)
      *  - basic authentication: use url syntax http://username:password@domain:port
      */
      
      // InfluxDB example setup (the InfluxDB databases specified need to exist)
      datasources: {
        rbx: {
          type: 'influxdb',
          url: "{{ INFLUXDB_SERVER | default("http://localhost:8086") }}/db/rbx",
          username: 'root',
          password: 'root',
        },
        grafana: {
          type: 'influxdb',
          url: "{{ INFLUXDB_SERVER | default("http://localhost:8086") }}/db/grafana",
          username: 'root',
          password: 'root',
          grafanaDB: true
        },
      },
      
      /* Global configuration options
      * ========================================================
      */
      
      // specify the limit for dashboard search results
      search: {
        max_results: 100
      },
      
      // default home dashboard
      default_route: '/dashboard/file/rbx-dash.json',
      
      // set to false to disable unsaved changes warning
      unsaved_changes_warning: true,
      
      // set the default timespan for the playlist feature
      // Example: "1m", "1h"
      playlist_timespan: "1m",
      
      // If you want to specify password before saving, please specify it below
      // The purpose of this password is not security, but to stop some users from accidentally changing dashboards
      admin: {
        password: ''
      },
      
      // Change window title prefix from 'Grafana - <dashboard title>'
      window_title_prefix: 'RBX Dashboard - ',
      
      // Add your own custom panels
      plugins: {
        // list of plugin panels
        panels: [],
        // requirejs modules in plugins folder that should be loaded
        // for example custom datasources
        dependencies: [],
      }
    });
});