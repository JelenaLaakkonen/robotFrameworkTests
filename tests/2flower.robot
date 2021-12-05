*** Settings ***
Library                     AppiumLibrary       20

*** Variables ***
&{INPUT-DETAILS}            TextGood=I feel very good 
&{INPUT2-DETAILS}           TextBad=I feel very sad   

${INPUT-FIELD}              //android.widget.EditText[@index=1]
${SUBMIT-BUTTON}            //android.view.ViewGroup[@index=2]
${OK-BUTTON}                //android.widget.Button[@index=0]
${ALERT-BUTTON}             //android.view.ViewGroup[@index='2']/android.view.ViewGroup[@index='2']
${NO-BUTTON}                //android.view.ViewGroup[@index='2']
${NAVIGATION-BUTTON}        //android.view.View[@index='1']/android.view.View[@index='0']

#${NAVIGATION-BUTTON}       //android.view.ViewGroup[@index='1']/android.view.View[@index='1']/android.view.View[@index='0']
                            
${POINT-BUTTON}             //android.view.ViewGroup[@index='2']/android.view.ViewGroup[@index='1']
${LOGOUT-BUTTON}            //android.view.ViewGroup[@index='0']/android.view.ViewGroup[@index='3']

*** Test Cases *** 
Test
    Open Application    http://localhost:4723/wd/hub    platformName=Android   deviceName=emulator-5554 appPackage=host.exp.exponent   appActivity=host.exp.exponent.LauncherActivity automationName=Uiautomator2
    Input Text          ${INPUT-FIELD}         ${INPUT-DETAILS}[TextGood]
    Click Element                              ${SUBMIT-BUTTON} 
    Wait Until Page Contains Element           ${OK-BUTTON}
    Click Element                              ${OK-BUTTON}
    
    Click Element                              ${ALERT-BUTTON}
    Wait Until Page Contains Element           ${INPUT-FIELD}
    Input Text          ${INPUT-FIELD}         ${INPUT2-DETAILS}[TextBad]
    Click Element                              ${SUBMIT-BUTTON}
    #Wait Until Page Contains Element           ${NO-BUTTON}
    #Click Element                              ${NO-BUTTON}
    #Wait Until Page Contains Element           ${NAVIGATION-BUTTON}
    #Click Element                              ${NAVIGATION-BUTTON}

    #Click Element                              ${POINT-BUTTON} 
    
    #Click Element                              ${LOGOUT-BUTTON}

   
