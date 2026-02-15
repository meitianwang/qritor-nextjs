'use client'

import Link from 'next/link'
import { useTranslation } from '@/hooks/useTranslation'
import { useDocumentMeta } from '@/hooks/useDocumentMeta'

/**
 * Privacy Policy page
 */
export default function PrivacyPage() {
    const { t } = useTranslation('portal')

    // SEO
    useDocumentMeta({
        title: t('seo.privacy.title'),
        description: t('seo.privacy.description')
    })

    return (
        <>
            {/* Page header */}
            <section className="page-header">
                <div className="container">
                    <h1 className="page-title animate-fade-in">{t('legal.privacy.title')}</h1>
                    <p className="page-subtitle animate-fade-in delay-100">
                        {t('legal.privacy.lastUpdated')}
                    </p>
                </div>
            </section>

            {/* Privacy policy content */}
            <section className="legal-content">
                <div className="container">
                    <div className="legal-document">

                        {/* Introduction */}
                        <div className="legal-section">
                            <p>{t('legal.privacy.intro')}</p>
                            <div className="legal-company-info">
                                <h3>{t('legal.privacy.companyInfo.title')}</h3>
                                <ul>
                                    <li><strong>{t('legal.privacy.companyInfo.companyName')}</strong>：{t('legal.privacy.companyInfo.companyNameValue')}</li>
                                    <li><strong>{t('legal.privacy.companyInfo.address')}</strong>：{t('legal.privacy.companyInfo.addressValue')}</li>
                                    <li><strong>{t('legal.privacy.companyInfo.email')}</strong>：{t('legal.privacy.companyInfo.emailValue')}</li>
                                </ul>
                            </div>
                        </div>

                        {/* 1. Information Collection */}
                        <div className="legal-section">
                            <h2>{t('legal.privacy.section1.title')}</h2>
                            <h3>{t('legal.privacy.section1.subtitle1')}</h3>
                            <p>{t('legal.privacy.section1.desc1')}</p>
                            <ul>
                                <li><strong>{t('legal.privacy.section1.item1')}</strong>：{t('legal.privacy.section1.item1Desc')}</li>
                                <li><strong>{t('legal.privacy.section1.item2')}</strong>：{t('legal.privacy.section1.item2Desc')}</li>
                                <li><strong>{t('legal.privacy.section1.item3')}</strong>：{t('legal.privacy.section1.item3Desc')}</li>
                                <li><strong>{t('legal.privacy.section1.item4')}</strong>：{t('legal.privacy.section1.item4Desc')}</li>
                            </ul>
                            <h3>{t('legal.privacy.section1.subtitle2')}</h3>
                            <p>{t('legal.privacy.section1.desc2')}</p>
                            <ul>
                                <li><strong>{t('legal.privacy.section1.item5')}</strong>：{t('legal.privacy.section1.item5Desc')}</li>
                                <li><strong>{t('legal.privacy.section1.item6')}</strong>：{t('legal.privacy.section1.item6Desc')}</li>
                                <li><strong>{t('legal.privacy.section1.item7')}</strong>：{t('legal.privacy.section1.item7Desc')}</li>
                            </ul>
                        </div>

                        {/* 2. Information Usage */}
                        <div className="legal-section">
                            <h2>{t('legal.privacy.section2.title')}</h2>
                            <p>{t('legal.privacy.section2.desc')}</p>
                            <ul>
                                <li><strong>{t('legal.privacy.section2.item1')}</strong>：{t('legal.privacy.section2.item1Desc')}</li>
                                <li><strong>{t('legal.privacy.section2.item2')}</strong>：{t('legal.privacy.section2.item2Desc')}</li>
                                <li><strong>{t('legal.privacy.section2.item3')}</strong>：{t('legal.privacy.section2.item3Desc')}</li>
                                <li><strong>{t('legal.privacy.section2.item4')}</strong>：{t('legal.privacy.section2.item4Desc')}</li>
                                <li><strong>{t('legal.privacy.section2.item5')}</strong>：{t('legal.privacy.section2.item5Desc')}</li>
                                <li><strong>{t('legal.privacy.section2.item6')}</strong>：{t('legal.privacy.section2.item6Desc')}</li>
                                <li><strong>{t('legal.privacy.section2.item7')}</strong>：{t('legal.privacy.section2.item7Desc')}</li>
                            </ul>
                        </div>

                        {/* 3. Information Sharing */}
                        <div className="legal-section">
                            <h2>{t('legal.privacy.section3.title')}</h2>
                            <p>{t('legal.privacy.section3.desc')}</p>
                            <h3>{t('legal.privacy.section3.subtitle1')}</h3>
                            <p>{t('legal.privacy.section3.desc1')}</p>
                            <h3>{t('legal.privacy.section3.subtitle2')}</h3>
                            <p>{t('legal.privacy.section3.desc2')}</p>
                            <h3>{t('legal.privacy.section3.subtitle3')}</h3>
                            <p>{t('legal.privacy.section3.desc3')}</p>
                            <h3>{t('legal.privacy.section3.subtitle4')}</h3>
                            <p>{t('legal.privacy.section3.desc4')}</p>
                        </div>

                        {/* 4. Data Security */}
                        <div className="legal-section">
                            <h2>{t('legal.privacy.section4.title')}</h2>
                            <p>{t('legal.privacy.section4.desc')}</p>
                            <ul>
                                <li><strong>{t('legal.privacy.section4.item1')}</strong>：{t('legal.privacy.section4.item1Desc')}</li>
                                <li><strong>{t('legal.privacy.section4.item2')}</strong>：{t('legal.privacy.section4.item2Desc')}</li>
                                <li><strong>{t('legal.privacy.section4.item3')}</strong>：{t('legal.privacy.section4.item3Desc')}</li>
                                <li><strong>{t('legal.privacy.section4.item4')}</strong>：{t('legal.privacy.section4.item4Desc')}</li>
                                <li><strong>{t('legal.privacy.section4.item5')}</strong>：{t('legal.privacy.section4.item5Desc')}</li>
                            </ul>
                            <p>{t('legal.privacy.section4.note')}</p>
                        </div>

                        {/* 5. Cookie Policy */}
                        <div className="legal-section">
                            <h2>{t('legal.privacy.section5.title')}</h2>
                            <p>{t('legal.privacy.section5.desc')}</p>
                            <ul>
                                <li>{t('legal.privacy.section5.item1')}</li>
                                <li>{t('legal.privacy.section5.item2')}</li>
                                <li>{t('legal.privacy.section5.item3')}</li>
                            </ul>
                            <p>{t('legal.privacy.section5.note')}</p>
                        </div>

                        {/* 6. User Rights */}
                        <div className="legal-section">
                            <h2>{t('legal.privacy.section6.title')}</h2>
                            <p>{t('legal.privacy.section6.desc')}</p>
                            <h3>{t('legal.privacy.section6.subtitle1')}</h3>
                            <p>{t('legal.privacy.section6.desc1')}</p>
                            <h3>{t('legal.privacy.section6.subtitle2')}</h3>
                            <p>{t('legal.privacy.section6.desc2')}</p>
                            <h3>{t('legal.privacy.section6.subtitle3')}</h3>
                            <p>{t('legal.privacy.section6.desc3')}</p>
                            <h3>{t('legal.privacy.section6.subtitle4')}</h3>
                            <p>{t('legal.privacy.section6.desc4')}</p>
                            <h3>{t('legal.privacy.section6.subtitle5')}</h3>
                            <p>{t('legal.privacy.section6.desc5')}</p>
                        </div>

                        {/* 7. Children's Privacy */}
                        <div className="legal-section">
                            <h2>{t('legal.privacy.section7.title')}</h2>
                            <p>{t('legal.privacy.section7.desc1')}</p>
                            <p>{t('legal.privacy.section7.desc2')}</p>
                        </div>

                        {/* 8. Data Storage & Cross-border */}
                        <div className="legal-section">
                            <h2>{t('legal.privacy.section8.title')}</h2>
                            <h3>{t('legal.privacy.section8.subtitle1')}</h3>
                            <p>{t('legal.privacy.section8.desc1')}</p>
                            <h3>{t('legal.privacy.section8.subtitle2')}</h3>
                            <p>{t('legal.privacy.section8.desc2')}</p>
                        </div>

                        {/* 9. Policy Changes */}
                        <div className="legal-section">
                            <h2>{t('legal.privacy.section9.title')}</h2>
                            <p>{t('legal.privacy.section9.desc1')}</p>
                            <p>{t('legal.privacy.section9.desc2')}</p>
                        </div>

                        {/* 10. Contact Us */}
                        <div className="legal-section">
                            <h2>{t('legal.privacy.section10.title')}</h2>
                            <p>{t('legal.privacy.section10.desc')}</p>
                            <ul>
                                <li><strong>{t('legal.privacy.section10.companyName')}</strong>：{t('legal.privacy.companyInfo.companyNameValue')}</li>
                                <li><strong>{t('legal.privacy.section10.email')}</strong>：{t('legal.privacy.companyInfo.emailValue')}</li>
                                <li><strong>{t('legal.privacy.section10.address')}</strong>：{t('legal.privacy.companyInfo.addressValue')}</li>
                            </ul>
                            <p>{t('legal.privacy.section10.note')}</p>
                        </div>

                        {/* Related links */}
                        <div className="legal-related">
                            <h3>{t('legal.relatedDocs')}</h3>
                            <div className="legal-links">
                                <Link href="/terms" className="legal-link">{t('legal.terms.title')}</Link>
                                <Link href="/refund" className="legal-link">{t('legal.refund.title')}</Link>
                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </>
    )
}
