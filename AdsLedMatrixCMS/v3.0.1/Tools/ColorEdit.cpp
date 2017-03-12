// ColorEdit.cpp : implementation file
//

#include "stdafx.h"
#include "ColorEdit.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CColorEdit

CColorEdit::CColorEdit()
{
}

CColorEdit::~CColorEdit()
{
}


BEGIN_MESSAGE_MAP(CColorEdit, CRichEditCtrl)
	//{{AFX_MSG_MAP(CColorEdit)
	ON_WM_CTLCOLOR_REFLECT()
	ON_CONTROL_REFLECT(EN_UPDATE, OnUpdate)
	ON_WM_CREATE()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CColorEdit message handlers

HBRUSH CColorEdit::CtlColor(CDC* pDC, UINT nCtlColor) 
{	
	LOGFONT lf;
	memset(&lf, 0, sizeof(LOGFONT));			// zero out structure			
	lf.lfHeight = 16;				  			//  size
	lf.lfWeight	= FW_BOLD;					
	lf.lfQuality= ANTIALIASED_QUALITY;						
#ifdef _UNICODE
	wcscpy((LPTSTR)lf.lfFaceName, _T(".VnTime"));     // request a face name 
#else
	strcpy((LPTSTR)lf.lfFaceName, _T(".VnTime"));     // request a face name 
#endif
	CFont font;
	VERIFY(font.CreateFontIndirect(&lf));		// create the font
	
	pDC->SelectObject(&font);
	pDC->SetTextColor(RGB(255,0,0));
	
	CBrush brush(RGB(0,0,0));
	pDC->SetTextColor(RGB(255,0,0));	
	CRect rect;
	CBrush* brOld = pDC->SelectObject(&brush);	
	pDC->Rectangle(rect);

	return HBRUSH(NULL);
}

void CColorEdit::OnUpdate() 
{
	// TODO: If this is a RICHEDIT control, the control will not
	// send this notification unless you override the CEdit::OnInitDialog()
	// function to send the EM_SETEVENTMASK message to the control
	// with the ENM_UPDATE flag ORed into the lParam mask.
	
	// TODO: Add your control notification handler code here
	
}

int CColorEdit::OnCreate(LPCREATESTRUCT lpCreateStruct) 
{
	if (CRichEditCtrl::OnCreate(lpCreateStruct) == -1)
		return -1;	

	this->InitCharFormat();

	return 0;
}

void CColorEdit::InitCharFormat()
{
	CHARFORMAT cf = {0};
	cf.cbSize = sizeof(CHARFORMAT);
	cf.crTextColor = RGB(255,0,0);
	cf.yHeight = 300;
	cf.dwMask = CFM_EMBOSS|CFM_OUTLINE|CFM_SHADOW|CFM_BOLD|CFM_COLOR|CFM_BACKCOLOR|CFM_FACE|CFM_SIZE;
	cf.dwEffects = CFE_BOLD|CFE_SHADOW;
	strcpy(cf.szFaceName,(".VnTime"));	
	SetDefaultCharFormat(cf);
	SetBackgroundColor(FALSE,RGB(0,0,0));
}


void CColorEdit::SetTextColor(COLORREF clr)
{	
	CHARFORMAT cf = {0};
	cf.cbSize = sizeof(CHARFORMAT);
	cf.crTextColor = clr;		
	cf.yHeight = 300;
	strcpy(cf.szFaceName,(".VnTime"));
	cf.dwMask = CFM_EMBOSS|CFM_OUTLINE|CFM_SHADOW|CFM_BOLD|CFM_COLOR|CFM_BACKCOLOR|CFM_FACE|CFM_SIZE;
	cf.dwEffects = CFE_BOLD|CFE_SHADOW;
	SetDefaultCharFormat(cf);	
}

void CColorEdit::SetTextColor(int nColor)
{
	COLORREF clr = RGB(0,0,0);
	if (nColor == 1)
		clr = RGB(255,0,0);
	else
	if (nColor == 2)
		clr = RGB(0,255,0);
	else
	if (nColor == 3)
		clr = RGB(255,255,0);
	
	this->SetTextColor(clr);
}