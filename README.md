# FlutterExcercise
Flutter exercise on MVVM model

#Exercise on MVVM pattern in Flutter
#Home Screen
	
	* Home screen uses data from json to build carasoul widget
	* HomeViewModel class is responsible to get contains from json and parse in respective Models
	* on successfull update app will load Carosoul with number of items from response
	* Each Carousel item has image, header, and description

#Home Detail
	
	* On click on Carasoul app will navigate to next page which is HomeItemDetailsPage
	* It will display list of image and notes associated with particular carasoul items
	
#Home Details Note

	* On click on image App will navigate and load list of notes available with particular Home details 
	* It is simple plain list with Cell tiles

#WebView

	* On click on any of the Note app will open In App browser and respective url

