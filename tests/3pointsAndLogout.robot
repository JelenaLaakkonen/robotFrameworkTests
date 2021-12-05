*** Settings ***
Library                     AppiumLibrary       20

*** Variables ***

${NAVIGATION-BUTTON}        //android.view.View[@index='1']/android.view.View[@index='0']
${POINT-BUTTON}             //android.view.ViewGroup[@index='3']/android.view.ViewGroup[@index='1']
${LOGOUT-BUTTON}            //android.view.ViewGroup[@index='0']/android.view.ViewGroup[@index='3']

*** Test Cases *** 
Points and logout
    Open Application    http://localhost:4723/wd/hub    platformName=Android   deviceName=emulator-5554 appPackage=host.exp.exponent   appActivity=host.exp.exponent.LauncherActivity automationName=Uiautomator2
    Wait Until Page Contains Element           ${NAVIGATION-BUTTON}
    Click Element                              ${NAVIGATION-BUTTON}
    Wait Until Page Contains Element           ${POINT-BUTTON}
    Click Element                              ${POINT-BUTTON} 
    Click Element                              ${POINT-BUTTON} 
    Click Element                              ${POINT-BUTTON}
    Click Element                              ${POINT-BUTTON} 
    Click Element                              ${POINT-BUTTON} 
    Click Element                              ${POINT-BUTTON}
    Sleep                                      5s
    Click Element                              ${LOGOUT-BUTTON}
