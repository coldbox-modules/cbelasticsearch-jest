/**
*********************************************************************************
* Your Copyright
********************************************************************************
*/
component{

    // Module Properties
    this.title 				= "cbElasticSearch-jest";
    this.author 			= "Jon Clausen <jclausen@ortussolutions.com>";
    this.webURL 			= "";
    this.description 		= "JEST Java Client for the cbElasticSearch module";
    this.version			= "1.0.0";
    // If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
    this.viewParentLookup 	= false;
    // If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
    this.layoutParentLookup = false;
    // Module Entry Point
    this.entryPoint			= "cbElasticsearchJest";
    // Model Namespace
    this.modelNamespace		= "cbElasticsearchJest";
    // CF Mapping
    this.cfmapping			= "cbElasticsearchJest";
    // Auto-map models
    this.autoMapModels		= false;
    // Module Dependencies That Must Be Loaded First, use internal names or aliases
    this.dependencies		= [ "cbjavaloader" ];
    // Auto-parse parent settings
    this.parseParentSettings = false;

    variables.configStruct = {};


    function configure(){}

    /**
    * Fired when the module is registered and activated.
    */
    function onLoad(){

        // load DB jars
        var jLoader = wirebox.getInstance( "Loader@cbjavaloader" );
        jLoader.appendPaths( variables.modulePath & "/lib/java" );

        try{
            //test for slf4j installation - if isn't available in the engine, add the optional directory to the paths to provide it
            createObject( "java", "org.slf4j.helpers.Util" );
        } catch( any e ){
            jLoader.appendPaths( variables.modulePath & "/lib/optional" );
        }

        /**
        * Main Configuration Object Singleton
        **/
        binder.map( "JestClient@cbElasticsearch" )
                        .to( '#moduleMapping#.models.JestClient' );

    }

}
