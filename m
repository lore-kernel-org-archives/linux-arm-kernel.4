Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C560606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jkfBhbmw;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=d0mq2ifd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=zvW5z7zfahFNFXi+Ssaf7DpYERKkjJt0YrEyUHja2pk=; b=jkfBhbmwE9GNxIQTzfNseF36QH
	1I347DptXoun8sbioYIaSNNyUBDesJf0OQKhFTrT10wJ8Y10hV0bfEbZaDYW+NT7IWgp0cwzL0dkI
	pSVs228gdG0iA1T1QcPJ2cRvb8Dh6saZ8wedd36PjhROS2RbYyIIGVmFo3umgiRylxHPLb8Cxi5R9
	6zuDJiRKzoBodWoz5aF9+QBPVknBjOdnIYGzYwm0du8+SxyAah0DfMVevg9D7FcX/GNTwcw2PmR/k
	Aux5uW79owYVRJb7GVJq25jYi9qReYunytF9/m5RZbthKrWIpgOPjZLAP1f+XSmmcT3Hqm5UeMEEG
	2Uq/+d4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsS3-00000006tg6-36rD;
	Tue, 24 Nov 2026 15:28:59 +0000
Received: from out-88.mta1.migadu.com ([95.215.58.88] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsRv-00000006tcb-2pTP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 15:28:59 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ZlYt6RHKpSvMzdObJH/W7hyfD0aXwfhI08mgyRDFJwI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795534127; v=1; x=1796138927;
 b=d0mq2ifdwgOzELx//KYvKqpaXDNKPkX2hHMvm4EqLp0Az/cpGtwZhiRT5cBPnnDm/q+rVOPK
 ovh08k+sTEIFg48rlg6mJU7IP+PftV0euAKT4peQ5qVK0crUbM3Ey1SH+2FEbYrQQ4VjedcZAqJ
 Bo47N7miGpkFj3wc56t3n1yE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by mta10.migadu.com with ESMTPS id 1820b8d53bebf8b1;
	Tue, 24 Nov 2026 15:28:46 +0000
X-Mizu-Trace-ID: 1820b8d53bebf8b1
X-Migadu-Flow: FLOW_OUT
From: Usama Arif <usama.arif@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	riel@surriel.com,
	shakeel.butt@linux.dev,
	kernel-team@meta.com,
	rkeilty@meta.com,
	atish.patra@linux.dev,
	dgreid@meta.com
Cc: Usama Arif <usama.arif@linux.dev>
Subject: [PATCH] KVM: arm64: Reduce the stage-2 page cache on 64 KiB hosts
Date: Tue, 24 Nov 2026 07:28:42 -0800
Message-ID: <20261124152842.2634495-1-usama.arif@linux.dev>
X-Mailer: git-send-email 2.53.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_072852_227508_37D77C6F 
X-CRM114-Status: UNSURE (   9.43  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When a stage-2 fault may need new page tables, KVM first tops up the
vCPU's page cache: if it holds fewer pages than the fault might need, it
is refilled to KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE, which arm64 sets to
40. Unused pages stay in the cache until the vCPU is destroyed.

With 64 KiB pages, that is 2.5 MiB per vCPU, and most of it is never
used. Stage-2 has at most three levels and the root is preallocated, so
a fault needs at most two new table pages (kvm_mmu_cache_min_pages()).
As every last-level table covers 512 MiB, an 8 GiB guest needs just 17
table pages to map all of its memory, while its four vCPU caches get
filled with 160.

On a production host with 64 KiB pages running 101 VMs with four vCPUs
each, the caches were still 86% full. The memory used:

                        before      after
  per-vCPU capacity     2.5 MB     512 KB
  all 404 vCPUs         869 MB     <= 202 MB

Let's lower the capacity to 8 with 64 KiB pages, In the production
usecase above, it frees at least 667 MB. That still covers the two-page
minimum and leaves room for several table allocations per refill. 4 KB
and 16 KB pages keep 40.

The temporary cache in kvm_phys_addr_ioremap() uses the same capacity,
but it is topped up before every page it maps, so 8 is sufficient there
as well. The pKVM hypervisor memcache and the eager split cache don't
use this capacity.

Signed-off-by: Usama Arif <usama.arif@linux.dev>
---
 arch/arm64/include/asm/kvm_types.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_types.h b/arch/arm64/include/asm/kvm_types.h
index 9a126b9e2d7c99..28568da9ea4a7b 100644
--- a/arch/arm64/include/asm/kvm_types.h
+++ b/arch/arm64/include/asm/kvm_types.h
@@ -2,7 +2,12 @@
 #ifndef _ASM_ARM64_KVM_TYPES_H
 #define _ASM_ARM64_KVM_TYPES_H
 
+/* Must cover kvm_mmu_cache_min_pages(), at most 2 with 64 KiB pages. */
+#ifdef CONFIG_ARM64_64K_PAGES
+#define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 8
+#else
 #define KVM_ARCH_NR_OBJS_PER_MEMORY_CACHE 40
+#endif
 
 #endif /* _ASM_ARM64_KVM_TYPES_H */
 
-- 
2.53.1-Meta


