/**
 * @id appsec-queries/crypto/aes-pbkf2-iterations
 * @kind problem
 * @title PBKDF2 iterations
 * @severity error
 * @description PBKDF2 iterations should be: SHA-1: 1_300_000, SHA-256: 600_000, SHA-512: 210_000. 
 * @ref https//cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html#pbkdf2
 */
import javascript

from CallExpr call, string sha, int iterations
where
  call.getCalleeName() = "pbkdf2" and (
  exists(|
    call.getArgument(2).getIntValue() < 1300000 and
    call.getArgument(3).getIntValue() = 1 |
    sha = "SHA-1" and
    iterations = 1300000
    ) or
  exists(|
    call.getArgument(2).getIntValue() < 600000 and
    call.getArgument(3).getIntValue() = 256 |
    sha = "SHA-256" and
    iterations = 600000
    ) or
  exists(|
    call.getArgument(2).getIntValue() < 210000 and
    call.getArgument(3).getIntValue() = 512 |
    sha = "SHA-512" and
    iterations = 210000
    )
  )
  
select call,  "Increase the number of iterations to at least " + iterations + " for PBKDF2 " + sha
