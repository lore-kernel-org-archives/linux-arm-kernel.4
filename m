Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B63606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 13:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zw8II4o0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cbYPOLeI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=juq+pi4pblAMzdsctIP8tsm6etRIcSlR/IjeGEKfwmM=; b=Zw8II4o0drVlEZ
	HXHyt6CgbiaU2cZK6BH7VQ/ZFmzwL4ttyRfU8cklZIn1z1Mn/XW5Rm4ZS4FpNJOTynFu6+enW8MB7
	Z/XohDH1tgwtiQBYhVgW4/tdemQMEIZeoxdnOnRDiKqrM69+8b09JQ5Yq6AyYpUvN6uv0kXgrczzI
	XUZQ3hsKsegFVCDS4isrXsocDudQFIownCKV0pQR6X3t3gWPFDvbN/rqXn4ZK8pUL0ToQ4/ISNk4i
	7R51lvnP1yn9vIOt63C5x+9McwDFaxxO36hTeNj2afr0GKSxyXkZDoBA+u5P1xZLWmTa9XeJ89Hrg
	lV+7NqSuv9mdtXUGHHZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgoe-0000000ElJj-1vnc;
	Sat, 07 Nov 2026 13:50:44 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgob-0000000ElHQ-3TZz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 13:50:43 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-3704d30b84fso1210867eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 05:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059441; x=1794664241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=juq+pi4pblAMzdsctIP8tsm6etRIcSlR/IjeGEKfwmM=;
        b=cbYPOLeIfNgVE1BF4Z3uz3ZH9AGIdRAOxzciGLHHUH0P0wswSWhFa+6MAbkaP+2mtq
         08wlcKD+KbvXfFv42JksixFVpK0NY33ZSphXOugESbmrLVa2vlLnaMym41OgsjVgQtih
         b/08aVviX8Wig222B+MopEcCDpRp9eUJ1v6+pAad1JfOdPmBMUTJ7o7CcHlBI2bNKk54
         sH/mxuxbQu0oTQvfjvn9KirnCXWs5b9f3Pt9B9YZYPtMuecf0k1syPUA2qgFqgAiX3tk
         UGvHf96qJcCUM9znkTeM9J3JiNapxVZu2jboLUhxIaYHslmSELUGMjCAkuUsgTxfKdcZ
         lBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059441; x=1794664241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=juq+pi4pblAMzdsctIP8tsm6etRIcSlR/IjeGEKfwmM=;
        b=eDWNWhS0AJOuajaPzA0VQtEkk24lQVRqOxpVmeYzRtDs2mA/EcE9+ywYyyv2ej0S5O
         68dY6Pld93kUfIMKHazAwu2azmbr3iVEMy+ECsBpdUVGC0xQH6YQLU0qtY25sSFHGU5Y
         fVsjDHbKItHLVPYfBa7AGujTFdM2zziXMi7c0oofqgd3K02yOnSLfHwctiUd4EySSCr5
         yZxVmUMmQoeDEfKq7ZUGuMpdVfctFI4Ux/WDESafTNxa8nf8Aca2hwFi7sm9fnpj4sea
         HWshVzBVr12h+DU4GUJ17RWQcWTogBfrzyBoRI6ICGFtXfVwkVjb3XL2Qwq9SeXO0uH9
         /r/g==
X-Forwarded-Encrypted: i=1; AL+hErE4DthDi8z+KWqQdFLL7p+QrTekbaQZ0oGGNe/dXzjx0IyKk9D2v/U24iiNh7UsW11lIa42dbiiOYRHsT92aBCs@lists.infradead.org
X-Gm-Message-State: APuU4Z9ryE8RIcey7NDGFl5ttnsQvW3Jhz3MIQqHMuK5JeV+ga36wMTZ
	urhi6E2y8HBVLZmThAXzDPh+JayX+fFC8T9oKDgSSA3k0k8HxWSIbhMo
