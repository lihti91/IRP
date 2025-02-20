﻿#language: en
@tree
@Positive
@FiscalPrinter

Feature: check fiscal printer

Variables:
import "Variables.feature"

SalesReceiptXML1 = 
"""xml
<?xml version="1.0" encoding="UTF-8"?>
<CheckPackage>
	<Parameters CashierName="CI" OperationType="1" TaxationSystem="0"/>
	<Positions>
		<FiscalString AmountWithDiscount="100" DiscountAmount="0" MarkingCode="Mark1" MeasureOfQuantity="255" Name="Product 6 with SLN PZU" Quantity="1" PaymentMethod="4" PriceWithDiscount="100" VATRate="0" VATAmount="0" CalculationAgent="5">
			<VendorData VendorINN="" VendorName="Consignor 2" VendorPhone=""/>
		</FiscalString>
		<FiscalString AmountWithDiscount="200" DiscountAmount="0" MeasureOfQuantity="255" Name="Product 3 with SLN UNIQ" Quantity="1" PaymentMethod="4" PriceWithDiscount="200" VATRate="18" VATAmount="30.51"/>
	</Positions>
	<Payments Cash="300" ElectronicPayment="0" PrePayment="0" PostPayment="0" Barter="0"/>
</CheckPackage>
"""

SalesReceiptXML2 = 
"""xml
<?xml version="1.0" encoding="UTF-8"?>
<CheckPackage>
	<Parameters CashierName="CI" OperationType="1" TaxationSystem="0"/>
	<Positions>
		<FiscalString AmountWithDiscount="100" DiscountAmount="0" MarkingCode="Mark1" MeasureOfQuantity="255" Name="Product 1 with SLN PZU" Quantity="1" PaymentMethod="4" PriceWithDiscount="100" VATRate="18" VATAmount="15.25"/>
		<FiscalString AmountWithDiscount="520" DiscountAmount="0" MeasureOfQuantity="255" Name="Dress XS/Blue" Quantity="1" PaymentMethod="4" PriceWithDiscount="520" VATRate="18" VATAmount="79.32"/>
	</Positions>
	<Payments Cash="0" ElectronicPayment="620" PrePayment="0" PostPayment="0" Barter="0"/>
</CheckPackage>
"""

SalesReceiptXML3 = 
"""xml
<?xml version="1.0" encoding="UTF-8"?>
<CheckPackage>
	<Parameters CashierName="CI" OperationType="1" TaxationSystem="0"/>
	<Positions>
		<FiscalString AmountWithDiscount="100" DiscountAmount="0" MarkingCode="Mark1" MeasureOfQuantity="255" Name="Product 6 with SLN PZU" Quantity="1" PaymentMethod="4" PriceWithDiscount="100" VATRate="18" VATAmount="15.25"/>
		<FiscalString AmountWithDiscount="520" DiscountAmount="0" MeasureOfQuantity="255" Name="Dress XS/Blue" Quantity="1" PaymentMethod="4" PriceWithDiscount="520" VATRate="18" VATAmount="79.32"/>
		<FiscalString AmountWithDiscount="100" DiscountAmount="0" MarkingCode="Mark1" MeasureOfQuantity="255" Name="Product 1 with SLN PZU" Quantity="1" PaymentMethod="4" PriceWithDiscount="100" VATRate="18" VATAmount="15.25"/>
		<FiscalString AmountWithDiscount="120" DiscountAmount="0" MarkingCode="Mark8" MeasureOfQuantity="255" Name="Product 4 with SLN UNIQ" Quantity="1" PaymentMethod="4" PriceWithDiscount="120" VATRate="18" VATAmount="18.31"/>
	</Positions>
	<Payments Cash="440" ElectronicPayment="400" PrePayment="0" PostPayment="0" Barter="0"/>
</CheckPackage>
"""

SalesReceiptXML4 =
"""xml
<?xml version="1.0" encoding="UTF-8"?>
<CheckPackage>
	<Parameters CashierName="CI" OperationType="1" TaxationSystem="0"/>
	<Positions>
		<FiscalString AmountWithDiscount="118" DiscountAmount="0" MarkingCode="Mark1" MeasureOfQuantity="255" Name="Product 6 with SLN PZU" Quantity="1" PaymentMethod="4" PriceWithDiscount="118" VATRate="18" VATAmount="18"/>
	</Positions>
	<Payments Cash="0" ElectronicPayment="0" PrePayment="0" PostPayment="118" Barter="0"/>
</CheckPackage>
"""
SalesReceiptXML5 =
"""xml
<?xml version="1.0" encoding="UTF-8"?>
<CheckPackage>
	<Parameters CashierName="CI" OperationType="1" TaxationSystem="0"/>
	<Positions>
		<FiscalString AmountWithDiscount="118" DiscountAmount="0" MarkingCode="Mark1" MeasureOfQuantity="255" Name="Product 6 with SLN PZU" Quantity="1" PaymentMethod="4" PriceWithDiscount="118" VATRate="18" VATAmount="18"/>
	</Positions>
	<Payments Cash="0" ElectronicPayment="0" PrePayment="0" PostPayment="118" Barter="0"/>
</CheckPackage>
"""

