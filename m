Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792E7606A8BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 11:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1PFk14SO;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=s7eg7tKp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ac3f7pvozHRMKcmrspffsdFebWreOCTqfsZg8CNjtpQ=; b=1PFk14SOKD6v2gbomhSk/8sRHX
	wzQcDGP0zAqBySrgqetsRiwo+rLm4OWwUOhTa0xI0IOf2WUr8Kclb+Fz0tvOgxmF8J/YtqgY9iTcV
	e/UTyPjFiju/9J9I3yc32/slp1zXO3yYZk7gI36R7QhMoi3gZfkO5B2HhwscT7UQRGDurd4+vkTWE
	amQWp3Hs5mtUU0R3YFOuNBjGfSAHuv/NNhD8mkWt1K1AlApt0luCQRw39YZBcY8kukvM9MPjGQr5N
	GuohY1gbkiYCfdVO+meBG3IgEJSUC9uUhW/Utkt5GbK3nrb70F+A+olCTGnH1WGbI8tGs3Tc+A23j
	6rfHQ0Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuX7-0000000265v-3Pfm;
	Mon, 16 Nov 2026 11:05:57 +0000
Received: from out-3.mta1.migadu.com ([95.215.58.3] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSuX2-0000000261E-3mAl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 11:05:56 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=m5wyWpf9Hx87dvxO36yhwoD+oIhUOyMmO/fTyfd0zBc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794827150; v=1; x=1795431950;
 b=s7eg7tKp8SgVGREdI8d9hMMs261snyawQh9XWPSsGFIfBNIe+oyueARCZ4H5JOi/ssjyfL6U
 I6WfcTh0ENqkM9OQWau+pXN5UuEJiF4z+JXdtwbzSn9w4Yz3ozz6YieHeWdX3R+3MLpcRGYkcvY
 cYR8NLiXdQDDz/4aOHy1gbK4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 099d0d4b73867140;
	Mon, 16 Nov 2026 11:05:49 +0000
X-Mizu-Trace-ID: 099d0d4b73867140
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>,
	stable@vger.kernel.org
Subject: [PATCH] drivers/virt: pkvm: Zero and clean memory before sharing it with the host
Date: Mon, 16 Nov 2026 11:05:49 +0000
Message-ID: <20261116110549.1863653-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_030554_530537_24FC6514 
X-CRM114-Status: GOOD (  12.78  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>

On pKVM, set_memory_decrypted() shares pages with the host in place and
without cache maintenance. The atomic pool, dma-direct and dynamic
SWIOTLB pools zero their memory only after sharing it, so unless the
page allocator has zeroed it, the host can read whatever the guest last
left in it. Zeroing first isn't enough on its own, as the zeroes may not
have been written back to memory, and a host that maps the pages
Non-cacheable then reads the old contents.

Zero the range and clean it to the PoC before sharing it, so that no
caller can hand the host stale data.

Fixes: ebc59b120c588 ("drivers/virt: pkvm: Hook up mem_encrypt API using pKVM hypercalls")
Fixes: e62decaf98e7c ("arm64/coco: Add pKVM as a CC platform")
Link: https://lore.kernel.org/r/20261116091137.94252-3-aneesh.kumar@kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
[fuad: take the pKVM hunk of v10 patch 2 as a standalone fix, add the clean to the PoC]
Co-developed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---

Notes:
    This is the pKVM hunk of patch 2 of Aneesh's v10 [1] plus a clean to
    the PoC, taken on its own because it fixes a bug that has exposed
    guest memory to the host since v6.12.
    
    Based on Linux 7.4-rc3 (aebb727447640).
    
    [1] https://lore.kernel.org/r/20261116091137.94252-3-aneesh.kumar@kernel.org

 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
index 26fe9c3f22e36..81d1cd24a2eff 100644
--- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
+++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
@@ -9,10 +9,12 @@
 
 #include <linux/arm-smccc.h>
 #include <linux/array_size.h>
+#include <linux/cacheflush.h>
 #include <linux/io.h>
 #include <linux/mem_encrypt.h>
 #include <linux/mm.h>
 #include <linux/pgtable.h>
+#include <linux/string.h>
 
 #include <asm/hypervisor.h>
 
@@ -61,6 +63,15 @@ static int pkvm_set_memory_encrypted(unsigned long addr, int numpages)
 
 static int pkvm_set_memory_decrypted(unsigned long addr, int numpages)
 {
+	size_t size = numpages * PAGE_SIZE;
+
+	/*
+	 * The host can read the pages as soon as they are shared, possibly
+	 * through a Non-cacheable mapping. No caller relies on their contents.
+	 */
+	memset((void *)addr, 0, size);
+	dcache_clean_poc(addr, addr + size);
+
 	return __set_memory_range(ARM_SMCCC_VENDOR_HYP_KVM_MEM_SHARE_FUNC_ID,
 				  addr, numpages);
 }

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.47.3


