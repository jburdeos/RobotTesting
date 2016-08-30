*** Settings ***
Documentation    Create New Product for Lead Form
Library          Selenium2Library
Library          OperatingSystem


*** Variables ***
${DEV_URL}  http://devtranspar1/
${BROWSER}  Chrome
${FF_PROFILE}   C:/Users/gperez/AppData/Roaming/Mozilla/Firefox/Profiles

*** Test Cases ***
Create Product
    ##open browser  ${DEV_URL}  ${BROWSER}
    ##maximize browser window
    open browser to dev site
    Click link   lnkddAdmin
    Set Selenium Speed  .45 seconds
    Click link   link=Products
    wait until element is not visible   loadingDiv  timeout=50
    Click link   id=lnkNewProduct
    wait until element is not visible   loadingDiv  timeout=50
    Input text          txtProductNumber   Pikachu Product for Lead Form
    Input text          txtProductTitle   Pikachu Product for Lead Form
    Select from list    ddlProductCategory    Accident
    Select from list    ddlProductType    Accident Only
    click element       xpath=//*[@id='frmProduct']/div[3]/div/div/div  #LOB
    click element       xpath=//*[@id='frmProduct']/div[3]/div/div/div/div[2]/div[@data-value='HEALTH']
    click element       xpath=//*[@id='frmProduct']/div[3]/div[2]/div/div  #Admin System
    click element       xpath=//*[@id='frmProduct']/div[3]/div[2]/div/div/div[2]/div[@data-value='FF']
    click element       xpath=//div[2]/div/div/i
    click element       xpath=//*[@id='frmProduct']/div[4]/div/div/div  #Marketing Names
    click element       xpath=//*[@id='frmProduct']/div[4]/div/div/div/div[2]/div[@data-value='AccAdv']
    click element       xpath=//div[4]/div/div/div/i
    click element       xpath=//*[@id='frmProduct']/div[4]/div[2]/div/div  #UW Type
    click element       xpath=//*[@id='frmProduct']/div[4]/div[2]/div/div/div[2]/div[@data-value='GI']
    click element       xpath=//div[4]/div[2]/div/div/i
    click element       xpath=//*[@id='frmProduct']/div[5]/div/div/div  #Marketing Segmanet
    click element       xpath=//*[@id='frmProduct']/div[5]/div/div/div/div[2]/div[5][@data-value='TEB']
    click element       xpath=//div[5]/div/div/div/i
    input text          txtNotes    Pikachu Product for Lead Form
    Click button        btnSaveProduct
    confirm action
    close browser

*** Keywords ***
open browser to dev site
    run keyword if  '${BROWSER} == IE'  set IEWebdriver
    run keyword if  '${BROWSER} == Chrome'  set ChromeDriver
    open browser   ${DEV_URL}  ${BROWSER}
    maximize browser window
    wait until element is visible   txtSearchHeader

set IEWebdriver
    set environment variable    webdriver.ie.driver     "C:\Python27\IEDriverServer.exe"

set ChromeDriver
    set environment variable    webdriver.chrome.driver     "C:\Python27\chromedriver.exe"