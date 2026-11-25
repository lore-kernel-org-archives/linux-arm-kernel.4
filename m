Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D701606A68E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YXYO18tx;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=mqYMj4HJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IcKZMhVXkGsLegGjBxXphuzXg6/DwngmLc9AVe2Sr2Q=; b=YXYO18txyjeTzt
	UH3MO3T83NGG2/YRb0kyK02te59nhN2obhtKRLBwr5mW9K7F5I7Neutu2BctZCkOhLXNaUlPfQU3P
	aHxozG9/3TLx3fno6zYovjtzr1oFO0gZ4ace5h6aLgcjiA6tiap6ps+9q7IYC2kturYAdlvdb167o
	tCDp32Ao3LHDc9kFfKVxu+9Iv+qOjspvSMzwG9Ymj49CctYqM0IIbC2nfFZUyF+4ludFAVNffOrvf
	cUvqoteAvSoj40iPwMneRMCoXIBjGV6fRYlZdVK6AZNaF80s8XFCZD8xl4fFsezSCCqDfDLY6Fs+C
	M0zk/WAe8JUuUkLDiejg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWECn-0000000AD88-1BW3;
	Wed, 25 Nov 2026 14:42:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEB6-0000000AC7J-0U7i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:40:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 635651BF7;
	Wed, 25 Nov 2026 06:40:52 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA8423F632;
	Wed, 25 Nov 2026 06:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617655; bh=gt7ayGUpndc9+xYpRU4sJb5goSevkWB5qx8zGCnfUXQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mqYMj4HJOTQaHs49wZnhCfzwZe47nDhaEMEveW6J84VcjpT85Zk7deEnMmSuPK/Np
	 uHaEb9z+vjEeOnpXB8fyIwfhZCnDgN/2XRnDoqUvqGVUUUvJePmyQxXCKz3Z15QbNN
	 DnIIcWZvzDVfXeqBviGz89o1vbDYZF7nkxDc4gGM=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 25 Nov 2026 14:40:33 +0000
Subject: [PATCH v4 11/13] irqchip/gic-v5: Retain the ITT when device
 invalidation times out
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-host_gicv5_fixes-v4-11-0469743c47d8@arm.com>
References: <20261125-host_gicv5_fixes-v4-0-0469743c47d8@arm.com>
In-Reply-To: <20261125-host_gicv5_fixes-v4-0-0469743c47d8@arm.com>
To: Marc Zyngier <maz@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Fuad Tabba <fuad.tabba@linux.dev>, 
 Sascha Bischoff <sascha.bischoff@arm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_064056_279736_E4E115B3 
X-CRM114-Status: GOOD (  16.15  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Device registration publishes a DTE pointing to the new ITT before
invalidating the ITS device cache. If invalidation times out, clearing
the DTE in memory does not guarantee that the ITS has discarded a
cached reference to the ITT, and hence the hardware could still try
and access the memory. Freeing the ITT on that path can therefore
leave the ITS accessing memory that has been reallocated.

Device teardown has the same problem: it frees the ITT even when the
invalidation issued after clearing the DTE fails to complete in the
specified timeout.

Retain the ITT on either failure path. Continue returning the
invalidation error, and free the ITT during teardown only after
successful completion. This deliberately retains memory on hardware
failure because a timeout does not cancel the operation or establish
that cached references are gone.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Reported-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Link: https://lore.kernel.org/r/20261112145814.853424-1-fuad.tabba@linux.dev
---
 drivers/irqchip/irq-gic-v5-its.c | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index db13011ef6d9..37835d1600fb 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -11,6 +11,7 @@
 #include <linux/iommu.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/kmemleak.h>
 #include <linux/msi.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -165,6 +166,23 @@ static void gicv5_its_free_itt(struct gicv5_its_dev *its_dev)
 		gicv5_its_free_itt_two_level(its_dev);
 }
 
+/* The ITS may still reference these allocations after its_dev is freed. */
+static void gicv5_its_itt_not_leak(struct gicv5_its_dev *its_dev)
+{
+	unsigned int i;
+
+	if (!its_dev->itt_cfg.l2itt) {
+		kmemleak_not_leak(its_dev->itt_cfg.linear.itt);
+		return;
+	}
+
+	for (i = 0; i < its_dev->itt_cfg.l2.num_l1_ents; i++)
+		kmemleak_not_leak(its_dev->itt_cfg.l2.l2ptrs[i]);
+
+	kmemleak_not_leak(its_dev->itt_cfg.l2.l2ptrs);
+	kmemleak_not_leak(its_dev->itt_cfg.l2.l1itt);
+}
+
 static int gicv5_its_create_itt_linear(struct gicv5_its_chip_data *its,
 				       struct gicv5_its_dev *its_dev,
 				       unsigned int event_id_bits)
@@ -540,8 +558,9 @@ static int gicv5_its_device_register(struct gicv5_its_chip_data *its,
 
 	ret = gicv5_its_device_cache_inv(its, its_dev);
 	if (ret) {
+		/* The ITS may still have a cached reference to the ITT. */
 		its_write_table_entry(its, dte, 0);
-		gicv5_its_free_itt(its_dev);
+		gicv5_its_itt_not_leak(its_dev);
 		return ret;
 	}
 
@@ -570,9 +589,15 @@ static int gicv5_its_device_unregister(struct gicv5_its_chip_data *its,
 	its_write_table_entry(its, dte, 0);
 
 	ret = gicv5_its_device_cache_inv(its, its_dev);
+	if (ret) {
+		gicv5_its_itt_not_leak(its_dev);
+		return ret;
+	}
+
+	/* Only release the ITT once the ITS has discarded its references. */
 	gicv5_its_free_itt(its_dev);
 
-	return ret;
+	return 0;
 }
 
 /*

-- 
2.34.1


