(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["tour-list-tour-list-module"],{

/***/ "./node_modules/ngx-infinite-scroll/modules/ngx-infinite-scroll.es5.js":
/*!*****************************************************************************!*\
  !*** ./node_modules/ngx-infinite-scroll/modules/ngx-infinite-scroll.es5.js ***!
  \*****************************************************************************/
/*! exports provided: InfiniteScrollDirective, InfiniteScrollModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "InfiniteScrollDirective", function() { return InfiniteScrollDirective; });
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "InfiniteScrollModule", function() { return InfiniteScrollModule; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var rxjs__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! rxjs */ "./node_modules/rxjs/_esm5/index.js");
/* harmony import */ var rxjs_operators__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! rxjs/operators */ "./node_modules/rxjs/_esm5/operators/index.js");



/**
 * @fileoverview added by tsickle
 * @suppress {checkTypes} checked by tsc
 */
/**
 * @param {?} selector
 * @param {?} scrollWindow
 * @param {?} defaultElement
 * @param {?} fromRoot
 * @return {?}
 */
function resolveContainerElement(selector, scrollWindow, defaultElement, fromRoot) {
    var /** @type {?} */ hasWindow = window && !!window.document && window.document.documentElement;
    var /** @type {?} */ container = hasWindow && scrollWindow ? window : defaultElement;
    if (selector) {
        var /** @type {?} */ containerIsString = selector && hasWindow && typeof selector === 'string';
        container = containerIsString
            ? findElement(selector, defaultElement.nativeElement, fromRoot)
            : selector;
        if (!container) {
            throw new Error('ngx-infinite-scroll {resolveContainerElement()}: selector for');
        }
    }
    return container;
}
/**
 * @param {?} selector
 * @param {?} customRoot
 * @param {?} fromRoot
 * @return {?}
 */
function findElement(selector, customRoot, fromRoot) {
    var /** @type {?} */ rootEl = fromRoot ? window.document : customRoot;
    return rootEl.querySelector(selector);
}
/**
 * @param {?} prop
 * @return {?}
 */
function inputPropChanged(prop) {
    return prop && !prop.firstChange;
}
/**
 * @return {?}
 */
function hasWindowDefined() {
    return typeof window !== 'undefined';
}
/**
 * @fileoverview added by tsickle
 * @suppress {checkTypes} checked by tsc
 */
var VerticalProps = {
    clientHeight: "clientHeight",
    offsetHeight: "offsetHeight",
    scrollHeight: "scrollHeight",
    pageYOffset: "pageYOffset",
    offsetTop: "offsetTop",
    scrollTop: "scrollTop",
    top: "top"
};
var HorizontalProps = {
    clientHeight: "clientWidth",
    offsetHeight: "offsetWidth",
    scrollHeight: "scrollWidth",
    pageYOffset: "pageXOffset",
    offsetTop: "offsetLeft",
    scrollTop: "scrollLeft",
    top: "left"
};
var AxisResolver = /** @class */ (function () {
    /**
     * @param {?=} vertical
     */
    function AxisResolver(vertical) {
        if (vertical === void 0) { vertical = true; }
        this.vertical = vertical;
        this.propsMap = vertical ? VerticalProps : HorizontalProps;
    }
    /**
     * @return {?}
     */
    AxisResolver.prototype.clientHeightKey = function () {
        return this.propsMap.clientHeight;
    };
    /**
     * @return {?}
     */
    AxisResolver.prototype.offsetHeightKey = function () {
        return this.propsMap.offsetHeight;
    };
    /**
     * @return {?}
     */
    AxisResolver.prototype.scrollHeightKey = function () {
        return this.propsMap.scrollHeight;
    };
    /**
     * @return {?}
     */
    AxisResolver.prototype.pageYOffsetKey = function () {
        return this.propsMap.pageYOffset;
    };
    /**
     * @return {?}
     */
    AxisResolver.prototype.offsetTopKey = function () {
        return this.propsMap.offsetTop;
    };
    /**
     * @return {?}
     */
    AxisResolver.prototype.scrollTopKey = function () {
        return this.propsMap.scrollTop;
    };
    /**
     * @return {?}
     */
    AxisResolver.prototype.topKey = function () {
        return this.propsMap.top;
    };
    return AxisResolver;
}());
/**
 * @fileoverview added by tsickle
 * @suppress {checkTypes} checked by tsc
 */
/**
 * @record
 */
/**
 * @record
 */
/**
 * @record
 */
/**
 * @record
 */
/**
 * @param {?} alwaysCallback
 * @param {?} shouldFireScrollEvent
 * @param {?} isTriggeredCurrentTotal
 * @return {?}
 */
function shouldTriggerEvents(alwaysCallback, shouldFireScrollEvent, isTriggeredCurrentTotal) {
    return (alwaysCallback || shouldFireScrollEvent) && !isTriggeredCurrentTotal;
}
/**
 * @fileoverview added by tsickle
 * @suppress {checkTypes} checked by tsc
 */
/**
 * @param {?} __0
 * @return {?}
 */
function createResolver(_a) {
    var windowElement = _a.windowElement, axis = _a.axis;
    return createResolverWithContainer({ axis: axis, isWindow: isElementWindow(windowElement) }, windowElement);
}
/**
 * @param {?} resolver
 * @param {?} windowElement
 * @return {?}
 */
function createResolverWithContainer(resolver, windowElement) {
    var /** @type {?} */ container = resolver.isWindow || (windowElement && !windowElement.nativeElement)
        ? windowElement
        : windowElement.nativeElement;
    return Object.assign({}, resolver, { container: container });
}
/**
 * @param {?} windowElement
 * @return {?}
 */
function isElementWindow(windowElement) {
    var /** @type {?} */ isWindow = ['Window', 'global'].some(function (obj) { return Object.prototype.toString.call(windowElement).includes(obj); });
    return isWindow;
}
/**
 * @param {?} isContainerWindow
 * @param {?} windowElement
 * @return {?}
 */
function getDocumentElement(isContainerWindow, windowElement) {
    return isContainerWindow ? windowElement.document.documentElement : null;
}
/**
 * @param {?} element
 * @param {?} resolver
 * @return {?}
 */
function calculatePoints(element, resolver) {
    var /** @type {?} */ height = extractHeightForElement(resolver);
    return resolver.isWindow
        ? calculatePointsForWindow(height, element, resolver)
        : calculatePointsForElement(height, element, resolver);
}
/**
 * @param {?} height
 * @param {?} element
 * @param {?} resolver
 * @return {?}
 */
function calculatePointsForWindow(height, element, resolver) {
    var axis = resolver.axis, container = resolver.container, isWindow = resolver.isWindow;
    var _a = extractHeightPropKeys(axis), offsetHeightKey = _a.offsetHeightKey, clientHeightKey = _a.clientHeightKey;
    // scrolled until now / current y point
    var /** @type {?} */ scrolled = height +
        getElementPageYOffset(getDocumentElement(isWindow, container), axis, isWindow);
    // total height / most bottom y point
    var /** @type {?} */ nativeElementHeight = getElementHeight(element.nativeElement, isWindow, offsetHeightKey, clientHeightKey);
    var /** @type {?} */ totalToScroll = getElementOffsetTop(element.nativeElement, axis, isWindow) +
        nativeElementHeight;
    return { height: height, scrolled: scrolled, totalToScroll: totalToScroll };
}
/**
 * @param {?} height
 * @param {?} element
 * @param {?} resolver
 * @return {?}
 */
function calculatePointsForElement(height, element, resolver) {
    var axis = resolver.axis, container = resolver.container;
    // perhaps use container.offsetTop instead of 'scrollTop'
    var /** @type {?} */ scrolled = container[axis.scrollTopKey()];
    var /** @type {?} */ totalToScroll = container[axis.scrollHeightKey()];
    return { height: height, scrolled: scrolled, totalToScroll: totalToScroll };
}
/**
 * @param {?} axis
 * @return {?}
 */
function extractHeightPropKeys(axis) {
    return {
        offsetHeightKey: axis.offsetHeightKey(),
        clientHeightKey: axis.clientHeightKey()
    };
}
/**
 * @param {?} __0
 * @return {?}
 */
