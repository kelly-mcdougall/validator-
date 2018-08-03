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


<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <ns prefix="mml" uri="http://www.w3.org/1998/Math/MathML"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>
    <ns prefix="oasis" uri="http://www.niso.org/standards/z39-96/ns/oasis-exchange/table"/>




    <!-- HEADER METADATA -->

    <!-- Check @article-type EXISTS on the <article> element -->
    <pattern>
        <rule context="/article">
            <assert test="@article-type"><![CDATA[The article element must have an article-type attribute. (See
                1.2 Article Types)]]></assert>
        </rule>
    </pattern>

    <!-- Check VALUE of @article-type is among confirmed values -->
    <pattern>
        <rule context="/article">
            <assert
                test="
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
                'retraction', 'review-article', 'translation', 'withdrawal'.  (See
                1.2 Article Types)]]>
            </assert>
        </rule>
    </pattern>


    <!-- JOURNAL METADATA -->
    <pattern>
        <!-- Check <journal-id> EXISTS -->
        <rule context="/article/front/journal-meta">
            <assert test="journal-id"><![CDATA[Missing journal-id element inside journal-meta. (See 1.3
                Journal IDs)]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check VALUE of <journal-id> element is among confirmed values -->
        <rule context="/article/front/journal-meta/journal-id">
            <assert
                test="
                    . = 'adev' or . = 'afar' or . = 'ajhe' or . = 'artl' or . = 'artm' or . = 'asep'
                    or . = 'coli' or . = 'comj' or . = 'cpsy' or . = 'daed' or . = 'desi' or . = 'dram'
                    or . = 'edfp' or . = 'evco' or . = 'glep' or . = 'grey' or . = 'ijlm' or . = 'itgg'
                    or . = 'isec' or . = 'jcws' or . = 'jinh' or . = 'jocn' or . = 'leon' or . = 'ling'
                    or . = 'lmj' or . = 'neco' or . = 'netn' or . = 'ntls' or . = 'octo' or . = 'opmi'
                    or . = 'pajj' or . = 'posc' or . = 'pres' or . = 'rest' or . = 'thld' or . = 'tneq' 
                    or . = 'tacl'">
                <![CDATA[Invalid <journal-id>. <journal-id> must be one of the following values: 
                'adev', 'afar', 'ajhe', 'artl', 'artm', 'asep', 'coli', 'comj', 'cpsy', 'daed', 
                'desi', 'dram', 'edfp', 'evco', 'glep', 'grey', 'ijlm', 'inov', 'isec', 'jcws', 
                'jinh', 'jocn', 'leon', 'ling', 'lmj', 'neco', 'netn', 'ntls', 'octo', 'opmi', 
                'pajj', 'posc', 'pres', 'rest', 'thld', 'tneq', 'tacl'. (See 1.3 Journal IDs)]]>
            </assert>
        </rule>
    </pattern>

    <pattern>

        <!-- Check VALUE of <journal-id> matches VALUE of <journal-title> -->
        <rule context="/article/front/journal-meta/journal-id">
            <assert
                test="
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
                    . = 'itgg' and /article/front/journal-meta/journal-title-group/journal-title = 'Innovations: Technology, Governance, Globalization' or
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
                    . = 'tneq' and /article/front/journal-meta/journal-title-group/journal-title = 'The New England Quarterly' or
                    . = 'tacl' and /article/front/journal-meta/journal-title-group/journal-title = 'Transactions of the Association for Computational Linguistics'
                    ">
                <![CDATA[journal-id and journal-title do not match. journal-id is ']]><value-of
                    select="/article/front/journal-meta/journal-id"
                    /><![CDATA[' and journal-title is ']]><value-of
                    select="/article/front/journal-meta/journal-title-group/journal-title"
                /><![CDATA[']]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check <issn> EXISTS and appears in the correct number -->
        <rule context="/article/front/journal-meta">
            <assert
                test="
                (count(issn) = 1 and /article/front/journal-meta[journal-id = 'artl' or journal-id = 'coli' or journal-id = 'cpsy' or journal-id = 'evco' or journal-id = 'jocn' or journal-id = 'neco' or journal-id = 'netn' or journal-id = 'opmi' or journal-id = 'posc' or journal-id = 'pres' or journal-id = 'tacl'])
                    or
                    (count(issn) = 2 and not(/article/front/journal-meta[journal-id = 'artl' or journal-id = 'coli' or journal-id = 'cpsy' or journal-id = 'evco' or journal-id = 'jocn' or journal-id = 'neco' or journal-id = 'netn' or journal-id = 'opmi' or journal-id = 'posc' or journal-id = 'pres' or journal-id = 'tacl']))
                    
                    "><![CDATA[Incorrect number of <issn> elements. If this is an e-only journal it should
                only have one <issn> element with an '@pub-type="epub"'. If this is a print and online 
                journal it should only have two <issn> elements with an '@pubtype="ppub"' and '@pub-type="epub"' (See 1.3 Journal IDs)]]></assert>


            <assert
                test="
                    (count(issn) = 1 and /article/front/journal-meta/issn/@pub-type = 'epub')
                    or
                    (count(issn) = 2 and (/article/front/journal-meta/issn/@pub-type = 'epub' and /article/front/journal-meta/issn/@pub-type = 'ppub'))
                    "><![CDATA[Incorrect @pub-type attribute on <issn>. For online only journals include
                '@pub-type="epub"'. For all other journals include '@pub-type="ppub"' AND '@pub-type="epub"' (See 1.3 Journal IDs)]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check <journal-title> EXISTS -->
        <rule context="/article/front/journal-meta/journal-title-group">
            <assert test="normalize-space(journal-title)"
                ><![CDATA[Missing <journal-title> element. (See 1.4 Journal Titles)]]>
            </assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check <abbrev-journal-title> EXISTS -->
        <rule context="/article/front/journal-meta/journal-title-group">
            <assert test="normalize-space(abbrev-journal-title)"><![CDATA[Missing <abbrev-journal-title>
                element. (See 1.4 Journal Titles)]]>
            </assert>
        </rule>
    </pattern>
    <pattern>
        <!-- Check @abbrev-type EXISTS on <abbrev-journal-title> -->
        <rule context="/article/front/journal-meta/journal-title-group/abbrev-journal-title">
            <assert test="@abbrev-type"
                ><![CDATA[Missing @abbrev-type on <abbrev-journal-title> element.  (See 1.4 Journal Titles)]]>
            </assert>
        </rule>
    </pattern>
    <pattern>
        <!-- Check VALUE of @abbrev-type -->
        <rule context="/article/front/journal-meta/journal-title-group/abbrev-journal-title/@abbrev-type">
            <assert test=". = 'pubmed'"><![CDATA[The value of @abbrev-type on <abbrev-journal-title> should be
                'pub-med'. (See 1.4 Journal Titles)]]>
            </assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check <publisher-name> EXISTS -->
        <rule context="/article/front/journal-meta/publisher">
            <assert test="publisher-name">
                <![CDATA[Missing <publisher-name> element. (See 1.6 Publisher Information) ]]></assert>
        </rule>
    </pattern>
    <pattern>
        <!-- Check VALUE of <publisher-name> -->
        <rule context="/article/front/journal-meta/publisher/publisher-name">
            <assert test="normalize-space(.) = 'MIT Press'">
                <![CDATA[The <publisher-name> must be 'MIT Press'. (See 1.6 Publisher Information) ]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check <addr-line> EXISTS -->
        <rule context="/article/front/journal-meta/publisher/publisher-loc">
            <assert test="addr-line"
                ><![CDATA[Missing <addr-line> element. (See 1.6 Publisher Information) ]]></assert>
        </rule>
    </pattern>
    <pattern>
        <!-- Check VALUE of <addr-line> -->
        <rule context="/article/front/journal-meta/publisher/publisher-loc/addr-line">
            <assert test="normalize-space(.) = 'One Rogers Street, Cambridge, MA 02142-1209'">
                <![CDATA[The <addr-line must> be 'One Rogers Street, Cambridge, MA 02142-1209'. (See 1.6 Publisher Information) ]]></assert>
        </rule>
    </pattern>
    <pattern>
        <!-- Check <country> EXISTS -->
        <rule context="/article/front/journal-meta/publisher/publisher-loc">
            <assert test="country"
                ><![CDATA[Missing <country> element. (See 1.6 Publisher Information) ]]></assert>
        </rule>
    </pattern>
    <pattern>
        <!-- Check VALUE of <country> -->
        <rule context="/article/front/journal-meta/publisher/publisher-loc/country">
            <assert test="normalize-space(.) = 'USA'">
                <![CDATA[The <country> must be 'USA'. (See 1.6 Publisher Information)]]></assert>
        </rule>
    </pattern>
    <pattern>
        <!-- Check <email> EXISTS -->
        <rule context="/article/front/journal-meta/publisher/publisher-loc">
            <assert test="email"><![CDATA[Missing <email> element. (See 1.6 Publisher Information)]]></assert>
        </rule>
    </pattern>
    <pattern>
        <!-- Check VALUE of <email> -->
        <rule context="/article/front/journal-meta/publisher/publisher-loc/email">
            <assert test="normalize-space(.) = 'journals-info&#x0040;mit.edu'">
                <![CDATA[The email must be 'journals-info&#x0040;mit.edu' ]]></assert>
            <assert test="@xlink:href = 'mailto:journals-info@mit.edu'"><![CDATA[ The @xlink:href must be
                'mailto:journals-info@mit.edu'. (See 1.6 Publisher Information)]]>
            </assert>
        </rule>
    </pattern>


    <!-- ARTICLE METADATA -->
    <pattern>
        <!-- Check NUMBER of <article-id> is correct and holds the correct VALUE -->
        <rule context="/article/front/article-meta">
            <assert test="count(article-id) = 2"
                ><![CDATA[You need to have two article-id elements. (See 1.8 Article Title)]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check that the VALUE of @pub-id-type is correct on <article-id> -->
        <rule context="/article/front/article-meta/article-id">
            <assert
                test="
                    (count(/article/front/article-meta/article-id/@pub-id-type) = 2 and
                    (/article/front/article-meta/article-id/@pub-id-type = 'doi' and
                    /article/front/article-meta/article-id/@pub-id-type = 'publisher-id'))"><![CDATA[Incorrect
                @article-id attributes on <article-id>. One must be '@pub-id-type = "publisher-id"' and the
                other must be '@pub-id-type = "doi"' (See 1.7 Article IDs)]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check <article-id> is formatted correctly -->
        <rule context="/article/front/article-meta/article-id">
            <assert test="matches(., '[a-z]{3,4}_[a-z]_[0-9]{1,6}')"
                ><![CDATA[Incorrectly formatted <article-id>. <article-id> should be formatted as follows: [journal-id]_[article type]_[id] ]. The id MUST be all lower case. (See 1.7 Article IDs)]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- <title-group> EXISTS -->
        <rule context="/article/front/article-meta">
            <report test="not(/article/@article-type = 'book-review') and not(title-group/article-title)"><![CDATA[This is not a book-review, but it's missing an <article-title>. (See 1.8 Article
                Title)]]></report>
        </rule>
    </pattern>

    <pattern>
        <!-- Check <subtitle> DOES NOT EXIST-->
        <rule context="/article/front/article-meta/title-group">
            <report test="subtitle"><![CDATA[Do not use <subtitle>, include the full title of the article in article-title. (See
                1.8 Article Title)]]></report>
        </rule>
    </pattern>

    <pattern>
        <!-- Check <pub-date> EXISTS -->
        <rule context="/article/front/article-meta">
            <report test="not(pub-date) and (volume or issue-part)"><![CDATA[Missing <pub-date> element. (See 1.17 Pub Date)]]></report>
        </rule>
    </pattern>

    <pattern>
        <!-- Check VALUE of @pub-type is correct on e-only journals -->
        <rule context="/article/front/article-meta/pub-date">
            <report
                test="
                    @pub-type = 'ppub' and /article/front/journal-meta[journal-id = 'artl' or journal-id = 'coli' or journal-id = 'cpsy' or journal-id = 'evco' or journal-id = 'jocn' or journal-id = 'neco' or journal-id = 'netn' or journal-id = 'opmi' or journal-id = 'posc' or journal-id = 'pres']
                    ">
                <value-of select="/article/front/journal-meta/journal-title-group/journal-title"
                    /><![CDATA[ is online only and the value of '@pub-type' on <pub-date> should be 'epub', not ']]><value-of
                    select="/article/front/article-meta/pub-date/@pub-type"/>
                <![CDATA[' (See 1.17 Pub Date)]]>
            </report>
        </rule>
    </pattern>

    <pattern>
        <!-- Check only 1 <pub-date> element on e-only journals  -->
        <rule context="/article/front/article-meta/pub-date">
            <report
                test="
                    not(count(/article/front/article-meta/pub-date) = 1) and /article/front/journal-meta[journal-id = 'artl' or journal-id = 'coli' or journal-id = 'cpsy' or journal-id = 'evco' or journal-id = 'jocn' or journal-id = 'neco' or journal-id = 'netn' or journal-id = 'opmi' or journal-id = 'posc' or journal-id = 'pres']
                    ">
                <value-of select="/article/front/journal-meta/journal-title-group/journal-title"
                /><![CDATA[ is online only and should include 1 <pub-date> element with '@pub-type="epub"'. (See 1.17 Pub Date)]]>
            </report>
        </rule>
    </pattern>

    <pattern>
        <!-- Check 2 <pub-date> elements on print/online journals -->
        <rule context="/article/front/article-meta/pub-date">
            <report
                test="
                    not(count(/article/front/article-meta/pub-date) = 2) and not(/article/front/journal-meta[journal-id = 'artl' or journal-id = 'coli' or journal-id = 'cpsy' or journal-id = 'evco' or journal-id = 'jocn' or journal-id = 'neco' or journal-id = 'netn' or journal-id = 'opmi' or journal-id = 'posc' or journal-id = 'pres'])
                    ">
                <value-of select="/article/front/journal-meta/journal-title-group/journal-title"
                /><![CDATA[ is not online only and should include 2 <pub-date> elements. One with '@pub-type="epub" and one with '@pub-type="ppub"'. (See 1.17 Pub Date)]]>
            </report>
        </rule>
    </pattern>

    <pattern>
        <!-- Check VALUE of @pub-type is correct on print/online journals -->
        <rule context="/article/front/article-meta/pub-date">
            <report
                test="(count(/article/front/article-meta/pub-date) = 2 and not(/article/front/article-meta/pub-date/@pub-type = 'epub' and /article/front/article-meta/pub-date/@pub-type = 'ppub'))"
                ><![CDATA[Two <pub-date> elements found. One should have '@pub-type="epub" and one with '@pub-type="ppub"' (See 1.17 Pub Date)]]></report>
        </rule>
    </pattern>


    <pattern>
        <!-- Check that the <month> is not a string and that it's formatted correctly-->
        <rule context="/article/front/article-meta/pub-date/month">
            <assert test="matches(., '^[0-9]{2}$')"
                ><![CDATA[the month in <pub-date> should be an integer value, not a string value, and should
                be formatted as '01', '02'... (See 1.17 Pub Date)]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check <volume> DOES NOT EXIST on Just Accepted or Early Access articles -->
        <rule context="/article/front/article-meta/volume">
            <assert test="matches(., '[0-9]{1,2}') and not(. = '0') and not(. = '00')"
                ><![CDATA[Omit <volume> element from Just Accepted and Early Access articles.(See 1.18 Volume/Issue)]]></assert>
        </rule>
    </pattern>


    <pattern>
        <!-- Check <issue> DOES NOT EXIST on Just Accepted or Early Access articles -->
        <rule context="/article/front/article-meta/issue">
            <assert test="matches(., '[0-9]{1,2}') and not(. = '0') and not(. = '00')"
                ><![CDATA[Omit <issue> element from Just Accepted and Early Access articles. (See 1.18 Volume/Issue)]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check <pub-date> DOES NOT EXIST on Just Accepted or Early Access articles -->
        <rule context="/article/front/article-meta/pub-date">
            <report test="year = 0 or year = 00"><![CDATA[Omit <pub-date> element
                from Just Accepted and Early Access articles. (See 1.17 Pub Date)]]></report>
        </rule>
    </pattern>

    <pattern>
        <!-- Check <permissions> EXISTS -->
        <rule context="/article/front/article-meta">
            <assert test="permissions"><![CDATA[Missing <permissions> element (See 1.21 Permissions)]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check <copyright-statement> EXISTS -->
        <rule context="/article/front/article-meta/permissions">
            <assert test="copyright-statement"><![CDATA[Missing <copyright-statement> element. (See 1.21 Permissions)]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check <copyright-holder> EXISTS -->
        <rule context="/article/front/article-meta/permissions">
            <assert test="copyright-holder"><![CDATA[Missing <copyright-holder> element. (See 1.21 Permissions)]]></assert>
        </rule>
    </pattern>


    <pattern>
        <!-- Check <copyright-year> EXISTS -->
        <rule context="/article/front/article-meta/permissions">
            <assert test="copyright-year"><![CDATA[Missing <copyright-year> element. (See 1.21 Permissions)]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check <license> and <license-p> EXIST (OA only) -->
        <rule context="/article/front/article-meta/permissions">
            <assert
                test="
                    ((/article/front/journal-meta[journal-id = 'netn' or journal-id = 'coli' or journal-id = 'cpsy' or journal-id = 'opmi' or journal-id = 'adev' or journal-id = 'tacl']) and license and license/license-p)
                    or
                    not(/article/front/journal-meta[journal-id = 'netn' or journal-id = 'coli' or journal-id = 'cpsy' or journal-id = 'opmi' or journal-id = 'adev' or journal-id = 'tacl'])">
                <![CDATA[This is an OA article and should include a <license> and <license-p> element. (See 1.21 Permissions)]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check VALUE of @license-type @xlink:href on <license> (OA only) -->
        <rule context="/article/front/article-meta/permissions/license">
            <assert
                test="@license-type = 'open-access' and @xlink:href = 'https://creativecommons.org/licenses/by/4.0/'">
                <![CDATA[If this is an OA article, the <license> element should include
                @license-type="open-access" and @xlink:href="https://creativecommons.org/licenses/by/4.0/".
                Note, it should not include @license-type="free-registered"'. (See 1.21 Permissions)]]></assert>
        </rule>
    </pattern>

    <!-- Check VALUE of <license> (OA only) -->
    <pattern>
        <rule context="/article/front/article-meta/permissions/license/license-p">
            <assert
                test="normalize-space(.) = 'This is an open-access article distributed under the terms of the Creative Commons Attribution 4.0 International License, which permits unrestricted use, distribution, and reproduction in any medium, provided the original work is properly cited. For a full description of the license, please visit https://creativecommons.org/licenses/by/4.0/legalcode.'">
                <![CDATA[<license-p> element should read 'This is an open-access article distributed under the
                terms of the Creative Commons Attribution 4.0 International License, which permits
                unrestricted use, distribution, and reproduction in any medium, provided the original work is properly cited. For a full description of the license, please visit https://creativecommons.org/licenses/by/4.0/legalcode.' If this is not an OA article, omit <license> and <license-p>". (See 1.21 Permissions)]]>
            </assert>
        </rule>
    </pattern>

    <!-- Check VALUE of <copyright-holder> (OA only: NETN, CPSY, OPMI)-->
    <pattern>
        <rule context="/article/front/article-meta/permissions">
            <report
                test="
                    ((/article/front/journal-meta[journal-id = 'netn' or journal-id = 'cpsy' or journal-id = 'opmi'])
                    and
                    not(matches(normalize-space(/article/front/article-meta/permissions/copyright-holder), 'Massachusetts Institute of Technology Published under a Creative Commons Attribution 4.0 International \(CC BY 4.0\) license')))">
                <![CDATA[<Copyright-holder> for]]>
                <value-of select="/article/front/journal-meta/journal-title-group/journal-title"/>
                <![CDATA[ should be "Massachusetts Institute of Technology Published under a Creative Commons
                Attribution 4.0 International (CC BY 4.0) license". (See 1.21 Permissions)]]>
            </report>
        </rule>
    </pattern>

    <!-- Check VALUE of <copyright-holder> (OA only: COLI)-->
    <pattern>
        <rule context="/article/front/article-meta/permissions">
            <report
                test="
                    ((/article/front/journal-meta[journal-id = 'coli' or journal-id = 'tacl'])
                    and
                    not(matches(normalize-space(/article/front/article-meta/permissions/copyright-holder), 'Association for Computational Linguistics Published under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International \(CC BY-NC-ND 4.0\) license')))">
                <![CDATA[<copyright-holder> for]]>
                <value-of select="/article/front/journal-meta/journal-title-group/journal-title"/>
                <![CDATA[ should be "Association for Computational Linguistics Published under a Creative
                Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0) license". (See 1.21 Permissions)]]>
            </report>
        </rule>
    </pattern>

    <!-- Check VALUE of <copyright-holder> (OA only:ADEV)-->
    <pattern>
        <rule context="/article/front/article-meta/permissions">
            <report
                test="
                    ((/article/front/journal-meta/journal-id = 'adev')
                    and
                    not(matches(normalize-space(/article/front/article-meta/permissions/copyright-holder), 'Asian Development Bank and Asian Development Bank Institute.  Published under a Creative Commons Attribution 4.0 International (CC BY 4.0) license')))">
                <![CDATA[<copyright-holder> for]]>
                <value-of select="/article/front/journal-meta/journal-title-group/journal-title"/>
                <![CDATA[ should be "Asian Development Bank and Asian Development Bank Institute.  Published under a Creative Commons Attribution 4.0 International (CC BY 4.0) license". (See 1.21 Permissions)]]>
            </report>
        </rule>
    </pattern>

    <!-- Check VALUE of <copyright-statement> (OA only: NETN, CPSY, OPMI)-->
    <pattern>
        <rule context="/article/front/article-meta/permissions">
            <report
                test="
                    ((/article/front/journal-meta[journal-id = 'netn' or journal-id = 'cpsy' or journal-id = 'opmi'])
                    and
                    not(matches(normalize-space(/article/front/article-meta/permissions/copyright-statement), '© 201[0-9] Massachusetts Institute of Technology Published under a Creative Commons Attribution 4.0 International \(CC BY 4.0\) license')))">
                <![CDATA[<copyright-statement> for]]>
                <value-of select="/article/front/journal-meta/journal-title-group/journal-title"/>
                <![CDATA[ should be "© [copyright year] Massachusetts Institute of Technology Published under
                a Creative Commons Attribution 4.0 International (CC BY 4.0) license".]]>
            </report>
        </rule>
    </pattern>

    <!-- Check VALUE of <copyright-statement> (OA only: COLI)-->
    <pattern>
        <rule context="/article/front/article-meta/permissions">
            <report
                test="
                    ((/article/front/journal-meta[journal-id = 'coli' or journal-id = 'tacl'])
                    and
                    not(matches(normalize-space(/article/front/article-meta/permissions/copyright-statement), '© 201[0-9] Association for Computational Linguistics Published under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International \(CC BY-NC-ND 4.0\) license')))">
                <![CDATA[<copyright-statement> for]]>
                <value-of select="/article/front/journal-meta/journal-title-group/journal-title"/>
                <![CDATA[ should be "© [copyright year] Association for Computational Linguistics Published under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0) license" ]]>
            </report>
        </rule>
    </pattern>

    <!-- Check VALUE of <copyright-statement> (OA only:ADEV)-->
    <pattern>
        <rule context="/article/front/article-meta/permissions">
            <report
                test="
                    ((/article/front/journal-meta/journal-id = 'adev')
                    and
                    not(matches(normalize-space(/article/front/article-meta/permissions/copyright-statement), '© 201[0-9] Asian Development Bank and Asian Development Bank Institute.  Published under a Creative Commons Attribution 4.0 International (CC BY 4.0) license')))">
                <![CDATA[<copyright-statement> for]]>
                <value-of select="/article/front/journal-meta/journal-title-group/journal-title"/>
                <![CDATA[ should be "© [copyright year] Asian Development Bank and Asian Development Bank Institute.  Published under a Creative Commons Attribution 4.0 International (CC BY 4.0) license" ]]>
            </report>
        </rule>
    </pattern>

    <!-- Check <self-uri> EXISTS -->
    <pattern>
        <rule context="/article/front/article-meta">
            <assert test="self-uri"><![CDATA[Missing <self-uri> element. (See 1.22 Link to PDF)]]></assert>
        </rule>
    </pattern>

    <!-- Check VALUE of @xlink:href on <self-uri> -->
    <pattern>
        <rule context="/article/front/article-meta/self-uri/@xlink:href">
            <assert
                test="matches(normalize-space(.), '[a-z]{4}_[a-z]{1}_[0-9]{3,6}.pdf') or matches(normalize-space(.), '[a-z]{4}_[a-z]{1}_[0-9]{3,6}.epub')">
                <![CDATA[Incorrectly formatted value on <self-uri> attribute @xlink:href. The attribute value
                must must be the name of the PDF or ePub file in lower case. It should follow the following pattern: [a-z]{4}_[a-z]{1}_[0-9]{3,6}.pdf. (See 1.22 Link to PDF)]]></assert>
        </rule>
    </pattern>

    <!-- Check VALUE of @xlink:href on <related-article> does not point to self -->
    <pattern>
        <let name="article_id" value="/article/front[1]/article-meta[1]/article-id[1]"/>
        <rule context="/article/front/article-meta/related-article">
            <report test="starts-with(@xlink:href, $article_id)"
                ><![CDATA[<related-article> element seems to point to this article. <related-article> element should be used to point to other/related content.]]></report>
        </rule>
    </pattern>

    <!-- Check <abstract> DOES NOT contain <title> -->
    <pattern>
        <rule context="/article/front/article-meta/abstract">
            <report test="title"><![CDATA[Remove <title> from abstract element. (See 1.23 Abstracts)]]></report>
        </rule>
    </pattern>

    <!-- Check <kwd> are seperated by <x>, <x> -->
    <pattern>

        <rule context="/article/front/article-meta/kwd-group">
            <let name="kwd_count" value="count(kwd)"/>
            <let name="x_count" value="count(x)"/>
            <report test="not($kwd_count = ($x_count + 1))"
                ><![CDATA[<keywords should be formatted with <x>, <x> (<kwd>...</kwd><x>, </x>). (See 1.24
                Keywords, JEL Codes)]]></report>
        </rule>
    </pattern>

    <!-- Check <heading> DOES NOT EXIST -->
    <pattern>
        <rule context="/article/front/article-meta/article-categories/subj-group">
            <report test="subject"
                ><![CDATA[This article includes a subject element inside article-categories/subj-group, but
                subject (used for TOC category heads) should be included in the issue xml file. (See 2.4 TOC
                Level Metadata)]]></report>
        </rule>
    </pattern>


    <!-- CONTRIBUTORS -->

    <pattern>
        <!-- Check that the <contributor> uses <string-name>, not <name> -->
        <rule context="/article/front/article-meta/contrib-group/contrib">
            <report test="name"
                ><![CDATA[The contib block uses <name>  when it should use  <string-name>. (See 1.9 Contributors
)]]></report>
        </rule>
    </pattern>

    <pattern>
        <!-- Check VALUE <contrib-type> -->
        <rule context="/article/front/article-meta/contrib-group/contrib">
            <assert
                test="
                    @contrib-type = 'abstractor' or @contrib-type = 'assoc-editor' or @contrib-type = 'author' or @contrib-type = 'chair' or
                    @contrib-type = 'collaborator' or @contrib-type = 'contributing-editor' or @contrib-type = 'corresp-editor' or
                    @contrib-type = 'editor' or @contrib-type = 'guest-editor' or @contrib-type = 'illustrator' or @contrib-type = 'moderator' or
                    @contrib-type = 'presenter' or @contrib-type = 'reviewed-author' or @contrib-type = 'reviewer' or @contrib-type = 'series-editor'
                    or @contrib-type = 'translator' or @contrib-type = '' or @contrib-type = 'coauthor' or @contrib-type = 'contributor' or
                    @contrib-type = 'contributor-note' or @contrib-type = 'corresp' or @contrib-type = 'proof-contact' or @contrib-type = 'techeditor'
                    "
                ><![CDATA[Unrecognized @contrib-type. Value should be one of the following: abstractor',
                'assoc-editor (associate editor)', 'author', 'chair', 'collaborator', 'contributing-editor',
                'corresp-editor (corresponding editor)', 'editor', 'guest-editor', 'illustrator', 'moderator',
                'presenter', 'reviewed-author', 'reviewer', 'series-editor', 'translator', 'coauthor', 'contributor', 'contributor-note', 'corresp (corresponding author)', 'proof-contact', 'techeditor'.  (See 1.9 Contributors
)]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check VALUE of <contrib-id> -->
        <rule context="/article/front/article-meta/contrib-group/contrib/contrib-id">
            <assert test="matches(., 'http://orcid.org/[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{3}[X0-9]{1}')"
                ><![CDATA[ORCID not properly formatted. Should follow:
                'http://orcid.org/[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{3}[X0-9]{1}'. (See 1.14 ORCID)]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check affiliations not tagged as <xref> -->
        <rule context="/article/front/article-meta/contrib-group/contrib/xref">
            <report test="@ref-type = 'aff'"
                ><![CDATA[Incorrectly formatted affiliation. Affiliations should be tagged using <aff>
                elements, not <xref> elements. (See 1.10 Affiliations)]]></report>
        </rule>
    </pattern>

    <pattern>
        <!-- Check VALUE of <aff> is not too long -->
        <rule context="//aff">
            <let name="aff_count" value="string-length(.)"/>
            <report test="string-length(.) &gt; 150"
                ><![CDATA[Affiliation longer than 150 characters, consider changing to <bio>. (See 1.10 Affiliations)]]><value-of
                    select="$aff_count"/></report>
        </rule>
    </pattern>

    <pattern>
        <!-- Check VALUE of @ref-type on <xref> -->
        <rule context="/article/front/article-meta/contrib-group/contrib/xref">
            <assert test="@ref-type = 'author-notes' or @ref-type = 'corresp'"
                    ><![CDATA[Incorrectly formatted <xref> element inside <contrib>. <xref> elements should only include '@ref-type="author-notes"' or '@ref-type="corresp'"' not ']]><value-of
                        select="@ref-type"/><![CDATA[ '. (See 1.11 Author notes)]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check corresponding author (Part 1) -->
        <rule context="/article/front/article-meta/contrib-group/contrib/xref">
            <report test="not(../@corresp = 'yes') and @ref-type = 'corresp'"
                ><![CDATA[<contrib> element includes '<xref rref-type="corresp">*</xref>', but the <contib> does not include an @corresp='yes'. (See 1.11 Author notes)]]></report>
        </rule>
    </pattern>

    <pattern>
        <!-- Check corresponding author (Part 2) -->
        <rule context="/article/front/article-meta/contrib-group/contrib/@corresp">
            <assert test=". = 'yes' and ../xref/@ref-type = 'corresp'"
                ><![CDATA[<contrib> element includes a @corresp='yes' but not '<xref
                ref-type="corresp">*</xref>'. (See 1.13 Corresponding Author Information)]]></assert>
        </rule>
    </pattern>

    <!-- Check @id EXISTS on <corresp> -->
    <pattern>
        <rule context="/article/front/article-meta/author-notes/corresp">
            <assert test="@id"><![CDATA[<corresp> element missing @id.  (See 1.13 Corresponding Author Information)]]></assert>
        </rule>
    </pattern>

    <!-- Check VALUE of <corresp> -->
    <pattern>
        <rule context="/article/front/article-meta/author-notes/corresp">
            <assert test="label and matches(., 'Corresponding author:') and email"
                ><![CDATA[Incorrect formatting of <corresp> element. Should be formatted as: '<corresp
                id="cor1"> &#x002A;Corresponding author.</corresp>. (See 1.13 Corresponding Author Information)]]></assert>
        </rule>
    </pattern>

    <!-- Check VALUE of @id on <corresp> -->
    <pattern>
        <rule context="/article/front/article-meta/author-notes/corresp/@id">
            <assert test="matches(., 'cor[0-9{1}]')"
                ><![CDATA[Value of @id on <corresp> should be formatted as 'cor1'. If there are multiple <corresp> elements, they should be formatted as 'cor2', 'cor3', ... (See 1.13 Corresponding Author Information)]]></assert>
        </rule>
    </pattern>


    <!-- BOOK REVIEWS -->

    <pattern>
        <!-- Check that all book reviews contain a <product> -->
        <rule context="/article">
            <report test="@article-type = 'book-review' and not(//product)"
                ><![CDATA[@article-type='book-review' found but missing <product> element. If this is a book review, the product information should be included in <product> element.]]></report>
        </rule>
    </pattern>

    <pattern>
        <!-- Check that if a <product> element exists, the article type is book-review -->
        <rule context="/article/front/article-meta">
            <report test="not(/article/@article-type = 'book-review') and (product)"
                ><![CDATA[<product> element is found, but the article type is not book-review. Only a
                book-review should have a <product> element. (See 1.29 Book and Product Reviews)]]></report>
        </rule>
    </pattern>

    <pattern>
        <!-- Check <source> exists inside <product> -->
        <rule context="/article/front/article-meta/product">
            <assert test="source"
                ><![CDATA[<product> element found without <source>. The title of the item being reviewed
                should be placed inside <source> within the <product> element. (See 1.29 Book and Product Reviews)]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check <source> is first elemt in <product> -->
        <rule context="/article/front/article-meta/product">
            <assert test="*[1] = source"
                ><![CDATA[<source> incorrectly placed inside <product>. <source> should be the first element
                inside <product>. (See 1.29 Book and Product Reviews)]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- If a book review includes <article-title>, the title should not be the same as <source> -->
        <rule context="/article/front/article-meta/title-group/article-title">
            <report test="/article/@article-type = 'book-review' and normalize-space(.) = normalize-space(/article/front/article-meta/product/source)">
                <![CDATA[<article-title> same as <source> in <product>. Either remove <article-title> or
                include a unique <article-title>. (See 1.29 Book and Product Reviews)]]></report>
        </rule>
    </pattern>


    <!-- FUNDREF -->
    <pattern>
        <!-- ALERT user to empty <award-id> -->
        <rule context="/article/front/article-meta/funding-group/award-group/award-id">
            <report test="normalize-space(.) = ''"><![CDATA[Empty <award-id> element. (See 1.16 FundRef)]]></report>
        </rule>
    </pattern>

    <pattern>
        <!-- ALERT user to empty <institution> -->
        <rule
            context="/article/front/article-meta/funding-group/award-group/funding-source/institution-wrap/institution">
            <report test="normalize-space(.) = ''"><![CDATA[Empty <institution> element. (See 1.16 FundRef)]]></report>
        </rule>
    </pattern>

    <pattern>
        <!-- ALERT user to empty <institution-id> -->
        <rule
            context="/article/front/article-meta/funding-group/award-group/funding-source/institution-wrap/institution-id">
            <report test="normalize-space(.) = ''"><![CDATA[Empty <institution-id> element. (See 1.16 FundRef)]]></report>
        </rule>
    </pattern>


    <!-- REFERENCES -->
    <pattern>
        <!-- Check @publication-type EXISTS on <mixed-citation> -->
        <rule context="/article/back/ref-list/ref/mixed-citation">
            <assert test="@publication-type"
                ><![CDATA[The <mixed-citation> element must have an @publication-type attribute. (See 1.30
                References)]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check VALUE of @publication-type -->
        <rule context="/article/back/ref-list/ref/mixed-citation/@publication-type">
            <assert
                test="
                    . = 'book' or . = 'confproc' or
                    . = 'journal' or . = 'paper' or
                    . = 'report' or . = 'thesis' or
                    . = 'letter' or . = 'review' or
                    . = 'patent' or . = 'standard' or
                    . = 'data' or . = 'working-paper' or
                    . = 'other'
                    
                    "><![CDATA[Unrecognized @publication-type on <mixed-citation>. Value should be one of the following:
                'book', 'confproc', 'journal', 'paper', 'report', 
                'thesis', 'letter', 'review', 'patent', 'standard', 
                'data', or 'working-paper'. Please do not use 'other'. 
                If you need a new @publication-type added, please email journals-tech@mit.edu so it can be added to the guidlines. (See 1.30
                References)]]></assert>
        </rule>
    </pattern>

    <pattern>
        <!-- Check VALUE of @publication-type -->
        <rule context="/article/back/ref-list/ref/mixed-citation/@publication-type">
            <assert
                test="
                . = 'book' or . = 'confproc' or
                . = 'journal' or . = 'paper' or
                . = 'report' or . = 'thesis' or
                . = 'letter' or . = 'review' or
                . = 'patent' or . = 'standard' or
                . = 'data' or . = 'working-paper' or
                . = 'other'
                
                "><![CDATA[Unrecognized @publication-type on <mixed-citation>. Value should be one of the following:
                'book', 'confproc', 'journal', 'paper', 'report', 
                'thesis', 'letter', 'review', 'patent', 'standard', 
                'data', or 'working-paper'. Please do not use 'other'. 
                If you need a new @publication-type added, please email journals-tech@mit.edu so it can be added to the guidlines. (See 1.30
                References)]]></assert>
        </rule>
    </pattern>
    
    <!-- FIGURES -->

    <!-- TABLES -->

    <pattern>
        <!-- Check tables are HTML, not OASIS -->
        <rule context="//oasis:table">
            <report test=".">
                <![CDATA[OASIS table found. Use HTML tables, not OASIS. See 1.27 Tables)]]>
            </report>
        </rule>
    </pattern>

</schema>
