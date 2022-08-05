*** Settings ***
Library     SeleniumLibrary
Variables   LocatorsJ.py
Variables    Locators.py
Library     String
Library    Collections
#Library     StringFormat
Library     BuiltIn
Resource   CommonKeywordResource.robot



*** Variables ***
${url}      https://staging.next.buyboxexperts.com/signin
${browser}  Chrome

${Email}    rsonawne@buyboxexperts.com
${Password}     reshma57
${Partner_Menu}     Partners
${COMPANY NAME}    test_agreement03
${months}   12
${ADDRESS}  3726 Lonsdale St
${STATE}    OH
${CITY}     Cincinnati
${POSTCODE}     BWER12344
${Service_Company_Address}  3726 Lonsdale St, Cincinnati, OH, BWER12344

*** Keywords ***
Open Browser To Login Page
    [documentation]     Used for opening browser
    [Arguments]     ${LOGIN URL}      ${BROWSER}
    Open Browser  ${LOGIN URL}  ${BROWSER}
    Maximize Browser Window

Enter Login Details
    [documentation]     Login credential provided in this keyword
    [Arguments]     ${Email}    ${Password}
    # Enter Email
    input text      ${BBE_USERNAME}        ${Email}
    click button    ${CONTINUE_BUTTON}
    Sleep       4
    # Enter Password
    input text      ${BBE_Password}       ${Password}
    click button    xpath://button[text()="Sign In"]
    sleep       3

Heading to req company tab
    [documentation]     Req company can be allocated upto main functionality
    [Arguments]        ${company_name}
    click element       ${partner_tab}
    sleep       5
    click element   ${search_box}
    press keys      None        ${Company_name}
    sleep       6
    click element   ${searched_company}
    sleep       7
    click element   ${Company_details_Agreement}
    wait until page contains element   ${View_action}

# Added Retainer value in quartery for seller
check Seller Quarterly
    click element   ${SELLER_RETAINER_QUARTERLY}
    sleep   3   s
    Enter field     ${SELLER_RETAINER_FIRST}    3000
    Enter field     ${SELLER_RETAINER_SECOND}    3000
    press keys      None    ARROW_DOWN
    Enter field     ${SELLER_RETAINER_THIRD}    3000
    Enter field     ${SELLER_RETAINER_FOURTH}    3000

# Added Retainer value in monthly for seller
Check Seller Monthly
    click element   ${SELLER_RETAINER_MONTHLY}
    sleep   3   s
    Enter field     ${SELLER_RETAINER_JAN}      3000
    Enter field     ${SELLER_RETAINER_FEB}      3000
    Enter field     ${SELLER_RETAINER_MARCH}      3000
    Enter field     ${SELLER_RETAINER_APRIL}      3000
    Enter field     ${SELLER_RETAINER_MAY}      3000
    press keys      None    ARROW_DOWN
    Enter field     ${SELLER_RETAINER_JUNE}      3000
    Enter field     ${SELLER_RETAINER_JULY}      3000
    Enter field     ${SELLER_RETAINER_AUGUST}      3000
    Enter field     ${SELLER_RETAINER_SEPTEMBER}      3000
    Enter field     ${SELLER_RETAINER_OCTOBER}      3000
    Enter field     ${SELLER_RETAINER_NOVEMBER}      3000
    Enter field     ${SELLER_RETAINER_DECEMBER}      3000


