import { Visual } from "../../src/visual";
import powerbiVisualsApi from "powerbi-visuals-api"
import IVisualPlugin = powerbiVisualsApi.visuals.plugins.IVisualPlugin
import VisualConstructorOptions = powerbiVisualsApi.extensibility.visual.VisualConstructorOptions
var powerbiKey: any = "powerbi";
var powerbi: any = window[powerbiKey];

var subplotDA977CD1525C4D0B96F571BCD64B0850: IVisualPlugin = {
    name: 'subplotDA977CD1525C4D0B96F571BCD64B0850',
    displayName: 'Subplot_graph',
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
    powerbi.visuals.plugins["subplotDA977CD1525C4D0B96F571BCD64B0850"] = subplotDA977CD1525C4D0B96F571BCD64B0850;
}

export default subplotDA977CD1525C4D0B96F571BCD64B0850;