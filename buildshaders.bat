@echo on
set shaders_path=%cd%/win32_30_nv8
set shaders_remix_path=%cd%/win32_30_remix
set win32_30=%cd%/update/common/shaders/win32_30
set win32_30_atidx10=%cd%/update/common/shaders/win32_30_atidx10

for /R "%shaders_path%" %%a in (*.xml) do (
    RageShaderEditor.exe "%%a"
)

if not exist "%win32_30%" mkdir "%win32_30%"
for /R "%shaders_path%" %%i in (*.fxc) do (
echo D | xcopy "%%i" "%win32_30%" /K /H /Y
del "%%i"
)

for /R "%shaders_remix_path%" %%a in (*.xml) do (
    RageShaderEditor.exe "%%a"
)

if not exist "%win32_30_atidx10%" mkdir "%win32_30_atidx10%"
for /R "%shaders_remix_path%" %%i in (*.fxc) do (
echo D | xcopy "%%i" "%win32_30_atidx10%" /K /H /Y
del "%%i"
)

echo D | xcopy "%cd%/resources" "%cd%/update" /K /H /Y /S