SalesReceiptXML6 =
"""xml
<?xml version="1.0" encoding="UTF-8"?>
<CheckPackage>
	<Parameters CashierName="CI" OperationType="2" TaxationSystem="0"/>
	<Positions>
		<FiscalString AmountWithDiscount="210" DiscountAmount="0" MarkingCode="Mark1" MeasureOfQuantity="255" Name="Product 6 with SLN PZU" Quantity="1" PaymentMethod="4" PriceWithDiscount="210" VATRate="18" VATAmount="32.03"/>
	</Positions>
	<Payments Cash="210" ElectronicPayment="0" PrePayment="0" PostPayment="0" Barter="0"/>
</CheckPackage>
"""

SalesReceiptXML7 =
"""xml
<?xml version="1.0" encoding="UTF-8"?>
<CheckPackage>
	<Parameters CashierName="CI" OperationType="2" TaxationSystem="0"/>
	<Positions>
		<FiscalString AmountWithDiscount="118" DiscountAmount="0" MarkingCode="Mark1" MeasureOfQuantity="255" Name="Product 6 with SLN PZU" Quantity="1" PaymentMethod="4" PriceWithDiscount="118" VATRate="18" VATAmount="18"/>
	</Positions>
	<Payments Cash="0" ElectronicPayment="0" PrePayment="0" PostPayment="118" Barter="0"/>
</CheckPackage>
"""

SalesReceiptXML8 =
"""xml
<?xml version="1.0" encoding="UTF-8"?>
<CheckPackage>
	<Parameters CashierName="CI" OperationType="2" TaxationSystem="0"/>
	<Positions>
		<FiscalString AmountWithDiscount="520" DiscountAmount="0" MeasureOfQuantity="255" Name="Dress XS/Blue" Quantity="1" PaymentMethod="4" PriceWithDiscount="520" VATRate="18" VATAmount="79.32"/>
	</Positions>
	<Payments Cash="0" ElectronicPayment="520" PrePayment="0" PostPayment="0" Barter="0"/>
</CheckPackage>
"""


Background:
	Given I launch TestClient opening script or connect the existing one



		
