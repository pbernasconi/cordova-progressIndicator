var ActivityIndicator = {
  show: function (type, dim, label, detail) {
    dim = dim || false;
    label = label || "Please wait...";
    detail = detail || '';

    cordova.exec(null, null, "ActivityIndicator", "show", [type, dim, label, detail]);
  },


  showSimple: function (dim) {
    dim = dim || false;
    cordova.exec(null, null, "ActivityIndicator", "showSimple", [dim]);

  },

  showSimpleWithLabel: function (dim, label) {
    dim = dim || false;
    label = label || "Please wait...";

    cordova.exec(null, null, "ActivityIndicator", "showSimpleWithLabel", [dim, label]);
  },

  showSimpleWithLabelDetail: function (dim, label, detail) {
    dim = dim || false;
    label = label || "Please wait...";
    detail = detail || "Loading";

    cordova.exec(null, null, "ActivityIndicator", "showSimpleWithLabelDetail", [dim, label, detail]);
  },

  showDeterminate: function (dim) {
    dim = dim || false;
    cordova.exec(null, null, "ActivityIndicator", "showDeterminate", [dim]);
  },

  showDeterminateWithLabel: function (dim, label) {
    dim = dim || false;
    label = label || "Please wait...";

    cordova.exec(null, null, "ActivityIndicator", "showDeterminateWithLabel", [dim, label]);
  },

  showDeterminateAnnular: function (dim) {
    dim = dim || false;
    cordova.exec(null, null, "ActivityIndicator", "showDeterminateAnnular", [dim]);
  },

  showDeterminateAnnularWithLabel: function (dim, label) {
    dim = dim || false;
    label = label || "Please wait...";

    cordova.exec(null, null, "ActivityIndicator", "showDeterminateAnnularWithLabel", [dim, label]);
  },

  showDeterminateBar: function (dim) {
    dim = dim || false;

    cordova.exec(null, null, "ActivityIndicator", "showDeterminateBar", [dim]);
  },

  showDeterminateBarWithLabel: function (dim, label) {
    dim = dim || false;
    label = label || "Please wait...";

    cordova.exec(null, null, "ActivityIndicator", "showDeterminateBarWithLabel", [dim, label]);
  },

  showSuccess: function (dim, label) {
    dim = dim || false;
    label = label || "Success";

    cordova.exec(null, null, "ActivityIndicator", "showSuccess", [dim, label]);
  },




  hide: function () {
    cordova.exec(null, null, "ActivityIndicator", "hide", []);
  }
};

module.exports = ActivityIndicator;