/**
 * @id appsec-queries/crypto/derivekey-pbkf2-iterations-sha-1
 * @kind problem
 * @title PBKDF2 iterations
 * @severity error
 * @description PBKDF2 iterations should be: SHA-1: 1_300_000, SHA-256: 600_000, SHA-512: 210_000. 
 * @ref https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html#pbkdf2
 */
import javascript
import DeriveKeyCallLib

from DeriveKeyCall call, string sha, int iterations
where 
  exists( |
    call.getHash() = "sha-1" and
    call.getIterations() < 1300000  |
    sha = "SHA-1" and
    iterations = 1300000
   ) or
   exists( |
    call.getHash() = "sha-256" and
    call.getIterations() < 600000  |
    sha = "SHA-256" and
    iterations = 600000
   ) or
   exists( |
    call.getHash() = "sha-512" and
    call.getIterations() < 210000  |
    sha = "SHA-512" and
    iterations = 210000
   )
  
  
select call, "Increase the number of iterations to at least " + iterations + " for " + sha


