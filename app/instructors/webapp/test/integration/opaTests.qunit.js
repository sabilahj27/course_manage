sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'instructors/test/integration/FirstJourney',
		'instructors/test/integration/pages/InstructorsList',
		'instructors/test/integration/pages/InstructorsObjectPage',
		'instructors/test/integration/pages/CoursesObjectPage'
    ],
    function(JourneyRunner, opaJourney, InstructorsList, InstructorsObjectPage, CoursesObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('instructors') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheInstructorsList: InstructorsList,
					onTheInstructorsObjectPage: InstructorsObjectPage,
					onTheCoursesObjectPage: CoursesObjectPage
                }
            },
            opaJourney.run
        );
    }
);