Check Fee Structure
    dropdown field  ${PRIMARY_MARKETPLACE_DROPDOWN}     ${OPEN_MY_PARTNER_DROPDOWN}     Amazon.co.uk
    dropdown field  ${PRIMARY_MARKETPLACE_DROPDOWN}     ${OPEN_CONTRACT_LENGTH_DROPDOWN}     Amazon.co.uk
    dropdown field  ${ACCOUNT_TYPE_DROPDOWN}    ${OPEN_MY_PARTNER_DROPDOWN}     hybrid
    dropdown field  ${ACCOUNT_TYPE_DROPDOWN}    ${OPEN_CONTRACT_LENGTH_DROPDOWN}     hybrid
    #press keys      ${AGREEMENT_SECTION}    PAGE_DOWN
    #${Account_type}=    get text    ${ACCOUNT_TYPE_VALUE}
    #log to console  ${Account_type}
    ${Account_type}     set variable    Hybrid
    ${Hybrid_Account}  set variable    Hybrid
    IF  "${Account_type}" == "${Hybrid_Account}"
        dropdown field  ${FEE_TYPE_DROPDOWN}    ${OPEN_MY_PARTNER_DROPDOWN}     Retainer Only
        dropdown field  ${FEE_TYPE_DROPDOWN}    ${OPEN_CONTRACT_LENGTH_DROPDOWN}    Retainer Only
        scroll element into view    ${PROCEED_TO_NEXT_SECTION2}
        click element   ${SELLER_RETAINER_FIXED}
        Enter field     ${SELLER_FIXED_VALUE}   60000
        #click element   ${AGREEMENT_SECTION}
        check Seller Quarterly
        check seller monthly
        scroll element into view    ${PROCEED_TO_NEXT_SECTION2}
        dropdown field  ${VENDOR_BILLING_DROPDOWN}      ${OPEN_CONTRACT_LENGTH_DROPDOWN}    ordered
        dropdown field  ${VENDOR_BILLING_DROPDOWN}  ${OPEN_MY_PARTNER_DROPDOWN}     ordered
        check box selected      ${SAME_FEE_STRUCTURE_ID}    ${SAME_FEE_STRUCTURE}
        #press keys      ${FEE_STRUCTURE_SECTION}    PAGE_DOWN
        scroll element into view    ${ADDENDUM_HEADER}
        click element   ${PROCEED_TO_NEXT_SECTION2}
    END

Check One Time Service
    check box selected  ${APLUS_CONTENT_ONE_TIME_ID}    ${APLUS_CONTENT_ONE_TIME_LABEL}
    check box selected  ${PRODUCT_INSERT_ONE_TIME_ID}    ${PRODUCT_INSERT_ONE_TIME_LABEL}
    check box selected  ${AMAZON_BRAND_ONE_TIME_ID}    ${AMAZON_BRAND_ONE_TIME_LABEL}
    check box selected  ${LISTING_COPY_ONE_TIME_ID}    ${LISTING_COPY_ONE_TIME_LABEL}
    check box selected  ${LISTING_DESIGN_ONE_TIME_ID}    ${LISTING_DESIGN_ONE_TIME_LABEL}
    check box selected  ${DOCUMENT_DESIGN_ONE_TIME_ID}    ${DOCUMENT_DESIGN_ONE_TIME_LABEL}
    check box selected  ${LISTING_PHOTOGRAPHY_ID}    ${LISTING_PHOTOGRAPHY_LABEL}
    check box selected  ${AMAZON_STOREFRONT_ONE_TIME_ID}    ${AMAZON_STOREFRONT_ONE_TIME_LABEL}

Check Seller Monthly Service
    check box selected  ${APLUS_CONTENT_SELLER_ID}  ${APLUS_CONTENT_SELLER_LABEL}
    check box selected  ${STOREFRONT_SUPPORT_SELLER_ID}  ${STOREFRONT_SUPPORT_SELLER_LABEL}
    check box selected  ${CUSTOMER_SUPPORT_SELLER_ID}  ${CUSTOMER_SUPPORT_SELLER_LABEL}
    check box selected  ${LOGISTIC_MANAGEMENT_SELLER_ID}  ${LOGISTIC_MANAGEMENT_SELLER_LABEL}
    check box selected  ${INVENTORY_RECONCILIATION_SELLER_ID}     ${INVENTORY_RECONCILIATION_SELLER_LABEL}
    check box selected  ${DSP_ADVERTISE_SELLER_ID}     ${DSP_ADVERTISE_SELLER_LABEL}
    check box selected  ${ADDITIONAL_MARKETPLACES_SELLER_ID}    ${ADDITIONAL_MARKETPLACES_SELLER_LABEL}
    Multiselect Dropdown    ${ADDITIONAL_MARKETPLACES1_DROPDOWN}     ${OPEN_ADDITIONAL_MARKETPLACES_DROPDOWN}
    ...     ${SELLER_MARKETPLACES}      ${REMOVE_MARKETPLACE}

