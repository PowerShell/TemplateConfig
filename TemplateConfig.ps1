
<#PSScriptInfo

.VERSION 1.0.0.2

.GUID ba80cc84-9f23-47a8-9ae4-402e3f7e25c7

.AUTHOR Michael Greene

.COMPANYNAME Microsoft Corporation

.COPYRIGHT 

.TAGS DSC Config

.LICENSEURI https://github.com/PowerShell/TemplateConfig/blob/master/LICENSE

.PROJECTURI http://github.com/powershell/templateconfig

.ICONURI 

.EXTERNALMODULEDEPENDENCIES

.REQUIREDSCRIPTS 

.EXTERNALSCRIPTDEPENDENCIES 

.RELEASENOTES


#>

#Requires -Module TemplateConfigModule
#Requires -Module xPSDesiredStateConfiguration

<# 

.DESCRIPTION 
 Example configuration script to demonstrate pairing a PowerShell Desired State Configuration script with a module that contains supporting assets. 

.EXAMPLE
TemplateConfig -configdata c:\dsc\TemplateConfig\ConfigurationData\TemplateConf.configdata.psd1 -outpath c:\dsc\TemplateConfig\MOF
#> 

configuration TemplateConfig
{
    Import-DscResource -ModuleName 'PSDesiredStateConfiguration','xPSDesiredStateConfiguration'
    
    Node $AllNodes.NodeName
    {
        File testfile
        {
            Ensure          = 'Present'
            DestinationPath = $Node.Path
            Contents        = $Node.Contents
        }

        xGroup testGroup
        {
            Ensure = 'Present'
            GroupName = $Node.GroupName
        }
    }
}
