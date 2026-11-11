Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB32606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 04:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HJhymjTA;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ZeHvJ4qC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Lvre1MX6Fv185E+vol1UoVO9hXcj6H5AcuzmOlcLq2I=; b=HJhymjTAsWKPsczw+RYkKnuO8i
	7OoloaCYvxNXsMGrdjQw7U1y7oVyKt1p0q46O2JRoWwZOXjz0aw8wdPIHHQtlASFrq9BTTUKRawHu
	ALb3OBTaKflxsO0NoDy7i2ru7romajkc6WKkx41JQTb8FOahwYmYMYYjGBMo7tqIVHun9yOFkjZ/i
	4oaZgfMVedHDuNOdmjCg8kINZpRyQU14/wZcHZFgvI0/GMHP/Vm/0mnF5hb/kpYUZ0mMz6aOEmj9g
	vHohcPevH/ZPEtaZaUWWz0f18fII5n5yU77cz9YhglvjVohr5ySOWwTvQiVo+YhbU1bLS+n5xVcpD
	Whlpf3EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR074-00000005czT-1w5b;
	Wed, 11 Nov 2026 04:39:10 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR072-00000005cxu-1o2n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 04:39:09 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48e46e449e8so1844343f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 20:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794371946; x=1794976746; darn=lists.infradead.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lvre1MX6Fv185E+vol1UoVO9hXcj6H5AcuzmOlcLq2I=;
        b=ZeHvJ4qCDpVQSU3II/XbKTegaJVJXlrieG4mb97iHav0IfWo0/5VHjXJCgZ6S//VZr
         G7an+DS/PcPb/h4OyCsnZfpVJ/hrk4C5DV5eIsAbPkUTo+8eRZfDDkEAuHQaEmnZbqRe
         qvoHWDjGyiem2A+lRbNJk/LW9cX9wTVLEd5mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371946; x=1794976746;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lvre1MX6Fv185E+vol1UoVO9hXcj6H5AcuzmOlcLq2I=;
        b=JHRDU1rjJBDB0pF2qfrYlbXnesazLr9A86aDo2XAy9vnrDVoFQBFeWWfq1YCfmwfJ5
         5egRi6qNSYX+sCeY16XENDBYATdBrnl/Et1NXJSZyf/7TWmxuyNqbChyEzAeEl++a7u2
         SHkuAI4xxst0jvO7L/QhO9/AzuJfBTNTWO4mECD4mo+OTlaofWbHK4hpd+3DW32v1NSH
         DQzKdtZBJKACVuRA4GYANHZ+Y4CNkmAqdDnnr3zY59GzmCs3PuKPXOhnii6AUO3T5Q0q
         CNUE8Kk/tYT8w8cmZwfILfIjBSmgYpCw6OwtGl6s6p5y7lTzjnqrM2oC3ByPdyccza0Z
         3qxQ==
X-Forwarded-Encrypted: i=1; AL+hErGvBCeNfozX7OzJy/kn3ulr51sjJPgCVirC5TSBF/lcw0HDa/nnmI4mVOGOoOqyaY7gU6Oj2BQH12ZZYtkukn71@lists.infradead.org
X-Gm-Message-State: APuU4Z+w9PJfD5xnXeqLn564G4r+u7dL35PGp+UZ5uaHlDePDIx7WvKN
	nHLaIUSZzBqLSGrJPSwPAzotUWheB3yUPHJmptP0CE5795Ghgsf5tP31uP9Xz4vxsN0=
X-Gm-Gg: AYBFou311IL8tjpuANcD6QJicPjE8t7HmGhtCLHUJ6Z87KDgK/wOnAPgF5Xbyque+H3
	9s5+TJ96EYGCET/Yn1wzKREjmH9p+biDSGDo9End9jtPAz7xEFAQJvvUz0dEmT2kKLi5R0MGXhX
	kVb6EwWqvQ7+DNSuHWlO2XnuZH/+nL5nW+Fm+XjayPZjf+03ywAZ9y8D5rCViz3+jUJ6I46ZlGO
	Mdxr55E/ubsWfP/w9UiRxOeNMhjzJXfZI4fG5WjTA4oTPVF3o8/HQP2A4suhxUKKjpTPX3zfLqV
	wn9qB/4xxDWSQ88w1/Q/CUNOGdeo4AsMu1UaW9mQ43FM6k6lUtgAT605A2HeBPLxa6eQCIIPtVB
	yFGk+vlhYDqy45KU1iuD3gbMTEuoeD0Qzw0qpzQCbNkt8nMdH6qH5THYLqZRQf7AexL+nxSemZ/
	ipgoR3AUfvwxzKSV3bb0GKhUhgMRMGT9+aJb3Wu1kubb/4yhYN2+n0XKe2ejPJnuAifz9qHJ+aW
	nuLh899PzjxL2d42tEcVGECVLW2ndTRvpm8htiB1x/7MvRA6Dw80qeeDEZK0DHBCk4dFWotbXz7
	i/1iLn5O1B75pWArH3mQIyqEOGAqxcpTUv6S5XMgMWAYXFAwjIYpVejfP7ncqgKxecC4Y8aKSFK
	sFhzKrF2q6O7ea+2ouGczH0cHLUYN545YZDn34LMY7AJ1+3gWiDdvd/rGBHN7qwLfdhTi2/eekd
	g/zB3LfDLNVfOmUXOnjduzfj1WwZ+RN1DhLSQ4vZRE1l6wxfyHu9XB
