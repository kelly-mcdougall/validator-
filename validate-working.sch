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
 	- Check <article-title> EXISTS
 	- Check <subtitle> DOES NOT EXIST
 	- Check <pub-date> EXISTS
 	- Check VALUE of @pub-type is correct on e-only journals
    	- Check 1 <pub-date> element on e-only journals 
    	- Check 2 <pub-date> elements on print/online journals 
 	- Check <month> is not a string and that it's formatted correctly
 	- Check <volume> DOES NOT EXIST on Just Accepted or Early Access articles
 	- Check <issue> DOES NOT EXIST on Just Accepted or Early Access articles
 	- Check <copyright-statement> EXISTS
 	- Check <copyright-holder> EXISTS
 	- Check <copyright-year> EXISTS
 	- Check <license> and <license-p> EXIST (OA only)
 	- Check VALUE of @license-type @xlink:href on <license> (OA only)
 	- Check VALUE of <license> (OA only)
 	- Check VALUE of <copyright-statement> (OA only) 
 	- Check <self-uri> EXISTS
 	- Check <abstract> DOES NOT contain <title>
 	- Check <kwd> are separated by <x>, <x>
 	- Check <heading> DOES NOT EXIST
 	
 4. CONTRIBUTORS                                               
 	- Check that the <contributor> uses <string-name>, not <name>
    	- Check VALUE <contrib-type>
    	- Check VALUE of <contrib-id>
    	- Check affiliations not tagged as <xref>
    	- Check VALUE of @ref-type on <xref>
 - Check corresponding author (Part 1)
    	- Check corresponding author (Part 2)
    	- Check @id EXISTS on <corresp>
    	- Check VALUE of <corresp>
    	- Check VALUE of @id on <corresp>


 5. BOOK REVIEWS           
 	- Check that all book reviews contain a <product>
 	- If a book review includes <article-title>, the title should not be the same as <source> (** NOT WORKING **)

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


