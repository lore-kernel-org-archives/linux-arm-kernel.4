Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEF660A2614
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bi8Zo+Yu;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Ft4tiibX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=V9fQ7V+HnC3+mZIkVBup/DL7T9dCFIK15XRUFub1Lqw=; b=bi8Zo+YuCc6Rdq
	NmgaiD6lISTMp6vBNYRn7QMsz/2wa4N1YJEUgpr4uAv4P6CvGGkGRB0wyH8KD/u8LID7fHNPyFg9E
	YGvGkXHpmaV7j+RIeXn7N++ajl7EwJsTOe0dQ7Wxs97VqH06JVAMkBW1HkiSyCtV5H1KpsYsDbTE/
	ltqS9EAQb6gN9O4CXdmiL2mi2oB4yZPGunYvJz9fK9ToT9RHpEyay4MVPxppTPjvnHL7W+5qQh8Jp
	0WDwG8miwztTdUV/d0bDBGmC0E1Bk5f/2PCzVkiyc2gvrQ8qAAxsIpan5mJw6NYrxNW+cbF0XX4do
	DH4u9D3SBFoaU4lMN7PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1Lk-00000003Wh6-0L4u;
	Mon, 16 Nov 2026 18:22:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1LZ-00000003Wad-1s58
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:22:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFDE81A25;
	Mon, 16 Nov 2026 10:22:25 -0800 (PST)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C38EF3F632;
	Mon, 16 Nov 2026 10:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794853348; bh=S8CtYSrSSXMBTx69eeGqeydEJ6als+cClSEg+DhFsW4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ft4tiibXYJqtmYg04qPoR27PIg/NV2mU5uMiLQaxae4LxwdRVGDClZTMCdgnWTilp
	 agSHCQ2E/WNtIfRc516klVJtSId+QJAKQpfzJt0hRHY3ZVRVaZLsAGtg6sWk22NI9U
	 Fp3V2wMcAleD6hUQn7oqdnXDwKD2D8HI2h/QeP44=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 16 Nov 2026 18:21:31 +0000
Subject: [PATCH 4/8] perf/arm_pmu: Prepare ACPI registration for per-CPU
 interrupts
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-acpi_arm_pmu_registration_hmp-v1-4-0371d4eca626@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794853327; l=3464;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=S8CtYSrSSXMBTx69eeGqeydEJ6als+cClSEg+DhFsW4=;
 b=PllKyyNoIOh6QzJ591v24YxRwvR//bSIPCuq5ofsE32NiW5U2NddFKqe6GVtK9iwI9jcvs/MG
 uKpcsFLYGFoDiLA7E8H8yMt+Lt5/eyabPuK65vp+6V6+3lzdK2cpFAx
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_102229_577827_4AEA24F7 
X-CRM114-Status: GOOD (  18.28  )
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

CPU PMUs may use a separate SPI for each CPU. Extend the existing IRQ
compatibility check to allow different SPIs in a group while retaining
the same-PPI requirement.

Extend arm_acpi_register_sw_node_irq_affinity() to publish a singleton
CPU mask for each SPI resource, using the CPU recorded in its mapping
entry. Keep the full group mask at index zero for a shared PPI or a
counting-only device with no IRQ resources.

Retain zero-GSI CPU PMU entries for counting-only devices. Trust
firmware to provide GICC interrupt descriptions as specified by ACPI.
SPE and TRBE remain the common registration interface's callers in this
commit.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/perf/arm_pmu_acpi.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/arm_pmu_acpi.c b/drivers/perf/arm_pmu_acpi.c
index 7ae291acb04526d820bdfb9640aaa8352449be54..6a7fa8d01f42b1b58e28541a374f005e1955598f 100644
--- a/drivers/perf/arm_pmu_acpi.c
+++ b/drivers/perf/arm_pmu_acpi.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include <linux/string.h>
 
 #include <asm/cpu.h>
 #include <asm/cputype.h>
@@ -158,7 +159,8 @@ arm_acpi_alloc_pmu_groups(const struct arm_pmu_acpi_device_info *info,
 			goto out_free;
 		}
 		gsi = info->parse_gsi(gicc);
-		if (!gsi)
+		/* CPU PMUs can count without an overflow interrupt */
+		if (!gsi && strcmp(info->name, ARMV8_PMU_PDEV_NAME))
 			continue;
 
 		group = arm_acpi_alloc_pmu_group(groups, &nr_groups, cpu);
@@ -201,7 +203,8 @@ static void arm_acpi_unregister_irq_resource(struct arm_pmu_acpi_group *group)
 
 static bool arm_acpi_pmu_irq_matches(unsigned int irq, unsigned int other_irq)
 {
-	return irq == other_irq;
+	return irq == other_irq ||
+		(!irq_is_percpu_devid(irq) && !irq_is_percpu_devid(other_irq));
 }
 
 static int arm_acpi_map_gsi_irq(u32 gsi, int *irq)
@@ -253,7 +256,7 @@ static int arm_acpi_register_irq_resource(struct platform_device *pdev,
 		if (ret < 0)
 			goto out_free;
 
-		/* A group must use the same PPI */
+		/* A group must use the same PPI or only SPIs */
 		if (group->nr_irqs && !arm_acpi_pmu_irq_matches(irq, res[0].start)) {
 			pr_warn("ACPI: %s: CPU%d has inconsistent PPI in group, ignoring CPU\n",
 				pdev->name, map.cpu);
@@ -279,15 +282,28 @@ static int arm_acpi_register_irq_resource(struct platform_device *pdev,
 static int arm_acpi_register_sw_node_irq_affinity(struct platform_device *pdev,
 						 struct arm_pmu_acpi_group *group)
 {
-	int ret;
+	struct fwnode_handle *fwnode;
+	struct resource *res;
+	int i, ret;
 
 	/* A MIDR group may span several processor containers */
 	ret = device_create_managed_software_node(&pdev->dev, NULL, NULL);
 	if (ret)
 		return ret;
+	fwnode = dev_fwnode(&pdev->dev);
+
+	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+	if (!res || irq_is_percpu_devid(res->start))
+		return software_node_add_irq_affinity(fwnode, 0, &group->cpus);
+
+	for (i = 0; i < group->nr_irqs; i++) {
+		ret = software_node_add_irq_affinity(fwnode, i,
+						     cpumask_of(group->irq_maps[i].cpu));
+		if (ret)
+			return ret;
+	}
 
-	return software_node_add_irq_affinity(dev_fwnode(&pdev->dev), 0,
-					      &group->cpus);
+	return 0;
 }
 
 static int arm_acpi_register_pmu_device(struct arm_pmu_acpi_group *group,

-- 
2.34.1


