# Benjamin Stuart T1A2
Author: Benjamin Stuart  
Date: 03/04/2022  

## R4
1. Provide a link to your source control repository

Github Repo: [https://github.com/BenjaminStuartDev/T1A2 ](https://github.com/BenjaminStuartDev/BenjaminStuart_T1A3) 

Git Log: [Git Log](./docs/gitlog.txt) 

## R5
1. Identify any code style guide or styling conventions that the application will adhere to.
   
   - I used [Rubocop](https://rubocop.org/) as my style guide for this application. 

2. Reference the chosen style guide appropriately.

   - Rubocop can be found here: [Rubocop](https://rubocop.org/)




## R6

1. Develop a list of features that will be included in the application. It must include:
   - at least THREE features
   - describe each feature

My features include: 

**A Menu interface:** Can be used to navigate the entire POS.

**Business Setup:** Used to create and re-create the setup for the business stored in the POS. (e.g. add all employees, add all menu-items, add tables, set the first manager (owner) and set the cafe name)

**Login Menu:** prevents malicious use of the POS through a login verification system. 

**Users can track tables:** Can process and view the bill for a table as well as additional features such as add menu-items to a tables order.

**Manager Permissions:** Controls access to POS settings where features like remove/add staff exist as well as being able to edit staff, edit menu items and edit the business settings.

**Save/Load Functionality:** Saves and loads the program.

## R7

1. Develop an implementation plan which:
   - outlines how each feature will be implemented and a checklist of tasks for each feature
   - prioritise the implementation of different features, or checklist items within a feature
   - provide a deadline, duration or other time indicator for each feature or checklist/checklist-item

2. Utilise a suitable project management platform to track this implementation plan.

3. Provide screenshots/images and/or a reference to an accessible project management platform used to track this implementation plan. 

> Your checklists for each feature should have at least 5 items.

You can find my implementation plan here: 

Source Control (R4): [Benjamin Stuart Trello Board](https://trello.com/invite/b/YSUpwTKT/af5c4127764d71afc2e64f63823d6980/hospitality-pos-system)

## R8 
1. Design help documentation which includes a set of instructions which accurately describe how to use and install the application.

2. You must include:
   - steps to install the application
   - any dependencies required by the application to operate
   - any system/hardware requirements
   - how to use any command line arguments made for the application

You can find my help document here: [help.md](./src/readme.md)

## Gems

1. Json
2. Fileutils
3. TTY Prompt
4. TTY Table
5. Colorize

## R15 Design TWO tests which check that the application is running as expected.

Each test should:
- cover a different feature of the application
- state what is being tested
- provide at least TWO test cases and the expected results for each test case

> An outline of the testing procedure and cases should be included with the source code of the application

During the development of this application I used the Test Driven Development process with the goal of producing a usable, reliable, scalable and functional program. 

To achieve this I used RSPEC (See more here: https://rspec.info/) to unit test methods and classes to ensure that errors are appropriately raised and the program does not break if unexpected inputs are used. In addition to this my tests have an emphasis on ensuring that the methods and classes are working as intended by delivering the correct outputs.

In addition to this I also utilized a range of manual tests during the development phase to ensure the application was scalable with large data sets and usable - that is straight forward in how it should be used. 

All tests can be found in the spec directory located inside the src folder. Each test is written a way that is readable and explains what I am testing. The features of the application that are successfully tested using rspec include: Business Setup, Users can Track Tables and Manager Permissions.