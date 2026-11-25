Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8D2606A336
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pukp/n/K;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kMiMzTAB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SO8Hr/Fl+8debprOMQuSjXe3B5PXGw8YoggDIyD/DsE=; b=pukp/n/KZImcht
	l4KCenCLHvRHPAKwpaJGdKBZkFdC9qLRK25KHF302jpQG/IU75/L1mnxQTQf9BhfrjViZ3/Y0TIx5
	yMnyUBuqG02afyAI7RTDdY4TXvPJTq1TNHtwBpP1LhO1LNoG78c4G/BNVTB+i3nzPiUTxhEBvMWJP
	AaknecuSqspEUDp2CeSW1OQByqcwZpFMn+gfa+lfXKctfBg42g1iQo13yAAg9X4wihcVo6wfAlrJH
	Vw3IJ+G/hWucwG7KsWOgHprjMoffavessqqEXykqvkSVnB9Wg+ZgkgYnP2n8+WUNOb2eaGXBPVxX+
	X0G1dyMRQ7xGmYYP0A5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEB7-0000000ACBT-3bMP;
	Wed, 25 Nov 2026 14:40:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEB2-0000000AC6e-1DhX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:40:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E50031BD0;
	Wed, 25 Nov 2026 06:40:48 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 563593F632;
	Wed, 25 Nov 2026 06:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617651; bh=zqlEy1y8XsotrPK229jQWV4LiW1Z+QmAZyRPajzeCxU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kMiMzTAB6Z1VsR/ZyNVGm6DpKhKlY4pgZlCPH4eH5aWZc5xJEVX0Y4yAp34nyeK9Z
	 XrZnGXPhcZN7pHV6s9R8BOOw1VmrDhLWo5l+op+Ly7w0NmdA4jTef/S3eKaW97pmD5
	 dHOuO7c6GYfGKk7Qig9xniSdLZdwBxaVSR05/8rY=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 25 Nov 2026 14:40:31 +0000
Subject: [PATCH v4 09/13] irqchip/gic-v5: Clean the allocated linear device
 table size
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-host_gicv5_fixes-v4-9-0469743c47d8@arm.com>
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
X-CRM114-CacheID: sfid-20261125_064052_987188_DC303EFD 
X-CRM114-Status: GOOD (  11.84  )
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

When the linear device table exceeds the kmalloc limit, the driver
caps the DeviceID width before allocation but keeps the original size
for cache maintenance. On a noncoherent ITS, this cleans beyond the
allocated table.

Recalculate the size after capping the DeviceID width.

Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: stable@vger.kernel.org
---
 drivers/irqchip/irq-gic-v5-its.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index dce5bfd1a78d..e7db4449fe91 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -594,14 +594,14 @@ static int gicv5_its_alloc_devtab_linear(struct gicv5_its_chip_data *its,
 	 * kmalloc limits so that the system can chug along with a linear
 	 * device table.
 	 */
-	sz = BIT_ULL(device_id_bits) * sizeof(*devtab);
-	if (sz > KMALLOC_MAX_SIZE) {
-		u8 device_id_cap = ilog2(KMALLOC_MAX_SIZE/sizeof(*devtab));
+	if (BIT_ULL(device_id_bits) * sizeof(*devtab) > KMALLOC_MAX_SIZE) {
+		u8 device_id_cap = ilog2(KMALLOC_MAX_SIZE / sizeof(*devtab));
 
 		pr_warn("Limiting device ID bits from %u to %u\n",
 			device_id_bits, device_id_cap);
 		device_id_bits = device_id_cap;
 	}
+	sz = BIT_ULL(device_id_bits) * sizeof(*devtab);
 
 	devtab = kzalloc_objs(*devtab, BIT(device_id_bits));
 	if (!devtab)

-- 
2.34.1


