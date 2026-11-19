Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3713606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1Qrj9CG4;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=VcrTYhxN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Zfbl7z+Ezff8RKjY41cGTXI7HmNsjcTB1S41dIhkeYk=; b=1Qrj9CG4RbTaVBSWfn+wAZiX/n
	bEvaYS/SBaiaCHbB8zPBIZ2nC2u8A5NODXKOAOk6FE6sJx5aygz2zsfXo7ieR/veyDdr31KmdHnCd
	zjOflIU+QlfbyuSD+R07riK62qc9Vd8tSwFonWuIIY1EGtN6okfUi2M1+/XYRMzXYsSPMC52kB4Oc
	mWVvxLVkqgnQuCOg7hM9VnQf4ZC5mYkbUcwqdIajrYY0Ktj6UM3Ot8gXYFXc1rSxvAH7IOV2NLji3
	S9dDpui7uH2kSDk2XDw8X55orDlTJkBGDZBuV5UHwIuxqAkLqPAVAxHo4WFLTT7Vc+M71XqJI6U1F
	edDvBsng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU75q-0000000D2Qo-40Pg;
	Thu, 19 Nov 2026 18:42:46 +0000
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com ([50.112.246.219])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU75o-0000000D2QK-26uJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1795113764; x=1826649764;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Zfbl7z+Ezff8RKjY41cGTXI7HmNsjcTB1S41dIhkeYk=;
  b=VcrTYhxNM116REU1CIWZ4C7zHUa9Nbqmn+KNzrW+rJM+clTTIRlzp7w9
   ncd8s2s2IsQrLvEQOVWEPyDtohJrp+Hg+3e/xCfY6F25H66LrF5iEDHNA
   K3HOfN/RdaQ1RyoAjQUyvPHnYSmPQSFS6m6EPuvnUCYfDPVk8MV03oZVc
   l5TNNHOpEOt/n+WzxkVbWEBhb7xogr+S/tG8RWvNxolDQeYfpdbp5PLTq
   Duo7jzOM8bHn/JrYUCirMUygIoko//5FeZGZSdWM02z8mD2MOPXx39P3J
   6iX1rY2sZq2ktd3/kisb/dJEFzIjJq4NprG+FDi4FVALBSlK4B4xi+6Iv
   A==;
X-CSE-ConnectionGUID: hqUjQN9/QcqZrgGk5zQFFw==
X-CSE-MsgGUID: gDvD7OBNT+mKq0LFeqrgDQ==
X-IronPort-AV: E=Sophos;i="6.27,221,1787011200"; 
   d="scan'208";a="34426166"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 18:42:39 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:16553]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.46.128:2525] with esmtp (Farcaster)
 id 07449928-09f5-4e12-b385-e2495c4c75b7; Thu, 19 Nov 2026 18:42:38 +0000 (UTC)
X-Farcaster-Flow-ID: 07449928-09f5-4e12-b385-e2495c4c75b7
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 19 Nov 2026 18:42:38 +0000
Received: from dev-dsk-machaujo-1c-d6b511e2.eu-west-1.amazon.com
 (10.253.100.8) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57; Thu, 19 Nov 2026
 18:42:36 +0000
