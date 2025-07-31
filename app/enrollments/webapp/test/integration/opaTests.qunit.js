sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'enrollments/test/integration/FirstJourney',
		'enrollments/test/integration/pages/EnrollmentsList',
		'enrollments/test/integration/pages/EnrollmentsObjectPage'
    ],
    function(JourneyRunner, opaJourney, EnrollmentsList, EnrollmentsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('enrollments') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheEnrollmentsList: EnrollmentsList,
					onTheEnrollmentsObjectPage: EnrollmentsObjectPage
                }
            },
            opaJourney.run
        );
    }
);