Scenario: _0850000 preparation (fiscal printer)
	When set True value to the constant
	When set True value to the constant Use consolidated retail sales
	When set True value to the constant Use commission trading
	And I close TestClient session
	Given I open new TestClient session or connect the existing one
	* Load info
		When Create catalog BusinessUnits objects
		When Create catalog BusinessUnits objects (Shop 02, use consolidated retail sales)
		When Create information register Barcodes records
		When Create catalog Companies objects (own Second company)
		When Create catalog CashAccounts objects
		When Create catalog Agreements objects
		When Create catalog ObjectStatuses objects
		When Create catalog ItemKeys objects
		When Create catalog ItemTypes objects
		When Create catalog Partners and Payment type (Bank)
		When Create catalog Units objects
		When Create catalog Items objects
		When Create catalog PriceTypes objects
		When Create catalog Specifications objects
		When Create catalog Partners objects (Customer)
		When Create chart of characteristic types AddAttributeAndProperty objects
		When Create catalog AddAttributeAndPropertySets objects
		When Create catalog AddAttributeAndPropertyValues objects
		When Create catalog Currencies objects
		When Create catalog Companies objects (Main company)
		When Create catalog Stores objects
		When Create catalog Partners objects
		When Create catalog Companies objects (partners company)
		When Create information register PartnerSegments records
		When Create catalog Agreements objects (commision trade, own companies)
		When Create catalog PartnerSegments objects
		When Create chart of characteristic types CurrencyMovementType objects
		When Create catalog TaxRates objects
		When Create catalog Taxes objects	
		When Create catalog Partners objects (trade agent and consignor)
		When Create catalog Stores (trade agent)
		When Create information register TaxSettings records
		When Create information register PricesByItemKeys records
		When Create catalog IntegrationSettings objects
		When Create information register CurrencyRates records
		When Create catalog SourceOfOrigins objects
		When Create PaymentType (advance)
		When Create catalog Users objects
		When Create catalog ItemTypes objects (serial lot numbers)
		When Create catalog Items objects (serial lot numbers)
		When Create catalog ItemKeys objects (serial lot numbers)
		When Create information register Barcodes records (serial lot numbers)
		When Create catalog SerialLotNumbers objects (serial lot numbers, with batch balance details)
		When update ItemKeys
		When Create catalog Partners objects and Companies objects (Customer)
		When Create catalog Agreements objects (Customer)
		When Create POS cash account objects
		When Create catalog Countries objects
		When Data preparation (comission stock)
	* Add plugin for taxes calculation
		Given I open hyperlink "e1cib/list/Catalog.ExternalDataProc"
		If "List" table does not contain lines Then
				| "Description" |
				| "TaxCalculateVAT_TR" |
			When add Plugin for tax calculation
		When Create information register Taxes records (VAT)
		When Create information register UserSettings records (Retail)
		When Create catalog ExpenseAndRevenueTypes objects
	* Tax settings
		When filling in Tax settings for company
	* Add sales tax
		When Create catalog Taxes objects (Sales tax)
		When Create information register TaxSettings (Sales tax)
		When Create information register Taxes records (Sales tax)
		When Create catalog RetailCustomers objects (check POS)
		When Create catalog UserGroups objects
	* Create payment terminal
		Given I open hyperlink "e1cib/list/Catalog.PaymentTerminals"
		And I click the button named "FormCreate"
		And I input "Payment terminal 01" text in the field named "Description_en"
		And I click "Save and close" button
	* Create PaymentTypes
		When Create catalog PaymentTypes objects
	* Bank terms
		When Create catalog BankTerms objects (for Shop 02)		
	* Workstation
		When Create catalog Workstations objects
		Given I open hyperlink "e1cib/list/Catalog.Workstations"
		And I go to line in "List" table
			| 'Description'    |
			| 'Workstation 01' |
		And I click "Set current workstation" button
		And I close TestClient session
		Given I open new TestClient session or connect the existing one	
	* Comission trade
		When Create information register TaxSettings records (Concignor 1)
		When Create information register TaxSettings records (Concignor 2)
		When Create document PurchaseInvoice (comission trade, own Companies)
		When Create document SalesInvoice (trade, own Companies)
	* Post document
		And I execute 1C:Enterprise script at server
 			| "Documents.PurchaseInvoice.FindByNumber(2200).GetObject().Write(DocumentWriteMode.Posting);" |
		And I execute 1C:Enterprise script at server
 			| "Documents.PurchaseInvoice.FindByNumber(192).GetObject().Write(DocumentWriteMode.Posting);" |
		And I execute 1C:Enterprise script at server
 			| "Documents.PurchaseInvoice.FindByNumber(2201).GetObject().Write(DocumentWriteMode.Posting);" |
		And I execute 1C:Enterprise script at server
 			| "Documents.PurchaseInvoice.FindByNumber(2202).GetObject().Write(DocumentWriteMode.Posting);" |
		And I execute 1C:Enterprise script at server
 			| "Documents.PurchaseInvoice.FindByNumber(2203).GetObject().Write(DocumentWriteMode.Posting);" |
		And I execute 1C:Enterprise script at server
 			| "Documents.PurchaseInvoice.FindByNumber(2206).GetObject().Write(DocumentWriteMode.Posting);" |
		And I execute 1C:Enterprise script at server
 			| "Documents.PurchaseInvoice.FindByNumber(2209).GetObject().Write(DocumentWriteMode.Posting);" |
		And I execute 1C:Enterprise script at server
 			| "Documents.SalesInvoice.FindByNumber(2200).GetObject().Write(DocumentWriteMode.Posting);" |
		And I execute 1C:Enterprise script at server
 			| "Documents.SalesInvoice.FindByNumber(2201).GetObject().Write(DocumentWriteMode.Posting);" |
		And I execute 1C:Enterprise script at server
 			| "Documents.PurchaseInvoice.FindByNumber(192).GetObject().Write(DocumentWriteMode.Posting);" |	
		And I execute 1C:Enterprise script at server
 			| "Documents.PurchaseInvoice.FindByNumber(195).GetObject().Write(DocumentWriteMode.Posting);" |	
		And I execute 1C:Enterprise script at server
 			| "Documents.PurchaseInvoice.FindByNumber(196).GetObject().Write(DocumentWriteMode.Posting);" |	
		And I execute 1C:Enterprise script at server
 			| "Documents.InventoryTransfer.FindByNumber(598).GetObject().Write(DocumentWriteMode.Posting);" |	
	* Money transfer
		When Create document MoneyTransfer objects (for cash in)
		And I execute 1C:Enterprise script at server
			| "Documents.MoneyTransfer.FindByNumber(11).GetObject().Write(DocumentWriteMode.Posting);" |
		And I execute 1C:Enterprise script at server
			| "Documents.MoneyTransfer.FindByNumber(12).GetObject().Write(DocumentWriteMode.Posting);" |
		Given I open hyperlink "e1cib/list/Document.MoneyTransfer"
		And I go to line in "List" table
			| 'Number' |
			| '11'     |
		And I select current line in "List" table
		And I delete "$$MoneyTransfer11$$" variable
		And I save the window as "$$MoneyTransfer11$$" 
		And I close all client application windows
	* Setting for Company commission trade
		When settings for Company (commission trade)
	And I close all client application windows
	* Add test extension
		Given I open hyperlink "e1cib/list/Catalog.Extensions"
		If "List" table does not contain lines Then
				| "Description" |
				| "AdditionalFunctionality" |
			When add Additional Functionality extension
	* Instal fiscal driver
		Given I open hyperlink "e1cib/list/Catalog.EquipmentDrivers"
		And I click the button named "FormCreate"
		And I input "KKT_3004" text in "Description" field
		And I input "AddIn.Modul_KKT_3004" text in "AddIn ID" field
		And I select external file "C:/AddComponents/KKT_3004.zip"
		And I click "Add file" button	
		And Delay 10
		And I click the button named "FormWrite"	
		And I click "Install" button
		Then "1C:Enterprise" window is opened
		And I click "OK" button
		And I click the button named "FormWriteAndClose"		
		And I close all client application windows
	* 	Fiscal settings
		Given I open hyperlink "e1cib/list/Catalog.Hardware"
		And I click the button named "FormCreate"
		And I input "Fiscal printer" text in "Description" field
		And I select "Fiscal printer" exact value from "Types of Equipment" drop-down list
		And I click Select button of "Driver" field
		And I go to line in "List" table
			| 'Description'  |
			| 'KKT_3004'     |
		And I select current line in "List" table
		And I click "Save" button		
		And I click "Save and close" button
		Then "Hardware" window is opened
		And I go to line in "List" table
			| 'Description'    |
			| 'Fiscal printer' |
		And I select current line in "List" table
		And in the table "DriverParameter" I click "Reload settings" button		
		And I go to line in "DriverParameter" table
			| 'Name'    |
			| 'LogFile' |
		And I delete "$$LogPath$$" variable
		And I save the value of "Value" field of "DriverParameter" table as "$$LogPath$$"	
		And I click the button named "FormWriteAndClose"
	* Add fiscal printer to the workstation
		Given I open hyperlink "e1cib/list/Catalog.Workstations"
		And I go to line in "List" table
			| 'Description' |
			| 'Workstation 01'     |
		And I select current line in "List" table	
	* Check add hardware
		And in the table "HardwareList" I click the button named "HardwareListAdd"
		And I click choice button of "Hardware" attribute in "HardwareList" table
		And I go to line in "List" table
			| 'Description' |
			| 'Fiscal printer'     |
		And I select current line in "List" table
		And I activate "Enable" field in "HardwareList" table
		And I finish line editing in "HardwareList" table
		And I set "Enable" checkbox in "HardwareList" table
		And I finish line editing in "HardwareList" table
		And I click "Save" button
		And "HardwareList" table became equal
			| 'Enable' | 'Hardware'       |
			| 'Yes'    | 'Fiscal printer' |
		And I click "Save and close" button
	* Check fiscal printer status
		Given I open hyperlink "e1cib/list/Catalog.Hardware"
		And I go to line in "List" table
			| 'Description' |
			| 'Fiscal printer'     |
		And I select current line in "List" table
		And I click "Connect" button
		Then the form attribute named "CommandResult" became equal to template
			| 'Fiscal printer connected.' |
			| 'ID:KKT_3004*'              |
		And I click "Disconnect" button
		Then the form attribute named "CommandResult" became equal to "Fiscal printer disconnected."
		And I click the button named "UpdateStatus"
		Then the form attribute named "CommandResult" became equal to "Fiscal printer NOT connected."						
	* Delete log file
		Then I delete '$$LogPath$$' file
	* Check fiscal printer connection
		And I click "Connect" button
		And Delay 5	
		And I parsed the log of the fiscal emulator by the path '$$LogPath$$' into the variable "ParsingResult"	
		And I check "$ParsingResult$" with "0" and method is "Open"

