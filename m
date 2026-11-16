Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D0D606A334
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mP59eBwf;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=vbYuXuIp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Y3aLM1H7iEvnRApaJAI01zW5jN8Rckd1vOMeNTAd9H0=; b=mP59eBwfg+R3Gs
	UZYiNT2kRFjj3PXlRzkzpDKe2ozxJXPn9NqnX9ZsIZN5R3PabYLAJ4crk9zVEyTyKp664pc77hDuB
	FgUcm9Ui86Oxm5GZr/e3Hwgt00aXBzkTpooT1GYjTUMeqFm3QBWOjMpZSkucnOcVpOBusCYUzeZkt
	kj66GeikMwHdSTSh3t4BNb8BsPiOtMl/jkMOYMl8RKx3hHFLsYunC7SiyFOlPZumq3PV783bUe30s
	2GqpH/BH6MK9lTBaQRrJvT+e9t695THJXMob2akFztAwZRufD/6m3PLbYzImXCtsZWShLOi5LQlRD
	HQRYidqfbmMMoAXXlxRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1LY-00000003Wa0-2omw;
	Mon, 16 Nov 2026 18:22:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1LW-00000003WYO-0WoP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:22:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 883321684;
	Mon, 16 Nov 2026 10:22:21 -0800 (PST)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A7CD3F632;
	Mon, 16 Nov 2026 10:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794853344; bh=xi1MhXmlAloJUYWXyD9PbM2BTAQZZcpVmn8NG9atlD8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vbYuXuIpnYEcXG7zbNgG7YLXdzAELVIWYn62/r7cQ+m7UIlbYjCxKGF6UynnxZHYI
	 dYW02xOr/1Z6HKsnPo7S4g/9itWHYdeHtCvwV8EnjgUEc4Um8WFqsIHQZLclkqT81F
	 cem/XjXHzgDLGFKfu3fNggXXWYiNihiYgogN4CaA=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 16 Nov 2026 18:21:30 +0000
Subject: [PATCH 3/8] perf/arm_pmu: Register ACPI SPE and TRBE devices with
 software nodes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-acpi_arm_pmu_registration_hmp-v1-3-0371d4eca626@arm.com>
References: <20261116-acpi_arm_pmu_registration_hmp-v1-0-0371d4eca626@arm.com>
In-Reply-To: <20261116-acpi_arm_pmu_registration_hmp-v1-0-0371d4eca626@arm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>, Will Deacon <will@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Hanjun Guo <guohanjun@huawei.com>, Jeremy Linton <jeremy.linton@arm.com>, 
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, Rob Herring <robh@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, Al Grant <al.grant@arm.com>, 
 "Johnny.Fan" <johnny.fan@cixtech.com>, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794853327; l=12374;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=RhPdV6oYh3rD01IAOheylAh2b5QHOZHX8TkzYtK9v1M=;
 b=8jj84FuQbFyT19dBbuoO2CngSuyagqrl/6PhWutvc2zYjkE7+YlslbQNfd/Nmn1wnyA0UfWFa
 IdwJlsJzieTDBTOmoFutwIrIcAymBITR5Olr+ahcUz0ibgscN2SEZV8
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_102226_272150_75322D4E 
X-CRM114-Status: GOOD (  27.92  )
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

From: "Johnny.Fan" <johnny.fan@cixtech.com>

The MADT describes SPE and TRBE interrupts per CPU, without providing an
ACPI namespace device for each group of compatible CPUs. The existing
registration only supports a homogeneous system.

Group initialized CPUs by MIDR and register one platform device per
group through a common descriptor-based entry point. Keep each CPU's GSI
and CPU number in a mapping record until IRQ resource setup. Deduplicate
shared GSIs and use arm_acpi_pmu_irq_matches() to require the same
mapped IRQ within each group. Warn and exclude CPUs with inconsistent
PPIs.