function extractHeightForElement(_a) {
    var container = _a.container, isWindow = _a.isWindow, axis = _a.axis;
    var _b = extractHeightPropKeys(axis), offsetHeightKey = _b.offsetHeightKey, clientHeightKey = _b.clientHeightKey;
    return getElementHeight(container, isWindow, offsetHeightKey, clientHeightKey);
}
/**
 * @param {?} elem
 * @param {?} isWindow
 * @param {?} offsetHeightKey
 * @param {?} clientHeightKey
 * @return {?}
 */
function getElementHeight(elem, isWindow, offsetHeightKey, clientHeightKey) {
    if (isNaN(elem[offsetHeightKey])) {
        var /** @type {?} */ docElem = getDocumentElement(isWindow, elem);
        return docElem ? docElem[clientHeightKey] : 0;
    }
    else {
        return elem[offsetHeightKey];
    }
}
/**
 * @param {?} elem
 * @param {?} axis
 * @param {?} isWindow
 * @return {?}
 */
function getElementOffsetTop(elem, axis, isWindow) {
    var /** @type {?} */ topKey = axis.topKey();
    // elem = elem.nativeElement;
    if (!elem.getBoundingClientRect) {
        // || elem.css('none')) {
        return;
    }
    return (elem.getBoundingClientRect()[topKey] +
        getElementPageYOffset(elem, axis, isWindow));
}
/**
 * @param {?} elem
 * @param {?} axis
 * @param {?} isWindow
 * @return {?}
 */
function getElementPageYOffset(elem, axis, isWindow) {
    var /** @type {?} */ pageYOffset = axis.pageYOffsetKey();
    var /** @type {?} */ scrollTop = axis.scrollTopKey();
    var /** @type {?} */ offsetTop = axis.offsetTopKey();
    if (isNaN(window[pageYOffset])) {
        return getDocumentElement(isWindow, elem)[scrollTop];
    }
    else if (elem.ownerDocument) {
        return elem.ownerDocument.defaultView[pageYOffset];
    }
    else {
        return elem[offsetTop];
    }
}
/**
 * @fileoverview added by tsickle
 * @suppress {checkTypes} checked by tsc
 */
/**
 * @param {?} container
 * @param {?} distance
 * @param {?} scrollingDown
 * @return {?}
 */
function shouldFireScrollEvent(container, distance, scrollingDown) {
    var /** @type {?} */ remaining;
    var /** @type {?} */ containerBreakpoint;
    if (container.totalToScroll <= 0) {
        return false;
    }
    var /** @type {?} */ scrolledUntilNow = container.height + container.scrolled;
    if (scrollingDown) {
        remaining =
            (container.totalToScroll - scrolledUntilNow) / container.totalToScroll;
        containerBreakpoint = distance.down / 10;
    }
    else {
        var /** @type {?} */ totalHiddenContentHeight = container.scrolled + (container.totalToScroll - scrolledUntilNow);
        remaining = container.scrolled / totalHiddenContentHeight;
        containerBreakpoint = distance.up / 10;
    }
    var /** @type {?} */ shouldFireEvent = remaining <= containerBreakpoint;
    return shouldFireEvent;
}
/**
 * @param {?} lastScrollPosition
 * @param {?} container
 * @return {?}
 */
function isScrollingDownwards(lastScrollPosition, container) {
    return lastScrollPosition < container.scrolled;
}
/**
 * @param {?} lastScrollPosition
 * @param {?} container
 * @param {?} distance
 * @return {?}
 */
function getScrollStats(lastScrollPosition, container, distance) {
    var /** @type {?} */ scrollDown = isScrollingDownwards(lastScrollPosition, container);
    return {
        fire: shouldFireScrollEvent(container, distance, scrollDown),
        scrollDown: scrollDown
    };
}
/**
 * @param {?} position
 * @param {?} scrollState
 * @return {?}
 */
function updateScrollPosition(position, scrollState) {
    return (scrollState.lastScrollPosition = position);
}
/**
 * @param {?} totalToScroll
 * @param {?} scrollState
 * @return {?}
 */
function updateTotalToScroll(totalToScroll, scrollState) {
    if (scrollState.lastTotalToScroll !== totalToScroll) {
        scrollState.lastTotalToScroll = scrollState.totalToScroll;
        scrollState.totalToScroll = totalToScroll;
    }
}
/**
 * @param {?} scrollState
 * @return {?}
 */
/**
 * @param {?} scroll
 * @param {?} scrollState
 * @param {?} triggered
 * @param {?} isScrollingDown
 * @return {?}
 */
function updateTriggeredFlag(scroll, scrollState, triggered, isScrollingDown) {
    if (isScrollingDown) {
        scrollState.triggered.down = scroll;
    }
    else {
        scrollState.triggered.up = scroll;
    }
}
/**
 * @param {?} totalToScroll
 * @param {?} scrollState
 * @param {?} isScrollingDown
 * @return {?}
 */
function isTriggeredScroll(totalToScroll, scrollState, isScrollingDown) {
    return isScrollingDown
        ? scrollState.triggered.down === totalToScroll
        : scrollState.triggered.up === totalToScroll;
}
/**
 * @param {?} scrollState
 * @param {?} scrolledUntilNow
 * @param {?} totalToScroll
 * @return {?}
 */
function updateScrollState(scrollState, scrolledUntilNow, totalToScroll) {
    updateScrollPosition(scrolledUntilNow, scrollState);
    updateTotalToScroll(totalToScroll, scrollState);
    // const isSameTotal = isSameTotalToScroll(scrollState);
    // if (!isSameTotal) {
    //   updateTriggeredFlag(scrollState, false, isScrollingDown);
    // }
}
/**
 * @fileoverview added by tsickle
 * @suppress {checkTypes} checked by tsc
 */
/**
 * @param {?} config
 * @return {?}
 */
function createScroller(config) {
    var scrollContainer = config.scrollContainer, scrollWindow = config.scrollWindow, element = config.element, fromRoot = config.fromRoot;
    var /** @type {?} */ resolver = createResolver({
        axis: new AxisResolver(!config.horizontal),
        windowElement: resolveContainerElement(scrollContainer, scrollWindow, element, fromRoot)
    });
    var startWithTotal = calculatePoints(element, resolver).totalToScroll;
    var /** @type {?} */ scrollState = {
        lastScrollPosition: 0,
        lastTotalToScroll: 0,
        totalToScroll: startWithTotal,
        triggered: {
            down: 0,
            up: 0
        }
    };
    var /** @type {?} */ options = {
        container: resolver.container,
        throttle: config.throttle
    };
    var /** @type {?} */ distance = {
        up: config.upDistance,
        down: config.downDistance
    };
    return attachScrollEvent(options).pipe(Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_2__["mergeMap"])(function (ev) { return Object(rxjs__WEBPACK_IMPORTED_MODULE_1__["of"])(calculatePoints(element, resolver)); }), Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_2__["map"])(function (positionStats) { return toInfiniteScrollParams(scrollState.lastScrollPosition, positionStats, distance); }), Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_2__["tap"])(function (_a) {
        var stats = _a.stats, scrollDown = _a.scrollDown;
        return updateScrollState(scrollState, stats.scrolled, stats.totalToScroll);
    }), Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_2__["filter"])(function (_a) {
        var fire = _a.fire, scrollDown = _a.scrollDown, totalToScroll = _a.stats.totalToScroll;
        return shouldTriggerEvents(config.alwaysCallback, fire, isTriggeredScroll(totalToScroll, scrollState, scrollDown));
    }), Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_2__["tap"])(function (_a) {
        var scrollDown = _a.scrollDown, totalToScroll = _a.stats.totalToScroll;
        updateTriggeredFlag(totalToScroll, scrollState, true, scrollDown);
    }), Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_2__["map"])(toInfiniteScrollAction));
}
/**
 * @param {?} options
 * @return {?}
 */
function attachScrollEvent(options) {
    var /** @type {?} */ obs = Object(rxjs__WEBPACK_IMPORTED_MODULE_1__["fromEvent"])(options.container, "scroll");
    // For an unknown reason calling `sampleTime()` causes trouble for many users, even with `options.throttle = 0`.
    // Let's avoid calling the function unless needed.
    // See https://github.com/orizens/ngx-infinite-scroll/issues/198
    if (options.throttle) {
        obs = obs.pipe(Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_2__["sampleTime"])(options.throttle));
    }
    return obs;
}
/**
 * @param {?} lastScrollPosition
 * @param {?} stats
 * @param {?} distance
 * @return {?}
 */
