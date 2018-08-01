
# workout builder  
A Workout Builder App  
  
Live Demo: https://gentle-dawn-91129.herokuapp.com  
  
**Ruby on Rails API-only App**  
  
Before starting I hope you have the Ruby v2.3.3 on Rails v5.2 environment setup properly  
  
## DB Setup  
*Development configuration in database.yml is for MySQL*  
  
1. Before installing create a database 'workout-builder'  
2. Create /config/application.yml file and set the database user and password in local ENV parameters  
3. Run the install  
4. In order to use Rails credentials you need to have master key in config/master.key or an environment variable RAILS_MASTER_KEY  
4. Generate a secret_key_base with 'rake secret' and copy it in the SECRET_KEY_BASE ENV variable  
5. Run migrations and seed the demo data  
6. Run the Rails server  
7. There is no step seven, you are ready to test the app  
  
## API  
*I use POSTMAN API Dev Environment for testing*  
  
### Sign up  
POST your-url/users/create  
**Headers:**   
Content-Type: application/json  
Body:  

    {  
	    "user": {  
	        "email": "your.name@email.com",  
	        "password": "password",  
	        "username": "yourname"  
	    }  
    }


### Sign in and get a token  
**POST** your-url/user-token  
**Headers:**  
    Content-Type: application/json  
**Body:**  

    {  
	    "auth": {  
	        "email": "your.name@email.com",  
	        "password": "password"  
	    }  
    }


### Check Auth Status  
**GET** your-url/auth  
**Headers:**  
    Authorization: Bearer your-token  
    Content-Type: application/json  
  
### Current Auth User  
**GET** your-url/users/current  
**Headers:**  
    Authorization: Bearer your-token  
    Content-Type: application/json  
*Returns the informations and Workouts of the loggedin User*  
  
### Exercises  
**GET** your-url/exercises  
**Headers:**  
    Authorization: Bearer your-token  
    Content-Type: application/json  
Returns all Exercises  
  
### Workouts  
**GET** your-url/workouts  
**Headers:**  
    Authorization: Bearer your-token  
    Content-Type: application/json  
*Returns all Workouts from all Users (In the future only an Admin will have access)*  
  
### Exercise Types  
**GET** your-url/exercise-types  
**Headers:**  
    Authorization: Bearer your-token  
    Content-Type: application/json  
  
### Muscle Groups  
**GET** your-url/muscle-groups  
**Headers:**  
    Authorization: Bearer your-token  
	Content-Type: application/json  
  
**Production ENV is configured for PostgreSQL and Heroku**  
*After Deploying the App, Setup the RAILS_MASTER_KEY and SECRET_KEY_BASE ENV variable so you could Auth the User and get the token*
