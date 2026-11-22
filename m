Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F033606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jNivtqlc;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nwJLc0ym
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bXQPSKJVaqWfQL317csB6FAtCBOwMGNwoZ92NFySUdo=; b=jNivtqlcFsAohqmgVMIrBELJDS
	FOE0fyZ4CguImV0NhlH3y+LT65Y0tNCyaFzqmoppjHMlBbVg1mW2J2CIxbD062QzlMmwOlwjqOHep
	kIzMDdrp6PDTbs3W2omXlOetvECv2z2SPV3unR9pgUTDSjtJFQs800OL6l9jWZw6dCl2Qnjs0yS97
	ggNV9t6r3vWzj+6+3BWxkg5O5hFiQk0f2dvNaYxfUBwOUGxMyx16MCqSYJK/lJMNKJNSzj40d9RYM
	2Seqx44bD6RV9tT1+iDzz9QVdNwjef+aqNXfRFA7wAFlSgyf7cW9zqm68ur9Nf/eyrEPyjhQ8B9X/
	IPKyTzhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCZ0-00000001Ya0-0JQM;
	Sun, 22 Nov 2026 18:45:22 +0000
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYl-00000001YQ6-1rOE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:45:09 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cdb8e8bccdeso1213638a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373106; x=1795977906; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXQPSKJVaqWfQL317csB6FAtCBOwMGNwoZ92NFySUdo=;
        b=nwJLc0ym90LHxHS1st2IpkCWFcko1lp8vYiLZu3AHEdYkhLX8SBN28pkxDyNUO/Mpo
         zaLL1yCT0Mo+wUVz3Qnqj7UB4JtqcgtqUzigUMOIoeOfQ86ss/5sRKByyiuTXohMZel7
         6p+jWSK8dHcAQHpqyPVTGmQuQakX5RcossTgM1IxdmN65WTrfkzDGjdp7xV0bCt/5VJ5
         dHcago/HcfUevlfsfuRRuwm8h1+mshngGaUHZ73ajtrpLgE/1HL0508sJRG+3JM93bCD
         RcDARRYdETW0F2d0i5NHWLRua67Lj8CwUyKTsUaWh4BA6TbTgUIm7dHZiaDCCsBSlUYj
         gJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373106; x=1795977906;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bXQPSKJVaqWfQL317csB6FAtCBOwMGNwoZ92NFySUdo=;
        b=JkKjjRIJo7KZkyB6tV/9KRM05q/KpMHhehoCU+jdHxwtfnG0SPzod4mbenaKD3AcMh
         zr8vGijkPVQGg9fqI5oQ2Z2KonkbA0CEdwrLLcWAmGCT6DTRk1fmCRPV9nJFnuN/F1av
         pHCWkYylmT75K9iRRrjsWOD99qzJUrfPqEg/2r+NLFAUi6dCxhjLwtizEqIb3gwlkf/B
         qGUoJ70eZ30h+AMVoygGEzQPWByiGMriWyiT/n2X/hry8iS5MykkDNN7BMiJAHAsI97C
         fKYTrzmGf34nTZvTx+SgWJLTm0Au6DwirL2JGooPhSHEr12GbD6dw1MyouJFq3mBE9QI
         quHw==
X-Forwarded-Encrypted: i=1; AL+hErEJCFmr7t6pZmCqux2oHzSJdJy/MwDRh6qFlZX6Vz+yMnF8DJll7VQqVuIrdmRXu2svY14aRXgGtWjC0flAVL5w@lists.infradead.org
X-Gm-Message-State: APuU4Z91MpoNrltArrQhlspZLQkGsiYb4NZcCfi6GM3oMiH2mwBIg5z6
	z4K9cwae4WBWRAhEtdaymdrr2AD3vbZBkYaC9l6p9aVvYJ1ekGsUkyfp9uISB6ddHSyusFgj3ls
	kstK68QKT1/JTxg3kWcoa3A==
X-Received: from pgjg24-n1.prod.google.com ([2002:a05:6a02:8158:10b0:cd8:b29d:d82a])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:4eb2:b0:3e8:b7fd:6280 with SMTP id adf61e73a8af0-4014d85fbbbmr9915990637.27.1795373105686;
 Sun, 22 Nov 2026 10:45:05 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:40 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-7-jthoughton@google.com>
Subject: [PATCH v3 06/19] hugetlb: Optimize bootmem folios that were not pre-HVOed
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
X-CRM114-CacheID: sfid-20261122_104507_491607_074F683C 
X-CRM114-Status: GOOD (  12.78  )
X-Spam-Score: -9.5 (---------)
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

Boot-time gigantic folios are expected to be pre-HVOed through the
section-based vmemmap optimization, so the bulk optimization pass for
bootmem folios was dropped.

However, arch_support_vmemmap_remap() may not yet
return true when bootmem folios are allocated (e.g. on arm64, where
support depends on a system-wide CPU capability), while it does return
true by the time the bootmem folios are gathered. Such architectures
disable the section-based vmemmap optimization in their vmemmap
population path (see section_vmemmap_optimization_disable()), so the
folios are not pre-HVOed and would never be optimized.

Optimize such folios when gathering bootmem folios. Their tail struct
pages have all been initialized by memmap_init_compound_page(),
as they were not pre-HVOed. Pre-HVOed folios are skipped by
vmemmap_should_optimize_folio().

Signed-off-by: James Houghton <jthoughton@google.com>
---
 mm/hugetlb.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 72839e98f998..8756c0206922 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3325,6 +3325,17 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 	unsigned long flags;
 	struct folio *folio, *tmp_f;
 
+	/*
+	 * Bootmem folios are normally pre-HVOed through the section-based
+	 * vmemmap optimization. However, an architecture that can only
+	 * determine whether it supports HVO after bootmem allocation disables
+	 * the section-based optimization (see
+	 * section_vmemmap_optimization_disable()), in which case the folios
+	 * were not pre-HVOed and must be optimized now. Pre-HVOed folios are
+	 * skipped.
+	 */
+	hugetlb_vmemmap_optimize_folios(h, folio_list);
+
 	list_for_each_entry_safe(folio, tmp_f, folio_list, lru) {
 		/* Subdivide locks to achieve better parallel performance */
 		spin_lock_irqsave(&hugetlb_lock, flags);
-- 
2.56.1.809.ga0b61035b5-goog