function toInfiniteScrollParams(lastScrollPosition, stats, distance) {
    var _a = getScrollStats(lastScrollPosition, stats, distance), scrollDown = _a.scrollDown, fire = _a.fire;
    return {
        scrollDown: scrollDown,
        fire: fire,
        stats: stats
    };
}
var InfiniteScrollActions = {
    DOWN: "[NGX_ISE] DOWN",
    UP: "[NGX_ISE] UP"
};
/**
 * @param {?} response
 * @return {?}
 */
function toInfiniteScrollAction(response) {
    var scrollDown = response.scrollDown, currentScrollPosition = response.stats.scrolled;
    return {
        type: scrollDown ? InfiniteScrollActions.DOWN : InfiniteScrollActions.UP,
        payload: {
            currentScrollPosition: currentScrollPosition
        }
    };
}
/**
 * @fileoverview added by tsickle
 * @suppress {checkTypes} checked by tsc
 */
var InfiniteScrollDirective = /** @class */ (function () {
    /**
     * @param {?} element
     * @param {?} zone
     */
    function InfiniteScrollDirective(element, zone) {
        this.element = element;
        this.zone = zone;
        this.scrolled = new _angular_core__WEBPACK_IMPORTED_MODULE_0__["EventEmitter"]();
        this.scrolledUp = new _angular_core__WEBPACK_IMPORTED_MODULE_0__["EventEmitter"]();
        this.infiniteScrollDistance = 2;
        this.infiniteScrollUpDistance = 1.5;
        this.infiniteScrollThrottle = 150;
        this.infiniteScrollDisabled = false;
        this.infiniteScrollContainer = null;
        this.scrollWindow = true;
        this.immediateCheck = false;
        this.horizontal = false;
        this.alwaysCallback = false;
        this.fromRoot = false;
    }
    /**
     * @return {?}
     */
    InfiniteScrollDirective.prototype.ngAfterViewInit = function () {
        if (!this.infiniteScrollDisabled) {
            this.setup();
        }
    };
    /**
     * @param {?} __0
     * @return {?}
     */
    InfiniteScrollDirective.prototype.ngOnChanges = function (_a) {
        var infiniteScrollContainer = _a.infiniteScrollContainer, infiniteScrollDisabled = _a.infiniteScrollDisabled, infiniteScrollDistance = _a.infiniteScrollDistance;
        var /** @type {?} */ containerChanged = inputPropChanged(infiniteScrollContainer);
        var /** @type {?} */ disabledChanged = inputPropChanged(infiniteScrollDisabled);
        var /** @type {?} */ distanceChanged = inputPropChanged(infiniteScrollDistance);
        var /** @type {?} */ shouldSetup = (!disabledChanged && !this.infiniteScrollDisabled) ||
            (disabledChanged && !infiniteScrollDisabled.currentValue) || distanceChanged;
        if (containerChanged || disabledChanged || distanceChanged) {
            this.destroyScroller();
            if (shouldSetup) {
                this.setup();
            }
        }
    };
    /**
     * @return {?}
     */
    InfiniteScrollDirective.prototype.setup = function () {
        var _this = this;
        if (hasWindowDefined()) {
            this.zone.runOutsideAngular(function () {
                _this.disposeScroller = createScroller({
                    fromRoot: _this.fromRoot,
                    alwaysCallback: _this.alwaysCallback,
                    disable: _this.infiniteScrollDisabled,
                    downDistance: _this.infiniteScrollDistance,
                    element: _this.element,
                    horizontal: _this.horizontal,
                    scrollContainer: _this.infiniteScrollContainer,
                    scrollWindow: _this.scrollWindow,
                    throttle: _this.infiniteScrollThrottle,
                    upDistance: _this.infiniteScrollUpDistance
                }).subscribe(function (payload) { return _this.zone.run(function () { return _this.handleOnScroll(payload); }); });
            });
        }
    };
    /**
     * @param {?} __0
     * @return {?}
     */
    InfiniteScrollDirective.prototype.handleOnScroll = function (_a) {
        var type = _a.type, payload = _a.payload;
        switch (type) {
            case InfiniteScrollActions.DOWN:
                return this.scrolled.emit(payload);
            case InfiniteScrollActions.UP:
                return this.scrolledUp.emit(payload);
            default:
                return;
        }
    };
    /**
     * @return {?}
     */
    InfiniteScrollDirective.prototype.ngOnDestroy = function () {
        this.destroyScroller();
    };
    /**
     * @return {?}
     */
    InfiniteScrollDirective.prototype.destroyScroller = function () {
        if (this.disposeScroller) {
            this.disposeScroller.unsubscribe();
        }
    };
    return InfiniteScrollDirective;
}());
InfiniteScrollDirective.decorators = [
    { type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Directive"], args: [{
                selector: '[infiniteScroll], [infinite-scroll], [data-infinite-scroll]'
            },] },
];
/** @nocollapse */
InfiniteScrollDirective.ctorParameters = function () { return [
    { type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["ElementRef"], },
    { type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["NgZone"], },
]; };
InfiniteScrollDirective.propDecorators = {
    "scrolled": [{ type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Output"] },],
    "scrolledUp": [{ type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Output"] },],
    "infiniteScrollDistance": [{ type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"] },],
    "infiniteScrollUpDistance": [{ type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"] },],
    "infiniteScrollThrottle": [{ type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"] },],
    "infiniteScrollDisabled": [{ type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"] },],
    "infiniteScrollContainer": [{ type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"] },],
    "scrollWindow": [{ type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"] },],
    "immediateCheck": [{ type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"] },],
    "horizontal": [{ type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"] },],
    "alwaysCallback": [{ type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"] },],
    "fromRoot": [{ type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["Input"] },],
};
/**
 * @fileoverview added by tsickle
 * @suppress {checkTypes} checked by tsc
 */
var InfiniteScrollModule = /** @class */ (function () {
    function InfiniteScrollModule() {
    }
    return InfiniteScrollModule;
}());
InfiniteScrollModule.decorators = [
    { type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["NgModule"], args: [{
                declarations: [InfiniteScrollDirective],
                exports: [InfiniteScrollDirective],
                imports: [],
                providers: []
            },] },
];
/**
 * @fileoverview added by tsickle
 * @suppress {checkTypes} checked by tsc
 */
/**
 * @fileoverview added by tsickle
 * @suppress {checkTypes} checked by tsc
 */
/**
 * Angular library starter.
 * Build an Angular library compatible with AoT compilation & Tree shaking.
 * Written by Roberto Simonetti.
 * MIT license.
 * https://github.com/robisim74/angular-library-starter
 */
/**
 * Entry point for all public APIs of the package.
 */
/**
 * @fileoverview added by tsickle
 * @suppress {checkTypes} checked by tsc
 */
/**
 * Generated bundle index. Do not edit.
 */

//# sourceMappingURL=ngx-infinite-scroll.es5.js.map


/***/ }),

/***/ "./src/app/tour-list/bottom-sheet/bottom-sheet.component.html":
/*!********************************************************************!*\
  !*** ./src/app/tour-list/bottom-sheet/bottom-sheet.component.html ***!
  \********************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "<small i18n=\"@@searchFilters\" class=\"text-gray font-thin\">Search Filters</small>\n\n<form class=\"example-form\" [formGroup]=\"form\">\n\n  <mat-form-field class=\"example-full-width short-input\">\n    <input matInput i18n-placeholder=\"@@persons\" placeholder=\"Persons\" formControlName=\"number_of_persons\" type=\"number\">\n  </mat-form-field>\n  <br>\n\n  <mat-form-field>\n    <input matInput i18n-placeholder=\"@@departureDate\" [matDatepicker]=\"picker\" placeholder=\"Departure Date\" (click)=\"picker.open()\" formControlName=\"departure_date\">\n    <mat-datepicker-toggle matSuffix [for]=\"picker\"></mat-datepicker-toggle>\n    <mat-datepicker #picker></mat-datepicker>\n  </mat-form-field>\n\n  <br>\n\n  <mat-form-field>\n    <mat-select i18n-placeholder=\"@@flexibleDeparture\" placeholder=\"Flexible Departure\" formControlName=\"flexible_departure\">\n                            <mat-option i18n=\"@@1week\" value=\"7\">1 Week</mat-option>\n                            <mat-option i18n=\"@@2weeks\" value=\"14\">2 Weeks</mat-option>\n                            <mat-option i18n=\"@@3weeks\" value=\"21\">3 Weeks</mat-option>\n    </mat-select>\n  </mat-form-field>\n\n  <br>\n\n  <mat-form-field class=\"example-full-width\">\n    <input matInput i18n-placeholder=\"destination\" placeholder=\"Destination\" formControlName=\"destination\" [matAutocomplete]=\"auto\">\n    <mat-autocomplete #auto=\"matAutocomplete\">\n      <mat-option *ngFor=\"let state of filteredStates | async\" [value]=\"state.value\">\n        <img style=\"vertical-align:middle;\" aria-hidden src=\"{{state.flag}}\" height=\"25\" />\n        <small>{{ state.displayValue }}</small>\n      </mat-option>\n    </mat-autocomplete>\n  </mat-form-field>\n\n\n\n  <br>\n\n  <mat-form-field class=\"example-full-width short-input\">\n    <input matInput i18n-placeholder=\"@@min\" placeholder=\"Min\" formControlName=\"price_min\" type=\"number\">\n  </mat-form-field>\n  <mat-form-field class=\"example-full-width short-input\">\n    <input matInput i18n-placeholder=\"@@max\" placeholder=\"Max\" formControlName=\"price_max\" type=\"number\">\n  </mat-form-field>\n  <small>DKK</small>\n\n\n  <br>\n\n  <mat-form-field class=\"example-full-width short-input\">\n    <input matInput i18n-placeholder=\"@@min\" placeholder=\"Min\" formControlName=\"duration_min\" type=\"number\">\n  </mat-form-field>\n  <mat-form-field class=\"example-full-width short-input\">\n    <input matInput i18n-placeholder=\"@@max\" placeholder=\"Max\" formControlName=\"duration_max\" type=\"number\">\n  </mat-form-field>\n  <small>Days</small>\n\n</form>\n      "

/***/ }),

/***/ "./src/app/tour-list/bottom-sheet/bottom-sheet.component.scss":
/*!********************************************************************!*\
  !*** ./src/app/tour-list/bottom-sheet/bottom-sheet.component.scss ***!
  \********************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = ".short-input {\n  width: 70px; }\n"

/***/ }),

/***/ "./src/app/tour-list/bottom-sheet/bottom-sheet.component.ts":
/*!******************************************************************!*\
  !*** ./src/app/tour-list/bottom-sheet/bottom-sheet.component.ts ***!
  \******************************************************************/
/*! exports provided: BottomSheetComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "BottomSheetComponent", function() { return BottomSheetComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/fesm5/router.js");
/* harmony import */ var moment__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! moment */ "./node_modules/moment/moment.js");
/* harmony import */ var moment__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(moment__WEBPACK_IMPORTED_MODULE_2__);
/* harmony import */ var _angular_forms__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! @angular/forms */ "./node_modules/@angular/forms/fesm5/forms.js");
/* harmony import */ var rxjs_operators__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! rxjs/operators */ "./node_modules/rxjs/_esm5/operators/index.js");
/* harmony import */ var _shared_services_destinations_service__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ../shared/services/destinations.service */ "./src/app/tour-list/shared/services/destinations.service.ts");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};






var BottomSheetComponent = /** @class */ (function () {
    function BottomSheetComponent(route, router, fb, destinationsService) {
        this.route = route;
        this.router = router;
        this.fb = fb;
        this.destinationsService = destinationsService;
    }
    // for autocomplete
    BottomSheetComponent.prototype.filterStates = function (value) {
        return this.states.filter(function (state) {
            return state.value.toLowerCase().indexOf(value.toLowerCase()) === 0;
        });
    };
    BottomSheetComponent.prototype.ngOnInit = function () {
        var _this = this;
        this.route.queryParams.subscribe(function (queryParams) {
            _this.params = {
                number_of_persons: queryParams.number_of_persons,
                departure_date: queryParams.departure_date,
                flexible_departure: queryParams.flexible_departure,
                destination: queryParams.destination,
                price_min: queryParams.price_min,
                price_max: queryParams.price_max,
                duration_min: queryParams.duration_min,
                duration_max: queryParams.duration_max,
                order: queryParams.order
            };
        });
        this.createForm();
        this.valueChanges();
        // generate states
        this.destinationsService.getDestinations().subscribe(function (destinations) {
            _this.states = destinations;
            console.log(_this.states);
            // for autocomplete
            _this.filteredStates = _this.form.get('destination').valueChanges
                .pipe(Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_4__["startWith"])(''), Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_4__["map"])(function (state) { return state ? _this.filterStates(state) : _this.states.slice(); }));
        });
    };
    BottomSheetComponent.prototype.createForm = function () {
        this.form = this.fb.group({
            "number_of_persons": this.params.number_of_persons,
            "departure_date": this.params.departure_date,
            "flexible_departure": this.params.flexible_departure,
            "destination": this.params.destination,
            "price_min": this.params.price_min,
            "price_max": this.params.price_max,
            "duration_min": this.params.duration_min,
            "duration_max": this.params.duration_max
        });
    };
    BottomSheetComponent.prototype.valueChanges = function () {
        var _this = this;
        this.form.valueChanges
            .subscribe(function (value) {
            var queryParams = {
                number_of_persons: value.number_of_persons,
                departure_date: value.departure_date,
                flexible_departure: value.flexible_departure,
                destination: value.destination,
                price_min: value.price_min,
                price_max: value.price_max,
                duration_min: value.duration_min,
                duration_max: value.duration_max,
                order: _this.params.order
            };
            if (queryParams.departure_date)
                queryParams.departure_date = moment__WEBPACK_IMPORTED_MODULE_2__(queryParams.departure_date).format('YYYY-MM-DD');
            _this.router.navigate([], { queryParams: queryParams });
        });
    };
    BottomSheetComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-bottom-sheet',
            template: __webpack_require__(/*! ./bottom-sheet.component.html */ "./src/app/tour-list/bottom-sheet/bottom-sheet.component.html"),
            styles: [__webpack_require__(/*! ./bottom-sheet.component.scss */ "./src/app/tour-list/bottom-sheet/bottom-sheet.component.scss")]
        }),
        __metadata("design:paramtypes", [_angular_router__WEBPACK_IMPORTED_MODULE_1__["ActivatedRoute"],
            _angular_router__WEBPACK_IMPORTED_MODULE_1__["Router"],
            _angular_forms__WEBPACK_IMPORTED_MODULE_3__["FormBuilder"],
            _shared_services_destinations_service__WEBPACK_IMPORTED_MODULE_5__["DestinationsService"]])
    ], BottomSheetComponent);
    return BottomSheetComponent;
}());



/***/ }),

/***/ "./src/app/tour-list/items/items.component.html":
/*!******************************************************!*\
  !*** ./src/app/tour-list/items/items.component.html ***!
  \******************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "<div fxLayout=\"row wrap\" fxLayoutAlign=\"start center\" class=\"text-left\" fxLayout.xs=\"column\" fxFlexFill>\n    <div fxFlex=\"20\" fxFlex.xs=\"100\" fxFlex.sm=\"50\" fxFlex.md=\"30\" fxFlex.lg=\"25\" class=\"search-card-container\" *ngFor=\"let tour of tours?.data\" [ngClass]=\"{ 'fade': isLoading }\">\n        <mat-card class=\"tour-card\">\n            <a href=\"{{ redirectUrl(tour.id) }}\" target=\"blank\">\n            <img mat-card-image src=\"{{ tour.image_url }}\">\n            </a>\n            <div class=\"provider-logo mat-elevation-z1\">\n                <img src=\"{{ tour.provider.logo }}\">\n            </div>\n\n            <mat-card-content>\n                <p>\n                    <span class=\"hotel\" *ngIf=\"tour.departure_date && tour.duration\">{{ tour.departure_date | date:\"MMM d\" }} +{{ tour.duration }}</span> <span i18n> {tour.duration, select, 1 {day} other {days}}</span>  &nbsp;  <span class=\"from\" *ngIf=\"tour.number_of_persons\">{{ tour.number_of_persons }} <ng-container i18n=\"@@personPlural\">{tour.number_of_persons, select, 1 {person} other {persons}}</ng-container></span>\n                    <span class=\"price\">{{ tour.currency }} {{ tour.price }}</span>\n                    <br>\n                    <span class=\"destination\">{{ tour.city }}</span> &nbsp; <span class=\"from\">{{ tour.country }}</span>\n                    <br>\n                    <span class=\"hotel\">{{ tour.name }}</span><span class=\"stars ml-2 font-thin\" *ngIf=\"tour.stars\">{{ tour.stars }}<mat-icon class=\"service-star\">star</mat-icon></span>  \n                    <br>\n                </p>\n            </mat-card-content>\n        </mat-card>\n    </div>\n</div>\n\n<div *ngIf=\"tours?.data && !tours.data.length\"><h1 i18n=\"@@nothingFound\">Nothing Found</h1></div>\n<div infiniteScroll [infiniteScrollDistance]=\"2\" [infiniteScrollThrottle]=\"50\" (scrolled)=\"onScroll()\"></div>\n<div align=\"center\"  *ngIf=\"isAppending\"><mat-spinner></mat-spinner></div>"

/***/ }),

/***/ "./src/app/tour-list/items/items.component.scss":
/*!******************************************************!*\
  !*** ./src/app/tour-list/items/items.component.scss ***!
  \******************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = ".search-card-container {\n  padding: 2rem; }\n\n.service-star {\n  color: #FFC107;\n  font-size: .9rem;\n  top: .2rem;\n  position: relative; }\n\n.fade {\n  opacity: .5; }\n"

/***/ }),

