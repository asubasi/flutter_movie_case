# flutter_movie_case

<!-- Packages -->
- auto_route => I used the auto_router library, one of the 2 most popular libraries for routing.
- bloc/cubit => I used the bloc/cubit libraries for state management and it was dynamic and functional.
- dio => I used it for accurate and powerful communication with the API. Again, one of the 2 most common libraries.


<!-- NETWORK MANAGER: -->
I used this file to customize the Dio library. For more dynamic and accurate communication with the API, I sent my api key by default in the header and avoided code repetition. I also avoided possible typos.


## Architecture

## Data
    The ApiService class uses Dio to make network requests.
    The API key is set in the headers to authenticate requests.
    The fetchData method fetches data from a given endpoint and handles any errors that occur.

## Domain
    Includes: Entity & Domain
    In this layer, I made the functions and entity models provided in the cubite. With these entity models, I isolated the interface from the data I don't use.

## Pesentation
    In this layer I did the UI operations. Everything that appears on the screen is in this layer. 

## core
    I used it for consistency across the app, keeping the components and theme here.








