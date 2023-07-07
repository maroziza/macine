Second-mode operating, monitor is tool used to inspect contents of RAM and some registers.
Debug flag is supposed to bring up 

| key            | action                              |
|----------------|-------------------------------------|
| Enter          | buffer->(address)                   |
| Space          | buffer->(address), address++        |
| Backspace      | buffer->(address), address--        |
| .              | buffer->address                     |
| :              | buffer->page                        |
| p, UP          | address -= 16                       |
 | n, DOWN        | address += 16                       |
| 0-9, a-f       | buffer=buffer&0xF0 &#124; key       |
| Shift 0-9, a-f | buffer=buffer&0x0F &#124; key << 4  |
