Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85651606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3bIccSPe;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lTmhjj2g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9ZXEacqR3rbcMgUrTgI8rcS8c5nOk1mz2EbR1FK4c64=; b=3bIccSPedQeBaP3YWSJI7G4iw3
	mKcewQMLmwKFLCx90ugveLMZy4bsfWYlXdKqok3Boa55lk7dDnCBaKunhQilQWixVmxnZvKF52JXD
	V7yBJnVjH9U1TzzkmeI2pSksXcdvVSmsu20iJlu7KkfkofRBbLmN4dbEwKUsjYrHhDquDOSEM00Im
	p53Do0JRFQW63KTMA9TDGvuWHqVIogOe8M5co3vvONiTgWAGnxZCC/rt+E4mC7CyRdICOau0nkZ0/
	t611BqfNOA4vRK2J1Z6PKmtZgfh5VqZFSOkx4zy5j/7sHS9FadbcE0+YOn96EFcesnmc9sbPRkkuu
	BCxiFbjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzI3-0000000HBKT-0nZS;
	Fri, 27 Nov 2026 16:59:15 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzHu-0000000HBI7-0pgy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 16:59:07 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4bb66fc3aa6so68151095e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 08:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795798744; x=1796403544; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ZXEacqR3rbcMgUrTgI8rcS8c5nOk1mz2EbR1FK4c64=;
        b=lTmhjj2goMW/CeHZ/bX3Nq90U2tPSa5jiSUbg8Nbyz0VDdo9CqXMXEujTgAzT0cgYo
         Emmh7Nf0qVCLYqJHBgcT6A7RCkBWIhuHjqx0osD4IkC+n8jItQ5YEquXt1Yd4bER8gUo
         ET5QiKBXovG6BfOGVUw71cHNq7yty1Gg1inEFa+zl3x5wBmpVg65FOiIi53JpOA4B6ve
         3Ws41MUbm90Lb7/bhbPVfOxtLTSV0DnYfs/7QH++3zvu+tCy81hIiX3Gs10oIIG9SIbz
         c+wFVta/g4ex9iSRjLughFHG4ty4/Tgp/lzchesfRyV9Z1sks3YNj/qiAx1wNzLIa0+Y
         qtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795798744; x=1796403544;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ZXEacqR3rbcMgUrTgI8rcS8c5nOk1mz2EbR1FK4c64=;
        b=W3uC1n/OCmNpyebYvPEQhoT0eHZM4gWExBvVRBvCCc9hADimQE4DCFwNepbZbZlRVr
         vd5CS23zXR4J0PhwRh/+drFudjf+y1+W/SLGwkocW+SrUzpP51WKBAA7YQwDj4J4SMpJ
         kJSDRqB3xf6yRi8FsO2shY6xUswW8svapD7DYpyiRKWu6FaGu+MlyoDeUqng93ouA2fy
         0z0UhvwqhycmaDmdEvvAKcvlDH9+Nf/zq760gdg3eNDISbUX2mPT/SgJq/RpYLRNBSxE
         nqTL2nBXP9ZuiMxoU62RsaxCZl7O4OKz5D93r4M3Tde7bJjb1HFpjPbvWNb3OobxLOiM
         A9gg==
X-Forwarded-Encrypted: i=1; AL+hErE9jwaOgz8ig6HDd8ArT0ESUdGp45/KP0opse4qmtBUKjuwX5RslogIotCnbOHUqmLBdXWchWPtACIkBglP+h3c@lists.infradead.org
X-Gm-Message-State: APuU4Z90dtJ9+rmspW66xGUJqsKRqFhgWzg+6OLJh0Gb2ZkfMAr2mBGe
	j1ihGMoI9LtyMiz8dl3bAh2LiUUQ1r9namb5HpioWyH04OLRIu5ZB6wYd5cTKJzIr+l/0kT78mx
	N/XxOV+6gHfSgOx34Bv8cZg==
