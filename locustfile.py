from locust import HttpUser, task, between

class MyUser(HttpUser):

    host = "https://jpetstore.aspectran.com"
    
    wait_time = between(1, 3)

    @task
    def login(self):

        response = self.client.post("/account/signonForm", data={
            "username": "testuser7",
            "password": "testuser7pass",
        })
        if response.status_code == 200:
            print("Login successful")
        else:
            print("Login failed")
    
    @task
    def view_account(self):
        self.client.get("/account/view")