/***/ "./src/app/tour-list/items/items.component.ts":
/*!****************************************************!*\
  !*** ./src/app/tour-list/items/items.component.ts ***!
  \****************************************************/
/*! exports provided: ItemsComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "ItemsComponent", function() { return ItemsComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _items_service__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./items.service */ "./src/app/tour-list/items/items.service.ts");
/* harmony import */ var moment__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! moment */ "./node_modules/moment/moment.js");
/* harmony import */ var moment__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(moment__WEBPACK_IMPORTED_MODULE_2__);
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/fesm5/router.js");
/* harmony import */ var _angular_material__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! @angular/material */ "./node_modules/@angular/material/esm5/material.es5.js");
/* harmony import */ var _snackbar_snackbar_component__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ./snackbar/snackbar.component */ "./src/app/tour-list/items/snackbar/snackbar.component.ts");
/* harmony import */ var _environments_environment__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! ../../../environments/environment */ "./src/environments/environment.ts");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};







var ItemsComponent = /** @class */ (function () {
    function ItemsComponent(itemsService, route, snackBar) {
        this.itemsService = itemsService;
        this.route = route;
        this.snackBar = snackBar;
        this.currentPage = 1;
        this.isLoading = true;
        this.isAppending = false;
    }
    ItemsComponent.prototype.ngOnInit = function () {
        var _this = this;
        this.route.queryParams.subscribe(function (queryParams) {
            _this.params = {
                number_of_persons: queryParams.number_of_persons,
                departure_date: moment__WEBPACK_IMPORTED_MODULE_2__(queryParams.departure_date).format('YYYY-MM-DD'),
                flexible_departure: queryParams.flexible_departure,
                destination: queryParams.destination,
                price_min: queryParams.price_min,
                price_max: queryParams.price_max,
                duration_min: queryParams.duration_min,
                duration_max: queryParams.duration_max,
                order: queryParams.order,
                provider_id: queryParams.provider_id
            };
            _this.searchTours();
        });
    };
    // function for getting tours, which uses initialized service
    ItemsComponent.prototype.searchTours = function () {
        var _this = this;
        this.isLoading = true;
        this.itemsService.getTours(this.params)
            .subscribe(function (data) {
            _this.tours = data;
            _this.isLoading = false;
        });
    };
    ItemsComponent.prototype.appendTours = function () {
        var _this = this;
        this.isAppending = true;
        this.itemsService.getTours(this.params)
            .subscribe(function (data) {
            _this.tours.data = _this.tours.data.concat(data.data);
            _this.isAppending = false;
        });
    };
    ItemsComponent.prototype.onScroll = function () {
        console.log('scrolled');
        if (this.tours) {
            var lastPage = this.tours.meta.last_page;
            if (lastPage > 1 && lastPage == this.currentPage)
                this.openSnackBar();
            else if (this.currentPage < lastPage) {
                this.currentPage++;
                this.params.page = this.currentPage;
                this.appendTours();
            }
        }
    };
    ItemsComponent.prototype.openSnackBar = function () {
        this.snackBar.openFromComponent(_snackbar_snackbar_component__WEBPACK_IMPORTED_MODULE_5__["SnackbarComponent"], {
            duration: 2000,
        });
    };
    ItemsComponent.prototype.redirectUrl = function (tour_id) {
        return _environments_environment__WEBPACK_IMPORTED_MODULE_6__["environment"].apiUrl + '/redirect-tour/' + tour_id;
    };
    ItemsComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-items',
            template: __webpack_require__(/*! ./items.component.html */ "./src/app/tour-list/items/items.component.html"),
            styles: [__webpack_require__(/*! ./items.component.scss */ "./src/app/tour-list/items/items.component.scss")],
            providers: [_items_service__WEBPACK_IMPORTED_MODULE_1__["ItemsService"]]
        }),
        __metadata("design:paramtypes", [_items_service__WEBPACK_IMPORTED_MODULE_1__["ItemsService"],
            _angular_router__WEBPACK_IMPORTED_MODULE_3__["ActivatedRoute"],
            _angular_material__WEBPACK_IMPORTED_MODULE_4__["MatSnackBar"]])
    ], ItemsComponent);
    return ItemsComponent;
}());



