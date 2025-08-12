(() => {
  // node_modules/@hotwired/stimulus/dist/stimulus.js
  function camelize(value) {
    return value.replace(/(?:[_-])([a-z0-9])/g, (_, char) => char.toUpperCase());
  }
  function namespaceCamelize(value) {
    return camelize(value.replace(/--/g, "-").replace(/__/g, "_"));
  }
  function capitalize(value) {
    return value.charAt(0).toUpperCase() + value.slice(1);
  }
  function dasherize(value) {
    return value.replace(/([A-Z])/g, (_, char) => `-${char.toLowerCase()}`);
  }
  function isSomething(object) {
    return object !== null && object !== void 0;
  }
  function hasProperty(object, property) {
    return Object.prototype.hasOwnProperty.call(object, property);
  }
  function readInheritableStaticArrayValues(constructor, propertyName) {
    const ancestors = getAncestorsForConstructor(constructor);
    return Array.from(ancestors.reduce((values, constructor2) => {
      getOwnStaticArrayValues(constructor2, propertyName).forEach((name) => values.add(name));
      return values;
    }, /* @__PURE__ */ new Set()));
  }
  function readInheritableStaticObjectPairs(constructor, propertyName) {
    const ancestors = getAncestorsForConstructor(constructor);
    return ancestors.reduce((pairs, constructor2) => {
      pairs.push(...getOwnStaticObjectPairs(constructor2, propertyName));
      return pairs;
    }, []);
  }
  function getAncestorsForConstructor(constructor) {
    const ancestors = [];
    while (constructor) {
      ancestors.push(constructor);
      constructor = Object.getPrototypeOf(constructor);
    }
    return ancestors.reverse();
  }
  function getOwnStaticArrayValues(constructor, propertyName) {
    const definition = constructor[propertyName];
    return Array.isArray(definition) ? definition : [];
  }
  function getOwnStaticObjectPairs(constructor, propertyName) {
    const definition = constructor[propertyName];
    return definition ? Object.keys(definition).map((key) => [key, definition[key]]) : [];
  }
  var getOwnKeys = (() => {
    if (typeof Object.getOwnPropertySymbols == "function") {
      return (object) => [...Object.getOwnPropertyNames(object), ...Object.getOwnPropertySymbols(object)];
    } else {
      return Object.getOwnPropertyNames;
    }
  })();
  var extend = (() => {
    function extendWithReflect(constructor) {
      function extended() {
        return Reflect.construct(constructor, arguments, new.target);
      }
      extended.prototype = Object.create(constructor.prototype, {
        constructor: { value: extended }
      });
      Reflect.setPrototypeOf(extended, constructor);
      return extended;
    }
    function testReflectExtension() {
      const a = function() {
        this.a.call(this);
      };
      const b = extendWithReflect(a);
      b.prototype.a = function() {
      };
      return new b();
    }
    try {
      testReflectExtension();
      return extendWithReflect;
    } catch (error) {
      return (constructor) => class extended extends constructor {
      };
    }
  })();
  var defaultSchema = {
    controllerAttribute: "data-controller",
    actionAttribute: "data-action",
    targetAttribute: "data-target",
    targetAttributeForScope: (identifier) => `data-${identifier}-target`,
    outletAttributeForScope: (identifier, outlet) => `data-${identifier}-${outlet}-outlet`,
    keyMappings: Object.assign(Object.assign({ enter: "Enter", tab: "Tab", esc: "Escape", space: " ", up: "ArrowUp", down: "ArrowDown", left: "ArrowLeft", right: "ArrowRight", home: "Home", end: "End", page_up: "PageUp", page_down: "PageDown" }, objectFromEntries("abcdefghijklmnopqrstuvwxyz".split("").map((c) => [c, c]))), objectFromEntries("0123456789".split("").map((n) => [n, n])))
  };
  function objectFromEntries(array) {
    return array.reduce((memo, [k, v]) => Object.assign(Object.assign({}, memo), { [k]: v }), {});
  }
  function ClassPropertiesBlessing(constructor) {
    const classes = readInheritableStaticArrayValues(constructor, "classes");
    return classes.reduce((properties, classDefinition) => {
      return Object.assign(properties, propertiesForClassDefinition(classDefinition));
    }, {});
  }
  function propertiesForClassDefinition(key) {
    return {
      [`${key}Class`]: {
        get() {
          const { classes } = this;
          if (classes.has(key)) {
            return classes.get(key);
          } else {
            const attribute = classes.getAttributeName(key);
            throw new Error(`Missing attribute "${attribute}"`);
          }
        }
      },
      [`${key}Classes`]: {
        get() {
          return this.classes.getAll(key);
        }
      },
      [`has${capitalize(key)}Class`]: {
        get() {
          return this.classes.has(key);
        }
      }
    };
  }
  function OutletPropertiesBlessing(constructor) {
    const outlets = readInheritableStaticArrayValues(constructor, "outlets");
    return outlets.reduce((properties, outletDefinition) => {
      return Object.assign(properties, propertiesForOutletDefinition(outletDefinition));
    }, {});
  }
  function getOutletController(controller, element, identifier) {
    return controller.application.getControllerForElementAndIdentifier(element, identifier);
  }
  function getControllerAndEnsureConnectedScope(controller, element, outletName) {
    let outletController = getOutletController(controller, element, outletName);
    if (outletController)
      return outletController;
    controller.application.router.proposeToConnectScopeForElementAndIdentifier(element, outletName);
    outletController = getOutletController(controller, element, outletName);
    if (outletController)
      return outletController;
  }
  function propertiesForOutletDefinition(name) {
    const camelizedName = namespaceCamelize(name);
    return {
      [`${camelizedName}Outlet`]: {
        get() {
          const outletElement = this.outlets.find(name);
          const selector = this.outlets.getSelectorForOutletName(name);
          if (outletElement) {
            const outletController = getControllerAndEnsureConnectedScope(this, outletElement, name);
            if (outletController)
              return outletController;
            throw new Error(`The provided outlet element is missing an outlet controller "${name}" instance for host controller "${this.identifier}"`);
          }
          throw new Error(`Missing outlet element "${name}" for host controller "${this.identifier}". Stimulus couldn't find a matching outlet element using selector "${selector}".`);
        }
      },
      [`${camelizedName}Outlets`]: {
        get() {
          const outlets = this.outlets.findAll(name);
          if (outlets.length > 0) {
            return outlets.map((outletElement) => {
              const outletController = getControllerAndEnsureConnectedScope(this, outletElement, name);
              if (outletController)
                return outletController;
              console.warn(`The provided outlet element is missing an outlet controller "${name}" instance for host controller "${this.identifier}"`, outletElement);
            }).filter((controller) => controller);
          }
          return [];
        }
      },
      [`${camelizedName}OutletElement`]: {
        get() {
          const outletElement = this.outlets.find(name);
          const selector = this.outlets.getSelectorForOutletName(name);
          if (outletElement) {
            return outletElement;
          } else {
            throw new Error(`Missing outlet element "${name}" for host controller "${this.identifier}". Stimulus couldn't find a matching outlet element using selector "${selector}".`);
          }
        }
      },
      [`${camelizedName}OutletElements`]: {
        get() {
          return this.outlets.findAll(name);
        }
      },
      [`has${capitalize(camelizedName)}Outlet`]: {
        get() {
          return this.outlets.has(name);
        }
      }
    };
  }
  function TargetPropertiesBlessing(constructor) {
    const targets = readInheritableStaticArrayValues(constructor, "targets");
    return targets.reduce((properties, targetDefinition) => {
      return Object.assign(properties, propertiesForTargetDefinition(targetDefinition));
    }, {});
  }
  function propertiesForTargetDefinition(name) {
    return {
      [`${name}Target`]: {
        get() {
          const target = this.targets.find(name);
          if (target) {
            return target;
          } else {
            throw new Error(`Missing target element "${name}" for "${this.identifier}" controller`);
          }
        }
      },
      [`${name}Targets`]: {
        get() {
          return this.targets.findAll(name);
        }
      },
      [`has${capitalize(name)}Target`]: {
        get() {
          return this.targets.has(name);
        }
      }
    };
  }
  function ValuePropertiesBlessing(constructor) {
    const valueDefinitionPairs = readInheritableStaticObjectPairs(constructor, "values");
    const propertyDescriptorMap = {
      valueDescriptorMap: {
        get() {
          return valueDefinitionPairs.reduce((result, valueDefinitionPair) => {
            const valueDescriptor = parseValueDefinitionPair(valueDefinitionPair, this.identifier);
            const attributeName = this.data.getAttributeNameForKey(valueDescriptor.key);
            return Object.assign(result, { [attributeName]: valueDescriptor });
          }, {});
        }
      }
    };
    return valueDefinitionPairs.reduce((properties, valueDefinitionPair) => {
      return Object.assign(properties, propertiesForValueDefinitionPair(valueDefinitionPair));
    }, propertyDescriptorMap);
  }
  function propertiesForValueDefinitionPair(valueDefinitionPair, controller) {
    const definition = parseValueDefinitionPair(valueDefinitionPair, controller);
    const { key, name, reader: read, writer: write } = definition;
    return {
      [name]: {
        get() {
          const value = this.data.get(key);
          if (value !== null) {
            return read(value);
          } else {
            return definition.defaultValue;
          }
        },
        set(value) {
          if (value === void 0) {
            this.data.delete(key);
          } else {
            this.data.set(key, write(value));
          }
        }
      },
      [`has${capitalize(name)}`]: {
        get() {
          return this.data.has(key) || definition.hasCustomDefaultValue;
        }
      }
    };
  }
  function parseValueDefinitionPair([token, typeDefinition], controller) {
    return valueDescriptorForTokenAndTypeDefinition({
      controller,
      token,
      typeDefinition
    });
  }
  function parseValueTypeConstant(constant) {
    switch (constant) {
      case Array:
        return "array";
      case Boolean:
        return "boolean";
      case Number:
        return "number";
      case Object:
        return "object";
      case String:
        return "string";
    }
  }
  function parseValueTypeDefault(defaultValue) {
    switch (typeof defaultValue) {
      case "boolean":
        return "boolean";
      case "number":
        return "number";
      case "string":
        return "string";
    }
    if (Array.isArray(defaultValue))
      return "array";
    if (Object.prototype.toString.call(defaultValue) === "[object Object]")
      return "object";
  }
  function parseValueTypeObject(payload) {
    const { controller, token, typeObject } = payload;
    const hasType = isSomething(typeObject.type);
    const hasDefault = isSomething(typeObject.default);
    const fullObject = hasType && hasDefault;
    const onlyType = hasType && !hasDefault;
    const onlyDefault = !hasType && hasDefault;
    const typeFromObject = parseValueTypeConstant(typeObject.type);
    const typeFromDefaultValue = parseValueTypeDefault(payload.typeObject.default);
    if (onlyType)
      return typeFromObject;
    if (onlyDefault)
      return typeFromDefaultValue;
    if (typeFromObject !== typeFromDefaultValue) {
      const propertyPath = controller ? `${controller}.${token}` : token;
      throw new Error(`The specified default value for the Stimulus Value "${propertyPath}" must match the defined type "${typeFromObject}". The provided default value of "${typeObject.default}" is of type "${typeFromDefaultValue}".`);
    }
    if (fullObject)
      return typeFromObject;
  }
  function parseValueTypeDefinition(payload) {
    const { controller, token, typeDefinition } = payload;
    const typeObject = { controller, token, typeObject: typeDefinition };
    const typeFromObject = parseValueTypeObject(typeObject);
    const typeFromDefaultValue = parseValueTypeDefault(typeDefinition);
    const typeFromConstant = parseValueTypeConstant(typeDefinition);
    const type = typeFromObject || typeFromDefaultValue || typeFromConstant;
    if (type)
      return type;
    const propertyPath = controller ? `${controller}.${typeDefinition}` : token;
    throw new Error(`Unknown value type "${propertyPath}" for "${token}" value`);
  }
  function defaultValueForDefinition(typeDefinition) {
    const constant = parseValueTypeConstant(typeDefinition);
    if (constant)
      return defaultValuesByType[constant];
    const hasDefault = hasProperty(typeDefinition, "default");
    const hasType = hasProperty(typeDefinition, "type");
    const typeObject = typeDefinition;
    if (hasDefault)
      return typeObject.default;
    if (hasType) {
      const { type } = typeObject;
      const constantFromType = parseValueTypeConstant(type);
      if (constantFromType)
        return defaultValuesByType[constantFromType];
    }
    return typeDefinition;
  }
  function valueDescriptorForTokenAndTypeDefinition(payload) {
    const { token, typeDefinition } = payload;
    const key = `${dasherize(token)}-value`;
    const type = parseValueTypeDefinition(payload);
    return {
      type,
      key,
      name: camelize(key),
      get defaultValue() {
        return defaultValueForDefinition(typeDefinition);
      },
      get hasCustomDefaultValue() {
        return parseValueTypeDefault(typeDefinition) !== void 0;
      },
      reader: readers[type],
      writer: writers[type] || writers.default
    };
  }
  var defaultValuesByType = {
    get array() {
      return [];
    },
    boolean: false,
    number: 0,
    get object() {
      return {};
    },
    string: ""
  };
  var readers = {
    array(value) {
      const array = JSON.parse(value);
      if (!Array.isArray(array)) {
        throw new TypeError(`expected value of type "array" but instead got value "${value}" of type "${parseValueTypeDefault(array)}"`);
      }
      return array;
    },
    boolean(value) {
      return !(value == "0" || String(value).toLowerCase() == "false");
    },
    number(value) {
      return Number(value.replace(/_/g, ""));
    },
    object(value) {
      const object = JSON.parse(value);
      if (object === null || typeof object != "object" || Array.isArray(object)) {
        throw new TypeError(`expected value of type "object" but instead got value "${value}" of type "${parseValueTypeDefault(object)}"`);
      }
      return object;
    },
    string(value) {
      return value;
    }
  };
  var writers = {
    default: writeString,
    array: writeJSON,
    object: writeJSON
  };
  function writeJSON(value) {
    return JSON.stringify(value);
  }
  function writeString(value) {
    return `${value}`;
  }
  var Controller = class {
    constructor(context) {
      this.context = context;
    }
    static get shouldLoad() {
      return true;
    }
    static afterLoad(_identifier, _application) {
      return;
    }
    get application() {
      return this.context.application;
    }
    get scope() {
      return this.context.scope;
    }
    get element() {
      return this.scope.element;
    }
    get identifier() {
      return this.scope.identifier;
    }
    get targets() {
      return this.scope.targets;
    }
    get outlets() {
      return this.scope.outlets;
    }
    get classes() {
      return this.scope.classes;
    }
    get data() {
      return this.scope.data;
    }
    initialize() {
    }
    connect() {
    }
    disconnect() {
    }
    dispatch(eventName, { target = this.element, detail = {}, prefix = this.identifier, bubbles = true, cancelable = true } = {}) {
      const type = prefix ? `${prefix}:${eventName}` : eventName;
      const event = new CustomEvent(type, { detail, bubbles, cancelable });
      target.dispatchEvent(event);
      return event;
    }
  };
  Controller.blessings = [
    ClassPropertiesBlessing,
    TargetPropertiesBlessing,
    ValuePropertiesBlessing,
    OutletPropertiesBlessing
  ];
  Controller.targets = [];
  Controller.outlets = [];
  Controller.values = {};

  // engine/rails_design/app/javascripts/stimulus_wx/mini-program.js
  var mini_program_default = class extends Controller {
    static values = {
      url: String,
      // url must begin with /pages
      data: Object,
      direct: Boolean,
      launch: Boolean,
      nav: Boolean,
      debug: Boolean
    };
    connect() {
      if (window.__wxjs_environment === "miniprogram") {
        if (this.directValue) {
          this.navTo();
        }
      }
    }
    link(event) {
      wx.miniProgram.getEnv((res) => {
        console.debug("mini program env:", res);
        if (res.miniprogram) {
          event.preventDefault();
          this.navTo();
        }
      });
    }
    navTo() {
      const query = new URLSearchParams(this.dataValue).toString();
      let url = this.urlValue;
      if (query.length > 0) {
        if (this.urlValue.includes("?")) {
          url = this.urlValue.concat("&").concat(query);
        } else {
          url = this.urlValue.concat("?").concat(query);
        }
      }
      console.debug("mini program nav url:", url);
      if (this.launchValue) {
        wx.miniProgram.reLaunch({ url });
      } else if (this.navValue) {
        wx.miniProgram.navigateTo({ url });
      } else {
        wx.miniProgram.redirectTo({ url });
      }
    }
  };

  // engine/rails_design/app/javascripts/base_controller.js
  var base_controller_default = class extends Controller {
    static values = {
      url: String,
      input: String,
      params: Object
    };
    csrfToken() {
      const meta = document.querySelector("meta[name=csrf-token]");
      return meta && meta.content;
    }
    get(url) {
      this.request(url, "GET");
    }
    post(url, body, headers) {
      this.request(
        url,
        "POST",
        body,
        { "Content-Type": "application/json", "X-CSRF-Token": this.csrfToken(), ...headers }
      );
    }
    patch(url, body, headers) {
      this.request(
        url,
        "PATCH",
        body,
        { "Content-Type": "application/json", "X-CSRF-Token": this.csrfToken(), ...headers }
      );
    }
    formPost(form) {
      this.request(
        this.urlValue,
        "POST",
        new FormData(form),
        { "X-CSRF-Token": this.csrfToken() }
      );
    }
    inputPost(input) {
      const body = new FormData();
      let url;
      if (input.dataset.url) {
        url = new URL(input.dataset.url, location.origin);
      } else {
        url = new URL(this.urlValue, location.origin);
      }
      if (this.hasInputValue) {
        body.append(this.inputValue, input.value);
      } else {
        body.append(input.name, input.value);
      }
      if (this.hasParamsValue) {
        Object.keys(this.paramsValue).forEach((k) => {
          body.append(k, this.paramsValue[k]);
        });
      }
      this.request(
        url,
        "POST",
        body,
        { "X-CSRF-Token": this.csrfToken() }
      );
    }
    inputGet(input) {
      let url;
      if (input.dataset.url) {
        url = new URL(input.dataset.url, location.origin);
      } else {
        url = new URL(this.urlValue, location.origin);
      }
      if (this.hasInputValue) {
        url.searchParams.set(this.inputValue, input.value);
      } else {
        url.searchParams.set(input.name, input.value);
      }
      if (this.hasParamsValue) {
        Object.keys(this.paramsValue).forEach((k) => {
          url.searchParams.set(k, this.paramsValue[k]);
        });
      }
      this.get(url);
    }
    request(url, method, body, headers) {
      fetch(url, {
        credentials: "include",
        method: method.toUpperCase(),
        headers: {
          Accept: "text/vnd.turbo-stream.html",
          ...headers
        },
        body
      }).then((response) => {
        return response.text();
      }).then((body2) => {
        Turbo.renderStreamMessage(body2);
      });
    }
    get locale() {
      return document.querySelector("html").lang;
    }
  };

  // engine/rails_design/app/javascripts/stimulus_wx/scan.js
  var scan_default = class extends base_controller_default {
    static values = {
      debug: Boolean,
      params: Object,
      form: String
    };
    report(event) {
      const ele = event.currentTarget;
      let url = ele.dataset.reportUrl;
      let body;
      if (this.hasFormValue) {
        const form = document.getElementById(this.formValue);
        body = new FormData(form);
        url = form.action;
      } else {
        body = new FormData();
      }
      if (this.hasParamsValue) {
        Object.keys(this.paramsValue).forEach((k) => {
          body.append(k, this.paramsValue[k]);
        });
      }
      wx.ready(() => {
        wx.scanQRCode({
          needResult: 1,
          success: (res) => {
            body.append("result", res.resultStr);
            this.post(url, body);
          }
        });
      });
    }
    invoke() {
      wx.ready(() => {
        wx.scanQRCode({
          complete: (res) => {
            if (this.hasDebugValue && this.debugValue) {
              alert(JSON.stringify(res));
            }
          }
        });
      });
    }
  };

  // engine/rails_design/app/javascripts/stimulus_wx/wechat.js
  var wechat_default = class extends base_controller_default {
    static targets = ["preview", "media"];
    static values = {
      address: String,
      url: String
    };
    close() {
      wx.miniProgram.getEnv((res) => {
        if (res.miniprogram) {
          wx.miniProgram.navigateTo({
            url: this.addressValue
            // url must begin with /pages
          });
        } else {
          wx.closeWindow();
        }
      });
    }
    openAddress() {
      wx.openAddress({
        success: (res) => {
          this.post(this.urlValue, JSON.stringify(res));
        },
        fail: (res) => {
          weixin_fetch({ success: this.openAddress, controller: this });
        }
      });
    }
    programAddress() {
      wx.miniProgram.getEnv((res) => {
        if (res.miniprogram) {
          wx.miniProgram.navigateTo({
            url: this.addressValue
            // url must begin with /pages
          });
        }
      });
    }
    location() {
      wx.getLocation({
        type: "gcj02",
        success(res) {
          wx.openLocation({
            latitude: res.latitude,
            longitude: res.longitude,
            name: "\u70B9\u51FB\u53F3\u4FA7\u6253\u5F00\u5BFC\u822A\u8F6F\u4EF6",
            address: "\u70B9\u51FB\u6D4B\u8BD5",
            scale: 15
          });
        },
        fail: () => {
          weixin_fetch({ success: this.location, controller: this });
        }
      });
    }
    chooseImage() {
      wx.chooseImage({
        count: 1,
        success: (res) => {
          let localId = res.localIds[0];
          this.previewTarget.src = localId;
          wx.uploadImage({
            localId,
            success: (res2) => {
              this.mediaTarget.value = res2.serverId;
              this.mediaTarget.form.requestSubmit();
            }
          });
        },
        fail: () => {
          weixin_fetch({ success: this.chooseImage, controller: this });
        }
      });
    }
    showMenu() {
      wx.ready(() => {
        wx.showMenuItems({
          menuList: ["menuItem:copyUrl"]
        });
        wx.showOptionMenu();
      });
    }
  };

  // engine/rails_design/app/javascripts/stimulus_wx/wx-share.js
  var wx_share_default = class extends Controller {
    static targets = ["preview", "media"];
    static values = {
      title: String,
      desc: String,
      link: String,
      image: String
    };
    connect() {
      this.updateTimeline();
      this.updateShare();
    }
    ready() {
      this.updateTimeline();
      this.updateShare();
    }
    updateTimeline() {
      wx.ready(() => {
        wx.updateTimelineShareData({
          title: this.titleValue,
          link: this.linkValue,
          imgUrl: this.imageValue,
          fail: () => {
            weixin_fetch({ success: this.updateTimeline, controller: this });
          }
        });
      });
    }
    updateShare() {
      wx.ready(() => {
        wx.updateAppMessageShareData({
          title: this.titleValue,
          desc: this.descValue,
          link: this.linkValue,
          imgUrl: this.imageValue,
          fail: () => {
            weixin_fetch({ success: this.updateShare, controller: this });
          },
          success: (res) => {
            console.debug(res, "\u8BBE\u7F6E\u6D88\u606F\u6210\u529F");
          }
        });
      });
    }
    // 实际测试不能正常工作，文档未说明
    showMenu() {
      wx.ready(() => {
        wx.hideAllNonBaseMenuItem();
        wx.showMenuItems({
          menuList: [
            "menuItem:share:appMessage",
            "menuItem:share:timeline",
            "menuItem:profile"
          ]
        });
        wx.showOptionMenu();
      });
    }
  };

  // engine/rails_design/app/javascripts/stimulus_wx/wxpay.js
  var wxpay_default = class extends Controller {
    static values = {
      options: Object,
      params: Object,
      debug: { type: Boolean, default: false },
      auto: { type: Boolean, default: false }
    };
    static targets = ["load"];
    connect() {
      const options = this.optionsValue;
      wx.config({
        debug: this.debugValue,
        appId: options["appid"],
        timestamp: options["timestamp"],
        nonceStr: options["noncestr"],
        signature: options["signature"],
        jsApiList: ["chooseWXPay"],
        openTagList: ["wx-open-subscribe"]
      });
      if (this.autoValue) {
        this.chooseWXPay();
      }
    }
    chooseWXPay() {
      wx.ready(() => {
        wx.chooseWXPay({
          ...this.paramsValue,
          success: (res) => {
            console.debug("chooseWXPay success", res);
            if (this.hasLoadTarget) {
              this.loadTarget.style.removeProperty("display");
            }
          },
          error: (e) => {
            alert(JSON.stringify(e));
          }
        });
      });
    }
  };

  // engine/rails_design/app/javascripts/stimulus_wx/index.js
  application.register("mini-program", mini_program_default);
  application.register("scan", scan_default);
  application.register("wechat", wechat_default);
  application.register("wx-share", wx_share_default);
  application.register("wxpay", wxpay_default);

  // engine/rails_design/app/javascripts/stimulus_qy/share-moment.js
  var share_moment_default = class extends Controller {
    static values = {
      text: String,
      images: Array
    };
    shareImage() {
      const debug = this.debugValue;
      wx.invoke(
        "shareToExternalMoments",
        {
          text: {
            content: this.textValue
          },
          attachments: this.images
        },
        function(res) {
          if (debug) {
            alert(JSON.stringify(res));
          }
        }
      );
    }
    get images() {
      return this.imagesValue.map((i) => {
        return {
          msgtype: "image",
          image: {
            imgUrl: i
          }
        };
      });
    }
  };

  // engine/rails_design/app/javascripts/stimulus_qy/open-data.js
  var open_data_default = class extends Controller {
    static targets = ["tag"];
    static values = {
      url: String
    };
    connect() {
      if (WWOpenData.on) {
        WWOpenData.on("error", this.getError);
        WWOpenData.on("update", this.getUpdate);
      }
      if (location.href === this.urlValue) {
        this.xx({ controller: this });
      } else {
        wxwork_fetch({ success: this.xx, controller: this });
      }
    }
    xx(args) {
      args.controller.tagTargets.forEach((tag) => {
        tag.insertAdjacentHTML(
          "beforeend",
          `<ww-open-data type="${tag.getAttribute("type")}" openid="${tag.getAttribute("openid")}"></ww-open-data>`
        );
      });
    }
    disconnect() {
      if (WWOpenData.off) {
        WWOpenData.off("update", this.getUpdate);
        WWOpenData.off("error", this.getError);
      }
    }
    getUpdate(event) {
      console.debug(`update ${JSON.stringify(event)}`);
    }
    getError(event) {
      console.debug(`error ${JSON.stringify(event)}`);
    }
  };

  // engine/rails_design/app/javascripts/stimulus_qy/index.js
  application.register("share-moment", share_moment_default);
  application.register("open-data", open_data_default);
})();
