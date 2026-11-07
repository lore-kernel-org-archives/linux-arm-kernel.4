Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4320E606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 13:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D+oMR3EG;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fAYeZEip
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vHl/pcUk1PujjHCFvfmAUSYKKFrTIfDLlcd8di49U6U=; b=D+oMR3EG2jF3Hn
	xGi7oNPzzlQnI1DaAJdCIiAvIYH4CJmT9f23lKLnYwUd+3nXLIX+J6Y/5MhSYgXt7PeJtCT0c+PMD
	qqzIsdPzzO+JWBSYRInzYPaUfXi8N1uv/Vh6Mc53rrxaHwPglQgxZYGGpdxcj7rJgg9jONqvvPJP2
	zPvQfMiaBOPwu1QVNkGlOwOCAePu9RUpEx6duR7LKM3h5TIXTDf/6CTeWrhTSWsVx07a177tX7jYg
	SyR3nPxScVI7jsuESovFYVsypFRTYhqsKskxKK42PvHRJtvQaIrBUrT2HwP6tKAL/cTZ9l2hMTXgO
	xQFM5+am+L+jlOCKp9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgp0-0000000Elax-4AvP;
	Sat, 07 Nov 2026 13:51:07 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgou-0000000ElWC-3hsM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 13:51:06 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-36ff9c9da34so2076007eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 05:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059460; x=1794664260; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vHl/pcUk1PujjHCFvfmAUSYKKFrTIfDLlcd8di49U6U=;
        b=fAYeZEipuwDGyhGo81G+GLV294R+ewtZ0RUDaLki9IN1R9j54zEJAeirmX8gk4JZ7i
         Gv1JzOwcRosEGrp8NO3VbgoOTyAOOKG2apvvpZBGw5U57kGgypAwGLNiZ0PV/6GKy/yf
         tJUmRh10bBL9Bq5efEz+kMIXPj1IXIsq4yQA/gAkhhhvDXed8/voU1rN48h3xCs4O3pz
         kY5B/qDNpbM0uc2FUS1wYyMGvIXyDA4orlqIDvYJG7R5uVaWtG2AZ6z89xrUU/RLhAOM
         TW1oWbu3E7Pgf5uBSamfL2FNJS1B2Z+hnksHKR93fa07FBp1hzr1+Q52fY38MqDvDViO
         Ig8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059460; x=1794664260;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHl/pcUk1PujjHCFvfmAUSYKKFrTIfDLlcd8di49U6U=;
        b=tviphNff2f+wOY6MIivjIxYYDM4EU2OEeme9Z9S+xeEuBIOzpZZoFkbQNOu5xPnFt5
         /g7uitoTj4U/M1+D864OIgJ+RUzk6pfRfuLmqXcpb//iuyBkuhoFjfHq2rE+YZSYI2yk
         z/+WqFuuQCPkSV9KWarnlKXvq7yS+I8QLWTA5UmmBtTvVhgmKaGePK+YDegvac2p2RKF
         YsD4/qLwTxar6Nda6BK8QKVfquCFwwYErG9B2ZxZaAcODn+XvpibiUjblKGkA5DO9so9
         ZPSYN8Nqxxl1B8sKF/29l0g7uqUi1VEc+5qiu7O0sqRODeN0BYNT7LWKgYdrDd/sFMMD
         KkuQ==
X-Forwarded-Encrypted: i=1; AL+hErHa6pAXvK6WQ1+KLadGip+lQKHMimAsni7qJVr8zL4N9iJJckJEOF5TFco7xid9mPd8EfxHYoay7ODFBoqqMkGF@lists.infradead.org
X-Gm-Message-State: APuU4Z8ZKqUPCYisVod8c1RLMeq6nMXvSVSj1vFodpOXoMXmpIirbLQ8
	OycpXyDvtbGx/V/zRF13yblhZKr9GqDW3YHeZL3NNlp8XX2C5TIkcxuZ
X-Gm-Gg: AYBFou0xvxkLiZC4fUgo86JJpGsjPJL146sJ4MpZB2AsaJJERBWpvLVqJDy9vWOgDnx
	jd+hMy7uWszC0ZEosyLmqBCPGG7I0QHOA100C0K2zRo37G7S/bqQHuzL8clBuOc380+aFSkPNhk
	GMtMnwuMY95VtaPAwtM/XkBD0DNZwdQPjTFYI7OpzFnjHuqnm/aAwXvxv+5MROejJxRJdNWnN2S
	87RRskaxLpMyCkX0q38vjdzd+XYh8sZSe260OnvUutmgcMxn6/JHy3SS/lGL4nRR0f9JGIFk80O
	BzV1KnW9nrF+tFOrBOFvJWSMAwnmUpTpQcrSoPoiW+IfAmDr4pwwXzbc06tBH+s13zUNO03/6xB
	zyINWGtYcEDAvgai854GCFmH8qKNC3L2CVXqCL3oP8f+RiE5/+6tPunnYiQEZhJNLhlvKqt+6vD
	mP0i7D/cY1QJbzP3289qEOFkMTr4oERaYO9W6Aj9aGbaixCBD/KjVinzxHqMWMTZVjsHXzl1EK7
	ua0wkBtoET+hlDKLwB25f0oDfXsNezajXsWVVOnxvWcqZjB1hEmG8h3p1pkD23hfur7xS99dMUM
	DNYpCyJE95gLf486PBdcWD2shvYoqJON0dHXzQOrOrTzyWDQNSfJ41GC0Q==