/***/ }),

/***/ "./src/app/tour-list/items/items.service.ts":
/*!**************************************************!*\
  !*** ./src/app/tour-list/items/items.service.ts ***!
  \**************************************************/
/*! exports provided: ItemsService */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "ItemsService", function() { return ItemsService; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _angular_common_http__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/common/http */ "./node_modules/@angular/common/fesm5/http.js");
/* harmony import */ var _environments_environment__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../environments/environment */ "./src/environments/environment.ts");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
// this service is for fetching tours from back end



var ItemsService = /** @class */ (function () {
    function ItemsService(http) {
        this.http = http;
        this.toursUrl = _environments_environment__WEBPACK_IMPORTED_MODULE_2__["environment"].apiUrl + '/api/search-tours';
    }
    ItemsService.prototype.getTours = function (params) {
        Object.keys(params).forEach(function (key) { return params[key] === undefined ? delete params[key] : ''; }); // delete undefined keys
        return this.http.get(this.toursUrl, { params: params });
    };
    ItemsService = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Injectable"])({
            providedIn: 'root'
        }),
        __metadata("design:paramtypes", [_angular_common_http__WEBPACK_IMPORTED_MODULE_1__["HttpClient"]])
    ], ItemsService);
    return ItemsService;
}());



/***/ }),

/***/ "./src/app/tour-list/items/snackbar/snackbar.component.html":
/*!******************************************************************!*\
  !*** ./src/app/tour-list/items/snackbar/snackbar.component.html ***!
  \******************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "<ng-container i18n=\"@@noMoreTours\">No more tours to show</ng-container>"

/***/ }),

/***/ "./src/app/tour-list/items/snackbar/snackbar.component.scss":
/*!******************************************************************!*\
  !*** ./src/app/tour-list/items/snackbar/snackbar.component.scss ***!
  \******************************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = ""

/***/ }),

/***/ "./src/app/tour-list/items/snackbar/snackbar.component.ts":
/*!****************************************************************!*\
  !*** ./src/app/tour-list/items/snackbar/snackbar.component.ts ***!
  \****************************************************************/
/*! exports provided: SnackbarComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "SnackbarComponent", function() { return SnackbarComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};

var SnackbarComponent = /** @class */ (function () {
    function SnackbarComponent() {
    }
    SnackbarComponent.prototype.ngOnInit = function () {
    };
    SnackbarComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-snackbar',
            template: __webpack_require__(/*! ./snackbar.component.html */ "./src/app/tour-list/items/snackbar/snackbar.component.html"),
            styles: [__webpack_require__(/*! ./snackbar.component.scss */ "./src/app/tour-list/items/snackbar/snackbar.component.scss")]
        }),
        __metadata("design:paramtypes", [])
    ], SnackbarComponent);
    return SnackbarComponent;
}());



/***/ }),

/***/ "./src/app/tour-list/shared/services/destinations.service.ts":
/*!*******************************************************************!*\
  !*** ./src/app/tour-list/shared/services/destinations.service.ts ***!
  \*******************************************************************/
