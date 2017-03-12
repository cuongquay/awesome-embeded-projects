// GlobalData.cpp: implementation of the CGlobalData class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "DigiLED.h"
#include "GlobalData.h"

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CGlobalData::CGlobalData()
{
	m_clrBkGnd = RGB(10,10,10);
	m_clrGrid = RGB(50,50,50);
	m_nGridSize = 1;
	m_nCurrentPage =0;
	m_nShowTime = 5;
}

CGlobalData::~CGlobalData()
{

}