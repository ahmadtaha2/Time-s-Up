//TODO: this file gets and processes data from the api
class AppModel {
  String? app_name;
}

class WebsiteModel {
  String? website_name;
}

void updateAppList(String value){
  //TODO: app search filter
  // use this:
  /*
  setState(() {
      display_list = main_movies_list
          .where(
            (element) => element.movie_title!.toLowerCase().contains(
                  value.toLowerCase(),
                ),
          )
          .toList();
    });
   */
  // but change the names as needed
}

void updateWebList(String value){
  //TODO: website search filter
  // use this:
  /*
  setState(() {
      display_list = main_movies_list
          .where(
            (element) => element.movie_title!.toLowerCase().contains(
                  value.toLowerCase(),
                ),
          )
          .toList();
    });
   */
  // but change the names as needed
}

/*
static List<MovieModel> main_movies_list = [
    // this is a test code so to try it on add some data to proccess and reveal...
    // to activate the search feature we need an api to feed the search engine with data eg: app name, time spent, ...etc
  ];
 */

/*
List<MovieModel> display_list = List.from(main_movies_list);
 */