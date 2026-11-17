Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B121D606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 02:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uRBu1BPP;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=bG2aZL9w
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cePgYs30Bcn8pusEQOJP4B1julb/89naq18hmSuJpMg=; b=uRBu1BPPwz4TdmXJhl+PmW7M/z
	uXk5kRabhPrnFdtt8qeipaUx1OJN18XDPCPU9iVb7bSbeYsMSLf9IeY3pMrccgMQM2ab4633V2uFB
	SyvSVyMZiEfnGhST1SPP3yhqEHtGeK2wpiP7xI3jkyMGNWkwGVKJJ+e0RowpT6VhJr1ZtciQzGzti
	M0XivT874S3JIrB+u0Wvk8tx2XMw70eHpTrfS5h7A8nGr+Ehu7/qriAp7lNFF++uLPqkoEn5j+MIL
	+niZSusQKyX9irOAwj/ltHW+OcMwHiv0MTMSbXBUEMipR6gg9iWZviEXybmaI8EhRvV8Zd9e1//5M
	m8q72BEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8XE-00000004LYy-0h4d;
	Tue, 17 Nov 2026 02:03:00 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8X3-00000004LVe-3nWN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 02:02:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=cePgYs30Bcn8pusEQOJP4B1julb/89naq18hmSuJpMg=;
	b=bG2aZL9wLtwMoR+eH6Ptsaon9AHyEhcKp9zMD6fLo6qLqqM7R/wqIkY1ACQdFPdxlYsVYTnQH
	DwVgjobhKkCZalHRUUoxXCLw6z1PSAe8pMtQ8MNickJe9vcrT9wTnvmfi0UNfvIFqMsHUortU94
	yGy7a9mOWxaNiNQFhlYDycg=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jT7Jb6SlNzpSwK;
	Tue, 17 Nov 2026 10:01:51 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 7C0B040579;
	Tue, 17 Nov 2026 10:02:39 +0800 (CST)
Received: from huawei.com (10.50.85.135) by kwepemr500001.china.huawei.com
 (7.202.194.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 17 Nov
 2026 10:02:38 +0800
From: Jinjiang Tu <tujinjiang@huawei.com>
To: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<ryan.roberts@arm.com>, <peterx@redhat.com>, <dave.jiang@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>
CC: <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>,
	<tujinjiang@huawei.com>
Subject: [PATCH v2 2/4] arm64: simplify pmd_special and pmd_mkspecial
Date: Tue, 17 Nov 2026 10:02:35 +0800
Message-ID: <20261117020237.4037980-3-tujinjiang@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117020237.4037980-1-tujinjiang@huawei.com>
References: <20261117020237.4037980-1-tujinjiang@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemr500001.china.huawei.com (7.202.194.229)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_180250_124156_04E5207A 
X-CRM114-Status: UNSURE (   8.09  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use pte_special() and pte_mkspecial() helper to simplify pmd_special()
and pmd_mkspecial(), and kill unused set_pmd_bit() and clear_pmd_bit()
helper.

Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>
---
 arch/arm64/include/asm/pgtable.h | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index a474c9fb485a..a06b0f5c3411 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -240,18 +240,6 @@ static inline pte_t set_pte_bit(pte_t pte, pgprot_t prot)
 	return pte;
 }
 
-static inline pmd_t clear_pmd_bit(pmd_t pmd, pgprot_t prot)
-{
-	pmd_val(pmd) &= ~pgprot_val(prot);
-	return pmd;
-}
-
-static inline pmd_t set_pmd_bit(pmd_t pmd, pgprot_t prot)
-{
-	pmd_val(pmd) |= pgprot_val(prot);
-	return pmd;
-}
-
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
 	pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
@@ -577,11 +565,8 @@ static inline pmd_t pmd_mkhuge(pmd_t pmd)
 }
 
 #ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
-#define pmd_special(pte)	(!!((pmd_val(pte) & PTE_SPECIAL)))
-static inline pmd_t pmd_mkspecial(pmd_t pmd)
-{
-	return set_pmd_bit(pmd, __pgprot(PTE_SPECIAL));
-}
+#define pmd_special(pmd)	pte_special(pmd_pte(pmd))
+#define pmd_mkspecial(pmd)	pte_pmd(pte_mkspecial(pmd_pte(pmd)))
 #endif
 
 #define __pmd_to_phys(pmd)	__pte_to_phys(pmd_pte(pmd))
-- 
2.54.0