X-Received: by 2002:a05:600c:4f15:b0:4a2:190f:cf6a with SMTP id 5b1f17b1804b1-4ba093d4aacmr18204945e9.35.1794371945737;
        Tue, 10 Nov 2026 20:39:05 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01ff3428sm124440165e9.15.2026.11.10.20.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:39:05 -0800 (PST)
Date: Tue, 10 Nov 2026 20:39:02 -0800
From: Chris Down <chris@chrisdown.name>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Mark Rutland <mark.rutland@arm.com>,
	Huang Ying <ying.huang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Mike Kravetz <mike.kravetz@oracle.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: [PATCH] arm64: hugetlb: Prevent write fault livelocks on stale TLB
 entries
Message-ID: <avPxZjjdBIlM_8_g@chrisdown.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_203908_535028_A2C7876C 
X-CRM114-Status: GOOD (  18.82  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In Meta production, we have had tasks get stuck in a fault loop while
using hugetlb on arm64. During my investigations I found that affected
tasks share a private hugetlb page.

Looking at the stuck task states, I found the following ordering:

  CPU0                                 CPU1
  ----                                 ----
  read page
  [read only entry cached in TLB]
                                       write page
                                       hugetlb_fault()
                                         hugetlb_wp()
                                         [reuse folio]
                                         set_huge_ptep_maybe_writable()
                                           set_huge_ptep_writable()
                                         [flush local TLB only]

  write page using stale entry
  hugetlb_fault()
    huge_ptep_set_access_flags()
    [entry already writable, no flush]
  retry write using stale entry
  [fault indefinitely. well, that's not ideal!]

The reason is that when a write fault makes a non-contiguous hugetlb
entry writable, it only invalidates the local TLB. However, another CPU
can keep the old read-only entry, so its write will fault even though
the page table already permits it. hugetlb_fault() then finds nothing to
change and leaves the stale entry in place, so the same write keeps
going round in circles.

This is particularly bad because, if the kernel is copying to user
memory, the retry stays inside the kernel and the task can't act on the
pending signal.

It can even remain unkillable while holding locks across the copy,
resulting in further failures. For example, a read into a hugetlb
buffer can hold the pipe mutex and block other users of the pipe until
the loop ends, causing cascading lockups across the machine.

To fix this, when a write fault finds nothing to change in a
non-contiguous hugetlb entry, let's invalidate the local entry.

Fixes: cb1fa2e99955 ("arm64, tlbflush: don't TLBI broadcast if page reused in write fault")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 arch/arm64/mm/hugetlbpage.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 8e799c1fe0aa..ff1f53e435e1 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -429,9 +429,24 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 	VM_WARN_ON(!pte_present(pte));
 	ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);
 
-	if (!pte_cont(pte))
-		return __ptep_set_access_flags_anysz(vma, addr, ptep, pte,
-						     dirty, pgsize);
+	if (!pte_cont(pte)) {
+		if (__ptep_set_access_flags_anysz(vma, addr, ptep, pte,
+						  dirty, pgsize))
+			return 1;
+
+		/*
+		 * Another CPU may have made the entry writable without
+		 * invalidating our stale read-only TLB entry. To avoid
+		 * indefinitely faulting on this entry, flush it.
+		 */
+		if (dirty)
+			__flush_hugetlb_tlb_range(vma, addr, addr + pgsize,
+						  pgsize,
+						  TLBF_NOWALKCACHE |
+						  TLBF_NOBROADCAST |
+						  TLBF_NONOTIFY);
+		return 0;
+	}
 
 	if (!__cont_access_flags_changed(ptep, pte, ncontig))
 		return 0;

base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
-- 
2.54.0