X-Gm-Gg: AYBFou0V/Frur+4wJ3CUyg2pFcfodT7CKI3qu4qa8f5vLomSlFf3upEbOdsyTIx0vxR
	26QgpAPYGvKfkXrLkq9hfr6T9Hx8m+vvgXozQ9+II6Z2wPW45iz0RYPkidG3S+zq+v9JuDAQd22
	Dq4xpq+U1TUJYOtr0Uk99NvO0aL6ZytN5P7sJkkHr4uWy5IqsIgdZOsitfHyCRmKm6H7h6Qc9RS
	72NgtVBIxvJMQM5+1wDvOoVgnBY+0x2922D7T8AmAAyg/BsauX2/Qvyi33mqplGrELXQ75WGT5h
	hcPX+F4D7DWfM62T4TkZIeWlSGAxFoqBztOvTnTBFlp2THWUMVpnhi8e0WD7Wl0yU3DNYrdROAw
	qOB/LWQxBQeRt6amHHC5TaoW2xu+rBMKWFoH8NTSSarwPrEz57Jk8oRmKMxDLUVKlE2/PN3pEqt
	IDD2DW4N4bcgWnSHZMhk5iCLXqsbbvKpRk7Ya8SSmt8msIBR82TShHU8ueKtAlWvXxGfLHhotmT
	5y5Yr7KGh6NSjeeReTZiDvefgVDPsBgCdcRrqyPHjSqqI5QhyejPvn25C4t53iK2ypRFhRPw5Lk
	zZo5SrRX6FDbxcGycCZYKWj06Xe5tC1Cf8lLZ6qG1L1TIv89gMJ9YRA6rg==
X-Received: by 2002:a05:7301:fc02:b0:36a:1788:3d1c with SMTP id 5a478bee46e88-36f761249e4mr8433809eec.34.1794059440743;
        Sat, 07 Nov 2026 05:50:40 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm21280820eec.10.2026.11.07.05.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:50:40 -0800 (PST)
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
Subject: [PATCH v12 06/10] mm/vmalloc: extract vmap_set_ptes() to consolidate PTE mapping logic
Date: Sat,  7 Nov 2026 21:49:49 +0800
Message-Id: <20261107134953.748622-7-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_055041_884238_B639600A 
X-CRM114-Status: GOOD (  13.02  )
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

From: Wen Jiang <jiangwen6@xiaomi.com>

Extract the common PTE mapping logic from vmap_pte_range() into a
shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
PTE mappings in a single function, preparing for the next patch which
will extend vmap_pages_pte_range() to also use this helper.

No functional change.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 mm/vmalloc.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index df37c8490ae7e..e3ea9581e68d0 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -92,6 +92,29 @@ struct vfree_deferred {
 static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);
 
 /*** Page table manipulation functions ***/
+
+/*
+ * Try contiguous mappings at the PTE level for arches which support them, and if
+ * requested by the caller. Fall back to PAGE_SIZE mappings otherwise.
+ *
+ * Return: mapping size.
+ */
+static __always_inline unsigned long vmap_set_ptes(pte_t *ptep,
+		unsigned long addr, unsigned long end, u64 pfn,
+		pgprot_t prot, unsigned int max_page_shift)
+{
+	unsigned long size;
+
+	size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
+	if (size != PAGE_SIZE) {
+		vmap_pte_set_huge(ptep, addr, PFN_PHYS(pfn), prot, size);
+		return size;
+	}
+
+	set_pte_at(&init_mm, addr, ptep, pfn_pte(pfn, prot));
+	return PAGE_SIZE;
+}
+
 static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
 			unsigned int max_page_shift, pgtbl_mod_mask *mask)
@@ -100,6 +123,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	u64 pfn;
 	struct page *page;
 	unsigned long size;
+	unsigned int nr_pages;
 
 	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
 		return -EINVAL;
@@ -120,15 +144,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			BUG();
 		}
 
-		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
-		if (size != PAGE_SIZE) {
-			vmap_pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
-			pfn += PFN_DOWN(size);
-			continue;
-		}
-		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
-		pfn++;
-	} while (pte += PFN_DOWN(size), addr += size, addr != end);
+		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
+		nr_pages = PFN_DOWN(size);
+	} while (pte += nr_pages, pfn += nr_pages, addr += size, addr != end);
 
 	lazy_mmu_mode_disable();
 	*mask |= PGTBL_PTE_MODIFIED;
-- 
2.34.1


