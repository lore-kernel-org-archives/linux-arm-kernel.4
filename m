Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5A4606A332
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 13:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L9UYLh0w;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TDvNt+gU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LValEK7sCbZl9kgj7RilnfIodlMc9vaM8NFPGguTOMw=; b=L9UYLh0w+VUIDi
	iLl1aNC2jMfx+gKstpBAmhihUFhIHvygRGFCiHclwPEOEyDrg5T74SO/84RGZ0s5WYHClRWUt4U1K
	I3AV9h4ZxVXGGIPnSJYLzFDK4BBm1gvNGLok6IFQtEnp5l3VyJishAUqDtifFyL4DwjW6JJephd0g
	P2VVsFMg2t/dszsThSq+Psq2tWfY09fFCPTAYGmnCodiGcnY+FXQUtmxnQfyg8epL3iw4D5f7BQRG
	7RC4C3u/QR1j6UKcZ9Zwq0qWkG4J2Gj4fXnjjOcxOD2hyLfnsB+TfPekxqnIyVuD6wnASiurUHAHB
	kTATXTksxoGWuRa586ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgob-0000000ElH2-18NN;
	Sat, 07 Nov 2026 13:50:41 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPgoV-0000000ElDl-1evl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 13:50:40 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso2441847eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 05:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794059434; x=1794664234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LValEK7sCbZl9kgj7RilnfIodlMc9vaM8NFPGguTOMw=;
        b=TDvNt+gUlOvo6Hg2V6snaDLGvfifj1engpHqHzN9w1fSiSXVLjTBP7vNyubAkAsvRN
         2g/cYvcceX0Cv/jBp1U1Zcfp4VSgnk3j20PmBgETkv3S2sh3GPTJtmQ9UsE3y62s2sa5
         UatRJlFMJNIfT1Ojt+t7FBIWTHir8FpQPfwi/7ZjOIQE/x+rILofewdDhRCgvMN8YUox
         87BtvgWNR5hbyDcBZXjRF8eutm+nq23M93EJ+c0ywNVNE8wo4jDY3jeP4RPYZmCzlB7A
         fNXRV9nZ6TpNuyWgzMg04bNFHKF7b/rFojX70GLHgGPxPOiq5FDi4Gk9NkvIOHm1ljRP
         nIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794059434; x=1794664234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LValEK7sCbZl9kgj7RilnfIodlMc9vaM8NFPGguTOMw=;
        b=i5EpsNLTcHqyuRSa0V/cKnEjkcYbmYwheF7ACHao3UG0KWR8oYQPwPFEaefRlbljhI
         ib+H4h8ypdkqMgfBeRn+2dtap8H3YSBrkUjnHqOG0IrVqrCNmCEJRRbb7PhMWZizZRo5
         IS4jB/yMLYAchHihMXF+HOZ8auTP7eLrPf/Rv5iMODbfIQuJcMGbgVgnunvKrATtPEaI
         VUOByhWMAAvl/T/GDfWj7E1S8OSrx9RsIQsGdXXQteAPDcouDSiopdo4+1PzmOxWBWJj
         eX3vCapqB9I/mc846qvAsif7NFHs/NgzGXOfLSKlDiPtkGwiUn+ioxZsL0bbB+kF5b1u
         OzMA==
X-Forwarded-Encrypted: i=1; AL+hErHgodMQ4ECRZ6WIx1J3iW94DBOrabPGDD9vP2z256SI3PViqfnxlEJ6HBfmUZL+mWFD6sxGg7/jBwuSM+29IXBz@lists.infradead.org
X-Gm-Message-State: APuU4Z/TlDcZEwQwNh2Go9/vs4rLWPlxaMIRQ8yxxaIu2w7aT8Sy3Hwf
	1zeCkxuXTnq6nGLyZ6RlUs6FqHqChMrng6hOKpenor5Xl37DqSnMhKjNaZaQpTWHQgE=
X-Gm-Gg: AYBFou0D1eA5qElAb5Zw4Xg+pGmf9EfAwvof5F60u5uvp34BLlCZGExPRZQQZLKuNcf
	+uTMl+K1gJ+054llGrhYEg0h1QfTmrVqj3JxSLYSTwk3FUZV6EZZtTet9KGxlfqTMlep8UmAE+6
	qSXZH5EaJIKbpbncimnm2tMsVg7q/rOa7gu7GG8+HUxJjqVVB8Ci6b5/HTy0vXKuY7ePIKgDxSF
	jQvGRHQSXN1P47ruO7os5A8Slp/qC7e4P3uq98U0GaZL3mLiuQnbnsgU+30VbuRqeEYMdWouasK
	G1LmKH5Ky3yr3gxe1JT7Db3Z52HCCKEEDk1XlkUfw4n7GJfjttL/PynbwGau4evQN8fsaZWkMlt
	eUVdg3aMMw98vKIQKR66IYC2BohVXgxM38YJJljyINQEkPyUwKFeffWo3BMRUnhRawaDNoPt31A
	uIYQJ9Gq4jPhXpxwHsG8H0r5tJSP9eHlex8wylmIoTkBcrYBNCzB/cECGlc6dvc9IS+1qetQFSU
	LUB7N15QQy7uQAo+iarUjWccS5JP9rmfEZv1HgcaYv7nZpxMlVfogL1czPZN6nOVadJrl2ZGMD1
	w3uIAaOdLttWit41vWRWYLOsAj2fphki+tgw4eCyfea3OSrZtz3uuW1gqg==
X-Received: by 2002:a05:693c:66cc:20b0:36a:1452:8dad with SMTP id 5a478bee46e88-36f7612b26dmr7574830eec.20.1794059434348;
        Sat, 07 Nov 2026 05:50:34 -0800 (PST)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm21280820eec.10.2026.11.07.05.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:50:33 -0800 (PST)
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
Subject: [PATCH v12 05/10] arm64/vmalloc: allow arch_vmap_pte_range_map_size() to batch multiple CONT_PTE
Date: Sat,  7 Nov 2026 21:49:48 +0800
Message-Id: <20261107134953.748622-6-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_055035_438649_DC33DEDD 
X-CRM114-Status: GOOD (  14.07  )
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

Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
blocks, reducing both PTE setup and TLB flush iterations.

Previously the function returned a single CONT_PTE_SIZE for an aligned
range, so the caller mapped one CONT_PTE block per iteration. Now, for a
CONT_PTE_SIZE-aligned range, it returns the largest CONT_PTE-aligned size
that fits within both the remaining range and the caller's max_page_shift,
so a single vmap_pte_set_huge() call installs several CONT_PTE blocks at
once.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
---
 arch/arm64/include/asm/vmalloc.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 4ec1acd3c1b34..c29704a19e276 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -23,10 +23,12 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 						unsigned long end, u64 pfn,
 						unsigned int max_page_shift)
 {
+	unsigned long size;
+
 	/*
-	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
-	 * aligned in both virtual and physical space, then we can pte-map the
-	 * block using the PTE_CONT bit for more efficient use of the TLB.
+	 * If the range is at least CONT_PTE_SIZE and naturally aligned in both
+	 * virtual and physical space, return the largest CONT_PTE-aligned size
+	 * that fits, for more efficient use of the TLB.
 	 */
 	if (max_page_shift < CONT_PTE_SHIFT)
 		return PAGE_SIZE;
@@ -40,7 +42,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
 		return PAGE_SIZE;
 
-	return CONT_PTE_SIZE;
+	size = min(end - addr, 1UL << max_page_shift);
+	size = round_down(size, CONT_PTE_SIZE);
+	return size;
 }
 
 #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
-- 
2.34.1


