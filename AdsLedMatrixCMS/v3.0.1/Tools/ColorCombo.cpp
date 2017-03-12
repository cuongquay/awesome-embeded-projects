// ColorCombo.cpp : implementation file
//

#include "stdafx.h"
#include "ColorCombo.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CColorCombo

CColorCombo::CColorCombo()
{
}

CColorCombo::~CColorCombo()
{
}


BEGIN_MESSAGE_MAP(CColorCombo, CComboBox)
	//{{AFX_MSG_MAP(CColorCombo)
		// NOTE - the ClassWizard will add and remove mapping macros here.
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CColorCombo message handlers

void CColorCombo::DrawItem(LPDRAWITEMSTRUCT lpDrawItemStruct) 
{
	if (lpDrawItemStruct->CtlType != ODT_COMBOBOX)
		return ;

	LPCTSTR lpszText = (LPCTSTR) lpDrawItemStruct->itemData;
	if (lpszText ==NULL || lpDrawItemStruct->itemData ==-1){
		return;
	}

	ASSERT(lpszText != NULL);
	CDC dc,*pDC = NULL;
	dc.Attach(lpDrawItemStruct->hDC);
	pDC = &dc;
	
	int R=0,G=0,B=0;
	sscanf((char*)lpszText,("RGB(%d,%d,%d"),&R,&G,&B);
	COLORREF clr = RGB(R,G,B);
	CBrush br(clr);
	CPen pen(PS_SOLID,3,RGB(0,0,0));
	CPen* pOldPen = pDC->SelectObject(&pen);
	CBrush* pBrOld = NULL;
	pBrOld = pDC->SelectObject(&br);
	pDC->Rectangle(&lpDrawItemStruct->rcItem);
	pDC->SelectObject(pOldPen);
	pDC->SelectObject(pBrOld);
	
	pDC->Detach();
	
}

COLORREF CColorCombo::GetColorItem(int nIndex)
{	
	COLORREF clrItem = RGB(0,0,0);
	
	return clrItem;
}