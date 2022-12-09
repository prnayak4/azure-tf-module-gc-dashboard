variable "resourcegroupname" {
    type =string
    description ="Resource Group Name "
    #default = "rg-avs-migrate-manage-kcl-westus2-001"
}
variable "location" {
    type =string
    description ="Location Name . Yo must use the  same of your Resource Group Location"
    #default = "westus2"
}
variable "GuestConfigurationWorkbookTg" {
    type =string
    description ="Workbook Hidden Title for GuestConfigurationWorkbook. This must be the workbook Hidden Tag . You can find this tag from Workbook json file"
    #default = "GuestConfiguration"
}
variable "DashboardName" {
    type=string
    description= "Dashboard Name "
   # default = "KCNS-CLOUDOPS-DASHBOARD"
}
