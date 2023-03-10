/******************************************************************************
 * YesDialog.c
 *
 * Copyright (c) 2022, longpanda <admin@ventoy.net>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 3 of the
 * License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, see <http://www.gnu.org/licenses/>.
 *
 */

#include <Windows.h>
#include <commctrl.h>
#include "resource.h"
#include "Language.h"
#include "YUMI2USB.h"

BOOL g_InputYes = FALSE;

static BOOL YesInitDialog(HWND hWnd, WPARAM wParam, LPARAM lParam)
{
    HFONT hStaticFont1;
    HFONT hStaticFont2;

    g_InputYes = FALSE;

    SetWindowText(GetDlgItem(hWnd, IDC_YES_STATIC4), _G(STR_INSTALL_YES_TIP1));
    SetWindowText(GetDlgItem(hWnd, IDC_YES_STATIC1), _G(STR_INSTALL_YES_TIP2));

    SetWindowText(GetDlgItem(hWnd, ID_YES_OK), _G(STR_BTN_OK));
    SetWindowText(GetDlgItem(hWnd, ID_YES_CANCEL), _G(STR_BTN_CANCEL));

    hStaticFont1 = CreateFont(26, 0, 0, 0, FW_BOLD, FALSE, FALSE, 0,
        ANSI_CHARSET, OUT_DEFAULT_PRECIS,
        CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY,
        DEFAULT_PITCH & FF_SWISS, TEXT("Courier New"));

    hStaticFont2 = CreateFont(22, 0, 0, 0, FW_BOLD, FALSE, FALSE, 0,
        ANSI_CHARSET, OUT_DEFAULT_PRECIS,
        CLIP_DEFAULT_PRECIS, DEFAULT_QUALITY,
        DEFAULT_PITCH & FF_SWISS, TEXT("MS Shell Dlg"));

    SendMessage(GetDlgItem(hWnd, IDC_YES_STATIC2), WM_SETFONT, (WPARAM)hStaticFont1, TRUE);
    SendMessage(GetDlgItem(hWnd, IDC_YES_STATIC4), WM_SETFONT, (WPARAM)hStaticFont2, TRUE);

    return TRUE;
}


static VOID OnYesBtnOkClick(HWND hWnd)
{	
	CHAR Value[64] = { 0 };

	GetWindowTextA(GetDlgItem(hWnd, IDC_YES_EDIT1), Value, sizeof(Value) - 1);
	
    if (strcmp(Value, "YES") == 0)
    {
        g_InputYes = TRUE;
    }
    
    SendMessage(hWnd, WM_CLOSE, 0, 0);
}

static VOID OnYesBtnCancelClick(HWND hWnd)
{
	SendMessage(hWnd, WM_CLOSE, 0, 0);
}

INT_PTR CALLBACK YesDialogProc(HWND hWnd, UINT Message, WPARAM wParam, LPARAM lParam)
{
    WORD NotifyCode;
    WORD CtrlID;

    switch (Message)
    {
        case WM_COMMAND:
        {
            NotifyCode = HIWORD(wParam);
            CtrlID = LOWORD(wParam);
            
            if (CtrlID == ID_YES_OK && NotifyCode == BN_CLICKED)
            {
				OnYesBtnOkClick(hWnd);
            }
            else if (CtrlID == ID_YES_CANCEL && NotifyCode == BN_CLICKED)
            {
				OnYesBtnCancelClick(hWnd);
            }			
            else
            {
                return TRUE;
            }

            break;
        }
        case WM_CTLCOLORSTATIC:
        {
            if (GetDlgItem(hWnd, IDC_YES_STATIC2) == (HANDLE)lParam ||
                GetDlgItem(hWnd, IDC_YES_STATIC4) == (HANDLE)lParam)
            {
                SetBkMode((HDC)wParam, TRANSPARENT);
                SetTextColor((HDC)wParam, RGB(255, 0, 0));
                return (LRESULT)(HBRUSH)(GetStockObject(HOLLOW_BRUSH));
            }
            else
            {
                break;
            }
        }
        case WM_INITDIALOG:
        {
            YesInitDialog(hWnd, wParam, lParam);
            return FALSE;
        }        
        case WM_CLOSE:
        {            
            EndDialog(hWnd, 0);
            return TRUE;
        }
    }

    return 0;
}