<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns prefix="mml" uri="http://www.w3.org/1998/Math/MathML"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>
    <ns prefix="oasis" uri="http://www.niso.org/standards/z39-96/ns/oasis-exchange/table"/>




    <!-- HEADER METADATA -->

    <!-- Check @article-type EXISTS on the <article> element -->
    <pattern>
        <rule context="/article">
            <assert id="err1" test="@article-type"><![CDATA[The article element must have an article-type attribute]]></assert>
        </rule>
    </pattern>

    <!-- Check VALUE of @article-type is among confirmed values -->
    <pattern>
        <rule context="/article">
            <assert id="err2" test="
                @article-type = 'abstract' or @article-type = 'addendum' or @article-type = 'announcement' or
                @article-type = 'article-commentary' or @article-type = 'back-matter' or @article-type = 'bibliography' or
                @article-type = 'book-review' or @article-type = 'books-received' or @article-type = 'brief-report' or
                @article-type = 'calendar' or @article-type = 'case-report' or @article-type = 'clarification' or 
                @article-type = 'collection' or @article-type = 'correction' or @article-type = 'discussion' or 
                @article-type = 'dissertation' or @article-type = 'editorial' or @article-type = 'erratum' or
                @article-type = 'front-matter' or @article-type = 'in-brief' or @article-type = 'index' or 
                @article-type = 'instructions' or @article-type = 'introduction' or @article-type = 'letter' or
                @article-type = 'meeting-report' or @article-type = 'news' or @article-type = 'note' or 
                @article-type = 'obituary' or @article-type = 'opinion' or @article-type = 'oration' or
                @article-type = 'other' or @article-type = 'partial-retraction' or @article-type = 'product-review' or
                @article-type = 'rapid-communication' or @article-type = 'reply' or @article-type = 'reprint' or
                @article-type = 'republication' or @article-type = 'research-article' or @article-type = 'retraction' or
                @article-type = 'review-article' or @article-type = 'translation' or @article-type = 'withdrawal'">
                <![CDATA[The article-type attribute must be one of the following values: 
                'abstract', 'addendum', 'announcement', 'article-commentary', 'back-matter', 
                'bibliography', 'book-review', 'books-received', 'brief-report', 'calendar', 
                'case-report', 'clarification', 'collection', 'correction', 'discussion', 
                'dissertation', 'editorial', 'erratum', 'front-matter', 'in-brief', 'index', 
                'instructions', 'introduction', 'letter', 'meeting-report', 'news', 'note', 
                'obituary', 'opinion', 'oration', 'other', 'partial-retraction', 'product-review', 
                'rapid-communication', 'reply', 'reprint', 'republication', 'research-article', 
                'retraction', 'review-article', 'translation', 'withdrawal']]>
            </assert>
        </rule>
    </pattern>
    
    
    <!-- JOURNAL METADATA -->
    <pattern>
        <!-- Check <journal-id> EXISTS -->
        <rule context="/article/front/journal-meta">
            <assert test="journal-id" id="err3"><![CDATA[Missing journal-id element inside journal-meta]]></assert>
        </rule>
    </pattern>
    
    <pattern>
        <!-- Check VALUE of <journal-id> element is among confirmed values -->
        <rule context="/article/front/journal-meta/journal-id">
            <assert id="err4" test="
                . = 'adev' or . = 'afar' or . = 'ajhe' or . = 'artl' or . = 'artm' or . = 'asep' 
                or . = 'coli' or . = 'comj' or . = 'cpsy' or . = 'daed' or . = 'desi' or . = 'dram' 
                or . = 'edfp' or . = 'evco' or . = 'glep' or . = 'grey' or . = 'ijlm' or . = 'inov' 
                or . = 'isec' or . = 'jcws' or . = 'jinh' or . = 'jocn' or . = 'leon' or . = 'ling' 
                or . = 'lmj' or . = 'neco' or . = 'netn' or . = 'ntls' or . = 'octo' or . = 'opmi' 
                or . = 'pajj' or . = 'posc' or . = 'pres' or . = 'rest' or . = 'thld' or . = 'tneq'">
                <![CDATA[Invalid <journal-id>. <journal-id> must be one of the following values: 
                'adev', 'afar', 'ajhe', 'artl', 'artm', 'asep', 'coli', 'comj', 'cpsy', 'daed', 
                'desi', 'dram', 'edfp', 'evco', 'glep', 'grey', 'ijlm', 'inov', 'isec', 'jcws', 
                'jinh', 'jocn', 'leon', 'ling', 'lmj', 'neco', 'netn', 'ntls', 'octo', 'opmi', 
                'pajj', 'posc', 'pres', 'rest', 'thld', 'tneq']]>
            </assert>
        </rule>
    </pattern>
    
    <pattern>
        
        <!-- Check VALUE of <journal-id> matches VALUE of <journal-title> -->
        <rule context="/article/front/journal-meta/journal-id">
            <assert id="err5" test="
                (
                . = 'adev' and /article/front/journal-meta/journal-title-group/journal-title = 'Asian Development Review') or
                . = 'afar' and /article/front/journal-meta/journal-title-group/journal-title = 'African Arts' or
                . = 'ajhe' and /article/front/journal-meta/journal-title-group/journal-title = 'American Journal of Health Economics' or
                . = 'artl' and /article/front/journal-meta/journal-title-group/journal-title = 'Artificial Life' or
                . = 'artm' and /article/front/journal-meta/journal-title-group/journal-title = 'ARTMargins' or
                . = 'asep' and /article/front/journal-meta/journal-title-group/journal-title = 'Asian Economic Papers' or
                . = 'bflr' and /article/front/journal-meta/journal-title-group/journal-title = 'The Baffler' or
                . = 'cnsm' and /article/front/journal-meta/journal-title-group/journal-title = 'Cognitive Neuroscience Society Meeting' or
                . = 'coli' and /article/front/journal-meta/journal-title-group/journal-title = 'Computational Linguistics' or
                . = 'comj' and /article/front/journal-meta/journal-title-group/journal-title = 'Computer Music Journal' or
                . = 'cpsy' and /article/front/journal-meta/journal-title-group/journal-title = 'Computational Psychiatry' or
                . = 'daed' and /article/front/journal-meta/journal-title-group/journal-title = 'Daedalus' or
                . = 'desi' and /article/front/journal-meta/journal-title-group/journal-title = 'Design Issues' or
                . = 'dram' and /article/front/journal-meta/journal-title-group/journal-title = 'TDR/The Drama Review' or
                . = 'edfp' and /article/front/journal-meta/journal-title-group/journal-title = 'Education Finance and Policy' or
                . = 'evco' and /article/front/journal-meta/journal-title-group/journal-title = 'Evolutionary Computation' or
                . = 'glep' and /article/front/journal-meta/journal-title-group/journal-title = 'Global Environmental Politics' or
                . = 'grey' and /article/front/journal-meta/journal-title-group/journal-title = 'Grey Room' or
                . = 'ijlm' and /article/front/journal-meta/journal-title-group/journal-title = 'International Journal of Learning and Media' or
                . = 'inov' and /article/front/journal-meta/journal-title-group/journal-title = 'Innovations' or
                . = 'isec' and /article/front/journal-meta/journal-title-group/journal-title = 'International Security' or
                . = 'jcws' and /article/front/journal-meta/journal-title-group/journal-title = 'Journal of Cold War Studies' or
                . = 'jinh' and /article/front/journal-meta/journal-title-group/journal-title = 'Journal of Interdisciplinary History' or
                . = 'jocn' and /article/front/journal-meta/journal-title-group/journal-title = 'Journal of Cognitive Neuroscience' or
                . = 'leon' and /article/front/journal-meta/journal-title-group/journal-title = 'Leonardo' or
                . = 'ling' and /article/front/journal-meta/journal-title-group/journal-title = 'Linguistic Inquiry' or
                . = 'lmj' and /article/front/journal-meta/journal-title-group/journal-title = 'Leonardo Music Journal' or
                . = 'neco' and /article/front/journal-meta/journal-title-group/journal-title = 'Neural Computation' or
                . = 'netn' and /article/front/journal-meta/journal-title-group/journal-title = 'Network Neuroscience' or
                . = 'ntls' and /article/front/journal-meta/journal-title-group/journal-title = 'Nautilus' or
                . = 'octo' and /article/front/journal-meta/journal-title-group/journal-title = 'October' or
                . = 'opmi' and /article/front/journal-meta/journal-title-group/journal-title = 'Open Mind' or
                . = 'pajj' and /article/front/journal-meta/journal-title-group/journal-title = 'PAJ: A Journal of Performance and Art' or
                . = 'posc' and /article/front/journal-meta/journal-title-group/journal-title = 'Perspectives on Science' or
                . = 'pres' and /article/front/journal-meta/journal-title-group/journal-title = 'PRESENCE: Teleoperators and Virtual Environments' or 
                . = 'rest' and /article/front/journal-meta/journal-title-group/journal-title = 'Review of Economics and Statistics' or
                . = 'thld' and /article/front/journal-meta/journal-title-group/journal-title = 'Thresholds' or
                . = 'tneq' and /article/front/journal-meta/journal-title-group/journal-title = 'The New England Quarterly'
                ">
                <![CDATA[journal-id and journal-title do not match. journal-id is ']]><value-of select='/article/front/journal-meta/journal-id'/><![CDATA[' and journal-title is ']]><value-of select='/article/front/journal-meta/journal-title-group/journal-title'/><![CDATA[']]></assert>
        </rule>
    </pattern>
    
    <pattern>
        <!-- Check <issn> EXISTS and appears in the correct number -->
        <rule context="/article/front/journal-meta">
            <assert test="
                (count(issn) = 1 and /article/front/journal-meta[journal-id= 'artl' or journal-id= 'coli' or journal-id= 'cpsy' or journal-id= 'evco' or journal-id= 'jocn' or journal-id= 'neco' or journal-id= 'netn' or journal-id= 'opmi' or journal-id= 'posc' or journal-id= 'pres'])
                or
                (count(issn) = 2 and not(/article/front/journal-meta[journal-id= 'artl' or journal-id= 'coli' or journal-id= 'cpsy' or journal-id= 'evco' or journal-id= 'jocn' or journal-id= 'neco' or journal-id= 'netn' or journal-id= 'opmi' or journal-id= 'posc' or journal-id= 'pres']))
                
                "><![CDATA[Incorrect number of <issn> elements. If this is an e-only journal it should only have one <issn> element with an '@pub-type="epub"'. If this is a print and online  journal it should only have two <issn> elements with an '@pubtype="ppub"' and '@pub-type="epub"']]></assert>
            
            
            <assert test="
                (count(issn) = 1 and /article/front/journal-meta/issn/@pub-type = 'epub')
                or
                (count(issn) = 2 and (/article/front/journal-meta/issn/@pub-type = 'epub' and /article/front/journal-meta/issn/@pub-type = 'ppub'))
                "><![CDATA[Incorrect @pub-type attribute on <issn>. For online only journals include '@pub-type="epub"'. For all other journals include '@pub-type="ppub"' AND '@pub-type="epub"']]></assert>
        </rule>
    </pattern>
    
    <pattern>
        <!-- Check <journal-title> EXISTS -->
        <rule context="/article/front/journal-meta/journal-title-group">
            <assert id="err61" test="journal-title"><![CDATA[Missing <journal-title> element]]>
            </assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check <abbrev-journal-title> EXISTS -->
        <rule context="/article/front/journal-meta/journal-title-group">
            <assert id="err6" test="abbrev-journal-title"><![CDATA[Missing <abbrev-journal-title> element]]>
            </assert>
        </rule>

        <!-- Check @abbrev-type EXISTS on <abbrev-journal-title> -->
        <rule context="/article/front/journal-meta/journal-title-group/abbrev-journal-title">
            <assert id="err7" test="@abbrev-type"><![CDATA[Missing @abbrev-type on <abbrev-journal-title> element]]>
            </assert>
        </rule>

        <!-- Check VALUE of @abbrev-type -->
        <rule context="/article/front/journal-meta/journal-title-group/abbrev-journal-title/@abbrev-type">
            <assert id="err8" test=". = 'pubmed'"><![CDATA[The value of @abbrev-type on <abbrev-journal-title> should be 'pub-med']]>
            </assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check <publisher-name> EXISTS -->
        <rule context="/article/front/journal-meta/publisher">
            <assert id="err9" test="publisher-name">
                <![CDATA[Missing <publisher-name> element]]></assert>
        </rule>

        <!-- Check VALUE of <publisher-name> -->
        <rule context="/article/front/journal-meta/publisher/publisher-name">
            <assert id="err10" test=". = 'MIT Press'">
                <![CDATA[The <publisher-name> must be 'MIT Press' ]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check <addr-line> EXISTS -->
        <rule context="/article/front/journal-meta/publisher/publisher-loc">
            <assert id="err11" test="addr-line"><![CDATA[Missing <addr-line> element]]></assert>
        </rule>

        <!-- Check VALUE of <addr-line> -->
        <rule context="/article/front/journal-meta/publisher/publisher-loc">
            <assert id="err12" test="addr-line = 'One Rogers Street, Cambridge, MA 02142-1209'">
                <![CDATA[The <addr-line must> be 'One Rogers Street, Cambridge, MA 02142-1209']]></assert>
        </rule>

        <!-- Check <country> EXISTS -->
        <rule context="/article/front/journal-meta/publisher/publisher-loc">
            <assert id="err13" test="/country"><![CDATA[Missing <country> element]]></assert>
        </rule>

        <!-- Check VALUE of <country> -->
        <rule context="/article/front/journal-meta/publisher/publisher-loc/country">
            <assert id="err14" test=". = 'USA'">
                <![CDATA[The <country> must be 'USA' ]]></assert>
        </rule>

        <!-- Check <email> EXISTS -->
        <rule context="/article/front/journal-meta/publisher/publisher-loc">
            <assert id="err15" test="email"><![CDATA[Missing <email> element]]></assert>
        </rule>

        <!-- Check VALUE of <email> -->
        <rule context="/article/front/journal-meta/publisher/publisher-loc/email">
            <assert id="err16" test=". = 'journals-info&#x0040;mit.edu'">
                <![CDATA[The email must be 'journals-info&#x0040;mit.edu' ]]></assert>
            <assert id="err17" test="@xlink:href = 'mailto:journals-info@mit.edu'"><![CDATA[ The @xlink:href must be 'mailto:journals-info@mit.edu']]>
            </assert>
        </rule>
    </pattern>


    <!-- ARTICLE METADATA -->
    <pattern>
        <!-- Check NUMBER of <article-id> is correct and holds the correct VALUE -->
        <rule context="/article/front/article-meta">
            <assert id="err18" test="count(article-id) = 2"><![CDATA[You need to have two article-id elements]]></assert>
        </rule>
    </pattern>
    
    <pattern>
        <!-- Check VALUE of @pub-type correct on <pub-date> for print/online journals -->
        <rule context="/article/front/article-meta/article-id">
            <assert id="err1v8" test="(count(/article/front/article-meta/article-id/@pub-id-type) = 2 and (/article/front/article-meta/article-id/@pub-id-type = 'doi' and /article/front/article-meta/article-id/@pub-id-type = 'publisher-id'))"><![CDATA[Incorrect @article-id attributes on <article-id>. One must be '@pub-id-type = "publisher-id"' and the other must be '@pub-id-type = "doi"']]></assert>
        </rule>
    </pattern>
    
    <pattern>
        <!-- Check <article-id> is formatted correctly -->
        <rule context="/article/front/article-meta/article-id">
            <assert id="err202" test="matches(.,'[a-z]{3,4}_[a-z]_[0-9]{1,6}')"><![CDATA[Incorrectly formatted <article-id>. <article-id> should be formatted as follows: [journal-id]_[article type]_[id] ]. The id MUST be all lower case.]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- <article-title> EXISTS -->
        <rule context="/article/front/article-meta/title-group">
            <report id="err21" test="not(@article-type='book-review') and not(article-title)"><![CDATA[This is not a book-review, but it's missing an <article-title>. ]]></report>
        </rule>
    </pattern>

    <pattern>
        <!-- Check <subtitle> DOES NOT EXIST-->
        <rule context="/article/front/article-meta/title-group">
            <report id="err467" test="subtitle"><![CDATA[Do not use <subtitle>, include the full title of the article in article-title.]]></report>
        </rule>
    </pattern>

    <pattern>
        <!-- Check <pub-date> EXISTS -->
        <rule context="/article/front/article-meta/pub-date">
            <assert id="err26" test="."><![CDATA[Missing <pub-date> element]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check VALUE of @pub-type is correct on e-only journals -->
        <rule context="/article/front/article-meta/pub-date">
            <report id="err2d6" test="@pub-type='ppub' and /article/front/journal-meta[journal-id='artl' or journal-id='coli' or journal-id='cpsy' or journal-id='evco' or journal-id='jocn' or journal-id='neco'  or journal-id='netn' or journal-id='opmi' or journal-id='posc' or journal-id='pres']
                ">
                <value-of select='/article/front/journal-meta/journal-title-group/journal-title'/><![CDATA[ is online only and the value of '@pub-type' on <pub-date> should be 'epub', not ']]><value-of select='/article/front/article-meta/pub-date/@pub-type'/> <![CDATA[' ]]>
            </report>
        </rule>
    </pattern>
    
    <pattern>
        <!-- Check only 1 <pub-date> element on e-only journals  -->
        <rule context="/article/front/article-meta/pub-date">
            <report id="err2df6" test="not(count(/article/front/article-meta/pub-date) = 1) and /article/front/journal-meta[journal-id='artl' or journal-id='coli' or journal-id='cpsy' or journal-id='evco' or journal-id='jocn' or journal-id='neco'  or journal-id='netn' or journal-id='opmi' or journal-id='posc' or journal-id='pres']
                ">
                <value-of select='/article/front/journal-meta/journal-title-group/journal-title'/><![CDATA[ is online only and should include 1 <pub-date> element with '@pub-type="epub"'.]]>
            </report>
        </rule>
    </pattern>
    
    <pattern>
        <!-- Check 2 <pub-date> elements on print/online journals -->
        <rule context="/article/front/article-meta/pub-date">
            <report id="err22df6" test="not(count(/article/front/article-meta/pub-date) = 2) and not(/article/front/journal-meta[journal-id='artl' or journal-id='coli' or journal-id='cpsy' or journal-id='evco' or journal-id='jocn' or journal-id='neco'  or journal-id='netn' or journal-id='opmi' or journal-id='posc' or journal-id='pres'])
                ">
                <value-of select='/article/front/journal-meta/journal-title-group/journal-title'/><![CDATA[ is not online only and should include 2 <pub-date> elements. One with '@pub-type="epub" and one with '@pub-type="ppub"'.]]>
            </report>
        </rule>
    </pattern>
    
    <pattern>
        <!-- Check VALUE of @pub-type is correct on print/online journals -->
        <rule context="/article/front/article-meta/pub-date">
            <report id="err1vd8" test="(count(/article/front/article-meta/pub-date) = 2 and not(/article/front/article-meta/pub-date/@pub-type = 'epub' and /article/front/article-meta/pub-date/@pub-type = 'ppub'))"><![CDATA[Two <pub-date> elements found. One should have '@pub-type="epub" and one with '@pub-type="ppub"']]></report>
        </rule>
    </pattern>
    
    
    <pattern>
        <!-- Check that the <month> is not a string and that it's formatted correctly-->
        <rule context="/article/front/article-meta/pub-date/month">
            <assert test="matches(., '^[0-9]{2}$')"><![CDATA[the month in <pub-date> should be an integer value, not a string value, and should be formatted as '01', '02'...]]></assert>
        </rule>
    </pattern>
    
    <pattern>
        <!-- Check <volume> DOES NOT EXIST on Just Accepted or Early Access articles -->
        <rule context="/article/front/article-meta/volume">
            <assert test="matches(.,'[0-9]{2}') and not(. = '0')  and not(. = '00')"><![CDATA[Omit <volume> element from Just Accepted articles. For non JA and EA content, format as <volume>01</volume>]]></assert>
        </rule>
    </pattern>
    
    
    <pattern>
        <!-- Check <issue> DOES NOT EXIST on Just Accepted or Early Access articles -->
        <rule context="/article/front/article-meta/issue">
            <assert test="matches(.,'[0-9]{2}') and not(. = '0')  and not(. = '00')"><![CDATA[Omit <issue> element from Just Accepted articles. For non JA and EA content, format as <issue>01</issue>]]></assert>
        </rule>
    </pattern>


    <pattern>
        <!-- Check <copyright-statement> EXISTS -->
        <rule context="/article/front/article-meta/permissions">
            <assert id="err288" test="copyright-statement"><![CDATA[Missing <copyright-statement> element]]></assert>
        </rule>
    </pattern>
    
    <pattern>
        <!-- Check <copyright-holder> EXISTS -->
        <rule context="/article/front/article-meta/permissions">
            <assert id="err289" test="copyright-holder"><![CDATA[Missing <copyright-holder> element]]></assert>
        </rule>
    </pattern>
    
    <pattern>
        <!-- Check <copyright-year> EXISTS -->
        <rule context="/article/front/article-meta/permissions">
            <assert id="err281" test="copyright-year"><![CDATA[Missing <copyright-year> element]]></assert>
        </rule>
    </pattern>
    
    <pattern>
        <!-- Check <license> and <license-p> EXIST (OA only) -->
        <rule context="/article/front/article-meta/permissions">
            <assert id="err2f81" test="
                ((/article/front/journal-meta[journal-id = 'netn' or journal-id= 'coli' or journal-id= 'cpsy' or journal-id= 'opmi']) and license and license/license-p )
                or 
                not(/article/front/journal-meta[journal-id = 'netn' or journal-id= 'coli' or journal-id= 'cpsy' or journal-id= 'opmi'])">
                <![CDATA[This is an OA article and should include a <license> and <license-p> element]]></assert>
        </rule>
    </pattern>
    
    <pattern>
        <!-- Check VALUE of @license-type @xlink:href on <license> (OA only) -->
        <rule context="/article/front/article-meta/permissions/license">
            <assert id="err2df81" test="@license-type='open-access' and @xlink:href='https://creativecommons.org/licenses/by/4.0/'">
                <![CDATA[If this is an OA article, the <license> element should include '@license-type="open-access"' and '@xlink:href="http://creativecommons.org/licenses/by/4.0/". Note, it should not include @license-type="free-registered"']]></assert>
        </rule>
    </pattern>
    
    <!-- Check VALUE of <license> (OA only) -->
    <pattern>
        <rule context="/article/front/article-meta/permissions/license/license-p">
            <assert test=". = 'This is an open-access article distributed under the terms of the Creative Commons Attribution 4.0 International License, which permits unrestricted use, distribution, and reproduction in any medium, provided the original work is properly cited.  For a full description of the license, please visit https://creativecommons.org/licenses/by/4.0/legalcode.'">
                <![CDATA[<license-p> element should read 'This is an open-access article distributed under the terms of the Creative Commons Attribution 4.0 International License, which permits unrestricted use, distribution, and reproduction in any medium, provided the original work is properly cited.  For a full description of the license, please visit https://creativecommons.org/licenses/by/4.0/legalcode.' If this is not an OA article, omit <license> and <license-p>" ]]>
            </assert>
        </rule>
    </pattern>
    
    <!-- Check VALUE of <copyright-statement> (OA only)-->
    <pattern>
        <rule context="/article/front/article-meta/permissions">
            <assert test="
                ((/article/front/journal-meta[journal-id = 'netn' or journal-id= 'coli' or journal-id= 'cpsy' or journal-id= 'opmi'])
                and 
                copyright-statement = '© 2018 Massachusetts Institute of Technology Published under a Creative Commons Attribution 4.0 International (CC BY 4.0) license')
                or 
                not(/article/front/journal-meta[journal-id = 'netn' or journal-id= 'coli' or journal-id= 'cpsy' or journal-id= 'opmi'])">
                <![CDATA[This is an OA article, the copyright-statement should be "© 2018 Massachusetts Institute of Technology Published under a Creative Commons Attribution 4.0 International (CC BY 4.0) license" ]]>
            </assert>
        </rule>
    </pattern>
    
    <!-- Check <self-uri> EXISTS -->
    <pattern>
        <rule context="/article/front/article-meta/self-uri">
            <assert id="err29" test="."><![CDATA[Missing <self-uri> element]]></assert>
        </rule>
    </pattern>

    <!-- Check <abstract> DOES NOT contain <title> -->
    <pattern>
        <rule context="/article/front/article-meta/abstract/title">
            <report id="err30" test="."><![CDATA[Remove <title> from abstract element.]]></report>
        </rule>
    </pattern>

    <!-- Check <kwd> are seperated by <x>, <x> -->
    <pattern>
        <rule context="/article/front/article-meta/kwd-group/x">
            <assert id="err31" test="."><![CDATA[<keywords should be formatted with <x>, <x> (<kwd>...</kwd><x>, </x>) ]]></assert>
        </rule>
    </pattern>

    <!-- Check <heading> DOES NOT EXIST -->
    <pattern>
        <rule context="/article/front/article-meta/article-categories/subj-group/subject">
            <report id="err312" test="."><![CDATA[This article includes a <heading> element, but headings should be included in the issue xml file.]]></report>
        </rule>
    </pattern>
 

    <!-- CONTRIBUTORS -->
    
    <pattern>
        <!-- Check that the <contributor> uses <string-name>, not <name> -->
        <rule context="/article/front/article-meta/contrib-group/contrib/name">
            <report id="err25" test="."><![CDATA[The contib block uses <name>  when it should use  <string-name>]]></report>
        </rule>
    </pattern>
    
    <pattern>
        <!-- Check VALUE <contrib-type> -->
        <rule context="/article/front/article-meta/contrib-group/contrib">
            <assert id="err2e5" test="
                @contrib-type = 'abstractor' or @contrib-type = 'assoc-editor' or @contrib-type = 'author' or @contrib-type = 'chair' or 
                @contrib-type = 'collaborator' or @contrib-type = 'contributing-editor' or @contrib-type = 'corresp-editor' or 
                @contrib-type = 'editor' or @contrib-type = 'guest-editor' or @contrib-type = 'illustrator' or @contrib-type = 'moderator' or 
                @contrib-type = 'presenter' or @contrib-type = 'reviewed-author' or @contrib-type = 'reviewer' or @contrib-type = 'series-editor' 
                or @contrib-type = 'translator' or @contrib-type = '' or @contrib-type = 'coauthor' or @contrib-type = 'contributor' or 
                @contrib-type = 'contributor-note' or @contrib-type = 'corresp' or @contrib-type = 'proof-contact' or @contrib-type = 'techeditor'
                "><![CDATA[Unrecognized @contrib-type. Value should be one of the following: abstractor', 'assoc-editor (associate editor)', 'author', 'chair', 'collaborator', 'contributing-editor', 'corresp-editor (corresponding editor)', 'editor', 'guest-editor', 'illustrator', 'moderator', 'presenter', 'reviewed-author', 'reviewer', 'series-editor', 'translator', 'coauthor', 'contributor', 'contributor-note', 'corresp (corresponding author)', 'proof-contact', 'techeditor]]></assert>
        </rule>
    </pattern>
    
    <pattern>
        <!-- Check VALUE of <contrib-id> -->
        <rule context="/article/front/article-meta/contrib-group/contrib/contrib-id">
            <assert test="matches(., 'http://orcid.org/[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{3}[X0-9]{1}')"><![CDATA[ORCID not properly formatted. Should follow: 'http://orcid.org/[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{3}[X0-9]{1}']]></assert>
        </rule>
    </pattern>
    
    <pattern>
        <!-- Check affiliations not tagged as <xref> -->
        <rule context="/article/front/article-meta/contrib-group/contrib/xref">
            <report test="@ref-type='aff'"><![CDATA[Incorrectly formatted affiliation. Affiliations should be tagged using <aff>, not <xref> elements.]]></report>
        </rule>
    </pattern>
    
    <pattern>
        <!-- Check VALUE of @ref-type on <xref> -->
        <rule context="/article/front/article-meta/contrib-group/contrib/xref">
            <assert test="@ref-type='author-notes' or @ref-type='corresp'"><![CDATA[Incorrectly formatted <xref> element inside <contrib>. <xref> elements should only include '@ref-type="author-notes"' or '@ref-type="corresp'"' not ']]><value-of select="@ref-type"/><![CDATA[ '.]]></assert>
        </rule>
    </pattern> 
    
    <pattern> 
        <!-- Check corresponding author (Part 1) -->
        <rule context="/article/front/article-meta/contrib-group/contrib/xref"> 
            <report test="not(../@corresp='yes') and @ref-type='corresp'"><![CDATA[<contrib> element includes '<xref rid="cor1" ref-type="corresp">*</xref>', but the <contib> does not include an @corresp='yes'. ]]></report> 
        </rule> 
    </pattern> 
    
    <pattern> 
        <!-- Check corresponding author (Part 2) -->
        <rule context="/article/front/article-meta/contrib-group/contrib/@corresp"> 
            <assert test=". = 'yes' and ../xref/@ref-type='corresp'"><![CDATA[<contrib> element includes a @corresp='yes' but not '<xref rid="cor1" ref-type="corresp">*</xref>'.]]></assert> 
        </rule> 
    </pattern> 
    
    <!-- Check @id EXISTS on <corresp> -->
    <pattern>
        <rule context="/article/front/article-meta/author-notes/corresp">
            <assert test="@id"><![CDATA[<corresp> element missing @id]]></assert>
        </rule>
    </pattern>
    
    <!-- Check VALUE of <corresp> -->
    <pattern>
        <rule context="/article/front/article-meta/author-notes/corresp">
            <assert test="label and matches(., 'Corresponding author:') and email"><![CDATA[Incorrect formatting of <corresp> element. Should be formatted as: '<corresp id="cor1"><label>*</label>Corresponding author: <email xlink:href="mailto:...">...</email>.</corresp>]]></assert>
        </rule>
    </pattern>

    <!-- Check VALUE of @id on <corresp> -->
    <pattern>
        <rule context="/article/front/article-meta/author-notes/corresp/@id">
            <assert test="matches(., 'cor[0-9{1}]')"><![CDATA[Value of @id on <corresp> should be formatted as 'cor1'. If there are multiple <corresp> elements, they should be formatted as 'cor2', 'cor3', ... ]]></assert>
        </rule>
    </pattern>
    

    <!-- BOOK REVIEWS -->

    <pattern> 
        <!-- Check that all book reviews contain a <product> -->
        <rule context="/article"> 
            <report test="@article-type='book-review' and not(//product)"><![CDATA[@article-type='book-review' found but missing <product> element. If this is a book review, the product information should be included in <product> element.]]></report> 
        </rule> 
    </pattern> 
    

    <pattern>
        <!-- If a book review includes <article-title>, the title should not be the same as <source> -->
        <rule context="/article/front/article-meta/title-group/article-title"> 
            <report test="(/article/front/article-meta/title-group/article-title/italic = article/front/article-meta/product/source/italic)"> <![CDATA[<article-title> same as <source> in <product>. Either remove <article-title> or include a unique <article-title>.]]></report> 
        </rule> 
    </pattern> 
    


    <!-- FUNDREF --> 
    <pattern> 
        <!-- ALERT user to empty <award-id> -->
        <rule context="/article/front/article-meta/funding-group/award-group/award-id"> 
            <report test="normalize-space(.) = ''"><![CDATA[Empty <award-id> element]]></report> 
        </rule> 
    </pattern>
    
    <pattern> 
        <!-- ALERT user to empty <institution> -->
        <rule context="/article/front/article-meta/funding-group/award-group/funding-source/institution-wrap/institution"> 
            <report test="normalize-space(.) = ''"><![CDATA[Empty <institution> element]]></report> 
        </rule> 
    </pattern> 

    <pattern> 
        <!-- ALERT user to empty <institution-id> -->
        <rule context="/article/front/article-meta/funding-group/award-group/funding-source/institution-wrap/institution-d"> 
            <report test="normalize-space(.) = ''"><![CDATA[Empty <institution-id> element]]></report> 
        </rule> 
    </pattern> 


    <!-- REFERENCES -->    
    <pattern> 
        <!-- Check @publication-type EXISTS on <mixed-citation> -->
        <rule context="/article/back/ref-list/ref/mixed-citation">
            <assert id="err2hfe5" test="@publication-type"><![CDATA[The <mixed-citation> element must have an @publication-type attribute]]></assert> 
        </rule> 
    </pattern> 
    
    <pattern> 
        <!-- Check VALUE of @publication-type -->
        <rule context="/article/back/ref-list/ref/mixed-citation">
            <assert id="err2fe5" test="
                @publication-type = 'book' or @publication-type = 'confproc' or 
                @publication-type = 'ejournal' or @publication-type = 'paper' or 
                @publication-type = 'report' or @publication-type = 'thesis'
                "><![CDATA[Unrecognized @publication-type on <mixed-citation>. Value should be one of the following: 'book', 'confproc', 'ejournal', 'paper', 'report', 'thesis']]></assert> 
        </rule> 
    </pattern> 
    
    <!-- FIGURES -->  
    
    <!-- TABLES -->    
    
    <pattern>
        <!-- Check tables are HTML, not OASIS --> 
        <rule context="//oasis:table">
            <report id="err3v2" test=".">
                <![CDATA[OASIS table found. Use HTML tables, not OASIS.]]>
            </report>
        </rule>
    </pattern>
    
</schema>




