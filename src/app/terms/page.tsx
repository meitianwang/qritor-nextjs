'use client'

import Link from 'next/link'
import { useTranslation } from '@/hooks/useTranslation'
import { useDocumentMeta } from '@/hooks/useDocumentMeta'

/**
 * Terms of Service page
 */
export default function TermsPage() {
    const { t } = useTranslation('portal')

    // SEO
    useDocumentMeta({
        title: t('seo.terms.title'),
        description: t('seo.terms.description')
    })

    return (
        <>
            {/* Page header */}
            <section className="page-header">
                <div className="container">
                    <h1 className="page-title animate-fade-in">{t('legal.terms.title')}</h1>
                    <p className="page-subtitle animate-fade-in delay-100">
                        {t('legal.terms.lastUpdated')}
                    </p>
                </div>
            </section>

            {/* Terms content */}
            <section className="legal-content">
                <div className="container">
                    <div className="legal-document">

                        {/* Introduction */}
                        <div className="legal-section">
                            <p>{t('legal.terms.intro')}</p>
                            <div className="legal-company-info">
                                <h3>{t('legal.terms.companyInfo.title')}</h3>
                                <ul>
                                    <li><strong>{t('legal.terms.companyInfo.companyName')}</strong>：{t('legal.terms.companyInfo.companyNameValue')}</li>
                                    <li><strong>{t('legal.terms.companyInfo.companyType')}</strong>：{t('legal.terms.companyInfo.companyTypeValue')}</li>
                                    <li><strong>{t('legal.terms.companyInfo.regNumber')}</strong>：{t('legal.terms.companyInfo.regNumberValue')}</li>
                                    <li><strong>{t('legal.terms.companyInfo.address')}</strong>：{t('legal.terms.companyInfo.addressValue')}</li>
                                </ul>
                            </div>
                        </div>

                        {/* 1. Service Overview */}
                        <div className="legal-section">
                            <h2>{t('legal.terms.section1.title')}</h2>
                            <p>{t('legal.terms.section1.desc')}</p>
                            <ul>
                                <li><strong>{t('legal.terms.section1.item1')}</strong>：{t('legal.terms.section1.item1Desc')}</li>
                                <li><strong>{t('legal.terms.section1.item2')}</strong>：{t('legal.terms.section1.item2Desc')}</li>
                                <li><strong>{t('legal.terms.section1.item3')}</strong>：{t('legal.terms.section1.item3Desc')}</li>
                                <li><strong>{t('legal.terms.section1.item4')}</strong>：{t('legal.terms.section1.item4Desc')}</li>
                                <li><strong>{t('legal.terms.section1.item5')}</strong>：{t('legal.terms.section1.item5Desc')}</li>
                            </ul>
                        </div>

                        {/* 2. User Registration & Account */}
                        <div className="legal-section">
                            <h2>{t('legal.terms.section2.title')}</h2>
                            <h3>{t('legal.terms.section2.subtitle1')}</h3>
                            <p>{t('legal.terms.section2.desc1')}</p>
                            <h3>{t('legal.terms.section2.subtitle2')}</h3>
                            <p>{t('legal.terms.section2.desc2')}</p>
                            <h3>{t('legal.terms.section2.subtitle3')}</h3>
                            <p>{t('legal.terms.section2.desc3')}</p>
                        </div>

                        {/* 3. User Conduct */}
                        <div className="legal-section">
                            <h2>{t('legal.terms.section3.title')}</h2>
                            <h3>{t('legal.terms.section3.subtitle1')}</h3>
                            <p>{t('legal.terms.section3.desc1')}</p>
                            <ul>
                                <li>{t('legal.terms.section3.item1')}</li>
                                <li>{t('legal.terms.section3.item2')}</li>
                                <li>{t('legal.terms.section3.item3')}</li>
                                <li>{t('legal.terms.section3.item4')}</li>
                                <li>{t('legal.terms.section3.item5')}</li>
                                <li>{t('legal.terms.section3.item6')}</li>
                                <li>{t('legal.terms.section3.item7')}</li>
                            </ul>
                            <h3>{t('legal.terms.section3.subtitle2')}</h3>
                            <p>{t('legal.terms.section3.desc2')}</p>
                        </div>

                        {/* 4. Intellectual Property */}
                        <div className="legal-section">
                            <h2>{t('legal.terms.section4.title')}</h2>
                            <h3>{t('legal.terms.section4.subtitle1')}</h3>
                            <p>{t('legal.terms.section4.desc1')}</p>
                            <h3>{t('legal.terms.section4.subtitle2')}</h3>
                            <p>
                                <strong>{t('legal.terms.section4.desc2a')}</strong>：{t('legal.terms.section4.desc2aText')}
                            </p>
                            <p>
                                <strong>{t('legal.terms.section4.desc2b')}</strong>：{t('legal.terms.section4.desc2bText')}
                            </p>
                            <ul>
                                <li>{t('legal.terms.section4.item1')}</li>
                                <li>{t('legal.terms.section4.item2')}</li>
                                <li>{t('legal.terms.section4.item3')}</li>
                            </ul>
                            <h3>{t('legal.terms.section4.subtitle3')}</h3>
                            <p>{t('legal.terms.section4.desc3')}</p>
                        </div>

                        {/* 5. Paid Services */}
                        <div className="legal-section">
                            <h2>{t('legal.terms.section5.title')}</h2>
                            <h3>{t('legal.terms.section5.subtitle1')}</h3>
                            <p>{t('legal.terms.section5.desc1')}</p>
                            <h3>{t('legal.terms.section5.subtitle2')}</h3>
                            <p>{t('legal.terms.section5.desc2')}</p>
                            <h3>{t('legal.terms.section5.subtitle3')}</h3>
                            <p>{t('legal.terms.section5.desc3')}</p>
                            <h3>{t('legal.terms.section5.subtitle4')}</h3>
                            <p>
                                {t('legal.terms.section5.desc4')} <Link href="/refund">{t('legal.terms.section5.refundLink')}</Link>。
                            </p>
                        </div>

                        {/* 6. Service Changes & Termination */}
                        <div className="legal-section">
                            <h2>{t('legal.terms.section6.title')}</h2>
                            <h3>{t('legal.terms.section6.subtitle1')}</h3>
                            <p>{t('legal.terms.section6.desc1')}</p>
                            <h3>{t('legal.terms.section6.subtitle2')}</h3>
                            <p>{t('legal.terms.section6.desc2')}</p>
                            <ul>
                                <li>{t('legal.terms.section6.item1')}</li>
                                <li>{t('legal.terms.section6.item2')}</li>
                                <li>{t('legal.terms.section6.item3')}</li>
                                <li>{t('legal.terms.section6.item4')}</li>
                            </ul>
                            <h3>{t('legal.terms.section6.subtitle3')}</h3>
                            <p>{t('legal.terms.section6.desc3')}</p>
                        </div>

                        {/* 7. Disclaimers */}
                        <div className="legal-section">
                            <h2>{t('legal.terms.section7.title')}</h2>
                            <h3>{t('legal.terms.section7.subtitle1')}</h3>
                            <p>{t('legal.terms.section7.desc1')}</p>
                            <h3>{t('legal.terms.section7.subtitle2')}</h3>
                            <p>{t('legal.terms.section7.desc2')}</p>
                            <h3>{t('legal.terms.section7.subtitle3')}</h3>
                            <p>{t('legal.terms.section7.desc3')}</p>
                            <h3>{t('legal.terms.section7.subtitle4')}</h3>
                            <p>{t('legal.terms.section7.desc4')}</p>
                        </div>

                        {/* 8. Dispute Resolution */}
                        <div className="legal-section">
                            <h2>{t('legal.terms.section8.title')}</h2>
                            <h3>{t('legal.terms.section8.subtitle1')}</h3>
                            <p>{t('legal.terms.section8.desc1')}</p>
                            <h3>{t('legal.terms.section8.subtitle2')}</h3>
                            <p>{t('legal.terms.section8.desc2')}</p>
                        </div>

                        {/* 9. Terms Modification */}
                        <div className="legal-section">
                            <h2>{t('legal.terms.section9.title')}</h2>
                            <p>{t('legal.terms.section9.desc')}</p>
                        </div>

                        {/* 10. Contact Us */}
                        <div className="legal-section">
                            <h2>{t('legal.terms.section10.title')}</h2>
                            <p>{t('legal.terms.section10.desc')}</p>
                            <ul>
                                <li><strong>{t('legal.terms.section10.companyName')}</strong>：{t('legal.terms.companyInfo.companyNameValue')}</li>
                                <li><strong>{t('legal.terms.section10.email')}</strong>：{t('legal.privacy.companyInfo.emailValue')}</li>
                                <li><strong>{t('legal.terms.section10.address')}</strong>：{t('legal.terms.companyInfo.addressValue')}</li>
                            </ul>
                        </div>

                        {/* Related links */}
                        <div className="legal-related">
                            <h3>{t('legal.relatedDocs')}</h3>
                            <div className="legal-links">
                                <Link href="/privacy" className="legal-link">{t('legal.privacy.title')}</Link>
                                <Link href="/refund" className="legal-link">{t('legal.refund.title')}</Link>
                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </>
    )
}
