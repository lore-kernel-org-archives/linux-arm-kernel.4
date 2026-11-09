Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870D260A5BE0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 16:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EfiO+7rF;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ldaoIdlx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=w/xadSNxlF1dcE7NrliZqcaX647rTwn6tKWJSB5uaPw=; b=EfiO+7rF2Hpbvn
	4kCIf0OmZCBY7/C73LZqiURMwfayE1mtTMkcXWfPktWQvzD5zU8mfIfIDtyCVYoQXRuEyzn+AaRea
	DeCRWl7rK4/kMzwhlR7xvY3EaDMjZdGf30PbD5gn3LwE4oxfgEqWrHlW1Z2EexMRRWi9rJWfkkTJX
	KEdl8q3Zk3ly33sMHruqPuUBYQyQh23dJB5PYSFGpdz95HHGUrA/AP50y4blUy65EWbg6RT99ECMd
	0Y5MkzQi75Xp/8Tz62vv6JffAaHAQFCN8TCYoWpuV7aOq/NH7HoMSqayBY1ZmWYAEUWNwaMQwU4q1
	oHUh8gTRej4BMH5e3FDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRo2-000000017XE-3EqB;
	Mon, 09 Nov 2026 16:01:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRnp-000000017Nd-3Vfg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 16:01:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED4381758;
	Mon,  9 Nov 2026 08:00:57 -0800 (PST)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.2.208.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C7CE3F632;
	Mon,  9 Nov 2026 08:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794240061; bh=VFlm1dBZL32mMpdbEZlu0B521tRtjxv6y79g4lyfR7M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ldaoIdlxnbqof2ygpu7uoIS36TRPBb0a7KqSQG47lJO/WyvgR3DFvILsv50YAk0y9
	 YPbtFv4E19oYZr9mArtAtTya0NZev3zEDxoQQ+SFGyaoI9nR7OVEAfsZj+yDBnj9r7
	 azx2Nrk5IQtYdL2p6rRsHUcMe572fiAZENG3IiO8=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Mon, 09 Nov 2026 15:58:30 +0000
Subject: [PATCH RFC v10 05/22] arm64: set_memory: Implement
 set_direct_map_pkey()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-kpkeys-v10-5-aa6c4d9603bc@arm.com>
References: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
In-Reply-To: <20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com>
To: linux-hardening@vger.kernel.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Ard Biesheuvel <ardb+git@google.com>, Andy Lutomirski <luto@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, Jann Horn <jannh@google.com>, 
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
 Kees Cook <kees@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
 Maxwell Bland <mbland@motorola.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Pierre Langlois <pierre.langlois@arm.com>, 
 =?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>, 
 Quentin Perret <qperret@google.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org, 
 Ira Weiny <iweiny@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794240029; l=2186;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=VFlm1dBZL32mMpdbEZlu0B521tRtjxv6y79g4lyfR7M=;
 b=VcY+DXHdsUztqYXuF9Z+OxZq5jyyzLtxxEifnN6W5UAiKiDqSWPeuNeQjq7koKky74S76Ikfc
 0B9SJZKJAOlBze/gVmLterM9t1uoECjb0BHcViK70dZmXCfp5Ka6tQ/
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_080102_161309_F3B9C4B6 
X-CRM114-Status: GOOD (  12.16  )
X-Spam-Score: -4.4 (----)
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

Implement set_direct_map_pkey() using POE.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/set_memory.h |  4 ++++
 arch/arm64/mm/pageattr.c            | 26 ++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 0091ba12200e..8322615b8ffb 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -18,4 +18,8 @@ bool kernel_page_present(struct page *page);
 int set_memory_encrypted(unsigned long addr, int numpages);
 int set_memory_decrypted(unsigned long addr, int numpages);
 
+#ifdef CONFIG_ARCH_HAS_KPKEYS
+int set_direct_map_pkey(unsigned long addr, int numpages, int pkey);
+#endif
+
 #endif /* _ASM_ARM64_SET_MEMORY_H */
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index de7bf95003ea..7143bb2dfecd 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -9,6 +9,8 @@
 #include <linux/sched.h>
 #include <linux/vmalloc.h>
 #include <linux/pagewalk.h>
+#include <linux/pkeys.h>
+#include <linux/kpkeys.h>
 
 #include <asm/cacheflush.h>
 #include <asm/pgtable-prot.h>
@@ -319,6 +321,30 @@ int __set_memory_enc_dec(unsigned long addr, int numpages, bool encrypt)
 				      __pgprot(PTE_PRESENT_INVALID));
 }
 
+#ifdef CONFIG_ARCH_HAS_KPKEYS
+int set_direct_map_pkey(unsigned long addr, int numpages, int pkey)
+{
+	unsigned long set_prot = 0;
+
+	if (!kpkeys_supported() || !can_set_direct_map())
+		return 0;
+
+	if (!__is_lm_address(kasan_reset_tag((void *)addr)))
+		return -EINVAL;
+
+	if (pkey < 0 || pkey >= arch_max_pkey())
+		return -EINVAL;
+
+	set_prot |= pkey & BIT(0) ? PTE_PO_IDX_0 : 0;
+	set_prot |= pkey & BIT(1) ? PTE_PO_IDX_1 : 0;
+	set_prot |= pkey & BIT(2) ? PTE_PO_IDX_2 : 0;
+
+	return __change_memory_common(addr, PAGE_SIZE * numpages,
+				      __pgprot(set_prot),
+				      __pgprot(PTE_PO_IDX_MASK));
+}
+#endif
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 void __kernel_map_pages(struct page *page, int numpages, int enable)
 {

-- 
2.56.0