X-Received: from wmbz10.prod.google.com ([2002:a05:600c:c08a:b0:4a1:8bbb:59bd])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4585:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb8882948dmr520359785e9.18.1795798743614;
 Fri, 27 Nov 2026 08:59:03 -0800 (PST)
Date: Fri, 27 Nov 2026 16:58:42 +0000
In-Reply-To: <20261127165843.709034-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261127165843.709034-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261127165843.709034-3-vdonnefort@google.com>
Subject: [PATCH v2 2/2] arm64: THPs for systems with pages bigger than 4K
From: Vincent Donnefort <vdonnefort@google.com>
To: will@kernel.org, julien.thierry.kdev@gmail.com
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, maz@kernel.org, oliver.upton@linux.dev, 
	suzuki.poulose@arm.com, alexandru.elisei@arm.com, andre.przywara@arm.com, 
	kernel-team@android.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_085906_253300_B5FA5D97 
X-CRM114-Status: GOOD (  13.94  )
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
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The THP support imposes guest RAM over-allocation to align the memslot
userspace address to PMD_SIZE. However the alignment is currently
hardcoded to 2MiB, which only works with 4K page systems.

Instead, derive the hugepage size from PAGE_SIZE and skip the alignment
if the guest RAM size can't even contain a single hugepage.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arm64/kvm.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/arm64/kvm.c b/arm64/kvm.c
index 35aa6f260dd1..02cd519a5cbb 100644
--- a/arm64/kvm.c
+++ b/arm64/kvm.c
@@ -17,6 +17,8 @@
 
 #include <asm/image.h>
 
+#define HUGEPAGE_SIZE (PAGE_SIZE * (PAGE_SIZE / 8UL))
+
 static struct arm64_image_header *kernel_header;
 
 struct kvm_ext kvm_req_ext[] = {
@@ -34,20 +36,23 @@ bool kvm__arch_cpu_supports_vm(void)
 
 void kvm__init_ram(struct kvm *kvm)
 {
-	u64 phys_start, phys_size;
+	u64 phys_start, phys_size, ram_alloc_align = SZ_64K;
 	void *host_mem;
 	int err;
 
 	/*
-	 * Allocate guest memory. We must align our buffer to 64K to
-	 * correlate with the maximum guest page size for virtio-mmio.
-	 * If using THP, then our minimal alignment becomes 2M.
-	 * 2M trumps 64K, so let's go with that.
+	 * Allocate guest memory. We must align our buffer to 64K to correlate
+	 * with the maximum guest page size for virtio-mmio. If using THP, then
+	 * our minimal alignment trumps 64K, so let's go with that.
 	 */
 	kvm->ram_size = kvm->cfg.ram_size;
 	kvm->arch.ram_alloc_size = kvm->ram_size;
-	if (!kvm->cfg.hugetlbfs_path)
-		kvm->arch.ram_alloc_size += SZ_2M;
+	if (!kvm->cfg.hugetlbfs_path) {
+		if (kvm->ram_size >= HUGEPAGE_SIZE)
+			ram_alloc_align = HUGEPAGE_SIZE;
+
+		kvm->arch.ram_alloc_size += ram_alloc_align;
+	}
 
 	if (kvm->cfg.arch.guest_memfd)
 		kvm->arch.ram_alloc_start = mmap_guest_memfd(kvm,
@@ -62,7 +67,7 @@ void kvm__init_ram(struct kvm *kvm)
 		    kvm->arch.ram_alloc_size, errno);
 
 	kvm->ram_start = (void *)ALIGN((unsigned long)kvm->arch.ram_alloc_start,
-					SZ_2M);
+					ram_alloc_align);
 
 	if (!kvm->cfg.arch.guest_memfd) {
 		madvise(kvm->arch.ram_alloc_start, kvm->arch.ram_alloc_size,
-- 
2.56.1.839.g22a8290db9-goog


