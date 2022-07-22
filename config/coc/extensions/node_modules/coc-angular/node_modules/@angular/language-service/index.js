/**
 * @license
 * Copyright Google LLC All Rights Reserved.
 *
 * Use of this source code is governed by an MIT-style license that can be
 * found in the LICENSE file at https://angular.io/license
 */
(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define("@angular/language-service", ["require", "exports"], factory);
    }
})(function (require, exports) {
    "use strict";
    const factory = (tsModule) => {
        let plugin;
        return {
            create(info) {
                plugin = require(`./bundles/language-service.js`)(tsModule);
                return plugin.create(info);
            },
            getExternalFiles(project) {
                var _a, _b;
                return (_b = (_a = plugin === null || plugin === void 0 ? void 0 : plugin.getExternalFiles) === null || _a === void 0 ? void 0 : _a.call(plugin, project)) !== null && _b !== void 0 ? _b : [];
            },
            onConfigurationChanged(config) {
                var _a;
                (_a = plugin === null || plugin === void 0 ? void 0 : plugin.onConfigurationChanged) === null || _a === void 0 ? void 0 : _a.call(plugin, config);
            },
        };
    };
    return factory;
});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiaW5kZXguanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi8uLi8uLi8uLi8uLi9wYWNrYWdlcy9sYW5ndWFnZS1zZXJ2aWNlL2luZGV4LnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBOzs7Ozs7R0FNRzs7Ozs7Ozs7Ozs7SUFVSCxNQUFNLE9BQU8sR0FBa0MsQ0FBQyxRQUFRLEVBQWdCLEVBQUU7UUFDeEUsSUFBSSxNQUFvQixDQUFDO1FBRXpCLE9BQU87WUFDTCxNQUFNLENBQUMsSUFBZ0M7Z0JBQ3JDLE1BQU0sR0FBRyxPQUFPLENBQUMsK0JBQStCLENBQUMsQ0FBQyxRQUFRLENBQUMsQ0FBQztnQkFDNUQsT0FBTyxNQUFNLENBQUMsTUFBTSxDQUFDLElBQUksQ0FBQyxDQUFDO1lBQzdCLENBQUM7WUFDRCxnQkFBZ0IsQ0FBQyxPQUEwQjs7Z0JBQ3pDLE9BQU8sTUFBQSxNQUFBLE1BQU0sYUFBTixNQUFNLHVCQUFOLE1BQU0sQ0FBRSxnQkFBZ0IsdURBQUcsT0FBTyxDQUFDLG1DQUFJLEVBQUUsQ0FBQztZQUNuRCxDQUFDO1lBQ0Qsc0JBQXNCLENBQUMsTUFBb0I7O2dCQUN6QyxNQUFBLE1BQU0sYUFBTixNQUFNLHVCQUFOLE1BQU0sQ0FBRSxzQkFBc0IsdURBQUcsTUFBTSxDQUFDLENBQUM7WUFDM0MsQ0FBQztTQUNGLENBQUM7SUFDSixDQUFDLENBQUM7SUFPRixPQUFTLE9BQU8sQ0FBQyIsInNvdXJjZXNDb250ZW50IjpbIi8qKlxuICogQGxpY2Vuc2VcbiAqIENvcHlyaWdodCBHb29nbGUgTExDIEFsbCBSaWdodHMgUmVzZXJ2ZWQuXG4gKlxuICogVXNlIG9mIHRoaXMgc291cmNlIGNvZGUgaXMgZ292ZXJuZWQgYnkgYW4gTUlULXN0eWxlIGxpY2Vuc2UgdGhhdCBjYW4gYmVcbiAqIGZvdW5kIGluIHRoZSBMSUNFTlNFIGZpbGUgYXQgaHR0cHM6Ly9hbmd1bGFyLmlvL2xpY2Vuc2VcbiAqL1xuXG5pbXBvcnQgKiBhcyB0cyBmcm9tICd0eXBlc2NyaXB0L2xpYi90c3NlcnZlcmxpYnJhcnknO1xuaW1wb3J0IHtOZ0xhbmd1YWdlU2VydmljZSwgUGx1Z2luQ29uZmlnfSBmcm9tICcuL2FwaSc7XG5cbmludGVyZmFjZSBQbHVnaW5Nb2R1bGUgZXh0ZW5kcyB0cy5zZXJ2ZXIuUGx1Z2luTW9kdWxlIHtcbiAgY3JlYXRlKGNyZWF0ZUluZm86IHRzLnNlcnZlci5QbHVnaW5DcmVhdGVJbmZvKTogTmdMYW5ndWFnZVNlcnZpY2U7XG4gIG9uQ29uZmlndXJhdGlvbkNoYW5nZWQ/KGNvbmZpZzogUGx1Z2luQ29uZmlnKTogdm9pZDtcbn1cblxuY29uc3QgZmFjdG9yeTogdHMuc2VydmVyLlBsdWdpbk1vZHVsZUZhY3RvcnkgPSAodHNNb2R1bGUpOiBQbHVnaW5Nb2R1bGUgPT4ge1xuICBsZXQgcGx1Z2luOiBQbHVnaW5Nb2R1bGU7XG5cbiAgcmV0dXJuIHtcbiAgICBjcmVhdGUoaW5mbzogdHMuc2VydmVyLlBsdWdpbkNyZWF0ZUluZm8pOiBOZ0xhbmd1YWdlU2VydmljZSB7XG4gICAgICBwbHVnaW4gPSByZXF1aXJlKGAuL2J1bmRsZXMvbGFuZ3VhZ2Utc2VydmljZS5qc2ApKHRzTW9kdWxlKTtcbiAgICAgIHJldHVybiBwbHVnaW4uY3JlYXRlKGluZm8pO1xuICAgIH0sXG4gICAgZ2V0RXh0ZXJuYWxGaWxlcyhwcm9qZWN0OiB0cy5zZXJ2ZXIuUHJvamVjdCk6IHN0cmluZ1tdIHtcbiAgICAgIHJldHVybiBwbHVnaW4/LmdldEV4dGVybmFsRmlsZXM/Lihwcm9qZWN0KSA/PyBbXTtcbiAgICB9LFxuICAgIG9uQ29uZmlndXJhdGlvbkNoYW5nZWQoY29uZmlnOiBQbHVnaW5Db25maWcpOiB2b2lkIHtcbiAgICAgIHBsdWdpbj8ub25Db25maWd1cmF0aW9uQ2hhbmdlZD8uKGNvbmZpZyk7XG4gICAgfSxcbiAgfTtcbn07XG5cbi8qKlxuICogVHNzZXJ2ZXIgZXhwZWN0cyBgQGFuZ3VsYXIvbGFuZ3VhZ2Utc2VydmljZWAgdG8gcHJvdmlkZSBhIGZhY3RvcnkgZnVuY3Rpb25cbiAqIGFzIHRoZSBkZWZhdWx0IGV4cG9ydCBvZiB0aGUgcGFja2FnZS4gU2VlXG4gKiBodHRwczovL2dpdGh1Yi5jb20vbWljcm9zb2Z0L1R5cGVTY3JpcHQvYmxvYi9mNGQwZWE2NTM5ZWRiNmQ4ZjcwYjYyNjEzMmQ2ZjlhYzFhYzQyODFhL3NyYy9zZXJ2ZXIvcHJvamVjdC50cyNMMTYxMVxuICovXG5leHBvcnQgPSBmYWN0b3J5O1xuIl19