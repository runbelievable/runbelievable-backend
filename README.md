# Runbelievable-backend

## Background and Description

"Runbelievable" is an app that was created to enhance the safety and experience of trail running by matching like-minded and like-abilitied people together for a great trail running experience. 

This application is the culmination of three applications but we will stick with discussing the functionality provided by the Back End and the microservice that was created and consumed by the the Back End team. 

### Many-to-Many
* This project utilizes a many-to-many relationships, connecting multiple tables in our database for an easier user experience.

![image](https://user-images.githubusercontent.com/52808022/83548986-ce990680-a4c1-11ea-9b8d-ff522c30f20b.png)

## Access
Start hitting our user and run endpoints, hassle-free, by visiting https://run-be.herokuapp.com/

# Endpoints provided by runbelievable-backend
Our API has the following RESTful resources namespaced under api/v1:
  - Users
  - Runs
  - User-runs
  - Run-users
  
It also has specialized endpoints for:
  - Random trail provider based on user's location
  - Messaging between two users
 
## Work on this project yourself!
-To get started, please visit https://github.com/runbelievable/runbelievable-backend fork and clone this project to your local machine!

-Once you are on the site, look for the green 'Clone or Download' button on the right side of the web page.

![image](https://user-images.githubusercontent.com/52808022/83550110-8da1f180-a4c3-11ea-959c-5ef198f6363d.png)

Next, copy the SSH Key after you have pressed the green 'Clone or Download' button.

![image](https://user-images.githubusercontent.com/52808022/83550110-8da1f180-a4c3-11ea-959c-5ef198f6363d.png)

Then, go to the directory in your temrinal where you would like
this project to be. Type in 'git clone' and the paste the copied SSH key in to your terminal before pressing enter.

![image](https://user-images.githubusercontent.com/52808022/83549831-271cd380-a4c3-11ea-84cd-4ddc5cd9c007.png)

You can now move in to the project directory and open it from your text editor.

## User for Runbelievable
When registering, fill in all the fields with your information and remember, your username must be unique!

Gif*

Using a unique username allows you to register and view your profile page.

*image

### Rails
* Create routes for namespaced routes
* Use Sessions to store information about a user and implement login/logout functionality
* Use BCrypt to hash user passwords before storing in the database
* Use filters (e.g. `before_action`) in a Rails controller

## Application Resources

- Uses Rails 5.2.x
- Uses PostgreSQL
- Uses 'bcrypt' for authentication
- Controller and model code was be tested via feature tests and model tests, respectively
- Created using good GitHub branching, team code reviews via GitHub comments, and use of the project planning tool, github projects

## Permitted

- To use FactoryBot to speed up your test development
- To use "rails generators" to speed up your app development

## Contributors and links to their Github Repositories:

* Alex Gallant: https://github.com/agallant121?tab=repositories

* Pierce Alworth: https://github.com/palworth?tab=repositories


