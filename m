Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC19F606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oVIRb9IR;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L2jb9Oi4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=t9e5fiKyui+gLN6NGnueZPdNy7gU/9XjTaWNkCYpwsg=; b=oVIRb9IR/8xM40PY8g+IawY+Ds
	eEVgz8hVxoXb3jNrZV8twr1AgS2M+uVXUGuY1E6m1WUep1oBQ+rBwhCBQzbPmU697XLk/WuvRPCDV
	pVMibB5h/8tJwjthvd0x7Be5AAHm++9P4dYFpmvWv7ueuNmacAAdS4/pKj45kH+Gah6QufMFalxsp
	VLn2EZGtXUj2QflzKjv/o/xqjFgpPGWqMxM1w+pixq5sXT1l6jlAIDcOUPrLXUDcL9IYK5KUvqyeu
	oHcI95PHjrBBeI4mYIlMlKkeUciK8GtnbjhQ8dsczOvsKa2R5YuMMRRdZfb+WM5EmnK97257ugPUA
	X18bm1ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6Bw-00000006Qpt-0tla;
	Wed, 11 Nov 2026 11:08:36 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6Bp-00000006Qlp-1Brp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:08:30 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-48e4d1e29f3so2932971f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 03:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794395306; x=1795000106; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9e5fiKyui+gLN6NGnueZPdNy7gU/9XjTaWNkCYpwsg=;
        b=L2jb9Oi4rp8VamKiDxmYUgyxheYMQFpidpzYDUmuB9dY5Tl3yXl4bOqgcvckxJdUle
         v6CPR7BvLrDigvT06Tdbekh893I0P4T4NnTskaMXxbhgzSpEeIjr25YHSaFLfmgzf820
         WQbpGUGkBOeDyE1jumlIw3ExPYwBECBMDuWPKAxHuOo+wqC2HeSSJA+RFMtyWd+5vIrq
         GpVQEyEmPOpjnc3eFU8gIsyBMcAy4A9y6s/LaE0pvw7LDLr5U4y68y2z21eK/02UTmOh
         pBFZlLEnKlotd8M0HwzWqZZBd8wekxBAYhFmf7nFzaz5ousPS99ZspZpv+JQEQ8+dES3
         tDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395306; x=1795000106;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t9e5fiKyui+gLN6NGnueZPdNy7gU/9XjTaWNkCYpwsg=;
        b=D7mBnyw1nFMb92oWayp2/iTcz8i7FXhbsaeIzFOEbuadmYP+TUP01rwsXJGWYFOYWI
         g8K2zXDoGfBQlNCb9XH6yK+oywa7h7pkFtxl8gDACtRWrp57KZ4SacOhp+qgi2xiKB2l
         uezRNbPJYglkA4oC+U9nAYzyT8ERLAMfILt2XN86mVSyXUWO0/+TOBbZrfiTJiQXa3Xm
         hgo+BdMoN3rnfApNtm00lLmHIDl0ufPVkLEcheoTLQJmgY6WVhgkq4UWdLvFSj/yqkAL
         g0SKmRibhK+Yp/iyuDrJSYPsUgm+bML6z0dNGpC9mzPqROOeTj23Em2Bvw+sh11CWwaZ
         isKw==
X-Forwarded-Encrypted: i=1; AL+hErEkHVUwelThGn49Gh/Bc6P2c889gs24C03tv1Ig3bp8UO4WNoSAUApEsUIRTmksinUWO1qFIdWMyibt0saGAGOd@lists.infradead.org
X-Gm-Message-State: APuU4Z/4Ne5lSBIf2dKC573Qo7mHs1nJn99YejqqdHViSgII8/8SSJfk
	xO+Jqp/810KOlx8Yrh5woVRN3hPXewG4xSaGWB6vO/SKdPyOFYuAWzZQikCkne1msqaAAHncveD
	ocMp2hZM094P9h4FevgXeJw==
X-Received: from wrsb1.prod.google.com ([2002:a5d:45c1:0:b0:48c:753a:6283])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e194:0:b0:491:6a7:b4ac with SMTP id ffacd0b85a97d-499c7b1aea4mr3063798f8f.56.1794395305902;
 Wed, 11 Nov 2026 03:08:25 -0800 (PST)
Date: Wed, 11 Nov 2026 11:07:33 +0000
In-Reply-To: <20261111110738.872947-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261111110738.872947-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111110738.872947-4-vdonnefort@google.com>
Subject: [PATCH v3 3/8] dma-contiguous: Expose rmem_cma_ops
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, m.szyprowski@samsung.com, jenswi@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mark.rutland@arm.com, robin.murphy@arm.com, hch@lst.de, 
	ryan.roberts@arm.com, sumit.garg@kernel.org, sudeep.holla@kernel.org, 
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org, 
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, iommu@lists.linux.dev, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_030829_330233_C109F6F2 
X-CRM114-Status: GOOD (  15.19  )
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

Expose rmem_cma_ops via a kernel/dma-private header so the upcoming
lendable-dma-pool reserved-memory handler can wrap the CMA callbacks
instead of duplicating them.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/dma/contiguous.c |  4 +++-
 kernel/dma/contiguous.h | 10 ++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 kernel/dma/contiguous.h

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 90937dc7c627..22d6e54aea35 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -46,6 +46,8 @@
 #include <linux/cma.h>
 #include <linux/nospec.h>
 
+#include "contiguous.h"
+
 #ifdef CONFIG_CMA_SIZE_MBYTES
 #define CMA_SIZE_MBYTES CONFIG_CMA_SIZE_MBYTES
 #else
@@ -578,7 +580,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 	return 0;
 }
 
-static const struct reserved_mem_ops rmem_cma_ops = {
+const struct reserved_mem_ops rmem_cma_ops = {
 	.node_validate  = rmem_cma_validate,
 	.node_fixup	= rmem_cma_fixup,
 	.node_init	= rmem_cma_setup,
diff --git a/kernel/dma/contiguous.h b/kernel/dma/contiguous.h
new file mode 100644
index 000000000000..9b1fdbfc794f
--- /dev/null
+++ b/kernel/dma/contiguous.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _KERNEL_DMA_CONTIGUOUS_H
+#define _KERNEL_DMA_CONTIGUOUS_H
+
+#ifdef CONFIG_OF_RESERVED_MEM
+struct reserved_mem_ops;
+extern const struct reserved_mem_ops rmem_cma_ops;
+#endif
+
+#endif /* _KERNEL_DMA_CONTIGUOUS_H */
-- 
2.56.0.542.g3ef89b7020-goog