X-Received: by 2002:a05:7301:6285:b0:35c:85fa:5a61 with SMTP id 5a478bee46e88-36f76f0e752mr7696943eec.38.1794059459921;
        Sat, 07 Nov 2026 05:50:59 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm21280820eec.10.2026.11.07.05.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:50:59 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	urezki@gmail.com,
	linux-mm@kvack.org
Cc: baohua@kernel.org,
	dev.jain@arm.com,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	david@kernel.org,
	rppt@kernel.org,
	leo.yan@arm.com,
	xueyuan.chen21@gmail.com,
	chleroy@kernel.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	ajd@linux.ibm.com,
	jiangwen6@xiaomi.com,
	jiangwenxiaomi@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 09/10] mm/vmalloc: map contiguous pages in batches for vmap() if possible
Date: Sat,  7 Nov 2026 21:49:52 +0800
Message-Id: <20261107134953.748622-10-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_055100_969601_BB2F0FC4 
X-CRM114-Status: GOOD (  20.19  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

In many cases, the pages passed to vmap() may include high-order
pages. For example, the systemheap often allocates pages in descending
order: order 8, then 4, then 0. Currently, vmap() iterates over every
page individually—even pages inside a high-order block are handled
one by one.

This patch detects physically contiguous pages (regardless of whether
they are compound or non-compound) by scanning with
num_pages_contiguous(), and maps them as a single contiguous block
whenever possible. The mapping order is determined by taking the
minimum of the contiguous page count and the pfn alignment, allowing
graceful degradation when pfn alignment is less than the contiguous
range.

Pages with the same page_shift are coalesced and mapped via
vmap_pages_range_noflush_walk() to avoid page table rewalk.

As users typically allocate memory in descending orders (e.g.
8 → 4 → 0), once an order-0 page is encountered, we stop scanning
for contiguous pages since subsequent pages are likely order-0 as well.

With large mappings, vmap_try_huge_pmd() may free an empty PTE table
left behind by an earlier vunmap() and install a PMD while vread_iter()
walks the same range without the mmap lock. Set VM_UNINITIALIZED on the
area until the mapping is complete, as __vmalloc_node_range_noprof()
already does, so that vread_iter() skips it.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Co-developed-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 85 insertions(+), 3 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 884e178405171..5b898da0826ad 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3617,6 +3617,85 @@ static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
 	return arch_vmap_pte_supported_shift(size);
 }
 
+static inline int get_vmap_mapping_order(struct page **pages,
+		pgprot_t prot, unsigned int nr_pages)
+{
+	unsigned long pfn;
+	unsigned int nr_contig;
+	int order;
+
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
+		return 0;
+
+	/* Limit nr_pages by pfn alignment */
+	pfn = page_to_pfn(*pages);
+	if (pfn > 0)
+		nr_pages = min_t(size_t, nr_pages, 1UL << __ffs(pfn));
+
+	nr_contig = num_pages_contiguous(pages, nr_pages);
+	if (nr_contig < 2)
+		return 0;
+
+	order = ilog2(nr_contig);
+
+	if (vm_shift(prot, PAGE_SIZE << order) == PAGE_SHIFT)
+		return 0;
+
+	return order;
+}
+
+static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages)
+{
+	const unsigned int nr_pages = (end - addr) >> PAGE_SHIFT;
+	unsigned int prev_shift = 0, batch_idx = 0;
+	unsigned long batch_start = addr, batch_end = addr;
+	int err;
+
+	err = kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
+					     PAGE_SHIFT, GFP_KERNEL);
+
+	if (err)
+		goto out;
+
+	for (unsigned int i = 0; i < nr_pages; ) {
+		unsigned int shift = PAGE_SHIFT +
+			get_vmap_mapping_order(pages + i, prot, nr_pages - i);
+
+		if (!i)
+			prev_shift = shift;
+
+		if (shift != prev_shift) {
+			err = vmap_pages_range_noflush_walk(batch_start, batch_end,
+					prot, pages + batch_idx, prev_shift);
+			if (err)
+				goto out;
+			prev_shift = shift;
+			batch_start = batch_end;
+			batch_idx = i;
+		}
+
+		/*
+		 * Once we fail to batch pages, we expect to fail batching
+		 * for all remaining pages, so just give up.
+		 */
+		if (shift == PAGE_SHIFT)
+			break;
+
+		batch_end += 1UL << shift;
+		i += 1U << (shift - PAGE_SHIFT);
+	}
+
+	/* Remaining */
+	if (batch_start < end)
+		err = vmap_pages_range_noflush_walk(batch_start, end, prot,
+				pages + batch_idx, prev_shift);
+
+out:
+	flush_cache_vmap(addr, end);
+	return err;
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3655,13 +3734,13 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	size = (unsigned long)count << PAGE_SHIFT;
-	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
+	area = get_vm_area_caller(size, flags | VM_UNINITIALIZED,
+				  __builtin_return_address(0));
 	if (!area)
 		return NULL;
 
 	addr = (unsigned long)area->addr;
-	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
-				pages, PAGE_SHIFT) < 0) {
+	if (vmap_pages_range_batched(addr, addr + size, pgprot_nx(prot), pages) < 0) {
 		vunmap(area->addr);
 		return NULL;
 	}
@@ -3670,6 +3749,9 @@ void *vmap(struct page **pages, unsigned int count,
 		area->pages = pages;
 		area->nr_pages = count;
 	}
+
+	clear_vm_uninitialized_flag(area);
+
 	return area->addr;
 }
 EXPORT_SYMBOL(vmap);
-- 
2.34.1