Scenario: _0850001 check preparation
	When check preparation

Scenario: _0850002 open session
	And I close all client application windows
	And In the command interface I select "Retail" "Point of sale"
	And I click "Open session" button
	If Recent TestClient message contains "Shift already opened." string Then
	* Temporally
		Given I open hyperlink "e1cib/list/Document.ConsolidatedRetailSales"
		And I select current line in "List" table
		And I click the hyperlink named "DecorationGroupTitleCollapsedPicture"
		And I select "Open" exact value from the drop-down list named "Status"
		And I activate "Icon" field in "Documents" table
		And I click "Post and close" button
		And I close all client application windows
		And In the command interface I select "Retail" "Point of sale"
		And I click "Close session" button
		Then "Finish: Session closing" window is opened
		And I click "Close session" button		
		And Delay 2
		And I click "Open session" button
* Check fiscal log
	When I Check the steps for Exception
		|'And I click "Open session" button'|		
	And I close all client application windows
	And I parsed the log of the fiscal emulator by the path '$$LogPath$$' into the variable "ParsingResult"
	And I check "$ParsingResult$" with "0" and method is "OpenShift"
	And I check "$ParsingResult$" with "0" and data in "In.Parameter2" contains 'CashierName="CI"'
	


Scenario: _0850010 create cash in
	And I close all client application windows
	* Open POS and open session		
		And In the command interface I select "Retail" "Point of sale"
	* Create cash in
		And I click "Create cash in" button		
		Then the number of "CashInList" table lines is "равно" 1
		And I go to line in "CashInList" table
			| 'Money transfer'      | 'Currency' | 'Amount'   |
			| '$$MoneyTransfer11$$' | 'TRY'      | '1 000,00' |
		And I select current line in "CashInList" table
	* Check Cash receipt
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "CashAccount" became equal to "Pos cash account 1"
		Then the form attribute named "TransactionType" became equal to "Cash in"
		Then the form attribute named "Currency" became equal to "TRY"
		And "PaymentList" table became equal
			| '#' | 'Total amount' | 'Financial movement type' | 'Money transfer'      |
			| '1' | '1 000,00'     | 'Movement type 1'         | '$$MoneyTransfer11$$' |
		
		Then the form attribute named "Branch" became equal to "Shop 02"
		And the editing text of form attribute named "DocumentAmount" became equal to "1 000,00"
		Then the form attribute named "CurrencyTotalAmount" became equal to "TRY"
	* Post Cash receipt
		And I click "Post" button
		And I delete "$$NumberCashReceipt1$$" variable
		And I delete "$$CashReceipt1$$" variable
		And I save the value of "Number" field as "$$NumberCashReceipt1$$"
		And I save the window as "$$CashReceipt1$$"
	* Print cash in
		And I click "Print cash in" button	
		And I click the button named "FormPostAndClose"
	* Check creation
		Given I open hyperlink "e1cib/list/Document.CashReceipt"		
		And "List" table became equal
			| 'Number'                 | 'Amount'   | 'Company'      | 'Cash account'       | 'Currency' | 'Transaction type' |
			| '$$NumberCashReceipt1$$' | '1 000,00' | 'Main Company' | 'Pos cash account 1' | 'TRY'      | 'Cash in'          |
		Then the number of "List" table lines is "равно" 1
		When in opened panel I select "Point of sales"
		And in the table "CashInList" I click "Update money transfers" button
		Then the number of "CashInList" table lines is "равно" 0
		And I close all client application windows
	* Check fiscal log
		And I parsed the log of the fiscal emulator by the path '$$LogPath$$' into the variable "ParsingResult"
		And I check "$ParsingResult$" with "0" and method is "CashInOutcome"
		And I check "$ParsingResult$" with "0" and data in "In.Parameter3" contains "1 000"