/*! exports provided: DestinationsService */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "DestinationsService", function() { return DestinationsService; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _angular_common_http__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/common/http */ "./node_modules/@angular/common/fesm5/http.js");
/* harmony import */ var _environments_environment__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ../../../../environments/environment */ "./src/environments/environment.ts");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
// this service is used for retrieval of destinations for the autocomplete



var DestinationsService = /** @class */ (function () {
    function DestinationsService(http) {
        this.http = http;
    }
    DestinationsService.prototype.getDestinations = function () {
        return this.http.get(_environments_environment__WEBPACK_IMPORTED_MODULE_2__["environment"].apiUrl + '/api/autocomplete/destinations');
    };
    DestinationsService = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Injectable"])({
            providedIn: 'root'
        }),
        __metadata("design:paramtypes", [_angular_common_http__WEBPACK_IMPORTED_MODULE_1__["HttpClient"]])
    ], DestinationsService);
    return DestinationsService;
}());



/***/ }),

/***/ "./src/app/tour-list/sidebar/sidebar.component.html":
/*!**********************************************************!*\
  !*** ./src/app/tour-list/sidebar/sidebar.component.html ***!
  \**********************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "<a routerLink=\"/\">\n  <div class=\"logo-container mb-4\">\n    <h5>billigste afbudsrejser</h5>\n  </div>\n</a>\n<div class=\"search-form-container\">\n  <small i18n=\"@@searchFilters\" class=\"text-gray font-thin\">Search Filters</small>\n\n  <form class=\"example-form\" [formGroup]=\"form\">\n\n    <mat-form-field class=\"example-full-width short-input\">\n      <input matInput i18n-placeholder=\"@@persons\" placeholder=\"Persons\" formControlName=\"number_of_persons\" type=\"number\">\n    </mat-form-field>\n    <br>\n\n    <mat-form-field>\n      <input matInput i18n-placeholder=\"@@departureDate\" [matDatepicker]=\"picker\" placeholder=\"Departure Date\" (click)=\"picker.open()\" formControlName=\"departure_date\">\n      <mat-datepicker-toggle matSuffix [for]=\"picker\"></mat-datepicker-toggle>\n      <mat-datepicker #picker></mat-datepicker>\n    </mat-form-field>\n\n    <br>\n\n    <mat-form-field>\n      <mat-select i18n-placeholder=\"@@flexibleDeparture\" placeholder=\"Flexible Departure\" formControlName=\"flexible_departure\">\n        <mat-option i18n=\"@@1week\" value=\"7\">1 Week</mat-option>\n        <mat-option i18n=\"@@2weeks\" value=\"14\">2 Weeks</mat-option>\n        <mat-option i18n=\"@@3weeks\" value=\"21\">3 Weeks</mat-option>\n      </mat-select>\n    </mat-form-field>\n\n\n\n    <br>\n\n    <mat-form-field class=\"example-full-width\">\n      <input matInput i18n-placeholder=\"destination\" placeholder=\"Destination\" formControlName=\"destination\" [matAutocomplete]=\"auto\">\n      <mat-autocomplete #auto=\"matAutocomplete\">\n        <mat-option *ngFor=\"let state of filteredStates | async\" [value]=\"state.value\">\n          <img style=\"vertical-align:middle;\" aria-hidden src=\"{{state.flag}}\" height=\"25\" />\n          <small>{{ state.displayValue }}</small>\n        </mat-option>\n      </mat-autocomplete>\n    </mat-form-field>\n\n\n\n    <br>\n\n    <mat-form-field class=\"example-full-width short-input\">\n      <input matInput i18n-placeholder=\"@@min\" placeholder=\"Min\" formControlName=\"price_min\" type=\"number\">\n    </mat-form-field>\n    <mat-form-field class=\"example-full-width short-input\">\n      <input matInput i18n-placeholder=\"@@max\" placeholder=\"Max\" formControlName=\"price_max\" type=\"number\">\n    </mat-form-field>\n    <small>DKK</small>\n\n\n    <br>\n\n    <mat-form-field class=\"example-full-width short-input\">\n      <input matInput i18n-placeholder=\"@@min\" placeholder=\"Min\" formControlName=\"duration_min\" type=\"number\">\n    </mat-form-field>\n    <mat-form-field class=\"example-full-width short-input\">\n      <input matInput i18n-placeholder=\"@@max\" placeholder=\"Max\" formControlName=\"duration_max\" type=\"number\">\n    </mat-form-field>\n    <small i18n=\"@@days\">Days</small>\n\n  </form>\n\n</div>\n\n<div class=\"sidebar-footer\">\n  <a href=\"/en\" class=\"gray-text mr-2\"><img style=\"width:15px\" class=\"mr-1\" src=\"http://aws-cf.imdoc.fr/prod/articles/3/5/0/5788350/4321013/big-432101389c.jpg?v=0\"> <small>English</small></a>\n  <a href=\"/da\" class=\"gray-text\"><img style=\"width:15px\" class=\"mr-1\" src=\"https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Flag_of_Denmark.svg/20px-Flag_of_Denmark.svg.png\"> <small>Dansk</small></a>\n  <br><br>\n  <small class=\"copyright\">Copyright © 2018. billigsteafbudsrejser</small>\n  <br>\n  <small class=\"copyright\">All rights reserved!</small>\n</div>\n"

/***/ }),

/***/ "./src/app/tour-list/sidebar/sidebar.component.scss":
/*!**********************************************************!*\
  !*** ./src/app/tour-list/sidebar/sidebar.component.scss ***!
  \**********************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = ".search-form-container {\n  margin-top: 50%; }\n  .search-form-container .short-input {\n    width: 70px; }\n  .sidebar-footer {\n  bottom: 2rem;\n  position: absolute; }\n  .sidebar-footer .copyright {\n    font-weight: 100;\n    font-size: .6rem; }\n  .logo-container {\n  padding: .3rem 1rem;\n  background: #ffeb39;\n  width: -webkit-fit-content;\n  width: -moz-fit-content;\n  width: fit-content;\n  color: black;\n  text-decoration: none;\n  position: absolute;\n  top: 0; }\n  small mat-icon {\n  font-size: .8rem; }\n"

/***/ }),

/***/ "./src/app/tour-list/sidebar/sidebar.component.ts":
/*!********************************************************!*\
  !*** ./src/app/tour-list/sidebar/sidebar.component.ts ***!
  \********************************************************/
/*! exports provided: SidebarComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "SidebarComponent", function() { return SidebarComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/fesm5/router.js");
/* harmony import */ var moment__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! moment */ "./node_modules/moment/moment.js");
/* harmony import */ var moment__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(moment__WEBPACK_IMPORTED_MODULE_2__);
/* harmony import */ var _angular_forms__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! @angular/forms */ "./node_modules/@angular/forms/fesm5/forms.js");
/* harmony import */ var rxjs_operators__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! rxjs/operators */ "./node_modules/rxjs/_esm5/operators/index.js");
/* harmony import */ var _shared_services_destinations_service__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ../shared/services/destinations.service */ "./src/app/tour-list/shared/services/destinations.service.ts");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};






