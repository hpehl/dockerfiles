define(['settings'], function(Settings) {

  return new Settings({

      datasources: {
        app: {
          type: 'influxdb',
          url: window.location.protocol + '//' + window.location.hostname + ':8086/db/app',
          username: 'root',
          password: 'root',
        },
        grafana: {
          type: 'influxdb',
          url: window.location.protocol + '//' + window.location.hostname + ':8086/db/grafana',
          username: 'root',
          password: 'root',
          grafanaDB: true
        },
      },

      search: {
        max_results: 100
      },

      default_route: '/dashboard/file/default.json',

      unsaved_changes_warning: true,

      playlist_timespan: "1m",

      admin: {
        password: ''
      },

      window_title_prefix: 'Grafana - ',

      plugins: {
        panels: [],

        dependencies: [],
      }

    });
});