Scenario: _0850011 create retail sales receipt from POS (consignor, cash)
	And I close all client application windows
	And In the command interface I select "Retail" "Point of sale"
	* Select first item (scan by barcode, with serial lot number)
		And I click "Search by barcode (F7)" button
		And I input "57897909799" text in the field named "InputFld"
		And I click the button named "OK"
		And I activate "Price" field in "ItemList" table
		And I select current line in "ItemList" table
		And I input "100,00" text in "Price" field of "ItemList" table
		And I finish line editing in "ItemList" table
	* Select second item (scan by barcode, with serial lot number)
		And I click "Search by barcode (F7)" button
		And I input "09987897977893" text in the field named "InputFld"
		And I click the button named "OK"
		And I activate "Price" field in "ItemList" table
		And I select current line in "ItemList" table
		And I input "200,00" text in "Price" field of "ItemList" table
		And I finish line editing in "ItemList" table
	* Payment
		And I click "Payment (+)" button
		Then "Payment" window is opened
		And I click the button named "Enter"
		And I close all client application windows
	* Check fiscal log
		And I parsed the log of the fiscal emulator by the path '$$LogPath$$' into the variable "ParsingResult"
		And I check "$ParsingResult$" with "0" and method is "ProcessCheck"
		And I check "$ParsingResult$" with "0" and data in "In.Parameter3" the same as "SalesReceiptXML1"
		
				