Check Vendor Monthly Service
    check box selected  ${APLUS_CONTENT_VENDOR_ID}  ${APLUS_CONTENT_VENDOR_LABEL}
    check box selected  ${STOREFRONT_SUPPORT_VENDOR_ID}  ${STOREFRONT_SUPPORT_VENDOR_LABEL}
    check box selected  ${CUSTOMER_SUPPORT_VENDOR_ID}  ${CUSTOMER_SUPPORT_VENDOR_LABEL}
    check box selected  ${LOGISTIC_MANAGEMENT_VENDOR_ID}  ${LOGISTIC_MANAGEMENT_VENDOR_LABEL}
    check box selected  ${APLUS_CONTENT_VENDOR_ID}  ${APLUS_CONTENT_VENDOR_LABEL}
    check box selected  ${INVENTORY_RECONCILIATION_VENDOR_ID}     ${INVENTORY_RECONCILIATION_VENDOR_LABEL}
    check box selected  ${DSP_ADVERTISING_VENDOR_ID}     ${DSP_ADVERTISING_VENDOR_LABEL}
    check box selected  ${ADDITIONAL_MARKETPLACES_VENDOR_ID}    ${ADDITIONAL_MARKETPLACES_VENDOR_LABEL}
    Multiselect Dropdown    ${ADDITIONAL_MARKETPLACES2_DROPDOWN}     ${OPEN_ADDITIONAL_MARKETPLACES_DROPDOWN}
    ...     ${VENDOR_MARKETPLACES}      ${REMOVE_VENDOR_MARKETPLACES}


Check DSP Advertising
    scroll element into view    ${PROCEED_TO_NEXT_SECTION3}
    #press keys  ${DSP_ADVERTISE_ID}     ALT+ARROW_DOWN
    check one time service
    scroll element into view    ${PROCEED_TO_NEXT_SECTION3}
    Check Seller Monthly Service
    scroll element into view    ${PROCEED_TO_NEXT_SECTION3}
    Check Vendor Monthly Service
    #check box selected  ${DSP_ADVERTISING_ID2}     ${DSP_ADVERTISING_LABEL2}
    scroll element into view    ${ADDENDUM_HEADER}
    click element   ${PROCEED_TO_NEXT_SECTION3}
    Enter field     ${MONTHLY_BUDGET}   30000
    dropdown field  ${AGENCY_FEE_DROPDOWN}  ${OPEN_MY_PARTNER_DROPDOWN}   15
    scroll element into view    ${ADDENDUM_HEADER}
    dropdown field  ${INITIAL_PERIOD_DROPDOWN}  ${OPEN_MY_PARTNER_DROPDOWN}     6
    dropdown field  ${INITIAL_PERIOD_DROPDOWN}  ${OPEN_CONTRACT_LENGTH_DROPDOWN}     6
    scroll element into view    ${ADDENDUM_HEADER}
    Multiselect Dropdown    ${DSP_MARKETPLACES_DROPDOWN}    ${OPEN_MY_PARTNER_DROPDOWN}     ${DSP_MARKETPLACES}
    ...     ${REMOVE_DSP_MARKETPLACES}
    #Multiselect Dropdown    ${DSP_MARKETPLACES_DROPDOWN}    ${OPEN_CONTRACT_LENGTH_DROPDOWN}
    click element   ${SAVE_CHANGES_LOCATOR}
    sleep   5   s