Associate a software node containing the group's IRQ affinity so drivers
can obtain the CPU mask through platform_get_irq_affinity() without
ACPI-specific handling or a processor-container companion. Create IRQ
resources first, then use arm_acpi_register_sw_node_irq_affinity() to
store the filtered group's PPI affinity at index zero.

Although SPE and TRBE need only one shared PPI per group, introduce
nr_irqs and the irq_maps[] array now to simplify adding CPU PMU support
with per-CPU SPIs in a later patch.

Signed-off-by: Johnny.Fan <johnny.fan@cixtech.com>
Co-developed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/perf/arm_pmu_acpi.c | 350 ++++++++++++++++++++++++++++++++++----------
 1 file changed, 274 insertions(+), 76 deletions(-)

diff --git a/drivers/perf/arm_pmu_acpi.c b/drivers/perf/arm_pmu_acpi.c
index ca6bf8f86cfe9be0dc351e41bd620d1d37028dfa..7ae291acb04526d820bdfb9640aaa8352449be54 100644
--- a/drivers/perf/arm_pmu_acpi.c
+++ b/drivers/perf/arm_pmu_acpi.c
@@ -7,11 +7,15 @@
 
 #include <linux/acpi.h>
 #include <linux/cpumask.h>
+#include <linux/err.h>
 #include <linux/init.h>
 #include <linux/irq.h>
 #include <linux/irqdesc.h>
 #include <linux/percpu.h>
 #include <linux/perf/arm_pmu.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
 
 #include <asm/cpu.h>
 #include <asm/cputype.h>
@@ -68,92 +72,297 @@ static void arm_pmu_acpi_unregister_irq(int cpu)
 		acpi_unregister_gsi(gsi);
 }
 
