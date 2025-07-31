sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'students/test/integration/FirstJourney',
		'students/test/integration/pages/StudentsList',
		'students/test/integration/pages/StudentsObjectPage',
		'students/test/integration/pages/EnrollmentsObjectPage'
    ],
    function(JourneyRunner, opaJourney, StudentsList, StudentsObjectPage, EnrollmentsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('students') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheStudentsList: StudentsList,
					onTheStudentsObjectPage: StudentsObjectPage,
					onTheEnrollmentsObjectPage: EnrollmentsObjectPage
                }
            },
            opaJourney.run
        );
    }
);