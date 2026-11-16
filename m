Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B33C606A334
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OPvfSWCW;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=cus0c2qa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2bZRBD0wre9l5Uxa72CBRjeS+PAIZqErv0ZXJe2eO5U=; b=OPvfSWCWpBRtBN
	DwMt/C6F5PV9zIV1eOIfWywHHjMafZ4J2Rc9h1ppdaM7BtSiddhQe5aLRleSLEYDvlEelACFVtVcW
	wSIqCScUEf6DcfLw/V3PWYfjSVt0/Z0PHJndTc6wfjz5M763Ok0LC2zxZaoXFSatR/Gq5UzTTGP5b
	DIDcLsIk4fH9pde8LRKVvSc97DUxS59w0zAvYNiHPoTepcs8UN2BvkQNi7DcqiTH2z6R2aw0x/xaU
	xV/XDebujl8WUu534PWoJrueb/umwZXI4gvfp3j3qc5iS0mfwWlWhon9T5z2GmRBqhejt7X81sDSl
	oWA5X4J09O7j8t1c9LhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1Lu-00000003Wpo-1ttI;
	Mon, 16 Nov 2026 18:22:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1Li-00000003Wfg-26Gv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:22:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D9261BB0;
	Mon, 16 Nov 2026 10:22:34 -0800 (PST)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61EDC3F632;
	Mon, 16 Nov 2026 10:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794853357; bh=Aq1hd5G15aLQCabTVDHrfLBjHUdHyPvPeCgENM9JxZw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cus0c2qa2Ecxo+mz3w6U9I3zCheFuro12aVZ+5uKULdZQZpeKWWHXwMRXUg20kErT
	 FDbxvOLB12TXFVUrOs1kqBYIeHR9eeu/vQYt2mzI8xZbwShRbyJDyRBbqI0bozrr81
	 ugiu0+kQCoP0rvkUTME3+2QTomCc3WLuKAb3T+Qw=
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 16 Nov 2026 18:21:33 +0000
Subject: [PATCH 6/8] perf/arm_pmu: Support ACPI devices in the platform
 probe
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-acpi_arm_pmu_registration_hmp-v1-6-0371d4eca626@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794853327; l=2895;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=Aq1hd5G15aLQCabTVDHrfLBjHUdHyPvPeCgENM9JxZw=;
 b=0Reaa4MK3RHMtWJ2Gcdtr4xhMwqc5ow3o5yOZzpav///I6ftHy1L2DMc0fSWDt296egC0/1Ga
 puiB9wFPJIcCHOXnBQhVp1Cf/as+M4OzW2q5EBhITjIv+bGUjDZqFBk
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_102238_640318_B55729DD 
X-CRM114-Status: GOOD (  17.08  )
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

Add pmu_get_match_data() to select the initialization callback for DT
and ACPI devices. Use OF match data for devices with a DT node, and
match the platform device name against the existing compatible table
otherwise. This also handles devices described by software nodes.

Return -ENODEV when no initializer or fallback probe table is available.
Append the platform device ID to numbered PMU names, leaving unnumbered
DT device names unchanged.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/perf/arm_pmu_platform.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm_pmu_platform.c b/drivers/perf/arm_pmu_platform.c
index 1c9e50a13201528edf4cfbdc2504d305b49d4913..397fdb148dc9b6be083e654e091ecc6a95c4905b 100644
--- a/drivers/perf/arm_pmu_platform.c
+++ b/drivers/perf/arm_pmu_platform.c
@@ -20,7 +20,9 @@
 #include <linux/perf/arm_pmu.h>
 #include <linux/platform_device.h>
 #include <linux/printk.h>
+#include <linux/slab.h>
 #include <linux/smp.h>
+#include <linux/string.h>
 
 static int probe_current_pmu(struct arm_pmu *pmu,
 			     const struct pmu_probe_info *info)
@@ -185,6 +187,23 @@ static void armpmu_free_irqs(struct arm_pmu *armpmu)
 	}
 }
 
+static const void *pmu_get_match_data(struct platform_device *pdev,
+				      const struct of_device_id *of_table)
+{
+	const struct of_device_id *match;
+
+	if (pdev->dev.of_node)
+		return of_device_get_match_data(&pdev->dev);
+
+	/* ACPI platform devices use a compatible string as their name */
+	for (match = of_table; match && match->compatible[0]; match++) {
+		if (!strcmp(pdev->name, match->compatible))
+			return match->data;
+	}
+
+	return NULL;
+}
+
 int arm_pmu_device_probe(struct platform_device *pdev,
 			 const struct of_device_id *of_table,
 			 const struct pmu_probe_info *probe_table)
@@ -205,7 +224,7 @@ int arm_pmu_device_probe(struct platform_device *pdev,
 	if (ret)
 		goto out_free;
 
-	init_fn = of_device_get_match_data(dev);
+	init_fn = pmu_get_match_data(pdev, of_table);
 	if (init_fn) {
 		pmu->secure_access = of_property_read_bool(dev->of_node,
 							   "secure-reg-access");
@@ -220,6 +239,8 @@ int arm_pmu_device_probe(struct platform_device *pdev,
 	} else if (probe_table) {
 		cpumask_setall(&pmu->supported_cpus);
 		ret = probe_current_pmu(pmu, probe_table);
+	} else {
+		ret = -ENODEV;
 	}
 
 	if (ret) {
@@ -227,6 +248,16 @@ int arm_pmu_device_probe(struct platform_device *pdev,
 		goto out_free;
 	}
 
+	/* Append instance suffix (for only ACPI devices) */
+	if (pdev->id >= 0) {
+		pmu->name = devm_kasprintf(dev, GFP_KERNEL, "%s_%d",
+					   pmu->name, pdev->id);
+		if (!pmu->name) {
+			ret = -ENOMEM;
+			goto out_free;
+		}
+	}
+
 	ret = armpmu_request_irqs(pmu);
 	if (ret)
 		goto out_free_irqs;

-- 
2.34.1


