Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B917C606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0NwMoj0j;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=kE0NNMqZ;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SMOC7uB3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=u826aq6QgFuLwy4ZUNvGuXRkf41ETeakzXxIgVKKh+Q=; b=0NwMoj0jKNUaGAEN3PpKLAyVfl
	YlUjs24Jx/QBk0pOd/uGmWQ+0X1v1ZIbGjJw0+r4ROEuyPmMNI85zpw8XaGeMgEWn3h+6V8dDgnWT
	wJZtMmgTsBpxEpydYPT6NORpRRAw9MJsZ2dr4evp1XlZKkd5IfZKBX214gsiKqQ1zDeA9BzWSSNNC
	/+8jcyKySrZJpHezB3n6lGFlXpKGkk9ykvZpvGmTz9ZiAvvUTrL6gNDYA50axDP9Gnmb72VtccUUr
	Q/2UGerZlj9JGl8dFbQUzsdx+dkPsD4JBQMrwswCvMfpX4g3rVeDX1ICt08hZSV7LWcT+tUAGD4X6
	//dgc2aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYi-00000001YOc-22ae;
	Sun, 22 Nov 2026 18:45:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYg-00000001YNd-2eb1
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 22 Nov 2026 18:45:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=u826aq6QgFuLwy4ZUNvGuXRkf41ETeakzXxIgVKKh+Q=; b=kE0NNMqZwh40SwaGppG6A2WyNM
	W5W7Tv34jdP21Jo+8NhNwmZG4RiIAh+3UeIOnve2DBZIBXwCnsqoL4ovQ1ftPg/ueom4toelm/dbT
	hoz4THQlISAfRCi6JWGDdP44oAdkeyV5ediWJXj6o0XXEDKPK5XD56VdW2aE03UyxAkgEKlFuq7bm
	1p09cCiiX6Icl+u8rNt8MPe3tkCvMUtT0fLalQpkeRbXH+0UVuZskOp9oND/C5xFR9a+UwkjaaakK
	Qr5zwNI9XRpoomI2vxkwCgtd2lqxGvi6VzENlDYd2eoQoKLSViYsk/JAJuZbB0fWmuWheI5leU1i+
	KD84Jfkg==;
Received: from mail-pj1-x1046.google.com ([2607:f8b0:4864:20::1046])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYe-00000002R9T-09st
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:45:01 +0000
Received: by mail-pj1-x1046.google.com with SMTP id 98e67ed59e1d1-3b42c3dba96so2996134a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373097; x=1795977897; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u826aq6QgFuLwy4ZUNvGuXRkf41ETeakzXxIgVKKh+Q=;
        b=SMOC7uB39eJ6AigfZQaOhzxG2gL5udpWylF6GnDpB8tojYZpkNm68/MTTtT7HyAxoy
         UwmO63CKQbBjDExvRi4CaMTxe6yqu6Qx9R0gOqpLGon5VIgEDKoMta6rklgphYSEqwTw
         /kmuAet2QOhyW4t9Yf/GoqXhNPsdsxUER+ISI/xAmpX6LQP0LSxejqRi8R1omVA1ZnPA
         Qj8oyg2BtoEKkVNdIO515mJ+cVH5a+VeT6rmeVASr9E94QFeWupEjzG9OF8LIm1J1scA
         PvPIBqcZL48y5ped6ZLXAThs1eRWQqmSU3r3VTWX0kk/tBp4r+/qfxX1XK1VAyoYTkjk
         ReSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373097; x=1795977897;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u826aq6QgFuLwy4ZUNvGuXRkf41ETeakzXxIgVKKh+Q=;
        b=kwgVcTI1SBwllS5m43tuZRTzLp1lfC0l1Gctk/tva/lSc899rAdR+tPpMIQEMk/H+j
         C2VPRpRZ9X1tizlccn9US/0ara53mGeMglV+VVrJ+BLewHIRxXuary9JLkYRuV9geqiZ
         hQ41MLfNBKDXD3goltEGYF8FpA5S4J9jLs8DSi6KhwU3lhe9gIbo1Vq/FXx0BtW1AA9u
         BhBePbQ9wJWy1KBeSrkKbdKte+ptSeErIjfkOOf5OWmdM9FZh5/rIYkumUbkXNOMxLuo
         8qVXQB1vU1W/TLtu/X/vLZj25nAtRm7KNYgJ4qtPeLsR4KBfbY1VEB9I1iuUyM7CeRRJ
         w8xw==
X-Forwarded-Encrypted: i=1; AL+hErEZFrsuOFmx1d14k1w0mXkD4T4JjpKKa4nCSXsPCpXarnZ/rCdqoSNbqMFKdqBAI7lCa3H4Qgb6IoZJyEo1o354@lists.infradead.org
X-Gm-Message-State: APuU4Z/gkFQVqdnmkRG/khtU+WK5S+Royd1JZRkA0x/rq5Cx5sccKwkn
	HlGwO4bhtzBo68FHKT2M2HFyYI17QNnI9VSI22FwUJymsGNardKg+t6bG23VcBq0VP8sjxBxHJe
	RnjRcGT67VDpbRsU33Az03w==
X-Received: from pjrn1.prod.google.com ([2002:a17:90a:b801:b0:3ac:3bb4:e960])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3f43:b0:3b4:1621:ba74 with SMTP id 98e67ed59e1d1-3b41c8fe3a5mr9462380a91.17.1795373096769;
 Sun, 22 Nov 2026 10:44:56 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:35 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-2-jthoughton@google.com>
Subject: [PATCH v3 01/19] arm64/pgtable: Clear AF with LDCLR on supported systems
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Nikos Nikoleris <nikos.nikoleris@arm.com>, 
	Linu Cherian <linu.cherian@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	David Hildenbrand <david@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_184500_045285_2997BD45 
X-CRM114-Status: GOOD (  12.93  )
X-Spam-Score: -7.6 (-------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace the cmpxchg loop with atomic64_fetch_andnot_relaxed, which, on
systems with LSE atomics, should end up as LDCLR.

This is somewhat overdue. In recent versions of the architecture, if a
system supports FEAT_LSE, forward progress guarantees for exclusive
monitors and cmpxchg loops are relaxed.

Mechanically, I would love to write test_and_clear_bit_relaxed(), but no
such function exists (test_and_clear_bit() has full ordering, which is
also undesirable). Implementing test_and_clear_bit_relaxed() properly is
a pretty large change; use atomic64 instead, as pte_t contains a u64.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/pgtable.h | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index ce51c1b9be22..4285b7e7a6a7 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1252,17 +1252,11 @@ static inline void __pte_clear(struct mm_struct *mm,
 static inline bool __ptep_test_and_clear_young(struct vm_area_struct *vma,
 		unsigned long address, pte_t *ptep)
 {
-	pte_t old_pte, pte;
+	atomic64_t *pteval = (atomic64_t *)&pte_val(*ptep);
+	s64 af_mask = PTE_AF;
 
-	pte = __ptep_get(ptep);
-	do {
-		old_pte = pte;
-		pte = pte_mkold(pte);
-		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep),
-					       pte_val(old_pte), pte_val(pte));
-	} while (pte_val(pte) != pte_val(old_pte));
-
-	return pte_young(pte);
+	/* Atomically clear PTE_AF, checking that it was set before. */
+	return af_mask & atomic64_fetch_andnot_relaxed(af_mask, pteval);
 }
 
 static inline bool __ptep_clear_flush_young(struct vm_area_struct *vma,
-- 
2.56.1.809.ga0b61035b5-goog


