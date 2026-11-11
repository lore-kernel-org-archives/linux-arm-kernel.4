Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0E2606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qe06F70R;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=W+cL7W++
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1XlqkjYgUHqMtiyvO2/LqlbV238Aov7kyKv1cwFa5P4=; b=Qe06F70RU85ZQjZISyl40WxaMd
	G+fD5ewe5U6JZR9rWD356m+cRTKlAvaILaF+HXb5bKoCfubEnb3bC2KKnyO1ucgs3KdYzgCR7D2r4
	f1XG/w5ny1oQ47rb/OfNApZHDhuvDyY/NebHnYJ6O6AsKVfFAiCofkPN6kDw62Kgnh13fxeMnlKlu
	scuVtZgvHXwrtTXvfm9LnkKNjfUhQjcuwPFhVZ+Xkw+nMeT0YIc3q2n1x+BiADe7WjVruOK83z7Gl
	aEheTEEf07ilqObCgDnu3bHAa8J5tI8FwrLEz+mn0iwmmguso3NJng69nDnBDZRDikalqVHPnyQ6M
	NcXztC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6CB-00000006R4M-0rci;
	Wed, 11 Nov 2026 11:08:51 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6C2-00000006Qvt-3X7J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:08:44 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48e0461e040so2335715f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 03:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794395321; x=1795000121; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1XlqkjYgUHqMtiyvO2/LqlbV238Aov7kyKv1cwFa5P4=;
        b=W+cL7W++mJxg8msfrGkRsCboa8tcvsiCUuaC9IXG6qfsUksnpBFxg1zwdaFwO6HF0w
         nZ3nKlEJmf4zxisaFpO3o/vRs60eyaqDzOAP9i7v4z3k/82QZqTdpWKUmOqZFI8DDvQz
         LiRrjFsKVZ1c23aWBtrKb6NZxwyubYxNvp+8q5r/RjuD33dPiL8ouZX2XvLGd8A/IvWv
         TUpbEoppqnLMs0qG+xFgcF46FxQB3POoyTucGWLfXGuRlGF6nk4sakCyr67yLP1boHIy
         Lo+zta6SZ9e6waoi8YibfTlbRVvqOs9V3zQ2hyLwxn2iAKEp8biemaAigIkd81m9eq2C
         rvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395321; x=1795000121;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1XlqkjYgUHqMtiyvO2/LqlbV238Aov7kyKv1cwFa5P4=;
        b=nm/mVBfxs9k5IdSWueTzaqCyAWLb55Rm+AgmDLlFNPhlBsciiRV58Sf0wLq5y6Jhad
         n2Wgivu7ra9VBqMkyib1fXyVoQ57jnHWmjWvvxtXorwI6U+sk+GfVmcI10sLQVoLbv/y
         2D0YRUSd4FZ6IZC8JcJvilZbXIwxe8AId6CdBakOI4xUN9UGvIiRJZUcRYdx47jZVcZ4
         KB5RO3arz0hysW6+lQFVMigJZK46wzQd7PQM8Dgbf/+VdqZT8LUxPskEkm0O3Vbt7FsZ
         lNNyb/82Uhi7Elt8RW5zzua2rOCVnxO507A5hWlqcC1oMTK+VkLS59vimzO53Kjp5jKB
         KbRg==
X-Forwarded-Encrypted: i=1; AL+hErGAsdeLbHGkwap4U7VG5AhjKlKyTpfnBYZ+MtOgBCqzccH6pWMW1so3G5NvCyNfJ7VVRGUKfv9CRVr77q6fJZns@lists.infradead.org
X-Gm-Message-State: APuU4Z8THqIi5KyJbDSlFDWPj45jPPcrgboIWg0gDQpXoqLETe7xg0X0
	lBKpkcvnEWRSTFBmVhItInPwJnImkFx1R2eJ7Kgic+tDgXLoHGf0UARz/0N40ceLStE24sZkHaq
	7eaocfnZOxA0zu+MtWy3rFg==
