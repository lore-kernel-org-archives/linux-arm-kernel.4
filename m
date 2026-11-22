Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DFE606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 18:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HutoXTzC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=k0dJ+WCu;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZeigknWP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a/BzRua6E4eXmgBBVosYCcmxsDMlITpi7UmbKmFzU4U=; b=HutoXTzCDm1aNtlG6Z7Q2zlELQ
	prdMrJP7CgD0yb3nyc/4Rk8RhvzPUXKAS8bX/g8/pxRlMKju1+KoTU2jDHrOgHeofep+QL6dXWP9y
	PiJvQsvA83+dalXhRq3oGOigvlJ+Oqam40I6DRin2iSZ9nnZOi8zMHXJiB0Zq1Iyx0fanXjgv0E7K
	rFSIbBa/+lxR6AUW1p2TqQiCzYXtK7nWPYdS+OADsUTZOxOv/24lt/9P0FFtNy+W2ocnODD4mw9B/
	uDUm/BMSEkVx5InV9E9Xle/XUgcsz/z5n9JtUFAigl6a1VjpDjDfOG915hwXIV1GC0fCamcbzvKvQ
	93HvONWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYw-00000001YXI-3JOc;
	Sun, 22 Nov 2026 18:45:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYi-00000001YOO-2GlF
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 22 Nov 2026 18:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=a/BzRua6E4eXmgBBVosYCcmxsDMlITpi7UmbKmFzU4U=; b=k0dJ+WCuzZA0V9mpmZ0P1xWpnF
	1HUD//k+8HK0e54YKCnrF4aFLFjPLwdpXSR8T2/tF90Kjzw0VmULGO7Emn3f97AepKqHMbNkHCS5D
	vM+UfaGa0XmCtetc+Tss0DlkoSKVR2R37Y28dPjmioF60obyZKs5a3flpfS7pRAt6Z9A8trEC1lF3
	B2Xq2+SaoVtkDKy5kp7ow1LD+2Y8FM1AXm04PRTSp15N5l8Pg1go3SB36p9Daxf0btYcgycgCLCRt
	L8zCRC4n8xvyaY35r7LnVChQiAkTEO6N0CPQLu5Flb2+UyqY7Uk8X9jM3JBmJDow2tLIl+WQqwMSJ
	xx/obuAg==;
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVCYf-00000002R9l-4AJM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 18:45:03 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-3b42ebf632cso1649418a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 10:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795373098; x=1795977898; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/BzRua6E4eXmgBBVosYCcmxsDMlITpi7UmbKmFzU4U=;
        b=ZeigknWPa5TCkhNDE7jNtkjgm/WZRwdUrzmFjC6ZOCSAvEVAs8ylOXDutoS4aVlG8H
         Mt3cveJDDT4NJsLYjCwUTbs8cZDlTJdzMdP6mrsuxLOh6pqfHOZbw5K9cRfq2wDyYX4k
         Q2zAa3+mlXz+u1Xg0EicjengBt7iIrduR3xYfoo/GxYSPd7vM4FxB+poXpyuNFhYAuKD
         5D89PGWkHszd9Mvo4wnRDEiCrWHp5Ym8mkwSBNhbs+XLgU1a2OP7NxjrFukowCHJj+xp
         W4hpLgaZW6ex2pI/MuTg09g2ilCYJElAGa5i+IsEDcvfDy0QaVwqXjm0QkJTUgAWIGk1
         P2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373098; x=1795977898;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/BzRua6E4eXmgBBVosYCcmxsDMlITpi7UmbKmFzU4U=;
        b=xe7Am3n4TB21nDU4gm691E7V3zQklL2QrfRDHrnmwWqfd3po/0ArLDBnYhlNpE+HAR
         69zwwnQsdZ/96r571hi1azqW9wd9ZWt8UDZqq2EDUyecRdeOVG9TlbGiRv9J2Ot9aAUP
         3LLlswm9bpUCRZb44W7BrZv6/6c1i0v5mxr0tOx3kUP/6UzCTYC7Q29ZBGD1bndmZzuh
         3G0DkgKnRicXiFsXoF/9n0VGpFjOdhEW9ylaRRpl53YzR9gXtW7h5G451kiwbIbBrQ9D
         82hKH7Sk712Ik00lq2nV4LsexWKmjFCkxO4qN4GgaWgg/osaWQBOBo1LH2PWS7mbFl/h
         3nrw==
X-Forwarded-Encrypted: i=1; AL+hErFLg7qgK1CH1Uqa+bqDvcdAW/y1ZVidVjycFC3JBRlAX+IijIy2HbuGkE2GFDmY4g0MsJR9UwKryqE9BYHxDY8/@lists.infradead.org
X-Gm-Message-State: APuU4Z87/Cs8YU++g+u6e3FYflxjhDRLiOMVYFRknxo2D4OLzt/WTcEt
	mah1ckr4Xk/uh3IGHubGhnEvmEAWFXc67kh0vFM8+XqVfC5Rp+HTjADyzM8aOJjMQff5FmMd2cH
	a/f2KGWiCNRegjg0EhQh9hw==
X-Received: from pjbgm11.prod.google.com ([2002:a17:90b:100b:b0:3b4:3d61:7517])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4b:b0:3ac:d39d:ee4f with SMTP id 98e67ed59e1d1-3b41caecd51mr6521075a91.44.1795373098233;
 Sun, 22 Nov 2026 10:44:58 -0800 (PST)
Date: Sun, 22 Nov 2026 18:44:36 +0000
In-Reply-To: <20261122184453.2668189-1-jthoughton@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261122184453.2668189-3-jthoughton@google.com>
Subject: [PATCH v3 02/19] hugetlb_vmemmap: Always flush TLB if needed upon PTE remapping
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
X-CRM114-CacheID: sfid-20261122_184502_029285_1B689A27 
X-CRM114-Status: GOOD (  11.87  )
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

vmemmap_remap_range() can potentially leave the vmemmap in a partially
optimized state. In this case, a TLB flush should be done if the walk
caller asked for it, even if the optimization was not fully applied.

A follow-up patch will more completely deal with partially-optimized
folios.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 mm/hugetlb_vmemmap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 09b9fd83c198..7be08c68c2f1 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -163,13 +163,11 @@ static int vmemmap_remap_range(unsigned long start, unsigned long end,
 
 	ret = walk_kernel_page_table_range_lockless(start, end, &vmemmap_remap_ops,
 						    NULL, walk);
-	if (ret)
-		return ret;
 
 	if (walk->remap_pte && !(walk->flags & VMEMMAP_DEFER_TLB_FLUSH))
 		flush_tlb_kernel_range(start, end);
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.56.1.809.ga0b61035b5-goog


