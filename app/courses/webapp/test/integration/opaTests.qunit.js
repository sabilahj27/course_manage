sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'courses/test/integration/FirstJourney',
		'courses/test/integration/pages/CoursesList',
		'courses/test/integration/pages/CoursesObjectPage',
		'courses/test/integration/pages/CourseFeedbacksObjectPage'
    ],
    function(JourneyRunner, opaJourney, CoursesList, CoursesObjectPage, CourseFeedbacksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('courses') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCoursesList: CoursesList,
					onTheCoursesObjectPage: CoursesObjectPage,
					onTheCourseFeedbacksObjectPage: CourseFeedbacksObjectPage
                }
            },
            opaJourney.run
        );
    }
);