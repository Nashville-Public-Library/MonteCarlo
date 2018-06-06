; CARLX_LimitlessLibraries_ArchiveInvoices.au3
; INSERT LIBRARY DEFINED FIELD "MNPS" ON ALL SCHOOLS
; OR FIGURE OUT WHERE ROUTE IS

; CONFIGURATION
AutoItSetOption("MouseCoordMode",0)
AutoItSetOption("SendCapslockMode", 0)
AutoItSetOption("SendKeyDelay", 0)
Send("{CAPSLOCK off}")

; INCLUDES
#include <Array.au3>
#include <CARLX.au3>

; FUNCTIONS

; VARIABLES

Local $aInvoiceIds[10] = [ 12345, _
242597, _
242598, _
242599, _
242600, _
242601, _
242602, _
242604, _
242605, _
242606]

; SCRIPT

; OPEN SQL Developer
;~ SQLDeveloperOpen()

; SQL query for the target invoices
;~ select invoiceid from invoice_v where branchgroup = '2' and status = 'RC' and dateapproved is not null order by invoiceid ;

; QUERY FOR ARCHIVABLE INVOICES

; OPEN CARLX WITH BRANCH LIMITLESS LIBRARIES
CarlXStaffOpen("29")

; OPEN ACQUISITIONS
Sleep(1000)
; Focus should land on Search > Term(s)

; ARCHIVE INVOICESi
For $nInvoiceId In _ArrayExtract($aInvoiceIds,2,5)
	WinWaitActive("Staff Workstation")
	Send("!n")	; Financials
	Send("i")	; Invoices
;	WinWaitActive("[CLASS:TInvoice.UnicodeClass]")
	Sleep(1000)
	Send($nInvoiceId) ; Invoice ID
	Send("{ENTER}")
	Sleep(1000)
	Send("!r")
	WinWaitActive("Invoice Archive")

Exit

	Send("!a")
Next
WinWaitActive("Staff Workstation")
CarlXStaffClose()

; REPORT
; TO DO: SQL query for the target invoices

Exit
