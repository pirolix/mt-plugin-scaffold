@ECHO OFF
ECHO $Id$

REM SubWCRev ��p���ăL�[���[�h�u�����s��
REM http://tortoisesvn.net/docs/release/TortoiseSVN_ja/tsvn-subwcrev-keywords.html

FOR /F "delims=" %%F in ('FINDSTR /S /M "$WC" .\*') do (
    ECHO Processing %%F
    SubWCRev . "%%F" "%%F" -q
)
PAUSE
