*This was a Flatiron School student project from 2016 and is no longer actively maintained.*

### Mini-project time!

After a week of Flatiron School, you know that we are a fan of group work. However for teachers, making the groups can get tedious.  Let's make a grouping application that all of the classes at Flatiron School can use.

We'll work on this project for the rest of today and tomorrow, so take your time to make it nice!  You'll also give a brief demonstration of your application to the rest of the class.

To get started, you should have one team member fork this repository and add the others on your team as collaborators.

## The application should have the following requirements
 1. We have multiple different courses occurring at Flatiron right now, so we should be able to associate a student with a particular class.
 2. Then for that course, we should be able to specify how large teams size should be.
 3. We like to have teachers assigned to a couple of groups so that a given teacher can review a groups' code, or keep tabs on a given group, so the application should automatically distribute groups among teachers. Each group should have one teacher.
 4. Keep in mind single source of truth. Every piece of information is stored once, and only once. When you change the data, the entire app should recognize the change.
 5. Your application should have some way of preventing people from working in the same groups multiple times. Spend some time thinking through how you'll design this algorithm.


## Process for building the application
 1. Consider the feature requirements listed above, and any other features you may want in the future.  Make a list of the objects that you will need.
 2. You then want to start drawing relationships between the models.  For example, a course has many students, etc. Spend time modeling out your domain before you start coding.
 3. Consider the methods that will go in each object.  Are there any additional methods, that maybe don't belong in either object?
 4. After having your objects, relationships, and some of the methods mapped out, see if there are any other objects that the methods belong in.  The more objects the better.  Do not be afraid of making small objects.
 5. We've given you empty files for the seed, console, and environment. You're free to refer to previous examples, but write a comment under each line explaining what the code does.

## Process when coding
1. Rephrase the problem
2. Break down the solution of the problem into steps
 - how would you solve this if you didn't have a computer?
 - what information would you need?
 - are you able to solve the problem without code, deconstruct the steps that your brain is doing to solve the problem.
3. Translate those steps into code
   - Coerce - to the data that you want
   - Reject - data that you do not need.

### Hints
1. You'll need classes for students, instructors, classes, and groups.
2. Create a seed file so you can play with the data
3. Spend at least an hour planning how your application will work. How will your classes relate to each other (domain modeling)? What method should each class have?
4. Think about how your application will be run. What information will the user enter to start it?
