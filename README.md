# Umbrella

A weather app to get each hour the main weather condition

## Xcode
- version 13.2.1
- Min iOS version required: 15

## API used

I used the openWeather API to retrieve all datas displayed
[Website](https://openweathermap.org/)
[API Documentation](https://openweathermap.org/api/one-call-api)

## My choices

### swiftUI

I choosed to made a full swiftUI application. Actually I have only made some little swiftUI components directly integrated inside UIKit objects.
Currently I'm working on a plan to integrate more swiftUI objects inside the application and addapting our navigation. This application will help me to define a strategy to do it and detect potential pain point or improvments.

### Combine and/or async-await

I have read some articles about these new features but never made experiment with them. I used this application to test async-await and combine, check and analize how we can use them, see differences, ...

I made 2 differents presenter and repository to display the first screen which display the weather condition per hour
- HourlyListPresenterCombineImp / WeatherRepositoryCombine
- HourlyListPresenterAsyncImp / WeatherRepositoryAsync

=> To switch between each solution: We have a boolean "useCombine" inside "UmbrellaApp.swift". 


## Demo

[Demo](./Demo.mov)

