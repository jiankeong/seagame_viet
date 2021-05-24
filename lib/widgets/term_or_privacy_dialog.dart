import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

import 'custom_future_builder.dart';
import '../utils/general_functions.dart';
import '../globals.dart';
import '../styles.dart';
import '../app_strings.dart';
import '../icon_image_path.dart';
import './default_sized_box.dart';
import './no_records_found_text.dart';

class TermsOrPrivacyDialog extends StatefulWidget {
  final int type;

  TermsOrPrivacyDialog({this.type = 0});

  @override
  _TermsOrPrivacyDialogState createState() => _TermsOrPrivacyDialogState();
}

class _TermsOrPrivacyDialogState extends State<TermsOrPrivacyDialog> {
  bool isInit = true;

  String infoText = "";

  Future<dynamic> _getInfoText() async {
    isInit = false;

    await Future.delayed(Duration(seconds: 1));

    if (widget.type == 1) {
      infoText =
          """<div class="DnnModule DnnModule- DnnModule--1 DnnModule-Admin">
          <div class="DNNContainer_noTitle">
            <div id="dnn_ctr_ContentPane"><div id="dnn_ctr_ModuleContent" class="DNNModuleContent ModC">
            
          <div class="dnnPrivacy dnnClear"><span id="dnn_ctr_Privacy_lblPrivacy"><div align="left">
                  <p>SEA Games 2021 is committed to protecting your privacy and developing technology
                  that gives you the most powerful and safe online experience. This Statement of Privacy
                  applies to the SEA Games 2021 site and governs data collection and usage.
                  By using the SEA Games 2021 site, you consent to the data practices described
                  in this statement.</p>
                  <p><span class="SubHead"><b>Collection of your Personal Information</b></span></p>
                  <p>SEA Games 2021 collects personally identifiable information, such as your email
                  address, name, home or work address or telephone number. SEA Games 2021 also
                  collects anonymous demographic information, which is not unique to you, such as
                  your ZIP code, age, gender, preferences, interests and favorites.</p>
                  <p>There is also information about your computer hardware and software that is automatically
                  collected by SEA Games 2021. This information can include: your IP address,
                  browser type, domain names, access times and referring website addresses. This
                  information is used by SEA Games 2021 for the operation of the service, to
                  maintain quality of the service, and to provide general statistics regarding use
                  of the SEA Games 2021 site.</p>
                  <p>Please keep in mind that if you directly disclose personally identifiable information
                  or personally sensitive data through SEA Games 2021 public message boards,
                  this information may be collected and used by others. Note: SEA Games 2021
                  does not read any of your private online communications.</p>
                  <p>SEA Games 2021 encourages you to review the privacy statements of Web sites
                  you choose to link to from SEA Games 2021 so that you can understand how those
                  Web sites collect, use and share your information. SEA Games 2021 is not responsible
                  for the privacy statements or other content on Web sites outside of the SEA Games 2021
                  and SEA Games 2021 family of Web sites.</p>
                  <p><span class="SubHead"><b>Use of your Personal Information</b></span></p>
                  <p>SEA Games 2021 collects and uses your personal information to operate the SEA Games 2021
                  Web site and deliver the services you have requested. SEA Games 2021 also uses
                  your personally identifiable information to inform you of other products or services
                  available from SEA Games 2021 and its affiliates. SEA Games 2021 may also
                  contact you via surveys to conduct research about your opinion of current services
                  or of potential new services that may be offered.</p>
                  <p>SEA Games 2021 does not sell, rent or lease its customer lists to third parties.
                  SEA Games 2021 may, from time to time, contact you on behalf of external business
                  partners about a particular offering that may be of interest to you. In those cases,
                  your unique personally identifiable information (e-mail, name, address, telephone
                  number) is not transferred to the third party. In addition, SEA Games 2021
                  may share data with trusted partners to help us perform statistical analysis, send
                  you email or postal mail, provide customer support, or arrange for deliveries. All
                  such third parties are prohibited from using your personal information except to
                  provide these services to SEA Games 2021, and they are required to maintain
                  the confidentiality of your information.</p>
                  <p>SEA Games 2021 does not use or disclose sensitive personal information, such
                  as race, religion, or political affiliations, without your explicit consent.</p>
                  <p>SEA Games 2021 keeps track of the Web sites and pages our customers visit within
                  SEA Games 2021, in order to determine what SEA Games 2021 services are
                  the most popular. This data is used to deliver customized content and advertising
                  within SEA Games 2021 to customers whose behavior indicates that they are interested
                  in a particular subject area.</p>
                  <p>SEA Games 2021 Web sites will disclose your personal information, without notice,
                  only if required to do so by law or in the good faith belief that such action is
                  necessary to: (a) conform to the edicts of the law or comply with legal process
                  served on SEA Games 2021 or the site; (b) protect and defend the rights or
                  property of SEA Games 2021; and, (c) act under exigent circumstances to protect
                  the personal safety of users of SEA Games 2021, or the public.</p>
                  <p><span class="SubHead"><b>Use of Cookies</b></span></p>
                  <p>The SEA Games 2021 Web site use "cookies" to help you personalize your online
                  experience. A cookie is a text file that is placed on your hard disk by a Web page
                  server. Cookies cannot be used to run programs or deliver viruses to your computer.
                  Cookies are uniquely assigned to you, and can only be read by a web server in the
                  domain that issued the cookie to you.</p>
                  <p>One of the primary purposes of cookies is to provide a convenience feature to save
                  you time. The purpose of a cookie is to tell the Web server that you have returned
                  to a specific page. For example, if you personalize SEA Games 2021 pages, or
                  register with SEA Games 2021 site or services, a cookie helps SEA Games 2021
                  to recall your specific information on subsequent visits. This simplifies the process
                  of recording your personal information, such as billing addresses, shipping addresses,
                  and so on. When you return to the same SEA Games 2021 Web site, the information
                  you previously provided can be retrieved, so you can easily use the SEA Games 2021
                  features that you customized.</p>
                  <p>You have the ability to accept or decline cookies. Most Web browsers automatically
                  accept cookies, but you can usually modify your browser setting to decline cookies
                  if you prefer. If you choose to decline cookies, you may not be able to fully experience
                  the interactive features of the SEA Games 2021 services or Web sites you visit.</p>
                  <p><span class="SubHead"><b>Security of your Personal Information</b></span></p>
                  <p>SEA Games 2021 secures your personal information from unauthorized access,
                  use or disclosure. SEA Games 2021 secures the personally identifiable information
                  you provide on computer servers in a controlled, secure environment, protected from
                  unauthorized access, use or disclosure. When personal information (such as a credit
                  card number) is transmitted to other Web sites, it is protected through the use
                  of encryption, such as the Secure Socket Layer (SSL) protocol.</p>
                  <p><span class="SubHead"><b>Changes to this Statement</b></span></p>
                  <p>SEA Games 2021 will occasionally update this Statement of Privacy to reflect
          company and customer feedback. SEA Games 2021 encourages you to periodically
                  review this Statement to be informed of how SEA Games 2021 is protecting your
                  information.</p>
                  <p><span class="SubHead"><b>Contact Information</b></span></p>
                  <p>SEA Games 2021 welcomes your comments regarding this Statement of Privacy.
                  If you believe that SEA Games 2021 has not adhered to this Statement, please
                  contact SEA Games 2021 at <a href="mailto:admin@viesgoc.com">admin@viesgoc.com</a>.
                  We will use commercially reasonable efforts to promptly determine and remedy the
                  problem.</p>
              </div></span></div>
          </div></div>
            <div class="clear"></div>
          </div>
</div>""";
    } else {
      infoText =
          """<div align="left">
        <p><span class="SubHead"><b>AGREEMENT BETWEEN USER AND SEA Games 2021</b></span></p><p>
        </p><p>The SEA Games 2021 Web Site is comprised of various Web pages operated by SEA Games 2021.</p>
        <p>The SEA Games 2021 Web Site is offered to you conditioned on your acceptance
        without modification of the terms, conditions, and notices contained herein. Your
        use of the SEA Games 2021 Web Site constitutes your agreement to all such terms,
        conditions, and notices.</p><p>
        </p><p><span class="SubHead"><b>MODIFICATION OF THESE TERMS OF USE</b></span></p>
        <p>SEA Games 2021 reserves the right to change the terms, conditions, and notices
        under which the SEA Games 2021 Web Site is offered, including but not limited
        to the charges associated with the use of the SEA Games 2021 Web Site.</p>
        <p><span class="SubHead"><b>LINKS TO THIRD PARTY SITES</b></span></p>
        <p>The SEA Games 2021 Web Site may contain links to other Web Sites ("Linked Sites").
        The Linked Sites are not under the control of SEA Games 2021 and SEA Games 2021
        is not responsible for the contents of any Linked Site, including without limitation
        any link contained in a Linked Site, or any changes or updates to a Linked Site.
        SEA Games 2021 is not responsible for webcasting or any other form of transmission
        received from any Linked Site. SEA Games 2021 is providing these links to you
        only as a convenience, and the inclusion of any link does not imply endorsement
        by SEA Games 2021 of the site or any association with its operators.</p>
        <p><span class="SubHead"><b>NO UNLAWFUL OR PROHIBITED USE</b></span></p>
        <p>As a condition of your use of the SEA Games 2021 Web Site, you warrant to SEA Games 2021
        that you will not use the SEA Games 2021 Web Site for any purpose that is unlawful
        or prohibited by these terms, conditions, and notices. You may not use the SEA Games 2021
        Web Site in any manner which could damage, disable, overburden, or impair the SEA Games 2021
        Web Site or interfere with any other party's use and enjoyment of the SEA Games 2021
        Web Site. You may not obtain or attempt to obtain any materials or information through
        any means not intentionally made available or provided for through the SEA Games 2021
        Web Sites.</p>
        <p><span class="SubHead"><b>USE OF COMMUNICATION SERVICES</b></span></p>
        <p>The SEA Games 2021 Web Site may contain bulletin board services, chat areas,
        news groups, forums, communities, personal web pages, calendars, and/or other message
        or communication facilities designed to enable you to communicate with the public
        at large or with a group (collectively, "Communication Services"), you agree to
        use the Communication Services only to post, send and receive messages and material
        that are proper and related to the particular Communication Service. By way of example,
        and not as a limitation, you agree that when using a Communication Service, you
        will not:</p>
<ul>
            <li>Defame, abuse, harass, stalk, threaten or otherwise violate the legal rights (such
                as rights of privacy and publicity) of others.</li>
            <li>Publish, post, upload, distribute or disseminate any inappropriate, profane, defamatory,
                infringing, obscene, indecent or unlawful topic, name, material or information.</li>
            <li>Upload files that contain software or other material protected by intellectual property
                laws (or by rights of privacy of publicity) unless you own or control the rights
                thereto or have received all necessary consents.</li>
            <li>Upload files that contain viruses, corrupted files, or any other similar software
                or programs that may damage the operation of another's computer.</li>
            <li>Advertise or offer to sell or buy any goods or services for any business purpose,
                unless such Communication Service specifically allows such messages.</li>
            <li>Conduct or forward surveys, contests, pyramid schemes or chain letters.</li>
            <li>Download any file posted by another user of a Communication Service that you know,
                or reasonably should know, cannot be legally distributed in such manner.</li>
            <li>Falsify or delete any author attributions, legal or other proper notices or proprietary
                designations or labels of the origin or source of software or other material contained
                in a file that is uploaded.</li>
            <li>Restrict or inhibit any other user from using and enjoying the Communication Services.</li>
            <li>Violate any code of conduct or other guidelines which may be applicable for any particular Communication Service.</li>
            <li>Harvest or otherwise collect information about others, including e-mail addresses, without their consent.</li>
            <li>Violate any applicable laws or regulations.</li>
</ul>
        <p>SEA Games 2021 has no obligation to monitor the Communication Services. However,
        SEA Games 2021 reserves the right to review materials posted to a Communication
        Service and to remove any materials in its sole discretion. SEA Games 2021
        reserves the right to terminate your access to any or all of the Communication Services
        at any time without notice for any reason whatsoever.</p>
        <p>SEA Games 2021 reserves the right at all times to disclose any information
        as necessary to satisfy any applicable law, regulation, legal process or governmental
        request, or to edit, refuse to post or to remove any information or materials, in
        whole or in part, in SEA Games 2021's sole discretion.</p>
        <p>Always use caution when giving out any personally identifying information about
        yourself or your children in any Communication Service. SEA Games 2021 does
        not control or endorse the content, messages or information found in any Communication
        Service and, therefore, SEA Games 2021 specifically disclaims any liability
        with regard to the Communication Services and any actions resulting from your participation
        in any Communication Service. Managers and hosts are not authorized SEA Games 2021
        spokespersons, and their views do not necessarily reflect those of SEA Games 2021.</p>
        <p>Materials uploaded to a Communication Service may be subject to posted limitations
        on usage, reproduction and/or dissemination. You are responsible for adhering to
        such limitations if you download the materials.</p>
        <p><span class="SubHead"><b>MATERIALS PROVIDED TO SEA Games 2021 OR POSTED AT ANY SEA Games 2021
            WEB SITE</b></span></p>
        <p>SEA Games 2021 does not claim ownership of the materials you provide to SEA Games 2021
        (including feedback and suggestions) or post, upload, input or submit to any SEA Games 2021
        Web Site or its associated services (collectively "Submissions"). However, by posting,
        uploading, inputting, providing or submitting your Submission you are granting SEA Games 2021,
        its affiliated companies and necessary sublicensees permission to use your Submission
        in connection with the operation of their Internet businesses including, without
        limitation, the rights to: copy, distribute, transmit, publicly display, publicly
        perform, reproduce, edit, translate and reformat your Submission; and to publish
        your name in connection with your Submission.</p>
        <p>No compensation will be paid with respect to the use of your Submission, as provided
        herein. SEA Games 2021 is under no obligation to post or use any Submission
        you may provide and may remove any Submission at any time in SEA Games 2021's
        sole discretion.</p>
        <p>By posting, uploading, inputting, providing or submitting your Submission you warrant
        and represent that you own or otherwise control all of the rights to your Submission
        as described in this section including, without limitation, all the rights necessary
        for you to provide, post, upload, input or submit the Submissions.</p>
        <p><span class="SubHead"><b>LIABILITY DISCLAIMER</b></span></p>
        <p>THE INFORMATION, SOFTWARE, PRODUCTS, AND SERVICES INCLUDED IN OR AVAILABLE THROUGH
        THE SEA Games 2021 WEB SITE MAY INCLUDE INACCURACIES OR TYPOGRAPHICAL ERRORS.
        CHANGES ARE PERIODICALLY ADDED TO THE INFORMATION HEREIN. SEA Games 2021 AND/OR
        ITS SUPPLIERS MAY MAKE IMPROVEMENTS AND/OR CHANGES IN THE SEA Games 2021 WEB
        SITE AT ANY TIME. ADVICE RECEIVED VIA THE SEA Games 2021 WEB SITE SHOULD NOT
        BE RELIED UPON FOR PERSONAL, MEDICAL, LEGAL OR FINANCIAL DECISIONS AND YOU SHOULD
        CONSULT AN APPROPRIATE PROFESSIONAL FOR SPECIFIC ADVICE TAILORED TO YOUR SITUATION.</p>
        <p>SEA Games 2021 AND/OR ITS SUPPLIERS MAKE NO REPRESENTATIONS ABOUT THE SUITABILITY,
        RELIABILITY, AVAILABILITY, TIMELINESS, AND ACCURACY OF THE INFORMATION, SOFTWARE,
        PRODUCTS, SERVICES AND RELATED GRAPHICS CONTAINED ON THE SEA Games 2021 WEB
        SITE FOR ANY PURPOSE. TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, ALL SUCH
        INFORMATION, SOFTWARE, PRODUCTS, SERVICES AND RELATED GRAPHICS ARE PROVIDED "AS
        IS" WITHOUT WARRANTY OR CONDITION OF ANY KIND. SEA Games 2021 AND/OR ITS SUPPLIERS
        HEREBY DISCLAIM ALL WARRANTIES AND CONDITIONS WITH REGARD TO THIS INFORMATION, SOFTWARE,
        PRODUCTS, SERVICES AND RELATED GRAPHICS, INCLUDING ALL IMPLIED WARRANTIES OR CONDITIONS
        OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT.</p>
        <p>TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT SHALL SEA Games 2021
        AND/OR ITS SUPPLIERS BE LIABLE FOR ANY DIRECT, INDIRECT, PUNITIVE, INCIDENTAL, SPECIAL,
        CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER INCLUDING, WITHOUT LIMITATION, DAMAGES
        FOR LOSS OF USE, DATA OR PROFITS, ARISING OUT OF OR IN ANY WAY CONNECTED WITH THE
        USE OR PERFORMANCE OF THE SEA Games 2021 WEB SITE, WITH THE DELAY OR INABILITY
        TO USE THE SEA Games 2021 WEB SITE OR RELATED SERVICES, THE PROVISION OF OR
        FAILURE TO PROVIDE SERVICES, OR FOR ANY INFORMATION, SOFTWARE, PRODUCTS, SERVICES
        AND RELATED GRAPHICS OBTAINED THROUGH THE SEA Games 2021 WEB SITE, OR OTHERWISE
        ARISING OUT OF THE USE OF THE SEA Games 2021 WEB SITE, WHETHER BASED ON CONTRACT,
        TORT, NEGLIGENCE, STRICT LIABILITY OR OTHERWISE, EVEN IF SEA Games 2021 OR
        ANY OF ITS SUPPLIERS HAS BEEN ADVISED OF THE POSSIBILITY OF DAMAGES. BECAUSE SOME
        STATES/JURISDICTIONS DO NOT ALLOW THE EXCLUSION OR LIMITATION OF LIABILITY FOR CONSEQUENTIAL
        OR INCIDENTAL DAMAGES, THE ABOVE LIMITATION MAY NOT APPLY TO YOU. IF YOU ARE DISSATISFIED
        WITH ANY PORTION OF THE SEA Games 2021 WEB SITE, OR WITH ANY OF THESE TERMS
        OF USE, YOUR SOLE AND EXCLUSIVE REMEDY IS TO DISCONTINUE USING THE SEA Games 2021
        WEB SITE.</p>
        <p>SERVICE CONTACT : admin@viesgoc.com</p>
        <p><span class="SubHead"><b>TERMINATION/ACCESS RESTRICTION</b></span></p>
        <p>SEA Games 2021 reserves the right, in its sole discretion, to terminate your
        access to the SEA Games 2021 Web Site and the related services or any portion
        thereof at any time, without notice. GENERAL To the maximum extent permitted by
        law, this agreement is governed by the laws of the State of Washington, U.S.A. and
        you hereby consent to the exclusive jurisdiction and venue of courts in San Mateo County,
        California, U.S.A. in all disputes arising out of or relating to the use of the
        SEA Games 2021 Web Site. Use of the SEA Games 2021 Web Site is unauthorized
        in any jurisdiction that does not give effect to all provisions of these terms and
        conditions, including without limitation this paragraph. You agree that no joint
        venture, partnership, employment, or agency relationship exists between you and
        SEA Games 2021 as a result of this agreement or use of the SEA Games 2021
        Web Site. SEA Games 2021's performance of this agreement is subject to existing
        laws and legal process, and nothing contained in this agreement is in derogation
        of SEA Games 2021's right to comply with governmental, court and law enforcement
        requests or requirements relating to your use of the SEA Games 2021 Web Site
        or information provided to or gathered by SEA Games 2021 with respect to such
        use. If any part of this agreement is determined to be invalid or unenforceable
        pursuant to applicable law including, but not limited to, the warranty disclaimers
        and liability limitations set forth above, then the invalid or unenforceable provision
        will be deemed superseded by a valid, enforceable provision that most closely matches
        the intent of the original provision and the remainder of the agreement shall continue
        in effect. Unless otherwise specified herein, this agreement constitutes the entire
        agreement between the user and SEA Games 2021 with respect to the SEA Games 2021
        Web Site and it supersedes all prior or contemporaneous communications and proposals,
        whether electronic, oral or written, between the user and SEA Games 2021 with
        respect to the SEA Games 2021 Web Site. A printed version of this agreement
        and of any notice given in electronic form shall be admissible in judicial or administrative
        proceedings based upon or relating to this agreement to the same extent an d subject
        to the same conditions as other business documents and records originally generated
        and maintained in printed form. It is the express wish to the parties that this
        agreement and all related documents be drawn up in English.</p>
        <p><span class="SubHead"><b>COPYRIGHT AND TRADEMARK NOTICES:</b></span></p>
        <p>All contents of the SEA Games 2021 Web Site are: Copyright 2021 by VIESGOC and/or
        its suppliers. All rights reserved.</p>
        <p><span class="SubHead"><b>TRADEMARKS</b></span></p>
        <p>The names of actual companies and products mentioned herein may be the trademarks
        of their respective owners.</p>
        <p>The example companies, organizations, products, people and events depicted herein
        are fictitious. No association with any real company, organization, product, person,
        or event is intended or should be inferred.</p>
        <p>Any rights not expressly granted herein are reserved.</p>
        <p><span class="SubHead"><b>NOTICES AND PROCEDURE FOR MAKING CLAIMS OF COPYRIGHT INFRINGEMENT</b></span></p>
        <p>Pursuant to Title 17, United States Code, Section 512(c)(2), notifications of claimed
        copyright infringement under United States copyright law should be sent to Service
        Provider's Designated Agent. ALL INQUIRIES NOT RELEVANT TO THE FOLLOWING PROCEDURE
        WILL RECEIVE NO RESPONSE. See Notice and Procedure for Making Claims of Copyright
        Infringement.</p>
    </div>""";
    }

    if (!mounted) return;

    setState(() {});

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Globals().getScreenWidth() * 0.05,
          vertical: Globals().getScreenHeight() * 0.1),
      child: Container(
        decoration: BoxDecoration(
          color: Styles.whiteColor,
          borderRadius: BorderRadius.circular(15.h),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 25.h,
          horizontal: 25.h,
        ),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTitleSection(),
              DefaultSizedBox.vertical(15),
              Expanded(
                child: CustomFutureBuilder(
                  future: isInit ? _getInfoText() : blankFunction(),
                  successWidget: infoText.trim() == ""
                      ? Center(
                          child: NoRecordFoundText(),
                        )
                      : SingleChildScrollView(
                          child: Html(
                            data: infoText,
                            style: {
                              "p": Style(
                                fontSize: FontSize(14.sp),
                                textAlign: TextAlign.justify,
                              )
                            },
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            titleMapper().tr().toUpperCase(),
            style: TextStyle(
              fontWeight: Styles.boldText,
              fontSize: 23.sp,
              color: Styles.primaryColor,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            AppIcons.cancel,
            width: 24.h,
            height: 24.h,
          ),
        ),
      ],
    );
  }

  String titleMapper() {
    switch (widget.type) {
      case 1:
        return AppStrings.privacyStatement;
      default:
        return AppStrings.termsOfUse;
    }
  }
}
