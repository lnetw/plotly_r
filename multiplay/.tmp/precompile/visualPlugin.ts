import { Visual } from "../../src/visual";
import powerbiVisualsApi from "powerbi-visuals-api"
import IVisualPlugin = powerbiVisualsApi.visuals.plugins.IVisualPlugin
import VisualConstructorOptions = powerbiVisualsApi.extensibility.visual.VisualConstructorOptions
var powerbiKey: any = "powerbi";
var powerbi: any = window[powerbiKey];

var multiplay722B4C5DFBF841F2B2042C296BAE66D7: IVisualPlugin = {
    name: 'multiplay722B4C5DFBF841F2B2042C296BAE66D7',
    displayName: 'Multi_graph',
    class: 'Visual',
    apiVersion: '2.6.0',
    create: (options: VisualConstructorOptions) => {
        if (Visual) {
            return new Visual(options);
        }

        throw 'Visual instance not found';
    },
    custom: true
};

if (typeof powerbi !== "undefined") {
    powerbi.visuals = powerbi.visuals || {};
    powerbi.visuals.plugins = powerbi.visuals.plugins || {};
    powerbi.visuals.plugins["multiplay722B4C5DFBF841F2B2042C296BAE66D7"] = multiplay722B4C5DFBF841F2B2042C296BAE66D7;
}

export default multiplay722B4C5DFBF841F2B2042C296BAE66D7;