X-Received: from wrqn16.prod.google.com ([2002:a5d:4210:0:b0:48e:3826:ef3f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:481d:b0:493:803e:800f with SMTP id ffacd0b85a97d-499c6e96f58mr3024659f8f.29.1794395320547;
 Wed, 11 Nov 2026 03:08:40 -0800 (PST)
Date: Wed, 11 Nov 2026 11:07:38 +0000
In-Reply-To: <20261111110738.872947-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261111110738.872947-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111110738.872947-9-vdonnefort@google.com>
Subject: [PATCH v3 8/8] optee: Add support for lendable-dma-pool
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
X-CRM114-CacheID: sfid-20261111_030842_914525_77043349 
X-CRM114-Status: GOOD (  15.50  )
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

When memory is lent to secure world, fatal CPU speculative reads can
still occur while it retains a cacheable mapping. Use the
lendable-dma-pool API to unmap pages before lending and restore them
upon reclaim.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 drivers/tee/optee/protmem.c | 48 ++++++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/tee/optee/protmem.c b/drivers/tee/optee/protmem.c
index be3abf6e8aa6..10e8f1540e5e 100644
--- a/drivers/tee/optee/protmem.c
+++ b/drivers/tee/optee/protmem.c
@@ -4,6 +4,7 @@
  */
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/dma-mapping.h>
 #include <linux/errno.h>
 #include <linux/genalloc.h>
 #include <linux/slab.h>
@@ -21,6 +22,7 @@ struct optee_protmem_dyn_pool {
 	u_int mem_attr_count;
 	refcount_t refcount;
 	u32 use_case;
+	bool unmapped;
 	struct tee_shm *protmem;
 	/* Protects when initializing and tearing down this struct */
 	struct mutex mutex;
@@ -32,6 +34,35 @@ to_protmem_dyn_pool(struct tee_protmem_pool *pool)
 	return container_of(pool, struct optee_protmem_dyn_pool, pool);
 }
 
+static int zap_direct_map_dyn_protmem(struct optee_protmem_dyn_pool *rp)
+{
+	int ret;
+
+	ret = dma_zap_direct_map(&rp->optee->teedev->dev,
+				 phys_to_page(rp->protmem->paddr),
+				 rp->protmem->size);
+	if (ret && ret != -ENODEV)
+		return ret;
+
+	rp->unmapped = !ret;
+
+	return 0;
+}
+
+static void restore_direct_map_dyn_protmem(struct optee_protmem_dyn_pool *rp)
+{
+	if (WARN_ON(!rp->protmem))
+		return;
+
+	if (!rp->unmapped)
+		return;
+
+	dma_restore_direct_map(&rp->optee->teedev->dev,
+			       phys_to_page(rp->protmem->paddr),
+			       rp->protmem->size);
+	rp->unmapped = false;
+}
+
 static int init_dyn_protmem(struct optee_protmem_dyn_pool *rp)
 {
 	int rc;
@@ -42,19 +73,15 @@ static int init_dyn_protmem(struct optee_protmem_dyn_pool *rp)
 		goto err_null_protmem;
 	}
 
-	/*
-	 * TODO unmap the memory range since the physical memory will
-	 * become inaccesible after the lend_protmem() call.
-	 *
-	 * If the platform supports a hypervisor at EL2, it will unmap the
-	 * intermediate physical memory for us and stop cache pre-fetch of
-	 * the memory.
-	 */
+	rc = zap_direct_map_dyn_protmem(rp);
+	if (rc)
+		goto err_put_shm;
+
 	rc = rp->optee->ops->lend_protmem(rp->optee, rp->protmem,
 					  rp->mem_attrs,
 					  rp->mem_attr_count, rp->use_case);
 	if (rc)
-		goto err_put_shm;
+		goto err_restore_direct_map;
 	rp->protmem->flags |= TEE_SHM_DYNAMIC;
 
 	rp->gen_pool = gen_pool_create(PAGE_SHIFT, -1);
@@ -76,6 +103,8 @@ static int init_dyn_protmem(struct optee_protmem_dyn_pool *rp)
 	rp->gen_pool = NULL;
 err_reclaim:
 	rp->optee->ops->reclaim_protmem(rp->optee, rp->protmem);
+err_restore_direct_map:
+	restore_direct_map_dyn_protmem(rp);
 err_put_shm:
 	tee_shm_put(rp->protmem);
 err_null_protmem:
@@ -112,6 +141,7 @@ static void release_dyn_protmem(struct optee_protmem_dyn_pool *rp)
 	rp->gen_pool = NULL;
 
 	rp->optee->ops->reclaim_protmem(rp->optee, rp->protmem);
+	restore_direct_map_dyn_protmem(rp);
 	rp->protmem->flags &= ~TEE_SHM_DYNAMIC;
 
 	WARN(refcount_read(&rp->protmem->refcount) != 1, "Unexpected refcount");
-- 
2.56.0.542.g3ef89b7020-goog