Scenario: _0850015 create retail sales receipt from POS (own stock, card 02)
	And I close all client application windows
	And In the command interface I select "Retail" "Point of sale"
	* Select first item (scan by barcode, with serial lot number)
		And I click "Search by barcode (F7)" button
		And I input "23455677788976667" text in the field named "InputFld"
		And I click the button named "OK"
		And I activate "Price" field in "ItemList" table
		And I select current line in "ItemList" table
		And I input "100,00" text in "Price" field of "ItemList" table
		And I finish line editing in "ItemList" table
	* Select second item (scan by barcode, without serial lot number)
		And I click "Search by barcode (F7)" button
		And I input "2202283705" text in the field named "InputFld"
		And I click the button named "OK"
		And I finish line editing in "ItemList" table
	* Payment
		And I click "Payment (+)" button
		Then "Payment" window is opened
		And I click "Card (*)" button
		Then "Payment types" window is opened
		And I click "Page_0" hyperlink
		Then "Payment" window is opened
		And I click the button named "Enter"
		And I close all client application windows	
	* Check fiscal log
		And I parsed the log of the fiscal emulator by the path '$$LogPath$$' into the variable "ParsingResult"
		And I check "$ParsingResult$" with "0" and method is "ProcessCheck"
		And I check "$ParsingResult$" with "0" and data in "In.Parameter3" the same as "SalesReceiptXML2"
		
		
Scenario: _0850015 create retail sales receipt from POS (own stock, cash and card 02)
	And I close all client application windows
	And In the command interface I select "Retail" "Point of sale"
	* Select first item (scan by barcode, with serial lot number)
		And I click "Search by barcode (F7)" button
		And I input "57897909799" text in the field named "InputFld"
		And I click the button named "OK"
		And I activate "Price" field in "ItemList" table
		And I select current line in "ItemList" table
		And I input "100,00" text in "Price" field of "ItemList" table
		And I finish line editing in "ItemList" table
	* Select second item (scan by barcode, without serial lot number)
		And I click "Search by barcode (F7)" button
		And I input "2202283705" text in the field named "InputFld"
		And I click the button named "OK"
		And I finish line editing in "ItemList" table
	* Select third item
		And I click "Search by barcode (F7)" button
		And I input "23455677788976667" text in the field named "InputFld"
		And I click the button named "OK"
		And I activate "Price" field in "ItemList" table
		And I select current line in "ItemList" table
		And I input "100,00" text in "Price" field of "ItemList" table
		And I finish line editing in "ItemList" table
	* Select fourth item
		And I click "Search by barcode (F7)" button
		And I input "19987897977" text in the field named "InputFld"
		And I click the button named "OK"
		And I activate "Price" field in "ItemList" table
		And I select current line in "ItemList" table
		And I input "120,00" text in "Price" field of "ItemList" table
		And I finish line editing in "ItemList" table
	* Payment
		And I click "Payment (+)" button
		Then "Payment" window is opened
		And I click "Card (*)" button
		Then "Payment types" window is opened
		And I click "Page_0" hyperlink
		And I activate field named "PaymentsAmountString" in "Payments" table
		And I select current line in "Payments" table
		And I click "4" button
		And I click "0" button
		And I click "0" button
		And I click "Cash (/)" button
		And I click the button named "Enter"
		And I close all client application windows	
		And I parsed the log of the fiscal emulator by the path '$$LogPath$$' into the variable "ParsingResult"
		And I check "$ParsingResult$" with "0" and method is "ProcessCheck"
		And I check "$ParsingResult$" with "0" and data in "In.Parameter3" the same as "SalesReceiptXML3"

	
				
