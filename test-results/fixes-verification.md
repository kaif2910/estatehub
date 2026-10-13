# Browser issue fixes — 13 October 2026

- Homepage mode buttons now submit SALE/RENT and category slugs, with selected-state accessibility feedback. Commercial returned one Commercial Office listing in the live browser.
- Category options load from the database. When unavailable, standard slug-based choices and a visible availability notice are used without fabricating database IDs. Apartment + Mumbai returned eight matching listings. Filters wait for Apply Filters and include the current keyword edit.
- Saved links go through the authenticated controller. Direct JSP access redirects too. Removed demo counts, fake comparison selection, and fake active subscriptions. Comparison uses selected saved cards; sorting uses their actual prices/areas. Removal uses POST and reports a failed database removal. Comparison with real saved data still needs authenticated browser verification.
- Blank login is blocked by browser required fields and server validation. The duplicate login warning is fixed.
- Recovery renders escaped request-scope success/errors and shows the actual 30-minute expiration. Browser submission using a nonexistent test address displayed the generic confirmation. Delivery to a real mailbox was not tested.
- Informational links open a real information/help page; popular city links run searches. Operator-approved legal policies and a public support contact still need to be supplied.
- Alert preferences now open a dialog explaining that automated SMS/WhatsApp/price alerts are unavailable, with a link to existing property preferences. No delivery service was added.

Validation: `mvn -q -DskipTests=false test package` passed all 12 tests (including 3 new server form-validation regression tests); `git diff --check` passed. Built WAR deployed to the existing local Cargo/Tomcat webapps directory.

Screenshot: recovery-fixed.jpg.
