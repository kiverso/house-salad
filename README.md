# House Salad Base

This repo is used as a base for the Consuming API lesson taught in Backend Module 3. To complete the lesson you will need to sign-up for an API key from the [ProPublica Congress API](https://projects.propublica.org/api-docs/congress-api/).

### Versions

Rails 5.1.7
Ruby 2.5.3

### Setup

```bash
git clone https://github.com/turingschool-examples/house-salad-base house-salad

cd house-salad

rails db:{create,migrate}
```

### Refactor
I refactored the the feature that allowed a user to search a state and return their members of the house. I accomplished this by first creating a Member object, a SearchResults object, and a ProbublicaService. 

#### PropublicaService
The service handles getting information from the API and has a members_of_house method which takes a state as an argument and fetches the information from the API for that state's house members.

#### SearchResults
SearchResults has a members method that parses the data from JSON and creates a Member object for each member of congress for a given state.

#### Member
This object contains the member of congress information. Attributes are name, role, party, and district. These are passed to the view instead of the hash that was previously passed to the view.

By refactoring this way the app will no longer pass a hash to the view and instead it passes a ruby object. It also abstracts much of the logic away from the controller where it was previously housed. It is also encapsulated better as now there is a separate class for handling the API call, parsing JSON, and creating objects to be passed to the view. Before the refactor these were all done in the SearchController. Overall the code is now divided up based on the task that it accomplishes. Some drawbacks of this refactor are that previously everything needed to get information to the view for the user to see was housed in the `search_controller.rb` file. This has now been split over multiple files and requires more effort to find the right code. On the flip side, splitting the code up in this was means that it can be used in different ways and that if part of the code breaks such as the API consumption, it will not break the rest of the code. This also means the codebase can be more easily changed and expanded for using other parts of the API other than just house of representatives data.

