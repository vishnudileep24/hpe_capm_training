sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'hpe/vishnu/managepo/test/integration/FirstJourney',
		'hpe/vishnu/managepo/test/integration/pages/POsList',
		'hpe/vishnu/managepo/test/integration/pages/POsObjectPage',
		'hpe/vishnu/managepo/test/integration/pages/POItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, POsList, POsObjectPage, POItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('hpe/vishnu/managepo') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePOsList: POsList,
					onThePOsObjectPage: POsObjectPage,
					onThePOItemsObjectPage: POItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);