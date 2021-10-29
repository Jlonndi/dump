Config.Templates = {
    ['police-print-report'] = {
        headerTitle = 'REP-RZ100',
        headerSubtitle = 'Police Report',
        elements = {
            { label = "TYPE", type = "input", value = "", can_be_emtpy = false },
            { label = "RECORD ID", type = "input", value = "", can_be_emtpy = false },
            { label = "SUSPECT NAME", type = "input", value = "", can_be_emtpy = false },
            { label = "SUBMITTED BY", type = "input", value = "", can_be_emtpy = false },
            { label = "SUBMITTED", type = "input", value = "", can_be_emtpy = false },
            { label = "REGISTRATION", type = "input", value = "", can_be_emtpy = false },
            { label = "CHARGES", type = "textarea", value = "", can_be_emtpy = false },
            { label = "DETAILS", type = "textarea", value = "", can_be_emtpy = false },
        }
    },
    ['citizen-police-report'] = {
        headerTitle = 'PD-RZ102',
        headerSubtitle = 'Citizen Police Report',
        elements = {
            { label = "DATE OF OCCURENCE", type = "input", value = "", can_be_emtpy = false },
            { label = "INVOLVED REGISTRATION #", type = "input", value = "", can_be_emtpy = false },
            { label ='DESCRIBE THE INCIDENT', type = 'textarea', value = '', can_be_emtpy = false },
        }
    },
    ['police-test-result'] = {
        headerTitle = 'PD-RZ208',
        headerSubtitle = 'Police GSR Result',
        elements = {
            { label = "NAME TEST RESULT (LABEL)", type = "input", value = "", can_be_emtpy = false },
            { label = 'LOCATION', type = "input", value = "", can_be_emtpy = false },
            { label = 'RESULT', type = "input", value = "", can_be_emtpy = false },
        }
    },
    ['police-lawful-order'] = {
        headerTitle = 'PD-RZ311',
        headerSubtitle = 'LSPD Lawful Order',
        elements = {
            { label = 'ORDEREE NAME (SUSPECT)', type = "input", value = "", can_be_emtpy = false },
            { label = 'EXPIRATION', type = "input", value = "", can_be_emtpy = false },
            { label ='ORDER CONTENTS', type = 'textarea', value = '', can_be_emtpy = false },
        }
    },
    ['police-seizure-notice'] = {
        headerTitle = 'PD-RZ784',
        headerSubtitle = 'Police Vehicle Seizure Notice',
        elements = {
            { label = 'REGISTERED OWNER NAME', type = "input", value = "", can_be_emtpy = false },
            { label = 'VEHICLE REGISTRATION', type = "input", value = "", can_be_emtpy = false },
            { label ='SEIZURE DETAILS', type = 'textarea', value = '', can_be_emtpy = false },
        }
    },


    -- EMS
    ['ems-death-cert'] = {
        headerTitle = 'FD-RZ909',
        headerSubtitle = 'Official Death Certificate',
        options = {
            hide_ignore_signature = false,
            auto_print_closest = false,
        },
        elements = {
            { label = 'NAME OF DECEASED', type = 'input', value = '', can_be_emtpy = false },
            { label = 'WITNESSES', type = 'input', value = '', can_be_emtpy = false },
            { label = 'CAUSE OF DEATH', type = 'textarea', value = '', can_be_emtpy = false },
        }
    },
    ['ems-prescription'] = {
        headerTitle = 'FD-RZ106',
        headerSubtitle = 'Medication Prescription',
        options = {
            hide_ignore_signature = false,
            auto_print_closest = false,
        },
        elements = {
            { label = "PERSON(S) NAME", type = "input", value = "", can_be_emtpy = false },
            { label = 'MEDICATION NAME', type = 'input', value = '', can_be_emtpy = false },
            { label = 'PILL COUNT', type = 'input', value = '', can_be_emtpy = false },
            { label = 'REASON', type = 'textarea', value = '', can_be_emtpy = false },
            { label = 'INSTRUCTION', type = 'input', value = '', can_be_emtpy = false },
        }
    },
    ['ems-fire-inspection'] = {
        headerTitle = 'FD-RZ306',
        headerSubtitle = 'Fire Inspection Report',
        options = {
            hide_ignore_signature = false,
            auto_print_closest = false,
        },
        elements = {
            { label = 'BUILDING NAME', type = 'input', value = '', can_be_emtpy = false },
            { label = 'INSPECTION DATE', type = 'input', value = '', can_be_emtpy = false },
            { label = 'RESULT', type = 'textarea', value = '', can_be_emtpy = false },
        }
    },

    -- DOJ
    ['doj-security-permit'] = {
        headerTitle = "DOJ-RZ306",
        headerSubtitle = "Security Operations Permit",
        elements = {
            { label = "HOLDER NAME", type = "input", value = "", can_be_emtpy = false },
            { label = "VALID UNTIL", type = "input", value = "", can_be_empty = false },
            { label = "INFORMATION", type = "textarea", value = "THE AFOREMENTIONED CITIZEN IS ALLOWED AND GRANTED A PERMIT FOR OPERATING AS SECURITY WHICH WILL BE VALID UNTIL THE AFOREMENTIONED EXPIRATION DATE.", can_be_emtpy = false },
        }
    },
    ['doj-affirmation'] = {
        headerTitle = "DOJ-RZ483",
        headerSubtitle = "Citizen affirmation form.",
        elements = {
            { label = "NAME", type = "input", value = "", can_be_emtpy = false },
            { label = "AFFIRMATION CONTENT", type = "textarea", value = "", can_be_emtpy = false },
        }
    },
    ['doj-warrant'] = {
        headerTitle = "DOJ-RZ420",
        headerSubtitle = 'Warrant',
        elements = {
            { label = 'NAME (PROPERTY OR INDIVIDUAL)', type = 'input', value = '', can_be_emtpy = false },
            { label = 'WARRANT TYPE', type = 'input', value = '', can_be_emtpy = false },
            { label = 'WARRANT CONTENT', type = 'textarea', value = '', can_be_emtpy = false },
        }
    },
    ['doj-marriage-certificate'] = {
        headerTitle = "DOJ-RZ069",
        headerSubtitle = 'Marriage Certificate',
        elements = {
            { label = 'SPOUSE #1 NAME', type = "input", value = "", can_be_emtpy = false },
            { label = 'SPOUSE #2 NAME', type = "input", value = "", can_be_emtpy = false },
            { label = 'WITNESS NAME', type = "input", value = "", can_be_emtpy = false },
            { label = 'OFFICIANT NAME', type = "input", value = "", can_be_emtpy = false },
            { label = 'DATE', type = "input", value = "", can_be_emtpy = false },
            { label = 'LOCATION', type = "input", value = "", can_be_emtpy = false },
        }
    },
    ['doj-permit'] = {
        headerTitle = "DOJ-RZ484",
        headerSubtitle = 'DOJ Permit',
        elements = {
            { label = 'ISSUED BY', type = "input", value = "", can_be_emtpy = false },
            { label = 'ISSUED TO', type = "input", value = "", can_be_emtpy = false },
            { label = 'DATE', type = "input", value = "", can_be_emtpy = false },

            { label = "DETAILS", type = "textarea", value = "", can_be_emtpy = false },
        }
    },
    ['doj-certificate'] = {
        headerTitle = "DOJ-RZ078",
        headerSubtitle = 'DOJ Certificate',
        elements = {
            { label = 'ISSUED BY', type = "input", value = "", can_be_emtpy = false },
            { label = 'ISSUED TO', type = "input", value = "", can_be_emtpy = false },
            { label = 'DATE', type = "input", value = "", can_be_emtpy = false },

            { label = "DETAILS", type = "textarea", value = "", can_be_emtpy = false },
        }
    },
    ['doj-court-order'] = {
        headerTitle = "DOJ-RZ158",
        headerSubtitle = 'Court Order',
        elements = {
            { label = 'ISSUED BY', type = "input", value = "", can_be_emtpy = false },
            { label = 'ISSUED TO', type = "input", value = "", can_be_emtpy = false },
            { label = 'DATE', type = "input", value = "", can_be_emtpy = false },

            { label = "DETAILS", type = "textarea", value = "", can_be_emtpy = false },
        }
    },

    -- Citizen
    ['citizen-contract'] = {
        headerTitle = "BL-RZ100",
        headerSubtitle = "Citizen Contract",
        elements = {
            { label = "TITLE", type = "input", value = "", can_be_emtpy = false },
            { label = "EXPIRATION", type = "input", value = "", can_be_emtpy = false },
            { label = "DETAILS", type = "textarea", value = "", can_be_emtpy = false },
        }
    },

    -- Roger Fetamine

    ['fetamine-patient-report'] = {
      headerTitle = 'SHRINK-69',
      headerSubtitle = 'Love and Light Counselling Patient Report',
      elements = {
          { label = "DATE", type = "input", value = "", can_be_emtpy = false },
          { label = "PATIENT NAME", type = "input", value = "", can_be_emtpy = false },
          { label = "DETAILS", type = "textarea", value = "", can_be_emtpy = false },
          { label = "PRESCRIPTIONS / RECOMMENDATIONS", type = "textarea", value = "", can_be_emtpy = false },
      }
    }
}

