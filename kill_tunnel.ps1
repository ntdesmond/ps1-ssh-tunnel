# This might be useful in case a tunnel process hangs, blocking the shell
(Get-WmiObject Win32_Process -Filter "name = 'ssh.exe' and CommandLine like '%-N[RL]%'").Terminate()