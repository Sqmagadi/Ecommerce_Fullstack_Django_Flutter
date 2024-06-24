# Ecommerce_Fullstack_Django_Flutter
This is a Full-Stack Ecommerce application built in Django and Flutter. The Application uses Django Rest Framework

The Mobile frontend is build on Flutter supported by Dart programming. 

Ensure the backend is running before compilling the flutter app



# Backend

`py manage.py runserver` on the same directory as **manage.py** file

Run the app on a browser on `127.0.0.1:8000`

# Frontend (Mobile)

`flutter run` on the **main.dart** file

**Note:** Look for `config.dart` in the `lib` directory and ensure you cofigure the **BaseUrl** depending on the environment you are running the app so that the app can query or connect to the backend. If this is not done correctly, no connection will be created and therefore no data will be rendered on the app.

`http//127.0.0.1:800/` for Web browser

`http//10.0.2.2:800` for android emulator


**Note:** The payment gateway (paypal) will only work on an android or IOS device. Test in an emulator (will not work on a web browser or on an operating system[windows or linux]).