Config.Documents['en'] = {
    ["public"] = {
        {
            headerTitle = "AFFIRMATION FORM",
            headerSubtitle = "Citizen affirmation form.",
            elements = {
                { label = "AFFIRMATION CONTENT", type = "textarea", value = "", can_be_emtpy = false },
            }
        },
        {
            headerTitle = "WITNESS TESTIMONY",
            headerSubtitle = "Official witness testimony.",
            elements = {
                { label = "DATE OF OCCURENCE", type = "input", value = "", can_be_emtpy = false },
                { label = "TESTIMONY CONTENT", type = "textarea", value = "", can_be_emtpy = false },
            }
        },
        {
            headerTitle = "VEHICLE CONVEY STATEMENT",
            headerSubtitle = "Vehicle convey statement towards another citizen.",
            elements = {
                { label = "PLATE NUMBER", type = "input", value = "", can_be_emtpy = false },
                { label = "CITIZEN NAME", type = "input", value = "", can_be_emtpy = false },
                { label = "AGREED PRICE", type = "input", value = "", can_be_empty = false },
                { label = "OTHER INFORMATION", type = "textarea", value = "", can_be_emtpy = true },
            }
        },
        {
            headerTitle = "DEBT STATEMENT TOWARDS CITIZEN",
            headerSubtitle = "Official debt statement towards another citizen.",
            elements = {
                { label = "CREDITOR FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
                { label = "CREDITOR LASTNAME", type = "input", value = "", can_be_emtpy = false },
                { label = "AMOUNT DUE", type = "input", value = "", can_be_empty = false },
                { label = "DUE DATE", type = "input", value = "", can_be_empty = false },
                { label = "OTHER INFORMATION", type = "textarea", value = "", can_be_emtpy = true },
            }
        },
        {
            headerTitle = "DEBT CLEARANCE DECLARATION",
            headerSubtitle = "Declaration of debt clearance from another citizen.",
            elements = {
                { label = "DEBTOR FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
                { label = "DEBTOR LASTNAME", type = "input", value = "", can_be_emtpy = false },
                { label = "DEBT AMOUNT", type = "input", value = "", can_be_empty = false },
                { label = "OTHERINFORMATION", type = "textarea", value = "I HEREBY DECLARE THAT THE AFOREMENTIONED CITIZEN HAS COMPLETED A PAYMENT WITH THE AFOREMENTIONED DEBT AMOUNT", can_be_emtpy = false, can_be_edited = false },
            }
        }
    },
    ["police"] = {
        {
            headerTitle = "SPECIAL PARKING PERMIT",
            headerSubtitle = "Special no-limit parking permit.",
            elements = {
                { label = "HOLDER FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
                { label = "HOLDER LASTNAME", type = "input", value = "", can_be_emtpy = false },
                { label = "VALID UNTIL", type = "input", value = "", can_be_empty = false },
                { label = "INFORMATION", type = "textarea", value = "THE AFOREMENTIONED CITIZEN HAS BEEN GRANTED UNLIMITED PARKING PERMIT IN EVERY CITY ZONE AND IS VALID UNTIL THE AFOREMENTIONED EXPIRATION DATE.", can_be_emtpy = false },
            }
        },
        {
            headerTitle = "CLEAN CITIZEN CRIMINAL RECORD",
            headerSubtitle = "Official clean, general purpose, citizen criminal record.",
            elements = {
                { label = "CITIZEN FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
                { label = "CITIZEN LASTNAME", type = "input", value = "", can_be_emtpy = false },
                { label = "VALID UNTIL", type = "input", value = "", can_be_empty = false },
                { label = "RECORD", type = "textarea", value = "THE POLICE HEREBY DECLARES THAT THE AFOREMENTIONED CITIZEN HOLDS A CLEAR CRIMINAL RECORD. THIS RESULT IS GENERATED FROM DATA SUBMITTED IN THE CRIMINAL RECORD SYSTEM BY THE DOCUMENT SIGN DATE.", can_be_emtpy = false, can_be_edited = false },
            }         }
    },
    ["ambulance"] = {
        {
            headerTitle = "MEDICAL REPORT - PATHOLOGY",
            headerSubtitle = "Official medical report provided by a pathologist.",
            elements = {
                { label = "INSURED FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
                { label = "INSURED LASTNAME", type = "input", value = "", can_be_emtpy = false },
                { label = "VALID UNTIL", type = "input", value = "", can_be_empty = false },
                { label = "MEDICAL NOTES", type = "textarea", value = "THE AFOREMENTIONED INSURED CITIZEN WAS TESTED BY A HEALTHCARE OFFICIAL AND DETERMINED HEALTHY WITH NO DETECTED LONGTERM CONDITIONS. THIS REPORT IS VALID UNTIL THE AFOREMENTIONED EXPIRATION DATE.", can_be_emtpy = false },
            }
        },
        {
            headerTitle = "MEDICAL REPORT - PSYCHOLOGY",
            headerSubtitle = "Official medical report provided by a psychologist.",
            elements = {
                { label = "INSURED FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
                { label = "INSURED LASTNAME", type = "input", value = "", can_be_emtpy = false },
                { label = "VALID UNTIL", type = "input", value = "", can_be_empty = false },
                { label = "MEDICAL NOTES", type = "textarea", value = "THE AFOREMENTIONED INSURED CITIZEN WAS TESTED BY A HEALTHCARE OFFICIAL AND DETERMINED MENTALLY HEALTHY BY THE LOWEST APPROVED PSYCHOLOGY STANDARDS. THIS REPORT IS VALID UNTIL THE AFOREMENTIONED EXPIRATION DATE.", can_be_emtpy = false },
            }
        },
        {
            headerTitle = "MEDICAL REPORT - EYE SPECIALIST",
            headerSubtitle = "Official medical report provided by an eye specialist.",
            elements = {
                { label = "INSURED FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
                { label = "INSURED LASTNAME", type = "input", value = "", can_be_emtpy = false },
                { label = "VALID UNTIL", type = "input", value = "", can_be_empty = false },
                { label = "MEDICAL NOTES", type = "textarea", value = "THE AFOREMENTIONED INSURED CITIZEN WAS TESTED BY A HEALTHCARE OFFICIAL AND DETERMINED WITH A HEALTHY AND ACCURATE EYESIGHT. THIS REPORT IS VALID UNTIL THE AFOREMENTIONED EXPIRATION DATE.", can_be_emtpy = false },
            }
        },
        {
            headerTitle = "MARIJUANA USE PERMIT",
            headerSubtitle = "Official medical marijuana usage permit for citizens.",
            elements = {
                { label = "INSURED FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
                { label = "INSURED LASTNAME", type = "input", value = "", can_be_emtpy = false },
                { label = "VALID UNTIL", type = "input", value = "", can_be_empty = false },
                { label = "MEDICAL NOTES", type = "textarea", value = "THE AFOREMENTIONED INSURED CITIZEN IS GRANTED, AFTER BEING THOROUGHLY EXAMINED BY A HEALTHCARE SPECIALIST, MARIJUANA USAGE PERMIT DUE TO UNDISCLOSED MEDICAL REASONS. THE LEGAL AND PERMITTED AMOUNT A CITIZEN CAN HOLD CAN NOT BE MORE THAN 100grams.", can_be_emtpy = false, can_be_edited = false },
            }
        },

        ["avocat"] = {
            {
                headerTitle = "LEGAL SERVICES CONTRACT",
                headerSubtitle = "Legal services contract provided by a lawyer.",
                elements = {
                    { label = "CITIZEN FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
                    { label = "CITIZEN LASTNAME", type = "input", value = "", can_be_emtpy = false },
                    { label = "VALID UNTIL", type = "input", value = "", can_be_empty = false },
                    { label = "INFORMATION", type = "textarea", value = "THIS DOCUMENT IS PROOF OF LEGAL REPRESANTATION AND COVERAGE OF THE AFOREMENTIONED CITIZEN. LEGAL SERVICES ARE VALID UNTIL THE AFOREMENTIONED EXPIRATION DATE.", can_be_emtpy = false },
                }
            }
        }
    }
}