Heading to statement of work
    ${width}    ${height}=   get window size
    log to console  ${width}
    log to console  ${height}
    Customer To Agreement
    click element   ${Company_details_Agreement}
    wait until page contains element   ${View_action}
    #click element   ${View_action}
    Dropdown Field  ${View_action}      ${OPEN_MY_PARTNER_DROPDOWN}     Edit
    wait until element is visible   ${SERVICE_AGREEMENT_HEADER}
    Enter field    ${CUSTOMER_NAME_LOCATOR}     ${COMPANY NAME}
    element should be visible    ${SAVE_CHANGES_LOCATOR}
    element should be visible    ${DISCARD_CHANGES_LOCATOR}
    click element    ${CONTRACT_START_DATE}
    sleep    2  s
    click element    ${ACTIVE_DATE}
    sleep    2  s
    Dropdown Field    ${CONTRACT_LENGTH_DROPDOWN}    ${OPEN_MY_PARTNER_DROPDOWN}    ${months}
    Dropdown Field    ${CONTRACT_LENGTH_DROPDOWN}    ${OPEN_CONTRACT_LENGTH_DROPDOWN}    ${months}
    Enter field    ${ADDRESS_LOCATOR}   ${ADDRESS}
    Enter field    ${STATE_LOCATOR}     ${STATE}
    Enter field    ${CITY_LOCATOR}      ${CITY}
    Enter field    ${POSTCODE_LOCATOR}  ${POSTCODE}
    ${Service_Agreement_Address}=   get text  ${AGREEMENT_ADDRESS}
    ${Service_Agreement_Company}=   get text  ${AGREEMENT_COMPANY}
    ${Service_Company_Name}   get element attribute    ${CUSTOMER_NAME_LOCATOR}      value
    ${Service_Start_Date}   get element attribute   ${CONTRACT_START_DATE}  value
    #should be equal     ${Service_Agreement_Company}    ${Service_Company_Name}
    #should be equal     ${Service_Agreement_Address}    ${Service_Company_Address}
    press keys      ${SERVICE_AGREEMENT_SECTION}     PAGE_DOWN
    ${Service_Agreement_Contact_Length}=     get text    ${AGREEMENT_CONTRACT_LENGTH}
    ${Service_Contract_Length}=     get text     ${CONTRACT_LENGTH}
    should be equal     ${Service_Contract_Length}      ${Service_Agreement_Contact_Length}
    #scroll element into view    ${AGREEMENT_ADDRESS2}
    ${Service_Signed_Address}=      get text    ${AGREEMENT_ADDRESS2}
    scroll element into view    ${AGREEMENT_ADDRESS2}
    should be equal     ${Service_Signed_Address}   ${Service_Agreement_Address}
    #log to console      ${Service_Signed_Address}
    press keys      ${SERVICE_AGREEMENT_SECTION}      PAGE_DOWN
    scroll element into view    ${PROCEED_TO_NEXT_SECTION}
    wait until page contains element    ${PROCEED_TO_NEXT_SECTION}
    click element   ${PROCEED_TO_NEXT_SECTION}
    sleep   3   s
    Check Fee Structure
    Check DSP Advertising
    #Execute javascript  document.body.style.zoom="70%"


By default agency fee 15%
    ${default_fee_0} =    set variable    ${15}
    ${default_fee_1} =    convert to string     ${default_fee_0}

    ${fee} =  get text  ${Contract_percentage}
    ${Selected_fee_0} =    convert to string     ${fee}
    ${Selected_fee_1} =    Remove String        ${Selected_fee_0}   ,    %
    should be equal as strings     ${default_fee_1}    ${Selected_fee_1}

Decrement should be of 1%
    ${fee} =  get text  ${Contract_percentage}
    ${Selected_fee_0} =    convert to string     ${fee}
    ${Selected_fee_1} =    Remove String        ${Selected_fee_0}   ,    %
    log to console      ${Selected_fee_1}

    sleep           5           # Monthly AD Budget
    press keys      None        TAB
    press keys      None        10000
    sleep       2               # Agency Fee Percentage
    press keys      None        TAB
    sleep       2
    press keys      None        ARROW_DOWN
    press keys      None        ARROW_DOWN
    press keys      None        ENTER
    sleep       2               # Initial Period
    press keys      None        TAB
    press keys      None        ARROW_DOWN
    sleep       2
    press keys      None        ARROW_DOWN
    press keys      None        ARROW_DOWN
    sleep       2
    press keys      None        ENTER
    sleep       2               # DSP MarketPlace
    press keys      None        TAB
    press keys      None        ARROW_DOWN
    press keys      None        ENTER

    ${fee_A} =  get text  ${Contract_percentage}
    ${Selected_fee_B} =    convert to string     ${fee_A}
    ${Selected_fee_C} =    Remove String        ${Selected_fee_B}   ,    %
#    log to console      ${Selected_fee_C}

    ${Calculation} =    Evaluate       ${Selected_fee_1}-${Selected_fee_C}
#    log to console      ${Calculation}

    ${Decrement} =      set variable        ${1}
    Should be equal as strings      ${Calculation}      ${Decrement}

    press keys      None        TAB
    press keys      None        ENTER
    sleep       3
    select frame        (//div[@class="container-fluid"]) [2]
#    scroll element into view        ${Save_Changes}
    click button        ${Save_Changes}
    sleep       5
    click element       ${Cross}
    sleep       5
    Execute javascript  document.body.style.zoom="70%"
    sleep       3
