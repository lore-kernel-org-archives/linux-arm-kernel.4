Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61EA606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uH4fhnio;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=pAysh9NN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kWAjaQKRjSMXSZwALN2skOlMmNcnSKjLyh7lTvegcNg=; b=uH4fhnioi+01js
	14kEOZ+WbtMyWE/VrrQQGTMfYUxADONf3bDfFCp/TkRATcWD1IW4mHyG8rNk0xVceXlHlhsZZGmQW
	kRC8TDE0N1fGFvI5SxuzrftSbN+jZR8i67HcWJg0q+wIO8PhDjzq+LmGEod+jWkOcIU60eAqkj0uP
	DjzQ6DU+N8J6u73vMnEZaQ1H/HqxRcT7De2XWh2tlAO6XybfNjTRF//TkS0Yt7aBmhFqPkuwo/gfk
	w/+fkkcDwbC6kAiw3FTZJRmaGFrzLrJcGBbOEVQjgHmzhPyR4ycVgSqoPmyHUti4D8A18Nf7pT8Jn
	bry+8mY1/gsLGR6h161w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWECn-0000000AD8e-23cd;
	Wed, 25 Nov 2026 14:42:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEB9-0000000AC7J-11uR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:41:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA71F1BCB;
	Wed, 25 Nov 2026 06:40:55 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BA393F632;
	Wed, 25 Nov 2026 06:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617658; bh=PpSX75/e67JpV9c7ZzwRPC2Fmo+YW2Jtu0sMWZgBfEw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pAysh9NNfpoKqfb/xyYT4qcgtrv/cNrUMd8YC46NhERnegL92258wcecgLUWYmiFO
	 LIytTpUzQ4sVEghDtjXeHx4XNsFCeRVbKUMH5/Hew9LOHsrVIhik+xHjfXgHA78kk4
	 2YW7yJzkaNXgomlrx2uLLAcotDypmWf7wovXTTY4=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 25 Nov 2026 14:40:35 +0000
Subject: [PATCH v4 13/13] irqchip/gic-v5: Invalidate the L1 DTE when
 allocating an L2 device table
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-host_gicv5_fixes-v4-13-0469743c47d8@arm.com>
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
X-CRM114-CacheID: sfid-20261125_064059_515824_264143F1 
X-CRM114-Status: GOOD (  13.31  )
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

Allocating an L2 device table makes its parent L1 DTE valid, but the
single-device invalidation performed during device registration does
not invalidate that L1 DTE. An ITS that cached the L1 DTE while it was
invalid can therefore continue dropping events for DeviceIDs in its
range.

Invalidate the L1 DTE and wait for completion immediately after
publishing the new L2 table. This also covers a registration that
subsequently fails, leaving the L2 table allocated and its parent L1
DTE valid. Keep single-device invalidations for device registration
and teardown when updating individual L2 DTEs.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Reported-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20261112145814.853424-1-fuad.tabba@linux.dev
---
 drivers/irqchip/irq-gic-v5-its.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 959277c74b68..87218ff05d7b 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -383,17 +383,17 @@ static __le64 *gicv5_its_device_get_itte_ref(struct gicv5_its_dev *its_dev,
 	return &l2_itt[l2_idx];
 }
 
-static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
-				      struct gicv5_its_dev *its_dev)
+static int __gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
+					u32 device_id, u8 event_id_bits, bool l1)
 {
 	u32 devicer;
 	u64 didr;
 
-	didr = FIELD_PREP(GICV5_ITS_DIDR_DEVICEID, its_dev->device_id);
+	didr = FIELD_PREP(GICV5_ITS_DIDR_DEVICEID, device_id);
 	devicer = FIELD_PREP(GICV5_ITS_INV_DEVICER_I, 0x1)	|
 		  FIELD_PREP(GICV5_ITS_INV_DEVICER_EVENTID_BITS,
-			     its_dev->itt_cfg.event_id_bits)	|
-		  FIELD_PREP(GICV5_ITS_INV_DEVICER_L1, 0x0);
+			     event_id_bits)			|
+		  FIELD_PREP(GICV5_ITS_INV_DEVICER_L1, l1);
 
 	guard(raw_spinlock_irqsave)(&its->inv_lock);
 
@@ -403,6 +403,13 @@ static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
 	return gicv5_its_cache_sync(its);
 }
 
+static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
+				      struct gicv5_its_dev *its_dev)
+{
+	return __gicv5_its_device_cache_inv(its, its_dev->device_id,
+					    its_dev->itt_cfg.event_id_bits, false);
+}
+
 /*
  * Allocate a level 2 device table entry, update L1 parent to reference it.
  * Only used for 2-level device tables, and it is called on demand.
@@ -442,7 +449,12 @@ static int gicv5_its_alloc_l2_devtab(struct gicv5_its_chip_data *its,
 		FIELD_PREP(GICV5_DTL1E_VALID, 0x1);
 	its_write_table_entry(its, &l1devtab[l1_index], l1dte);
 
-	return 0;
+	/*
+	 * Invalidate any cached L1 DTE before using the new L2 table.
+	 * With L1 set, EVENTID_BITS uses the maximum ITS_IDR2.EVENTID_BITS
+	 * value regardless of the supplied value.
+	 */
+	return __gicv5_its_device_cache_inv(its, l1_index << l2_bits, 0, true);
 }
 
 static __le64 *gicv5_its_devtab_get_dte_ref(struct gicv5_its_chip_data *its,

-- 
2.34.1


