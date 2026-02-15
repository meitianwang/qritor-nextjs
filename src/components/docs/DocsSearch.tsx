'use client'

import { useState, useEffect, useRef, useCallback, useMemo, type ReactNode } from 'react'
import { useRouter } from 'next/navigation'

// Search texts multilingual
const searchTexts: Record<string, { placeholder: string; noResults: string; shortcut: string }> = {
    zh: { placeholder: '搜索...', noResults: '未找到结果', shortcut: '\u2318K' },
    'zh-TW': { placeholder: '搜尋...', noResults: '未找到結果', shortcut: '\u2318K' },
    en: { placeholder: 'Search...', noResults: 'No results found', shortcut: '\u2318K' },
    de: { placeholder: 'Suchen...', noResults: 'Keine Ergebnisse', shortcut: '\u2318K' },
    fr: { placeholder: 'Rechercher...', noResults: 'Aucun résultat', shortcut: '\u2318K' },
    ja: { placeholder: '検索...', noResults: '結果なし', shortcut: '\u2318K' },
    ko: { placeholder: '검색...', noResults: '결과 없음', shortcut: '\u2318K' },
    es: { placeholder: 'Buscar...', noResults: 'Sin resultados', shortcut: '\u2318K' },
    pt: { placeholder: 'Pesquisar...', noResults: 'Sem resultados', shortcut: '\u2318K' },
    ar: { placeholder: 'بحث...', noResults: 'لا توجد نتائج', shortcut: '\u2318K' },
    ru: { placeholder: 'Поиск...', noResults: 'Нет результатов', shortcut: '\u2318K' },
    hi: { placeholder: 'खोजें...', noResults: 'कोई परिणाम नहीं', shortcut: '\u2318K' }
}

interface SearchItem {
    id: string
    title: string
    path: string
    section: string
    parent?: string
    description: string
    content: string
}

interface FuseMatch {
    key: string
    indices: [number, number][]
}

interface FuseResult {
    item: SearchItem
    matches?: FuseMatch[]
    score?: number
}

/**
 * Highlight matching text
 */
function highlightMatches(text: string, indices: [number, number][]): ReactNode[] | string {
    if (!indices || indices.length === 0) return text

    const result: ReactNode[] = []
    let lastIndex = 0

    // Merge overlapping indices
    const mergedIndices: [number, number][] = []
    indices.forEach(([start, end]) => {
        if (mergedIndices.length === 0 || start > mergedIndices[mergedIndices.length - 1][1] + 1) {
            mergedIndices.push([start, end])
        } else {
            mergedIndices[mergedIndices.length - 1][1] = Math.max(mergedIndices[mergedIndices.length - 1][1], end)
        }
    })

    mergedIndices.forEach(([start, end]) => {
        if (start > lastIndex) {
            result.push(text.slice(lastIndex, start))
        }
        result.push(<mark key={start}>{text.slice(start, end + 1)}</mark>)
        lastIndex = end + 1
    })

    if (lastIndex < text.length) {
        result.push(text.slice(lastIndex))
    }

    return result
}

interface DocsSearchProps {
    currentLang: string
    searchableItems?: SearchItem[]
}

/**
 * Docs search component - uses Fuse.js for fuzzy search
 * Note: searchableItems should be passed from parent or loaded from docsData
 */
