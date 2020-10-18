## Welcome to Calorie, Sorted App 🚀 🚀 🍏
a1-s3811920_s3703235_s3610346_s3771369 created by GitHub Classroom
### This app is created by:
* Timal Pathirana 
* Joshua Baruwa
* Abida Aysel 

### Install Pod before running the app
#### 1. Replace your pod file with this code below
```
# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'CalorieCounterApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for CalorieCounterApp
   pod 'Alamofire'
   pod 'AlamofireObjectMapper', '~> 5.2'
   pod 'MBProgressHUD', '~> 1.1.0'
   pod 'IQKeyboardManagerSwift'

  target 'CalorieCounterAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'CalorieCounterAppUITests' do
    # Pods for testing
  end

end
```
#### 2. Insall the pod file using this terminal code
```
pod install
```

