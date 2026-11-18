Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3B1606CA76
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 17:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a2DS5S2e;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=CvtEomsE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OHstQ0JYZUrsLqwWcoko7GWdw5mEgCrc6XUjx6ToQKM=; b=a2DS5S2e6WFJX+
	TnAM0NU8CpIetbaCqTTMd4UDgVHjNFpeWT5kWnORE+OJNz6tv5rVWIhWSJqSoVvEiPvV3XlvT14HL
	Myt1qoIEXuISdIiSL86FMeHgyWcB7coXsxlCVpbJxwdp41zkW57QOEhoRiAk5aFsKZsryGfQ+kvrT
	k74y15XVrzosvIzU2VYdU80yBruG6kgRaW289Qan8QXNnBpAmBBq/Tv8uOH6La16XHhKDP1pYgT8C
	nOUOML2jg5RAmwVaxY/j9xwcGEsFcqrP3iZd/CIvipBiUnAmQ+Cv5pTy5/WHU1r07A3vRxPXQq2qP
	cOg7+fYspl2ictjgJ9yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjZr-00000009mh2-0bRG;
	Wed, 18 Nov 2026 17:36:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjZl-00000009mcu-0emU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 17:36:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB9601477;
	Wed, 18 Nov 2026 09:36:00 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C99153F632;
	Wed, 18 Nov 2026 09:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795023363; bh=C9wq7t7vi5DkZGv7bjayDlpCJKB/Nv8vETEEU8P+2s0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CvtEomsEISaQdL6L5DoAJ038wrAqyMxp2OHM35l2Ddw2CLVi1aIpXDYP5RRhlO0ht
	 zIEybOUNP6Zp1I0X9RC6qPZ2Zl2KK3z8sdwfrEdMuu1oygOUdJfZauvuav1g0r6BaD
	 w3V8sFLA30974i2XfJnJovDD8F9vkGqkMOrPQusk=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 18 Nov 2026 17:35:34 +0000
Subject: [PATCH v3 05/14] irqchip/gic-v5: Serialise ITS invalidation
 commands
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-host_gicv5_fixes-v3-5-13c1859e8aa3@arm.com>
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
In-Reply-To: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com>
To: Marc Zyngier <maz@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Fuad Tabba <fuad.tabba@linux.dev>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Sashiko AI <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_093605_299997_E341659F 
X-CRM114-Status: GOOD (  11.00  )
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

The ITS uses the shared DIDR and EIDR registers to select the DeviceID
and EventID to invalidate. Event invalidations for different IRQs can
overlap, as can an event invalidation and a device invalidation. The
per-IRQ descriptor lock does not serialise these commands, so
concurrent writes can cause an invalidation to use the DeviceID or
EventID set by another concurrent invalidation.

Serialise the command register writes and STATUSR.IDLE polls for both
invalidation paths with a per-ITS raw spinlock. Use atomic polling
while holding the lock.

Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
Reported-by: Sashiko AI <sashiko-bot@kernel.org>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: stable@vger.kernel.org
Link: https://sashiko.dev/#/patchset/20261016155741.979985-1-sascha.bischoff@arm.com?part=11
---
 drivers/irqchip/irq-gic-v5-its.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index f876dc0de1b96..88d18822a1ff4 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -16,6 +16,7 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 
 #include <linux/irqchip.h>
 #include <linux/irqchip/arm-gic-v5.h>
@@ -28,6 +29,8 @@
 struct gicv5_its_chip_data {
 	struct	xarray			its_devices;
 	struct	mutex			dev_alloc_lock;
+	/* Event and device invalidation commands share DIDR. */
+	raw_spinlock_t			inv_lock;
 	struct	fwnode_handle		*fwnode;
 	struct gicv5_its_devtab_cfg	devtab_cfgr;
 	void	__iomem			*its_base;
@@ -129,6 +132,8 @@ static int gicv5_its_itt_cache_inv(struct gicv5_its_chip_data *its, u32 device_i
 	eidr = FIELD_PREP(GICV5_ITS_EIDR_EVENTID, event_id);
 	eventr = FIELD_PREP(GICV5_ITS_INV_EVENTR_I, 0x1);
 
+	guard(raw_spinlock_irqsave)(&its->inv_lock);
+
 	its_writeq_relaxed(its, didr, GICV5_ITS_DIDR);
 	its_writel_relaxed(its, eidr, GICV5_ITS_EIDR);
 	its_writel_relaxed(its, eventr, GICV5_ITS_INV_EVENTR);
@@ -371,6 +376,9 @@ static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
 		  FIELD_PREP(GICV5_ITS_INV_DEVICER_EVENTID_BITS,
 			     its_dev->itt_cfg.event_id_bits)	|
 		  FIELD_PREP(GICV5_ITS_INV_DEVICER_L1, 0x0);
+
+	guard(raw_spinlock_irqsave)(&its->inv_lock);
+
 	its_writeq_relaxed(its, didr, GICV5_ITS_DIDR);
 	its_writel_relaxed(its, devicer, GICV5_ITS_INV_DEVICER);
 
@@ -1112,6 +1120,7 @@ static int __init gicv5_its_init_bases(void __iomem *its_base, struct fwnode_han
 		return -ENOMEM;
 
 	mutex_init(&its_node->dev_alloc_lock);
+	raw_spin_lock_init(&its_node->inv_lock);
 	xa_init(&its_node->its_devices);
 	its_node->fwnode = handle;
 	its_node->its_base = its_base;

-- 
2.34.1