function DocsSearch({ currentLang, searchableItems = [] }: DocsSearchProps) {
    const [query, setQuery] = useState('')
    const [results, setResults] = useState<FuseResult[]>([])
    const [isOpen, setIsOpen] = useState(false)
    const [selectedIndex, setSelectedIndex] = useState(0)
    const [fuseInstance, setFuseInstance] = useState<{ search: (q: string) => FuseResult[] } | null>(null)
    const inputRef = useRef<HTMLInputElement>(null)
    const dropdownRef = useRef<HTMLDivElement>(null)
    const router = useRouter()

    const texts = searchTexts[currentLang] || searchTexts.en

    // Dynamically import Fuse.js and create instance
    useEffect(() => {
        if (searchableItems.length === 0) return

        import('fuse.js').then(({ default: Fuse }) => {
            const fuse = new Fuse(searchableItems, {
                keys: [
                    { name: 'title', weight: 0.4 },
                    { name: 'description', weight: 0.3 },
                    { name: 'content', weight: 0.2 },
                    { name: 'section', weight: 0.1 }
                ],
                threshold: 0.4,
                distance: 100,
                includeMatches: true,
                includeScore: true,
                minMatchCharLength: 2,
                ignoreLocation: true
            })
            setFuseInstance(fuse as unknown as { search: (q: string) => FuseResult[] })
        })
    }, [searchableItems])

    // Search
    useEffect(() => {
        if (!query.trim() || !fuseInstance) {
            setResults([])
            return
        }

        const searchResults = fuseInstance.search(query).slice(0, 8) as FuseResult[]
        setResults(searchResults)
        setSelectedIndex(0)
    }, [query, fuseInstance])

    // Keyboard shortcut Cmd/Ctrl + K
    useEffect(() => {
        const handleKeyDown = (e: KeyboardEvent) => {
            if ((e.metaKey || e.ctrlKey) && e.key === 'k') {
                e.preventDefault()
                inputRef.current?.focus()
                setIsOpen(true)
            }
            if (e.key === 'Escape') {
                setIsOpen(false)
                inputRef.current?.blur()
            }
        }
        document.addEventListener('keydown', handleKeyDown)
        return () => document.removeEventListener('keydown', handleKeyDown)
    }, [])

    // Close on outside click
    useEffect(() => {
        const handleClickOutside = (e: MouseEvent) => {
            if (dropdownRef.current && !dropdownRef.current.contains(e.target as Node)) {
                setIsOpen(false)
            }
        }
        document.addEventListener('mousedown', handleClickOutside)
        return () => document.removeEventListener('mousedown', handleClickOutside)
    }, [])

    // Keyboard navigation
    const handleKeyDown = useCallback((e: React.KeyboardEvent) => {
        if (!isOpen || results.length === 0) return

        if (e.key === 'ArrowDown') {
            e.preventDefault()
            setSelectedIndex(prev => (prev + 1) % results.length)
        } else if (e.key === 'ArrowUp') {
            e.preventDefault()
            setSelectedIndex(prev => (prev - 1 + results.length) % results.length)
        } else if (e.key === 'Enter') {
            e.preventDefault()
            const selected = results[selectedIndex]
            if (selected) {
                router.push(selected.item.path)
                setIsOpen(false)
                setQuery('')
            }
        }
    }, [isOpen, results, selectedIndex, router])

    // Select result
    const handleSelect = (result: FuseResult) => {
        router.push(result.item.path)
        setIsOpen(false)
        setQuery('')
    }

    // Get title highlight match
    const getTitleHighlight = (result: FuseResult): ReactNode[] | string => {
        const titleMatch = result.matches?.find(m => m.key === 'title')
        if (titleMatch) {
            return highlightMatches(result.item.title, titleMatch.indices)
        }
        return result.item.title
    }

    return (
        <div className="docs-search" ref={dropdownRef}>
            <svg className="docs-search-icon" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2">
                <circle cx="11" cy="11" r="8"></circle>
                <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
            </svg>
            <input
                ref={inputRef}
                type="text"
                className="docs-search-input"
                placeholder={texts.placeholder}
                value={query}
                onChange={(e) => {
                    setQuery(e.target.value)
                    setIsOpen(true)
                }}
                onFocus={() => setIsOpen(true)}
                onKeyDown={handleKeyDown}
            />
            <span className="docs-search-shortcut">{texts.shortcut}</span>

            {/* Search results dropdown */}
            {isOpen && query.trim() && (
                <div className="docs-search-dropdown">
                    {results.length > 0 ? (
                        results.map((result, index) => (
                            <div
                                key={result.item.path}
                                className={`docs-search-result ${index === selectedIndex ? 'selected' : ''}`}
                                onClick={() => handleSelect(result)}
                                onMouseEnter={() => setSelectedIndex(index)}
                            >
                                <div className="docs-search-result-title">
                                    {getTitleHighlight(result)}
                                </div>
                                <div className="docs-search-result-path">
                                    {result.item.section}
                                    {result.item.parent && ` > ${result.item.parent}`}
                                </div>
                                {result.item.description && (
                                    <div className="docs-search-result-desc">
                                        {result.item.description.slice(0, 80)}
                                        {result.item.description.length > 80 && '...'}
                                    </div>
                                )}
                            </div>
                        ))
                    ) : (
                        <div className="docs-search-no-results">{texts.noResults}</div>
                    )}
                </div>
            )}
        </div>
    )
}

export default DocsSearch
