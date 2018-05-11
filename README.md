# validator

<!--
 ============================================================= 
  TITLE:    MIT Press Validator                               
  VERSION:  1.1                                               
  DATE:     March 2018                                        
                                                               
 ============================================================= 
 ============================================================= 
                             SECTIONS                            
 1. HEADER METADATA                                            
    - Check @article-type EXISTS on the <article>
    - Check VALUE of @article-type is among confirmed values
 2. JOURNAL METADATA
    - Check <journal-id> EXISTS
    - Check VALUE of <journal-id> element is among confirmed values
    - Check VALUE of <journal-id> matches VALUE of <journal-title>
    - Check <issn> EXISTS and appears in the correct number
    - Check <journal-title> EXISTS
    - Check <abbrev-journal-title> EXISTS
    - Check @abbrev-type EXISTS on <abbrev-journal-title>
    - Check VALUE of @abbrev-type
    - Check <publisher-name> EXISTS
    - Check VALUE of <publisher-name>
    - Check <addr-line> EXISTS
    - Check VALUE of <addr-line>
    - Check <country> EXISTS
    - Check VALUE of <country>
    - Check <email> EXISTS
    - Check VALUE of <email>
 3. ARTICLE METADATA                               
    - Check NUMBER of <article-id> is correct and holds the correct VALUE
    - Check that the VALUE of @pub-id-type is correct on <article-id>
    - Check <article-id> is formatted correctly
    - Check <title-group> EXISTS
    - Check <subtitle> DOES NOT EXIST
    - Check <pub-date> EXISTS
    - Check VALUE of @pub-type is correct on e-only journals
    - Check 1 <pub-date> element on e-only journals
    - Check 2 <pub-date> elements on print/online journals
    - Check <month> is not a string and that it's formatted correctly
    - Check <volume> DOES NOT EXIST on Just Accepted or Early Access articles
    - Check <issue> DOES NOT EXIST on Just Accepted or Early Access articles
    - Check <pub-date> DOES NOT EXIST on Just Accepted or Early Access articles
    - Check <permissions> EXISTS
    - Check <copyright-statement> EXISTS
    - Check <copyright-holder> EXISTS
    - Check <copyright-year> EXISTS
    - Check <license> and <license-p> EXIST (OA only)
    - Check VALUE of @license-type @xlink:href on <license> (OA only)
    - Check VALUE of <license> (OA only)
    - Check VALUE of <copyright-holder> (OA only: NETN, CPSY, OIPMI)
    - Check VALUE of <copyright-holder> (OA only: COLI)
    - Check VALUE of <copyright-holder> (OA only: ADEV)
    - Check VALUE of <copyright-statement> (OA only: NETN, CPSY, OIPMI)
    - Check VALUE of <copyright-statement> (OA only: COLI)
    - Check VALUE of <copyright-statement> (OA only: ADEV)
    - Check <self-uri> EXISTS
    - Check VALUE of @xlink:href on <self-uri>
    - Check VALUE of @xlink:href on <related-article> does not point to self
    - Check <abstract> DOES NOT contain <title>
    - Check <kwd> are separated by <x>, <x>
    - Check <heading> DOES NOT EXIST
 	
 4. CONTRIBUTORS
    - Check that the <contributor> uses <string-name>, not <name>
    - Check VALUE <contrib-type>
    - Check VALUE of <contrib-id>
    - Check affiliations not tagged as <xref>
    - Check VALUE of @ref-type on <xref>
    - Check VALUE of <aff> is not too long
    - Check corresponding author (Part 1)
    - Check corresponding author (Part 2)
    - Check @id EXISTS on <corresp>
    - Check VALUE of <corresp>
    - Check VALUE of @id on <corresp>
 5. BOOK REVIEWS
    - Check that all book reviews contain a <product>
    - Check that if a <product> element exists, the article type is book-review
    - Check <source> exists inside <product>
    - If a book review includes <article-title>, the title should not be the same as <source>
 6. FUNDREF INFORMATION
    - ALERT user to empty <award-id>
    - ALERT user to empty <institution>
    - ALERT user empty <institution-id>
 7. REFERENCES
    - Check @publication-type EXISTS on <mixed-citation>
    - Check VALUE of @publication-type
    
 8. FIGURES                                        
    - 
    
 9. TABLES                                        
    - Check tables are HTML, not OASIS
 ============================================================= 
 ============================================================= 
 
  INFO: Full MIT Press XML Tagging guidelines can be found at 
  http://bit.ly/2oEXilJ. Questions should be directed to 
  kmcdouga@mit.edu.                                      
                                                               
 ============================================================= 
 -->