var SidebarComponent = /** @class */ (function () {
    function SidebarComponent(route, router, fb, destinationsService) {
        this.route = route;
        this.router = router;
        this.fb = fb;
        this.destinationsService = destinationsService;
    }
    // for autocomplete
    SidebarComponent.prototype.filterStates = function (value) {
        return this.states.filter(function (state) {
            return state.value.toLowerCase().indexOf(value.toLowerCase()) === 0;
        });
    };
    SidebarComponent.prototype.ngOnInit = function () {
        var _this = this;
        this.route.queryParams.subscribe(function (queryParams) {
            _this.params = {
                number_of_persons: queryParams.number_of_persons,
                departure_date: queryParams.departure_date,
                flexible_departure: queryParams.flexible_departure,
                destination: queryParams.destination,
                price_min: queryParams.price_min,
                price_max: queryParams.price_max,
                duration_min: queryParams.duration_min,
                duration_max: queryParams.duration_max,
                order: queryParams.order
            };
        });
        this.createForm();
        this.valueChanges();
        // generate states
        this.destinationsService.getDestinations().subscribe(function (destinations) {
            _this.states = destinations;
            console.log(_this.states);
            // for autocomplete
            _this.filteredStates = _this.form.get('destination').valueChanges
                .pipe(Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_4__["startWith"])(''), Object(rxjs_operators__WEBPACK_IMPORTED_MODULE_4__["map"])(function (state) { return state ? _this.filterStates(state) : _this.states.slice(); }));
        });
    };
    SidebarComponent.prototype.createForm = function () {
        this.form = this.fb.group({
            "number_of_persons": this.params.number_of_persons,
            "departure_date": this.params.departure_date,
            "flexible_departure": this.params.flexible_departure,
            "destination": this.params.destination,
            "price_min": this.params.price_min,
            "price_max": this.params.price_max,
            "duration_min": this.params.duration_min,
            "duration_max": this.params.duration_max
        });
    };
    SidebarComponent.prototype.valueChanges = function () {
        var _this = this;
        this.form.valueChanges
            .subscribe(function (value) {
            var queryParams = {
                number_of_persons: value.number_of_persons,
                departure_date: value.departure_date,
                flexible_departure: value.flexible_departure,
                destination: value.destination,
                price_min: value.price_min,
                price_max: value.price_max,
                duration_min: value.duration_min,
                duration_max: value.duration_max,
                order: _this.params.order
            };
            if (queryParams.departure_date)
                queryParams.departure_date = moment__WEBPACK_IMPORTED_MODULE_2__(queryParams.departure_date).format('YYYY-MM-DD');
            _this.router.navigate([], { queryParams: queryParams });
        });
    };
    SidebarComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-sidebar',
            template: __webpack_require__(/*! ./sidebar.component.html */ "./src/app/tour-list/sidebar/sidebar.component.html"),
            styles: [__webpack_require__(/*! ./sidebar.component.scss */ "./src/app/tour-list/sidebar/sidebar.component.scss")]
        }),
        __metadata("design:paramtypes", [_angular_router__WEBPACK_IMPORTED_MODULE_1__["ActivatedRoute"],
            _angular_router__WEBPACK_IMPORTED_MODULE_1__["Router"],
            _angular_forms__WEBPACK_IMPORTED_MODULE_3__["FormBuilder"],
            _shared_services_destinations_service__WEBPACK_IMPORTED_MODULE_5__["DestinationsService"]])
    ], SidebarComponent);
    return SidebarComponent;
}());



/***/ }),

/***/ "./src/app/tour-list/sorting/sorting.component.html":
/*!**********************************************************!*\
  !*** ./src/app/tour-list/sorting/sorting.component.html ***!
  \**********************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "<div align=\"right\" class=\"py-0 py-lg-4\">\n<mat-form-field>\n  <mat-select i18n-placeholder=\"@@sortBy\" placeholder=\"Sort By\" ([value])=\"params.order\" [(ngModel)]=\"params.order\" (ngModelChange)=\"sortTours()\">\n    <mat-option i18n-value value=\"date\">Date</mat-option>\n    <mat-option i18n-value value=\"price\">Price</mat-option>\n    <mat-option i18n-value value=\"popularity\">Popularity</mat-option>\n  </mat-select>\n</mat-form-field>\n</div>"

/***/ }),

/***/ "./src/app/tour-list/sorting/sorting.component.scss":
/*!**********************************************************!*\
  !*** ./src/app/tour-list/sorting/sorting.component.scss ***!
  \**********************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = ""

/***/ }),

/***/ "./src/app/tour-list/sorting/sorting.component.ts":
/*!********************************************************!*\
  !*** ./src/app/tour-list/sorting/sorting.component.ts ***!
  \********************************************************/
/*! exports provided: SortingComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "SortingComponent", function() { return SortingComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/fesm5/router.js");
/* harmony import */ var moment__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! moment */ "./node_modules/moment/moment.js");
/* harmony import */ var moment__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(moment__WEBPACK_IMPORTED_MODULE_2__);
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};



var SortingComponent = /** @class */ (function () {
    function SortingComponent(route, router) {
        this.route = route;
        this.router = router;
    }
    SortingComponent.prototype.ngOnInit = function () {
        var _this = this;
        this.route.queryParams.subscribe(function (queryParams) {
            _this.params = {
                number_of_persons: queryParams.number_of_persons,
                departure_date: moment__WEBPACK_IMPORTED_MODULE_2__(queryParams.departure_date).format('YYYY-MM-DD'),
                flexible_departure: queryParams.flexible_departure,
                destination: queryParams.destination,
                price_min: queryParams.price_min,
                price_max: queryParams.price_max,
                duration_min: queryParams.duration_min,
                duration_max: queryParams.duration_max,
                order: queryParams.order
            };
        });
    };
    SortingComponent.prototype.sortTours = function () {
        this.router.navigate([], { queryParams: this.params });
    };
    SortingComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-sorting',
            template: __webpack_require__(/*! ./sorting.component.html */ "./src/app/tour-list/sorting/sorting.component.html"),
            styles: [__webpack_require__(/*! ./sorting.component.scss */ "./src/app/tour-list/sorting/sorting.component.scss")]
        }),
        __metadata("design:paramtypes", [_angular_router__WEBPACK_IMPORTED_MODULE_1__["ActivatedRoute"],
            _angular_router__WEBPACK_IMPORTED_MODULE_1__["Router"]])
    ], SortingComponent);
    return SortingComponent;
}());



/***/ }),

/***/ "./src/app/tour-list/tour-list-routing.module.ts":
/*!*******************************************************!*\
  !*** ./src/app/tour-list/tour-list-routing.module.ts ***!
  \*******************************************************/
/*! exports provided: TourListRoutingModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "TourListRoutingModule", function() { return TourListRoutingModule; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/fesm5/router.js");
/* harmony import */ var _tour_list_component__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./tour-list.component */ "./src/app/tour-list/tour-list.component.ts");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};



var routes = [
    {
        path: '',
        component: _tour_list_component__WEBPACK_IMPORTED_MODULE_2__["TourListComponent"]
    }
];
var TourListRoutingModule = /** @class */ (function () {
    function TourListRoutingModule() {
    }
    TourListRoutingModule = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["NgModule"])({
            imports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forChild(routes)],
            exports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]]
        })
    ], TourListRoutingModule);
    return TourListRoutingModule;
}());



/***/ }),

/***/ "./src/app/tour-list/tour-list.component.html":
/*!****************************************************!*\
  !*** ./src/app/tour-list/tour-list.component.html ***!
  \****************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = "<mat-drawer-container>\n  <!--sidebar-->\n  <mat-drawer mode=\"side\" opened=\"true\" class=\"example-sidenav\" fxHide.xs>\n    <app-sidebar></app-sidebar>\n  </mat-drawer>\n  <!--/sidebar-->\n\n  <!--main content-->\n  <mat-drawer-content>\n\n    <!--mobile-->\n    <div class=\"container pt-0\" fxHide fxShow.xs>\n      <a href=\"/\">\n        <div class=\"logo-container-mobile mb-4\">\n          <h5>billigste afbudsrejser</h5>\n        </div>\n      </a>\n      <!-- filtering dialog-->\n      <a (click)=\"openBottomSheet()\" class=\"float-right\" fxHide fxShow.xs><small><mat-icon>filter_list</mat-icon> <ng-container i18n>Filters</ng-container></small></a>\n      <!--/ filtering dialog-->\n    </div>\n    <!--/mobile-->\n\n\n\n\n    <div class=\"container searched-tour-list-container\">\n      <div class=\"searched-tour-list\">\n        <!--sorting-->\n        <app-sorting></app-sorting>\n        <!--/sorting-->\n        <app-items></app-items>\n      </div>\n    </div>\n  </mat-drawer-content>\n  <!--main content-->\n</mat-drawer-container>\n"

/***/ }),

/***/ "./src/app/tour-list/tour-list.component.scss":
/*!****************************************************!*\
  !*** ./src/app/tour-list/tour-list.component.scss ***!
  \****************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

module.exports = ".searched-tour-list {\n  max-width: 1700px;\n  margin: 0 auto !important;\n  min-width: initial !important; }\n\n.mat-drawer-container {\n  background: white; }\n\n.example-sidenav {\n  padding: 20px;\n  background: #fbfbfb;\n  height: 100vh;\n  position: fixed; }\n\n.logo-container-mobile {\n  padding: .3rem 1rem;\n  background: #ffeb39;\n  width: -webkit-fit-content;\n  width: -moz-fit-content;\n  width: fit-content;\n  color: black;\n  text-decoration: none;\n  margin: 0 auto; }\n"

/***/ }),

