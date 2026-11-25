Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DDD606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 14:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k68b1Ifo;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=HoWOOWuL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/GANqmntd68P9lT6D3dbJ7EW1jyae4sFpw8dyIWsye8=; b=k68b1IfoXpeWXB
	FFYh1i5i7AS+4U/LnDB6VJ6sBvxulJvsqrsR1gfkn3g4H5ObLB391V9HVjE8yXR9mASmRJ3hCnqRV
	lsarFvMM5BwHUce3JA/0n0ST4+iBMRW61O63q/BGlIRZ7W0a05gghhdnbex3bzUnA+FmQxc8K0rDx
	41LnsKtHCdGZ5GIOIjNeF9EtWx6ow3OyVDq9jtI2FUNATVVkYu7D0KxaYzT3hjFSZ1M0CaLVXo3gv
	N4qz0//AUsZLQnWaa8R6fwg2YEEc+AQYdKSA8cwPYX1xaV1kiia216xN1Z0tdCHdlqcbFKwNPF51c
	zDhn/XwkMSySNJmTwZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEB6-0000000AC8y-2KVD;
	Wed, 25 Nov 2026 14:40:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWEAs-0000000AC2o-0su6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 14:40:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 620211762;
	Wed, 25 Nov 2026 06:40:38 -0800 (PST)
Received: from e133894.arm.com (e133894.arm.com [10.2.80.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C690E3F632;
	Wed, 25 Nov 2026 06:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795617641; bh=ebzFg5Tw/7vhKH7rfg1W+Qv8NkWZ3cdeJqFbn94l4ps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HoWOOWuLwFTbZIq11Rh5WvDp5C/Mivob5bD7k2iNmJPm6z8QhOqtjfuZq7VLNAQYS
	 mbJF12wtob/lNONxHkB0s+Y48bUTIs38e6QjZZZCHXa9covzg16gjRwjfmYY0Plthl
	 R2B7t0jNIERCjIm7m8Co3rGPzXqFfHJDmNkXJcps=
From: Sascha Bischoff <sascha.bischoff@arm.com>
Date: Wed, 25 Nov 2026 14:40:25 +0000
Subject: [PATCH v4 03/13] irqchip/gic-v5: Serialise IRS synchronisation
 requests
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-host_gicv5_fixes-v4-3-0469743c47d8@arm.com>
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
X-CRM114-CacheID: sfid-20261125_064042_305695_01568578 
X-CRM114-Status: GOOD (  10.74  )
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

IRS_SYNCR writes are ignored while IRS_SYNC_STATUSR.IDLE is clear.
Concurrent calls to gicv5_irs_syncr() can overlap, causing a request
to be dropped. A caller can then observe the earlier request
completing and assume that its own events have been processed.

The existing host caller is serialised by the LPI irqdomain mutex.
Upcoming KVM callers will not share that serialisation and may run
in atomic context. Serialise the request and completion poll with a
raw spinlock, and use atomic polling.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
 drivers/irqchip/irq-gic-v5-irs.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index 4edf787f3f97..ead76560ea08 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -10,6 +10,7 @@
 #include <linux/log2.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/spinlock.h>
 
 #include <linux/irqchip.h>
 #include <linux/irqchip/arm-gic-v5.h>
@@ -22,6 +23,8 @@
 #define LPI_ID_BITS_LINEAR		12
 
 static DEFINE_PER_CPU_READ_MOSTLY(struct gicv5_irs_chip_data *, per_cpu_irs_data);
+/* Synchronization requests must not overlap in an IRS Domain. */
+static DEFINE_RAW_SPINLOCK(irs_sync_lock);
 static LIST_HEAD(irs_nodes);
 
 static u32 irs_readl_relaxed(struct gicv5_irs_chip_data *irs_data,
@@ -507,10 +510,11 @@ void gicv5_irs_syncr(void)
 		return;
 
 	syncr = FIELD_PREP(GICV5_IRS_SYNCR_SYNC, 1);
+	guard(raw_spinlock_irqsave)(&irs_sync_lock);
 	irs_writel_relaxed(irs_data, syncr, GICV5_IRS_SYNCR);
 
-	gicv5_wait_for_op(irs_data->irs_base, GICV5_IRS_SYNC_STATUSR,
-			  GICV5_IRS_SYNC_STATUSR_IDLE);
+	gicv5_wait_for_op_atomic(irs_data->irs_base, GICV5_IRS_SYNC_STATUSR,
+				 GICV5_IRS_SYNC_STATUSR_IDLE, NULL);
 }
 
 int gicv5_irs_register_cpu(int cpuid)

-- 
2.34.1


