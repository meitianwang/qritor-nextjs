'use client'

import Link from 'next/link'
import { useTranslation } from '@/hooks/useTranslation'
import { useDocumentMeta } from '@/hooks/useDocumentMeta'

/**
 * Refund Policy page
 */
export default function RefundPage() {
    const { t } = useTranslation('portal')

    // SEO
    useDocumentMeta({
        title: t('seo.refund.title'),
        description: t('seo.refund.description')
    })

    return (
        <>
            {/* Page header */}
            <section className="page-header">
                <div className="container">
                    <h1 className="page-title animate-fade-in">{t('legal.refund.title')}</h1>
                    <p className="page-subtitle animate-fade-in delay-100">
                        {t('legal.refund.lastUpdated')}
                    </p>
                </div>
            </section>

            {/* Refund policy content */}
            <section className="legal-content">
                <div className="container">
                    <div className="legal-document">

                        {/* Introduction */}
                        <div className="legal-section">
                            <p>{t('legal.refund.intro')}</p>
                            <div className="legal-company-info">
                                <h3>{t('legal.refund.companyInfo.title')}</h3>
                                <ul>
                                    <li><strong>{t('legal.refund.companyInfo.companyName')}</strong>：{t('legal.refund.companyInfo.companyNameValue')}</li>
                                    <li><strong>{t('legal.refund.companyInfo.address')}</strong>：{t('legal.refund.companyInfo.addressValue')}</li>
                                </ul>
                            </div>
                        </div>

                        {/* 1. Refund Scope */}
                        <div className="legal-section">
                            <h2>{t('legal.refund.section1.title')}</h2>
                            <p>{t('legal.refund.section1.desc')}</p>
                            <ul>
                                <li><strong>{t('legal.refund.section1.item1')}</strong>：{t('legal.refund.section1.item1Desc')}</li>
                                <li><strong>{t('legal.refund.section1.item2')}</strong>：{t('legal.refund.section1.item2Desc')}</li>
                            </ul>
                        </div>

                        {/* 2. Subscription Refund */}
                        <div className="legal-section">
                            <h2>{t('legal.refund.section2.title')}</h2>

                            <h3>{t('legal.refund.section2.subtitle1')}</h3>
                            <p>{t('legal.refund.section2.desc1')}</p>
                            <ul>
                                <li>{t('legal.refund.section2.item1')}</li>
                                <li>{t('legal.refund.section2.item2')}</li>
                                <li>{t('legal.refund.section2.item3')}</li>
                            </ul>

                            <h3>{t('legal.refund.section2.subtitle2')}</h3>
                            <p>{t('legal.refund.section2.desc2')}</p>
                            <ul>
                                <li><strong>{t('legal.refund.section2.item4')}</strong>：{t('legal.refund.section2.item4Desc')}</li>
                                <li><strong>{t('legal.refund.section2.item5')}</strong>：{t('legal.refund.section2.item5Desc')}</li>
                            </ul>

                            <h3>{t('legal.refund.section2.subtitle3')}</h3>
                            <p>{t('legal.refund.section2.desc3')}</p>
                            <ul>
                                <li>{t('legal.refund.section2.item6')}</li>
                                <li>{t('legal.refund.section2.item7')}</li>
                                <li>{t('legal.refund.section2.item8')}</li>
                            </ul>
                        </div>

                        {/* 3. Credits Package Refund */}
                        <div className="legal-section">
                            <h2>{t('legal.refund.section3.title')}</h2>

                            <h3>{t('legal.refund.section3.subtitle1')}</h3>
                            <p>{t('legal.refund.section3.desc1')}</p>
                            <ul>
                                <li>{t('legal.refund.section3.item1')}</li>
                                <li>{t('legal.refund.section3.item2')}</li>
                            </ul>

                            <h3>{t('legal.refund.section3.subtitle2')}</h3>
                            <p>{t('legal.refund.section3.desc2')}</p>
                            <ul>
                                <li>{t('legal.refund.section3.item3')}</li>
                                <li>{t('legal.refund.section3.item4')}</li>
                            </ul>
                        </div>

                        {/* 4. Non-refundable Cases */}
                        <div className="legal-section">
                            <h2>{t('legal.refund.section4.title')}</h2>
                            <p>{t('legal.refund.section4.desc')}</p>
                            <ul>
                                <li>{t('legal.refund.section4.item1')}</li>
                                <li>{t('legal.refund.section4.item2')}</li>
                                <li>{t('legal.refund.section4.item3')}</li>
                                <li>{t('legal.refund.section4.item4')}</li>
                                <li>{t('legal.refund.section4.item5')}</li>
                                <li>{t('legal.refund.section4.item6')}</li>
                                <li>{t('legal.refund.section4.item7')}</li>
                            </ul>
                        </div>

                        {/* 5. Refund Process */}
                        <div className="legal-section">
                            <h2>{t('legal.refund.section5.title')}</h2>

                            <h3>{t('legal.refund.section5.subtitle1')}</h3>
                            <p>{t('legal.refund.section5.desc1')}</p>
                            <ul>
                                <li>{t('legal.refund.section5.item1')} <strong>{t('legal.refund.section5.emailValue')}</strong></li>
                                <li>{t('legal.refund.section5.item2')}</li>
                                <li>{t('legal.refund.section5.item3')}</li>
                            </ul>

                            <h3>{t('legal.refund.section5.subtitle2')}</h3>
                            <ul>
                                <li><strong>{t('legal.refund.section5.item4')}</strong>：{t('legal.refund.section5.item4Desc')}</li>
                                <li><strong>{t('legal.refund.section5.item5')}</strong>：{t('legal.refund.section5.item5Desc')}</li>
                            </ul>
                            <p>{t('legal.refund.section5.note')}</p>

                            <h3>{t('legal.refund.section5.subtitle3')}</h3>
                            <p>{t('legal.refund.section5.desc3')}</p>
                        </div>

                        {/* 6. Special Cases */}
                        <div className="legal-section">
                            <h2>{t('legal.refund.section6.title')}</h2>

                            <h3>{t('legal.refund.section6.subtitle1')}</h3>
                            <p>{t('legal.refund.section6.desc1')}</p>

                            <h3>{t('legal.refund.section6.subtitle2')}</h3>
                            <p>{t('legal.refund.section6.desc2')}</p>
                        </div>

                        {/* 7. Contact Us */}
                        <div className="legal-section">
                            <h2>{t('legal.refund.section7.title')}</h2>
                            <p>{t('legal.refund.section7.desc')}</p>
                            <ul>
                                <li><strong>{t('legal.refund.section7.companyName')}</strong>：{t('legal.refund.section7.companyNameValue')}</li>
                                <li><strong>{t('legal.refund.section7.email')}</strong>：{t('legal.refund.section7.emailValue')}</li>
                                <li><strong>{t('legal.refund.section7.address')}</strong>：{t('legal.refund.section7.addressValue')}</li>
                                <li><strong>{t('legal.refund.section7.hours')}</strong>：{t('legal.refund.section7.hoursValue')}</li>
                            </ul>
                        </div>

                        {/* 8. Policy Changes */}
                        <div className="legal-section">
                            <h2>{t('legal.refund.section8.title')}</h2>
                            <p>{t('legal.refund.section8.desc')}</p>
                        </div>

                        {/* Related links */}
                        <div className="legal-related">
                            <h3>{t('legal.relatedDocs')}</h3>
                            <div className="legal-links">
                                <Link href="/terms" className="legal-link">{t('legal.terms.title')}</Link>
                                <Link href="/privacy" className="legal-link">{t('legal.privacy.title')}</Link>
                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </>
    )
}