Scenario: _0850017 payment by payment agent from POS
	And I close all client application windows
	And In the command interface I select "Retail" "Point of sale"
	* Select retail customer
		And I click "Search customer" button
		And I input "002" text in "ID" field
		And I move to the next attribute
		And I click "OK" button
	* Select first item (scan by barcode, with serial lot number)
		And I click "Search by barcode (F7)" button
		And I input "57897909799" text in the field named "InputFld"
		And I click the button named "OK"
		And I activate "Price" field in "ItemList" table
		And I select current line in "ItemList" table
		And I input "100,00" text in "Price" field of "ItemList" table
		And I finish line editing in "ItemList" table
	* Bank credit
		And I click "Payment (+)" button
		And I click "P\A" button
		And "Payments" table became equal
			| 'Payment type' | 'Amount' |
			| 'Bank credit'  | '118,00' |
		And I click the button named "Enter"
		And Delay 3
		And I parsed the log of the fiscal emulator by the path '$$LogPath$$' into the variable "ParsingResult"
		And I check "$ParsingResult$" with "0" and method is "ProcessCheck"
		And I check "$ParsingResult$" with "0" and data in "In.Parameter3" the same as "SalesReceiptXML5"


	
Scenario: _0850018 advance payment
	And I close all client application windows
	And In the command interface I select "Retail" "Point of sale"
	* Select retail customer
		And I click "Search customer" button
		And I input "005" text in "ID" field
		And I move to the next attribute
		And I click "OK" button
	* Advance
		And I click the button named "Advance"
		And I change the radio button named "ReceiptPaymentMethod" value to "Advance payment"	
		Then "Payment" window is opened
		And I click "2" button
		And I click "0" button
		And I click "0" button
		And I click the button named "Enter"
	* Advance payment
		And I click "Search customer" button
		And I input "005" text in "ID" field
		And I move to the next attribute
		And I click "OK" button
		And I click "Search by barcode (F7)" button
		And I input "57897909799" text in the field named "InputFld"
		And I click the button named "OK"
		And I activate "Price" field in "ItemList" table
		And I select current line in "ItemList" table
		And I input "210,00" text in "Price" field of "ItemList" table
		And I finish line editing in "ItemList" table
		And I click "Payment (+)" button
		And I click "Cash (/)" button
		And I click the button named "Enter"
		And I move to the next attribute
		And I parsed the log of the fiscal emulator by the path '$$LogPath$$' into the variable "ParsingResult"
		And I check "$ParsingResult$" with "0" and method is "ProcessCheck"		

Scenario: _0850025 sales return (cash)
	And I close all client application windows
	Given I open hyperlink "e1cib/list/Document.RetailSalesReceipt"	
	* Select Retail sales receipt
		And I go to line in "List" table
			| 'Σ'      |
			| '210,00' |
		And I click the button named "FormDocumentRetailReturnReceiptGenarate"
		And I expand current line in "BasisesTree" table
		And I click "Ok" button
		And I click "Post" button
		And I click "Print receipt" button
	* Check fiscal log
		And Delay 5
		And I parsed the log of the fiscal emulator by the path '$$LogPath$$' into the variable "ParsingResult"
		And Delay 5
		And I check "$ParsingResult$" with "0" and method is "ProcessCheck"
		And I check "$ParsingResult$" with "0" and data in "In.Parameter3" the same as "SalesReceiptXML6"
				
Scenario: _0850025 sales return (bank credit)
	And I close all client application windows
	Given I open hyperlink "e1cib/list/Document.RetailSalesReceipt"	
	* Select Retail sales receipt
		And I go to line in "List" table
			| 'Σ'      |
			| '118,00' |
		And I click the button named "FormDocumentRetailReturnReceiptGenarate"
		And I expand current line in "BasisesTree" table
		And I click "Ok" button
		And I click "Post" button
		And I click "Print receipt" button
	* Check fiscal log
		And Delay 5
		And I parsed the log of the fiscal emulator by the path '$$LogPath$$' into the variable "ParsingResult"
		And Delay 5
		And I check "$ParsingResult$" with "0" and method is "ProcessCheck"
		And I check "$ParsingResult$" with "0" and data in "In.Parameter3" the same as "SalesReceiptXML7"
						
Scenario: _0850026 sales return (card)
	And I close all client application windows
	Given I open hyperlink "e1cib/list/Document.RetailSalesReceipt"	
	* Select Retail sales receipt
		And I go to line in "List" table
			| 'Σ'      |
			| '620,00' |
		And I click the button named "FormDocumentRetailReturnReceiptGenarate"
		And I expand current line in "BasisesTree" table
		And I go to line in "BasisesTree" table
			| 'Row presentation'         |
			| 'Product 1 with SLN (PZU)' |
		And I change "Use" checkbox in "BasisesTree" table
		And I finish line editing in "BasisesTree" table
		And I click "Ok" button
		And I move to "Payments" tab
		And I activate field named "PaymentsAmount" in "Payments" table
		And I select current line in "Payments" table
		And I input "520,00" text in the field named "PaymentsAmount" of "Payments" table
		And I finish line editing in "Payments" table
		And I click "Post" button
		And I click "Print receipt" button
	* Check fiscal log
		And Delay 5
		And I parsed the log of the fiscal emulator by the path '$$LogPath$$' into the variable "ParsingResult"
		And Delay 5
		And I check "$ParsingResult$" with "0" and method is "ProcessCheck"
		And I check "$ParsingResult$" with "0" and data in "In.Parameter3" the same as "SalesReceiptXML8"