/***/ "./src/app/tour-list/tour-list.component.ts":
/*!**************************************************!*\
  !*** ./src/app/tour-list/tour-list.component.ts ***!
  \**************************************************/
/*! exports provided: TourListComponent */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "TourListComponent", function() { return TourListComponent; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _angular_material__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/material */ "./node_modules/@angular/material/esm5/material.es5.js");
/* harmony import */ var _bottom_sheet_bottom_sheet_component__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./bottom-sheet/bottom-sheet.component */ "./src/app/tour-list/bottom-sheet/bottom-sheet.component.ts");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/fesm5/router.js");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (undefined && undefined.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};




var TourListComponent = /** @class */ (function () {
    function TourListComponent(bottomSheet, route) {
        var _this = this;
        this.bottomSheet = bottomSheet;
        this.route = route;
        this.route.queryParams.subscribe(function (queryParams) {
            _this.params = queryParams;
        });
    }
    TourListComponent.prototype.openBottomSheet = function () {
        this.bottomSheet.open(_bottom_sheet_bottom_sheet_component__WEBPACK_IMPORTED_MODULE_2__["BottomSheetComponent"]);
    };
    TourListComponent.prototype.ngOnInit = function () {
    };
    TourListComponent.prototype.receiveParams = function ($event) {
        this.params = $event;
        console.log('params received');
        console.log($event);
    };
    TourListComponent = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["Component"])({
            selector: 'app-tour-list',
            template: __webpack_require__(/*! ./tour-list.component.html */ "./src/app/tour-list/tour-list.component.html"),
            styles: [__webpack_require__(/*! ./tour-list.component.scss */ "./src/app/tour-list/tour-list.component.scss")]
        }),
        __metadata("design:paramtypes", [_angular_material__WEBPACK_IMPORTED_MODULE_1__["MatBottomSheet"],
            _angular_router__WEBPACK_IMPORTED_MODULE_3__["ActivatedRoute"]])
    ], TourListComponent);
    return TourListComponent;
}());



/***/ }),

/***/ "./src/app/tour-list/tour-list.module.ts":
/*!***********************************************!*\
  !*** ./src/app/tour-list/tour-list.module.ts ***!
  \***********************************************/
/*! exports provided: TourListModule */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "TourListModule", function() { return TourListModule; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/fesm5/core.js");
/* harmony import */ var _angular_common__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/common */ "./node_modules/@angular/common/fesm5/common.js");
/* harmony import */ var _tour_list_routing_module__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./tour-list-routing.module */ "./src/app/tour-list/tour-list-routing.module.ts");
/* harmony import */ var _angular_material__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! @angular/material */ "./node_modules/@angular/material/esm5/material.es5.js");
/* harmony import */ var _angular_flex_layout__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! @angular/flex-layout */ "./node_modules/@angular/flex-layout/esm5/flex-layout.es5.js");
/* harmony import */ var _angular_common_http__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! @angular/common/http */ "./node_modules/@angular/common/fesm5/http.js");
/* harmony import */ var ngx_infinite_scroll__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(/*! ngx-infinite-scroll */ "./node_modules/ngx-infinite-scroll/modules/ngx-infinite-scroll.es5.js");
/* harmony import */ var _angular_forms__WEBPACK_IMPORTED_MODULE_7__ = __webpack_require__(/*! @angular/forms */ "./node_modules/@angular/forms/fesm5/forms.js");
/* harmony import */ var _tour_list_component__WEBPACK_IMPORTED_MODULE_8__ = __webpack_require__(/*! ./tour-list.component */ "./src/app/tour-list/tour-list.component.ts");
/* harmony import */ var _items_items_component__WEBPACK_IMPORTED_MODULE_9__ = __webpack_require__(/*! ./items/items.component */ "./src/app/tour-list/items/items.component.ts");
/* harmony import */ var _sidebar_sidebar_component__WEBPACK_IMPORTED_MODULE_10__ = __webpack_require__(/*! ./sidebar/sidebar.component */ "./src/app/tour-list/sidebar/sidebar.component.ts");
/* harmony import */ var _bottom_sheet_bottom_sheet_component__WEBPACK_IMPORTED_MODULE_11__ = __webpack_require__(/*! ./bottom-sheet/bottom-sheet.component */ "./src/app/tour-list/bottom-sheet/bottom-sheet.component.ts");
/* harmony import */ var _items_snackbar_snackbar_component__WEBPACK_IMPORTED_MODULE_12__ = __webpack_require__(/*! ./items/snackbar/snackbar.component */ "./src/app/tour-list/items/snackbar/snackbar.component.ts");
/* harmony import */ var _sorting_sorting_component__WEBPACK_IMPORTED_MODULE_13__ = __webpack_require__(/*! ./sorting/sorting.component */ "./src/app/tour-list/sorting/sorting.component.ts");
var __decorate = (undefined && undefined.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};


// routing


// material flex layout

// http client

// infinite scroll








var TourListModule = /** @class */ (function () {
    function TourListModule() {
    }
    TourListModule = __decorate([
        Object(_angular_core__WEBPACK_IMPORTED_MODULE_0__["NgModule"])({
            imports: [
                _angular_common__WEBPACK_IMPORTED_MODULE_1__["CommonModule"],
                _tour_list_routing_module__WEBPACK_IMPORTED_MODULE_2__["TourListRoutingModule"],
                _angular_forms__WEBPACK_IMPORTED_MODULE_7__["FormsModule"], _angular_forms__WEBPACK_IMPORTED_MODULE_7__["ReactiveFormsModule"],
                _angular_material__WEBPACK_IMPORTED_MODULE_3__["MatIconModule"], _angular_material__WEBPACK_IMPORTED_MODULE_3__["MatButtonModule"], _angular_material__WEBPACK_IMPORTED_MODULE_3__["MatFormFieldModule"], _angular_material__WEBPACK_IMPORTED_MODULE_3__["MatInputModule"], _angular_material__WEBPACK_IMPORTED_MODULE_3__["MatCardModule"], _angular_material__WEBPACK_IMPORTED_MODULE_3__["MatDatepickerModule"], _angular_material__WEBPACK_IMPORTED_MODULE_3__["MatNativeDateModule"], _angular_material__WEBPACK_IMPORTED_MODULE_3__["MatSidenavModule"], _angular_material__WEBPACK_IMPORTED_MODULE_3__["MatSelectModule"], _angular_material__WEBPACK_IMPORTED_MODULE_3__["MatProgressSpinnerModule"], _angular_material__WEBPACK_IMPORTED_MODULE_3__["MatBottomSheetModule"], _angular_material__WEBPACK_IMPORTED_MODULE_3__["MatSnackBarModule"], _angular_material__WEBPACK_IMPORTED_MODULE_3__["MatAutocompleteModule"],
                _angular_flex_layout__WEBPACK_IMPORTED_MODULE_4__["FlexLayoutModule"],
                _angular_common_http__WEBPACK_IMPORTED_MODULE_5__["HttpClientModule"],
                ngx_infinite_scroll__WEBPACK_IMPORTED_MODULE_6__["InfiniteScrollModule"]
            ],
            declarations: [
                _tour_list_component__WEBPACK_IMPORTED_MODULE_8__["TourListComponent"],
                _items_items_component__WEBPACK_IMPORTED_MODULE_9__["ItemsComponent"],
                _sidebar_sidebar_component__WEBPACK_IMPORTED_MODULE_10__["SidebarComponent"],
                _bottom_sheet_bottom_sheet_component__WEBPACK_IMPORTED_MODULE_11__["BottomSheetComponent"],
                _items_snackbar_snackbar_component__WEBPACK_IMPORTED_MODULE_12__["SnackbarComponent"],
                _sorting_sorting_component__WEBPACK_IMPORTED_MODULE_13__["SortingComponent"]
            ],
            entryComponents: [
                _bottom_sheet_bottom_sheet_component__WEBPACK_IMPORTED_MODULE_11__["BottomSheetComponent"],
                _items_snackbar_snackbar_component__WEBPACK_IMPORTED_MODULE_12__["SnackbarComponent"]
            ]
        })
    ], TourListModule);
    return TourListModule;
}());



/***/ })

}]);
//# sourceMappingURL=tour-list-tour-list-module.js.map