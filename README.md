# Runbelievable-backend

![image](https://user-images.githubusercontent.com/52808022/83552326-cee7d080-a4c6-11ea-8c50-525c2fce399f.png)

## Background and Description

"Runbelievable" is an app that was created to enhance the safety and experience of trail running by matching like-minded and like-abilitied people together for a great trail running experience. 

This application is the culmination of three applications but we will stick with discussing the functionality provided by the Back End application and the MicroService that was created by the Back End team and consumed by the Back End application. 

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
  
# Sinatra MicroService consumption
 - We created a a microservice for the user by taking in a user's location, turning that location into lat and long coordinates and using those coordinates to find running trails in the user's area.
 
 ![image](https://user-images.githubusercontent.com/52808022/83551036-02296000-a4c5-11ea-8bc0-7907e4892300.png)
 
 If you would like to use this application yourself, please follow the guidelines provided below and consume:
 
 https://run-be-microservice.herokuapp.com/
 
 Hit the endpoint '/recommended-hikes' by using the key/value of location in the query params to get a random hike/running  trail near your current location.
 
 If you'd like to read more about this MicroService, visit: https://github.com/runbelievable/backend_microservice
 
## Work on this project yourself!
-To get started, please visit https://github.com/runbelievable/runbelievable-backend clone this project to your local machine!

-Once you are on the site, look for the green 'Clone or Download' button on the right side of the web page.

![](https://media.giphy.com/media/YmVGxGSfyUhC8nr7kD/giphy.gif)

Next, copy the SSH Key after you have pressed the green 'Clone or Download' button.

![image](https://user-images.githubusercontent.com/52808022/83550110-8da1f180-a4c3-11ea-959c-5ef198f6363d.png)

Then, go to the directory in your temrinal where you would like
this project to be. Type in 'git clone' and the paste the copied SSH key in to your terminal before pressing enter.

![image](https://user-images.githubusercontent.com/52808022/83549831-271cd380-a4c3-11ea-84cd-4ddc5cd9c007.png)

You can now move in to the project directory and open it from your text editor.

## User for Runbelievable
When registering, fill in all the fields with your information and remember, your username must be unique!

![image](https://user-images.githubusercontent.com/52808022/83552407-f0e15300-a4c6-11ea-8085-6f524983ed5d.png)

Using a unique username allows you to register and view your profile page.

![image](https://user-images.githubusercontent.com/52808022/83552445-035b8c80-a4c7-11ea-88b2-629f4f29ab17.png)

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