Scenario: _0850030 print X report
	And I close all client application windows
	And In the command interface I select "Retail" "Point of sale"
	And I click "Print X Report" button
	And Delay 5
	And I parsed the log of the fiscal emulator by the path '$$LogPath$$' into the variable "ParsingResult"
	And I check "$ParsingResult$" with "0" and method is "PrintXReport"	



Scenario: _0260150 create cash out
	And I close all client application windows
	* Open POS		
		And In the command interface I select "Retail" "Point of sale"	
	* Create cash out
		And I click "Create cash out" button
	* Check filling money transfer
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "Branch" became equal to "Shop 02"
		Then the form attribute named "Sender" became equal to "Pos cash account 1"
		Then the form attribute named "SendFinancialMovementType" became equal to "Movement type 1"
		Then the form attribute named "SenderCurrency" became equal to "TRY"
		Then the form attribute named "Receiver" became equal to "Cash desk №2"
		Then the form attribute named "ReceiveFinancialMovementType" became equal to "Movement type 1"
		Then the form attribute named "ReceiverCurrency" became equal to "TRY"
		And I input "1 000,00" text in "Send amount" field
		And I click "Create money transfer" button
		Then in the TestClient message log contains lines by template:
			|'Object Money transfer* created.'|		
	* Check creation
		Given I open hyperlink "e1cib/list/Document.MoneyTransfer"
		And I go to line in "List" table
			| 'Author' | 'Company'      | 'Receive amount' | 'Receive currency' | 'Receiver'     | 'Send amount' | 'Send currency' | 'Sender'             |
			| 'CI'     | 'Main Company' | '1 000,00'       | 'TRY'              | 'Cash desk №2' | '1 000,00'    | 'TRY'           | 'Pos cash account 1' |
		And I select current line in "List" table
		And I delete "$$NumberMoneyTransfer3$$" variable
		And I delete "$$MoneyTransfer3$$" variable
		And I save the value of "Number" field as "$$NumberMoneyTransfer3$$"
		And I save the window as "$$MoneyTransfer3$$"
		And I click "Print cash out" button	
	* Create Cash receipt
		And I click "Cash receipt" button
		Then the form attribute named "Company" became equal to "Main Company"
		Then the form attribute named "CashAccount" became equal to "Cash desk №2"
		Then the form attribute named "TransactionType" became equal to "Cash in"
		Then the form attribute named "Currency" became equal to "TRY"
		And "PaymentList" table became equal
			| '#' | 'Total amount' | 'Financial movement type' | 'Money transfer'     |
			| '1' | '1 000,00'     | 'Movement type 1'         | '$$MoneyTransfer3$$' |
		Then the form attribute named "Branch" became equal to "Shop 02"
		And the editing text of form attribute named "DocumentAmount" became equal to "1 000,00"
		Then the form attribute named "CurrencyTotalAmount" became equal to "TRY"
		And I click "Post" button
		And I delete "$$NumberCashReceipt2$$" variable
		And I delete "$$CashReceipt2$$" variable
		And I save the value of "Number" field as "$$NumberCashReceipt2$$"
		And I save the window as "$$CashReceipt2$$"
	* Check creation
		Given I open hyperlink "e1cib/list/Document.CashReceipt"
		And "List" table contains lines
			| 'Number'                 | 'Amount'   | 'Company'      | 'Cash account' | 'Reference'        | 'Currency' | 'Transaction type' | 'Author' |
			| '$$NumberCashReceipt2$$' | '1 000,00' | 'Main Company' | 'Cash desk №2' | '$$CashReceipt2$$' | 'TRY'      | 'Cash in'          | 'CI'     |
		And I close all client application windows		
		

Scenario: _0260152 close sessiion
	And I close all client application windows
	* Open POS		
		And In the command interface I select "Retail" "Point of sale"	
	* Close session
		And I click "Close session" button
		And I set checkbox named "CashConfirm"
		And I set checkbox named "TerminalConfirm"
		And I set checkbox named "CashConfirm"
		And I move to the next attribute		
		And I click "Close session" button
		And Delay 5
	* Check fiscal log
		And I parsed the log of the fiscal emulator by the path '$$LogPath$$' into the variable "ParsingResult"
		And I check "$ParsingResult$" with "0" and method is "CloseShift"	
				