From: Joshua Machauer <machaujo@amazon.de>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <nh-open-source@amazon.com>
Subject: [PATCH v2] irqchip/gic-v3: Fill in each CPU's redistributor from the init walk
Date: Thu, 19 Nov 2026 18:42:29 +0000
Message-ID: <20261119184229.57556-1-machaujo@amazon.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <867bj6ys1q.wl-maz@kernel.org>
References: <867bj6ys1q.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA004.ant.amazon.com (10.13.139.19) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_104244_645034_CCDB1DA4 
X-CRM114-Status: GOOD (  24.60  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A CPU coming online finds its redistributor by walking the frames from
the first one until GICR_TYPER matches its affinity. CPU n therefore
performs O(n) MMIO reads, and bringing up N CPUs costs O(N^2).
Secondary CPUs boot serially, so all of it adds to boot time.

gic_update_rdist_properties() already walks every frame once at boot.
Give each frame to the possible CPU it belongs to there, by setting that
CPU's rd_base and phys_base and initialising its rd_lock. A CPU coming
online then finds its frame assigned and does no MMIO at all. A CPU
absent at init, such as an ACPI online-capable CPU, still scans.

Finding the CPU compares each frame's affinity against that of every
possible CPU. That is still O(N^2) work at init, but it reads
cpu_logical_map[], which stays in the cache, instead of device memory.

inherit_vpe_l1_table_from_rd() and allocate_vpe_l2_table() take a
non-NULL rd_base to mean that the CPU has come up. Mark that with a new
RD_LOCAL_POPULATED flag instead, set in gic_populate_rdist(), and move
the RD_LOCAL_* flags to irq-gic-common.h so that both drivers see them.

NVIDIA Vera, 352 CPUs in two redistributor regions, 73 ms faster.
Without this patch:

  [    0.007441] GICv3: CPU1: found redistributor 20000 region 0:0x0000fe0040180000
  [    0.873847] GICv3: CPU351: found redistributor 100600001 region 1:0x0000fe40430c0000

With it:

  [    0.006401] GICv3: CPU1: found redistributor 20000 region 0:0x0000fe0040180000
  [    0.800722] GICv3: CPU351: found redistributor 100600001 region 1:0x0000fe40430c0000

KVM guest with 352 vCPUs on that Vera system, where every GICR_TYPER
read traps to the hypervisor, 139 ms faster. Without this patch:

  [    0.023483] GICv3: CPU1: found redistributor 100 region 0:0x0000000010240000
  [    0.433820] GICv3: CPU351: found redistributor 15701 region 0:0x0000000012de0000

With it:

  [    0.023817] GICv3: CPU1: found redistributor 100 region 0:0x0000000010240000
  [    0.295205] GICv3: CPU351: found redistributor 15701 region 0:0x0000000012de0000

Signed-off-by: Joshua Machauer <machaujo@amazon.de>
---
An LLM coding assistant drafted the code and this changelog and ran the
boot measurements. I reviewed and edited the result.

v2:
  - Fill in rd_base and phys_base instead of keeping a separate per-CPU
    copy of the frame (Marc)
  - Add RD_LOCAL_POPULATED for the two users that took a non-NULL
    rd_base to mean the CPU has come up
  - Initialise rd_lock once, where the frame is assigned, instead of
    each time the CPU comes online
  - Drop the qualifier about systems with one redistributor per CPU,
    which is every GICv3 system (Marc)
  - Rebase onto tip irq/core (v7.4-rc1)
  - Trim the test results to the NVIDIA Vera runs, remeasured on v2
---
 drivers/irqchip/irq-gic-common.h |   7 ++
 drivers/irqchip/irq-gic-v3-its.c |  11 ++-
 drivers/irqchip/irq-gic-v3.c     | 113 +++++++++++++++++++++----------
 3 files changed, 90 insertions(+), 41 deletions(-)

diff --git a/drivers/irqchip/irq-gic-common.h b/drivers/irqchip/irq-gic-common.h
index 710cab61d9195..ffe5546d6189b 100644
--- a/drivers/irqchip/irq-gic-common.h
+++ b/drivers/irqchip/irq-gic-common.h
@@ -33,4 +33,11 @@ void gic_enable_of_quirks(const struct device_node *np,
 #define RDIST_FLAGS_RD_TABLES_PREALLOCATED     (1 << 1)
 #define RDIST_FLAGS_FORCE_NON_SHAREABLE        (1 << 2)
 
+/* Per-CPU redistributor flags, in struct rdists::rdist->flags */
+#define RD_LOCAL_LPI_ENABLED                    BIT(0)
+#define RD_LOCAL_PENDTABLE_PREALLOCATED         BIT(1)
+#define RD_LOCAL_MEMRESERVE_DONE                BIT(2)
+/* The CPU has come up */
+#define RD_LOCAL_POPULATED                      BIT(3)
+
 #endif /* _IRQ_GIC_COMMON_H */
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 282e4bafb084f..ba6a6edf34230 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -50,10 +50,6 @@
 #define ITS_FLAGS_FORCE_NON_SHAREABLE		(1ULL << 3)
 #define ITS_FLAGS_WORKAROUND_HISILICON_162100801	(1ULL << 4)
 
-#define RD_LOCAL_LPI_ENABLED                    BIT(0)
-#define RD_LOCAL_PENDTABLE_PREALLOCATED         BIT(1)
-#define RD_LOCAL_MEMRESERVE_DONE                BIT(2)
-
 static u32 lpi_id_bits;
 
 /*
@@ -2802,7 +2798,8 @@ static u64 inherit_vpe_l1_table_from_rd(cpumask_t **mask)
 	for_each_possible_cpu(cpu) {
 		void __iomem *base = gic_data_rdist_cpu(cpu)->rd_base;
 
-		if (!base || cpu == smp_processor_id())
+		if (!(gic_data_rdist_cpu(cpu)->flags & RD_LOCAL_POPULATED) ||
+		    cpu == smp_processor_id())
 			continue;
 
 		val = gic_read_typer(base + GICR_TYPER);
@@ -2839,8 +2836,8 @@ static bool allocate_vpe_l2_table(int cpu, u32 id)
 	if (!gic_rdists->has_rvpeid)
 		return true;
 
-	/* Skip non-present CPUs */
-	if (!base)
+	/* Skip CPUs that have not come up yet */
+	if (!(gic_data_rdist_cpu(cpu)->flags & RD_LOCAL_POPULATED))
 		return true;
 
 	val  = gicr_read_vpropbaser(base + SZ_128K + GICR_VPROPBASER);
diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 94873646d46fb..a507d84bf8dbc 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1019,51 +1019,94 @@ static int gic_iterate_rdists(int (*fn)(struct redist_region *, void __iomem *))
 	return ret ? -ENODEV : 0;
 }
 
-static int __gic_populate_rdist(struct redist_region *region, void __iomem *ptr)
+/*
+ * Convert a CPU's affinity to a 32bit value that can be matched to
+ * GICR_TYPER bits [63:32].
+ */
+static u32 gic_cpu_to_rdist_aff(int cpu)
 {
-	unsigned long mpidr;
-	u64 typer;
-	u32 aff;
+	u64 mpidr = gic_cpu_to_affinity(cpu);
 
-	/*
-	 * Convert affinity to a 32bit value that can be matched to
-	 * GICR_TYPER bits [63:32].
-	 */
-	mpidr = gic_cpu_to_affinity(smp_processor_id());
+	return (MPIDR_AFFINITY_LEVEL(mpidr, 3) << 24 |
+		MPIDR_AFFINITY_LEVEL(mpidr, 2) << 16 |
+		MPIDR_AFFINITY_LEVEL(mpidr, 1) << 8 |
+		MPIDR_AFFINITY_LEVEL(mpidr, 0));
+}
 
-	aff = (MPIDR_AFFINITY_LEVEL(mpidr, 3) << 24 |
-	       MPIDR_AFFINITY_LEVEL(mpidr, 2) << 16 |
-	       MPIDR_AFFINITY_LEVEL(mpidr, 1) << 8 |
-	       MPIDR_AFFINITY_LEVEL(mpidr, 0));
+/* Give @cpu the redistributor frame at @ptr */
+static void gic_assign_rdist(int cpu, struct redist_region *region,
+			     void __iomem *ptr)
+{
+	raw_spin_lock_init(&per_cpu_ptr(gic_data.rdists.rdist, cpu)->rd_lock);
+	per_cpu_ptr(gic_data.rdists.rdist, cpu)->rd_base = ptr;
+	per_cpu_ptr(gic_data.rdists.rdist, cpu)->phys_base =
+		region->phys_base + (ptr - region->redist_base);
+}
 
-	typer = gic_read_typer(ptr + GICR_TYPER);
-	if ((typer >> 32) == aff) {
-		u64 offset = ptr - region->redist_base;
-		raw_spin_lock_init(&gic_data_rdist()->rd_lock);
-		gic_data_rdist_rd_base() = ptr;
-		gic_data_rdist()->phys_base = region->phys_base + offset;
-
-		pr_info("CPU%d: found redistributor %lx region %d:%pa\n",
-			smp_processor_id(), mpidr,
-			(int)(region - gic_data.redist_regions),
-			&gic_data_rdist()->phys_base);
-		return 0;
+static int __gic_find_rdist(struct redist_region *region, void __iomem *ptr)
+{
+	u64 typer = gic_read_typer(ptr + GICR_TYPER);
+
+	if ((typer >> 32) != gic_cpu_to_rdist_aff(smp_processor_id()))
+		return 1;	/* Try next one */
+
+	gic_assign_rdist(smp_processor_id(), region, ptr);
+	return 0;
+}
+
+/* The region holding @ptr: the one with the highest base not above it */
+static int gic_rdist_region_index(void __iomem *ptr)
+{
+	int i, idx = 0;
+
+	for (i = 1; i < gic_data.nr_redist_regions; i++) {
+		if (gic_data.redist_regions[i].redist_base <= ptr &&
+		    gic_data.redist_regions[i].redist_base >
+		    gic_data.redist_regions[idx].redist_base)
+			idx = i;
 	}
 
-	/* Try next one */
-	return 1;
+	return idx;
 }
 
 static int gic_populate_rdist(void)
 {
-	if (gic_iterate_rdists(__gic_populate_rdist) == 0)
-		return 0;
+	/*
+	 * The frame is normally assigned at init by
+	 * gic_update_rdist_properties(). A CPU that was absent then, such as
+	 * an ACPI online-capable CPU, scans for its frame instead.
+	 */
+	if (!gic_data_rdist_rd_base() &&
+	    gic_iterate_rdists(__gic_find_rdist)) {
+		/* We couldn't even deal with ourselves... */
+		WARN(true, "CPU%d: mpidr %lx has no re-distributor!\n",
+		     smp_processor_id(),
+		     (unsigned long)cpu_logical_map(smp_processor_id()));
+		return -ENODEV;
+	}
 
-	/* We couldn't even deal with ourselves... */
-	WARN(true, "CPU%d: mpidr %lx has no re-distributor!\n",
-	     smp_processor_id(),
-	     (unsigned long)cpu_logical_map(smp_processor_id()));
-	return -ENODEV;
+	gic_data_rdist()->flags |= RD_LOCAL_POPULATED;
+
+	pr_info("CPU%d: found redistributor %lx region %d:%pa\n",
+		smp_processor_id(),
+		(unsigned long)gic_cpu_to_affinity(smp_processor_id()),
+		gic_rdist_region_index(gic_data_rdist_rd_base()),
+		&gic_data_rdist()->phys_base);
+	return 0;
+}
+
+/* Give the frame at @ptr to the possible CPU whose affinity it reports */
+static void gic_find_rdist_cpu(struct redist_region *region, void __iomem *ptr,
+			       u64 typer)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu) {
+		if (gic_cpu_to_rdist_aff(cpu) == (typer >> 32)) {
+			gic_assign_rdist(cpu, region, ptr);
+			return;
+		}
+	}
 }
 
 static int __gic_update_rdist_properties(struct redist_region *region,
@@ -1072,6 +1115,8 @@ static int __gic_update_rdist_properties(struct redist_region *region,
 	u64 typer = gic_read_typer(ptr + GICR_TYPER);
 	u32 ctlr = readl_relaxed(ptr + GICR_CTLR);
 
+	gic_find_rdist_cpu(region, ptr, typer);
+
 	/* Boot-time cleanup */
 	if ((typer & GICR_TYPER_VLPIS) && (typer & GICR_TYPER_RVPEID)) {
 		u64 val;
-- 
2.47.3