-static int __maybe_unused
-arm_acpi_register_pmu_device(struct platform_device *pdev, u8 len,
-			     u16 (*parse_gsi)(struct acpi_madt_generic_interrupt *))
+struct arm_pmu_acpi_device_info {
+	const char *name;
+	u8 len;
+	u32 (*parse_gsi)(struct acpi_madt_generic_interrupt *gicc);
+};
+
+struct arm_pmu_acpi_irq_map {
+	u32 gsi;
+	int cpu;
+	int irq;	/* Nonzero only for mappings created by this group */
+};
+
+struct arm_pmu_acpi_group {
+	struct cpumask cpus;
+	int nr_irqs;
+	struct arm_pmu_acpi_irq_map irq_maps[];
+};
+
+static struct arm_pmu_acpi_group *
+arm_acpi_alloc_pmu_group(struct arm_pmu_acpi_group **groups, int *nr_groups,
+			 int cpu)
 {
-	int cpu, this_hetid, hetid, irq, ret;
-	u16 this_gsi = 0, gsi = 0;
+	struct arm_pmu_acpi_group *group;
+	unsigned long midr;
+	int i;
 
-	/*
-	 * Ensure that platform device must have IORESOURCE_IRQ
-	 * resource to hold gsi interrupt.
-	 */
-	if (pdev->num_resources != 1)
-		return -ENXIO;
+	midr = per_cpu(cpu_data, cpu).reg_midr;
 
-	if (pdev->resource[0].flags != IORESOURCE_IRQ)
-		return -ENXIO;
+	for (i = 0; i < *nr_groups; i++) {
+		int other;
+
+		group = groups[i];
+		other = cpumask_first(&group->cpus);
+		if (midr != per_cpu(cpu_data, other).reg_midr)
+			continue;
+
+		return group;
+	}
+
+	group = kzalloc_flex(*group, irq_maps, nr_cpu_ids, GFP_KERNEL);
+	if (!group)
+		return ERR_PTR(-ENOMEM);
+	groups[(*nr_groups)++] = group;
+
+	return group;
+}
+
+static void arm_acpi_free_pmu_groups(struct arm_pmu_acpi_group **groups,
+				     int nr_groups)
+{
+	int i;
+
+	for (i = 0; i < nr_groups; i++)
+		kfree(groups[i]);
+
+	kfree(groups);
+}
+
+static struct arm_pmu_acpi_group **
+arm_acpi_alloc_pmu_groups(const struct arm_pmu_acpi_device_info *info,
+			 int *nr_groups_out)
+{
+	struct arm_pmu_acpi_group **groups;
+	int cpu, nr_groups = 0;
+
+	*nr_groups_out = 0;
+
+	groups = kcalloc(num_possible_cpus(), sizeof(*groups), GFP_KERNEL);
+	if (!groups)
+		return NULL;
 
-	/*
-	 * Sanity check all the GICC tables for the same interrupt
-	 * number. For now, only support homogeneous ACPI machines.
-	 */
 	for_each_possible_cpu(cpu) {
 		struct acpi_madt_generic_interrupt *gicc;
+		struct arm_pmu_acpi_group *group;
+		u32 gsi;
+
+		/* CPUs that have never booted have no saved MIDR */
+		if (!per_cpu(cpu_data, cpu).reg_midr)
+			continue;
 
 		gicc = acpi_cpu_get_madt_gicc(cpu);
-		if (gicc->header.length < len)
-			return gsi ? -ENXIO : 0;
-
-		this_gsi = parse_gsi(gicc);
-		this_hetid = find_acpi_cpu_topology_hetero_id(cpu);
-		if (!gsi) {
-			hetid = this_hetid;
-			gsi = this_gsi;
-		} else if (hetid != this_hetid || gsi != this_gsi) {
-			pr_warn("ACPI: %s: must be homogeneous\n", pdev->name);
-			return -ENXIO;
+		if (gicc->header.length < info->len) {
+			pr_warn("ACPI: %s: miss GICC entries\n", info->name);
+			goto out_free;
 		}
+		gsi = info->parse_gsi(gicc);
+		if (!gsi)
+			continue;
+
+		group = arm_acpi_alloc_pmu_group(groups, &nr_groups, cpu);
+		if (IS_ERR(group))
+			goto out_free;
+
+		if (gsi) {
+			struct arm_pmu_acpi_irq_map *map =
+				&group->irq_maps[group->nr_irqs++];
+
+			map->gsi = gsi;
+			map->cpu = cpu;
+		}
+		cpumask_set_cpu(cpu, &group->cpus);
 	}
 
-	if (!this_gsi)
+	*nr_groups_out = nr_groups;
+	return groups;
+
+out_free:
+	arm_acpi_free_pmu_groups(groups, nr_groups);
+	return NULL;
+}
+
+static void arm_acpi_unregister_irq_resource(struct arm_pmu_acpi_group *group)
+{
+	int i;
+
+	/* Leave mappings reused from another group or device intact */
+	for (i = 0; i < group->nr_irqs; i++) {
+		struct arm_pmu_acpi_irq_map *map = &group->irq_maps[i];
+
+		if (!map->irq)
+			continue;
+
+		acpi_unregister_gsi(map->gsi);
+		map->irq = 0;
+	}
+}
+
+static bool arm_acpi_pmu_irq_matches(unsigned int irq, unsigned int other_irq)
+{
+	return irq == other_irq;
+}
+
+static int arm_acpi_map_gsi_irq(u32 gsi, int *irq)
+{
+	unsigned int existing_irq;
+
+	if (!acpi_gsi_to_irq(gsi, &existing_irq)) {
+		*irq = existing_irq;
+		return 0;
+	}
+
+	/* PMU overflow is level-sensitive; ignore the MADT edge flag */
+	*irq = acpi_register_gsi(NULL, gsi, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_HIGH);
+	return *irq;
+}
+
+static int arm_acpi_register_irq_resource(struct platform_device *pdev,
+					  struct arm_pmu_acpi_group *group)
+{
+	struct resource *res;
+	int i, j, nr_irqs = group->nr_irqs, ret;
+
+	if (!nr_irqs)
 		return 0;
 
-	irq = acpi_register_gsi(NULL, gsi, ACPI_LEVEL_SENSITIVE, ACPI_ACTIVE_HIGH);
-	if (irq < 0) {
-		pr_warn("ACPI: %s Unable to register interrupt: %d\n", pdev->name, gsi);
-		return -ENXIO;
+	res = kcalloc(nr_irqs, sizeof(*res), GFP_KERNEL);
+	if (!res)
+		return -ENOMEM;
+
+	group->nr_irqs = 0;
+	for (i = 0; i < nr_irqs; i++) {
+		struct arm_pmu_acpi_irq_map map = group->irq_maps[i];
+		int irq;
+
+		/* Shared GSIs need one resource */
+		for (j = 0; j < group->nr_irqs; j++) {
+			if (group->irq_maps[j].gsi == map.gsi)
+				break;
+		}
+		if (j < group->nr_irqs)
+			continue;
+
+		/*
+		 * On success, irq contains the mapped IRQ, whether new or
+		 * existing. The return value is positive for a new mapping
+		 * and zero for reuse.
+		 */
+		ret = arm_acpi_map_gsi_irq(map.gsi, &irq);
+		if (ret < 0)
+			goto out_free;
+
+		/* A group must use the same PPI */
+		if (group->nr_irqs && !arm_acpi_pmu_irq_matches(irq, res[0].start)) {
+			pr_warn("ACPI: %s: CPU%d has inconsistent PPI in group, ignoring CPU\n",
+				pdev->name, map.cpu);
+			cpumask_clear_cpu(map.cpu, &group->cpus);
+			/* Leave reused mappings intact */
+			if (ret > 0)
+				acpi_unregister_gsi(map.gsi);
+			continue;
+		}
+
+		map.irq = ret;
+		group->irq_maps[group->nr_irqs] = map;
+		res[group->nr_irqs++] = DEFINE_RES_IRQ(irq);
 	}
 
-	pdev->resource[0].start = irq;
-	ret = platform_device_register(pdev);
+	ret = platform_device_add_resources(pdev, res, group->nr_irqs);
+
+out_free:
+	kfree(res);
+	return ret;
+}
+
+static int arm_acpi_register_sw_node_irq_affinity(struct platform_device *pdev,
+						 struct arm_pmu_acpi_group *group)
+{
+	int ret;
+
+	/* A MIDR group may span several processor containers */
+	ret = device_create_managed_software_node(&pdev->dev, NULL, NULL);
 	if (ret)
-		acpi_unregister_gsi(gsi);
+		return ret;
+
+	return software_node_add_irq_affinity(dev_fwnode(&pdev->dev), 0,
+					      &group->cpus);
+}
+
+static int arm_acpi_register_pmu_device(struct arm_pmu_acpi_group *group,
+					const char *name, int id)
+{
+	struct platform_device *pdev;
+	int ret;
+
+	pdev = platform_device_alloc(name, id);
+	if (!pdev)
+		return -ENOMEM;
+
+	ret = arm_acpi_register_irq_resource(pdev, group);
+	if (ret)
+		goto out_put;
+
+	ret = arm_acpi_register_sw_node_irq_affinity(pdev, group);
+	if (ret)
+		goto out_put;
 
+	ret = platform_device_add(pdev);
+	if (ret)
+		goto out_put;
+
+	return 0;
+
+out_put:
+	platform_device_put(pdev);
+	arm_acpi_unregister_irq_resource(group);
 	return ret;
 }
 
-#if IS_ENABLED(CONFIG_ARM_SPE_PMU)
-static struct resource spe_resources[] = {
-	{
-		/* irq */
-		.flags          = IORESOURCE_IRQ,
+static int __maybe_unused
+arm_acpi_register_pmu_devices(const struct arm_pmu_acpi_device_info *info)
+{
+	struct arm_pmu_acpi_group **groups;
+	int i, nr_groups, nr_devices = 0, last_err = 0, ret;
+
+	groups = arm_acpi_alloc_pmu_groups(info, &nr_groups);
+	if (!groups)
+		return -ENOMEM;
+
+	for (i = 0; i < nr_groups; i++) {
+		if (!groups[i])
+			continue;
+
+		ret = arm_acpi_register_pmu_device(groups[i], info->name, i);
+		if (ret) {
+			pr_warn("ACPI: %s: %*pbl: add device failed (%d)\n",
+				info->name, cpumask_pr_args(&groups[i]->cpus), ret);
+			last_err = ret;
+		} else {
+			nr_devices++;
+		}
 	}
-};
 
-static struct platform_device spe_dev = {
-	.name = ARMV8_SPE_PDEV_NAME,
-	.id = -1,
-	.resource = spe_resources,
-	.num_resources = ARRAY_SIZE(spe_resources)
-};
+	arm_acpi_free_pmu_groups(groups, nr_groups);
+	return nr_devices ? 0 : last_err;
+}
 
-static u16 arm_spe_parse_gsi(struct acpi_madt_generic_interrupt *gicc)
+#if IS_ENABLED(CONFIG_ARM_SPE_PMU)
+static u32 arm_spe_parse_gsi(struct acpi_madt_generic_interrupt *gicc)
 {
 	return gicc->spe_interrupt;
 }
 
-/*
- * For lack of a better place, hook the normal PMU MADT walk
- * and create a SPE device if we detect a recent MADT with
- * a homogeneous PPI mapping.
- */
 static void arm_spe_acpi_register_device(void)
 {
-	int ret = arm_acpi_register_pmu_device(&spe_dev, ACPI_MADT_GICC_SPE,
-					       arm_spe_parse_gsi);
-	if (ret)
+	static const struct arm_pmu_acpi_device_info info = {
+		.name = ARMV8_SPE_PDEV_NAME,
+		.len = ACPI_MADT_GICC_SPE,
+		.parse_gsi = arm_spe_parse_gsi,
+	};
+
+	if (arm_acpi_register_pmu_devices(&info))
 		pr_warn("ACPI: SPE: Unable to register device\n");
 }
 #else
@@ -163,36 +372,25 @@ static inline void arm_spe_acpi_register_device(void)
 #endif /* CONFIG_ARM_SPE_PMU */
 
 #if IS_ENABLED(CONFIG_CORESIGHT_TRBE)
-static struct resource trbe_resources[] = {
-	{
-		/* irq */
-		.flags          = IORESOURCE_IRQ,
-	}
-};
-
-static struct platform_device trbe_dev = {
-	.name = ARMV8_TRBE_PDEV_NAME,
-	.id = -1,
-	.resource = trbe_resources,
-	.num_resources = ARRAY_SIZE(trbe_resources)
-};
-
-static u16 arm_trbe_parse_gsi(struct acpi_madt_generic_interrupt *gicc)
+static u32 arm_trbe_parse_gsi(struct acpi_madt_generic_interrupt *gicc)
 {
 	return gicc->trbe_interrupt;
 }
 
 static void arm_trbe_acpi_register_device(void)
 {
-	int ret = arm_acpi_register_pmu_device(&trbe_dev, ACPI_MADT_GICC_TRBE,
-					       arm_trbe_parse_gsi);
-	if (ret)
+	static const struct arm_pmu_acpi_device_info info = {
+		.name = ARMV8_TRBE_PDEV_NAME,
+		.len = ACPI_MADT_GICC_TRBE,
+		.parse_gsi = arm_trbe_parse_gsi,
+	};
+
+	if (arm_acpi_register_pmu_devices(&info))
 		pr_warn("ACPI: TRBE: Unable to register device\n");
 }
 #else
 static inline void arm_trbe_acpi_register_device(void)
 {
-
 }
 #endif /* CONFIG_CORESIGHT_TRBE */
 

-- 
2.34.1


