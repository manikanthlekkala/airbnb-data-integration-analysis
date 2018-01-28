New-Item -ItemType directory -Path Filtered-data -Force
cls
Write-Host ""
Write-Host "Filtering data please wait...."
# Reviewers
Import-Csv reviews.csv |select reviewer_id,reviewer_name | sort reviewer_id -unique | Export-Csv -Path Filtered-data\reviewers.csv -Encoding ascii -Force -NoTypeInformation
$xl = new-object -comobject excel.application
$xl.visible = $True
$Workbook = $xl.workbooks.open("D:\airbnb\boston-airbnb-open-data\Filtered-data\reviewers.csv")
$Worksheets = $Workbooks.worksheets
$Workbook.SaveAs("D:\airbnb\boston-airbnb-open-data\Filtered-data\csv-excel\reviewers.xlsm",52)
$Workbook.Saved = $True
$xl.Quit()
# Reviews
Import-Csv reviews.csv |select id,reviewer_id,listing_id,date,comments | sort id -unique | Export-Csv -Path Filtered-data\reviews.csv -Encoding ascii -Force -NoTypeInformation
$xl = new-object -comobject excel.application
$xl.visible = $True
$Workbook = $xl.workbooks.open("D:\airbnb\boston-airbnb-open-data\Filtered-data\reviews.csv")
$Worksheets = $Workbooks.worksheets
$Workbook.SaveAs("D:\airbnb\boston-airbnb-open-data\Filtered-data\csv-excel\reviews.xlsm",52)
$Workbook.Saved = $True
$xl.Quit()
# Calendar
Import-Csv calendar.csv |select listing_id,date,available,price | Export-Csv -Path Filtered-data\calendar.csv -Encoding ascii -Force -NoTypeInformation
$xl = new-object -comobject excel.application
$xl.visible = $True
$Workbook = $xl.workbooks.open("D:\airbnb\boston-airbnb-open-data\Filtered-data\calendar.csv")
$Worksheets = $Workbooks.worksheets
$Workbook.SaveAs("D:\airbnb\boston-airbnb-open-data\Filtered-data\csv-excel\calendar.xlsm",52);
$Workbook.Saved = $True
$xl.Quit()
#Locations
$CSV = Import-Csv listings.csv  |select @{Name=”location_id”;Expression={$_.””}}, host_location | sort host_location -unique 
$value =0;
FOREACH($ReadData in $CSV) {$ReadData.location_id=$value;$value++}
$CSV| export-csv -path Filtered-data\locations.csv -Encoding ascii -Force -NoTypeInformation
$xl = new-object -comobject excel.application
$xl.visible = $True
$Workbook = $xl.workbooks.open("D:\airbnb\boston-airbnb-open-data\Filtered-data\locations.csv")
$Worksheets = $Workbooks.worksheets
$Workbook.SaveAs("D:\airbnb\boston-airbnb-open-data\Filtered-data\csv-excel\locations.xlsm",52)
$Workbook.Saved = $True
$xl.Quit()
#Hosts
$names = import-csv Filtered-data\locations.csv |select  location_id,host_location
$sites = import-csv listings.csv | select host_id ,host_name,host_url,host_since, host_location,host_response_rate,host_acceptance_rate,host_is_superhost,host_has_profile_pic,host_identity_verified | sort host_id -unique
$namesMap = @{}
$names| ForEach-Object { $namesMap[$_.host_location] = $_.location_id } 
$merged = $sites | ForEach-Object {
  $site=$_
    [pscustomobject]@{"host_id"=$site.host_id;"host_name"=$site.host_name; "host_url"=$site.host_url; "host_since"=$site.host_since; "location_id"=$namesMap[$site.host_location]; "host_response_rate"=$site.host_response_rate;"host_acceptance_rate"=$site.host_acceptance_rate; "host_is_superhost"=$site.host_is_superhost; "host_has_profile_pic"=$site.host_has_profile_pic;"host_identity_verified"=$site.host_identity_verified } 
}
$merged | ForEach-Object{
$_.host_response_rate = $_.host_response_rate.replace("N/A","0")
$_.host_acceptance_rate = $_.host_acceptance_rate.replace("N/A","0")
$_.host_response_rate = $_.host_response_rate.replace("%","")
$_.host_acceptance_rate = $_.host_acceptance_rate.replace("%","")
}
$merged | Export-Csv -path Filtered-data\hosts.csv -Encoding ascii -Force -NoTypeInformation
$xl = new-object -comobject excel.application
$xl.visible = $True
$Workbook = $xl.workbooks.open("D:\airbnb\boston-airbnb-open-data\Filtered-data\hosts.csv")
$Worksheets = $Workbooks.worksheets
$Workbook.SaveAs("D:\airbnb\boston-airbnb-open-data\Filtered-data\csv-excel\hosts.xlsm",52)
$Workbook.Saved = $True
$xl.Quit()
#Listings
import-csv listings.csv | select id,listing_url,name,host_id,street,property_type,room_type,accommodates,bedrooms,beds,amenities,number_of_reviews,review_scores_rating,review_scores_accuracy,review_scores_cleanliness,review_scores_checkin,review_scores_communication,review_scores_location,review_scores_value,instant_bookable,cancellation_policy | sort id -Unique| Export-Csv -Path Filtered-data\listings.csv -Encoding ascii -Force -NoTypeInformation
$xl = new-object -comobject excel.application
$xl.visible = $True
$Workbook = $xl.workbooks.open("D:\airbnb\boston-airbnb-open-data\Filtered-data\listings.csv")
$Worksheets = $Workbooks.worksheets
$Workbook.SaveAs("D:\airbnb\boston-airbnb-open-data\Filtered-data\csv-excel\Listings.xlsm",52)
$Workbook.Saved = $True
$xl.Quit()