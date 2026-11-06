Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FF9606D831
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 18:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zBxB/O34;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=XqNhcFlq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Vt9Kamb5mjCKUOITfYlUppbcMdonIvPB5a8sUjW+bWQ=; b=zBxB/O34WXEnh0
	Kq2e/sBhbhvnywxz0gN6KY3jk+2A4eAGL5tS3osTQi7SLyZtqebiEfaZwXucK/WabX8W4YqniIy9X
	Znpg6xKF7jFvdbYCsFsh/87l0Xa4ykJourzXUvexGoamHqvpO2w4as2qH4ft6y7kdzNGnbAumOdPQ
	qoFpkjQLuz5+Ne7xFfyeeovqjxgkE/8dN+QITPfmPvgn0hMCzWRrBOD7KHkooOuC5CCtpFbNUUh0V
	aIg8lf7QB5k81Vf0a1iAQNqP1LP4sJWRziBdiAAFGGyWsTtw9Y1h1cVR8694TS60ZEEtL5Uc0G0b6
	T9n9BJZJG3E69DX77+FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOMF-0000000DLSq-4A8b;
	Fri, 06 Nov 2026 18:08:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOM8-0000000DLNV-3nY6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 18:08:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D63D41692;
	Fri,  6 Nov 2026 10:08:00 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2E6D03F673;
	Fri,  6 Nov 2026 10:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793988483; bh=FiLcr2bqRGNHwPqNhuLmcaRcjFrBKNMOb6axv3mSzXA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XqNhcFlqN0WCr6S7XhwkmUcBKgS3pU0Mk+Wax5ne0Lh4QfeHp/lNsB3OBA7j3kY9Q
	 RVFBNClELXOTcVvHhwXIyQFepk2oNHmZFe+ht5Y7+6yYq458ruFsbJ+mj17Iodwh+7
	 9BaVTQYOB8hEJIYBt0zZNIiWxNMIyrECIRv/htYo=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 4/4] perf/arm-bmu: Add Devicetree support
Date: Fri,  6 Nov 2026 18:07:46 +0000
Message-ID: <80f15ad90b1d1f447f072f6d9d82630f847379bf.1793986672.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
In-Reply-To: <cover.1793986672.git.robin.murphy@arm.com>
References: <cover.1793986672.git.robin.murphy@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_100804_986898_EE58C7B8 
X-CRM114-Status: GOOD (  15.39  )
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

Initial production BMU users will be ACPI-based, but DT consumers
will almost certainly come along sooner or later.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm_cspmu/Kconfig   |  2 +-
 drivers/perf/arm_cspmu/arm-bmu.c | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_cspmu/Kconfig b/drivers/perf/arm_cspmu/Kconfig
index 48c2a3ac7fab..8ce05bbe6b9a 100644
--- a/drivers/perf/arm_cspmu/Kconfig
+++ b/drivers/perf/arm_cspmu/Kconfig
@@ -37,6 +37,6 @@ config ARM_SYSTEM_PMU
 
 config ARM_BMU
 	tristate "ARM Bus Monitor Unit"
-	depends on (ARM64 && ACPI) || COMPILE_TEST
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Support perf event counting on Arm Bus Monitor Unit devices.
diff --git a/drivers/perf/arm_cspmu/arm-bmu.c b/drivers/perf/arm_cspmu/arm-bmu.c
index fe25954ac836..aa4ccbdae7a2 100644
--- a/drivers/perf/arm_cspmu/arm-bmu.c
+++ b/drivers/perf/arm_cspmu/arm-bmu.c
@@ -6,6 +6,7 @@
 #include <linux/interrupt.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/perf_event.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
@@ -409,7 +410,10 @@ static int arm_bmu_probe(struct platform_device *pdev)
 		.read = arm_bmu_event_read,
 	};
 
-	name = acpi_device_uid(ACPI_COMPANION(dev));
+	if (has_acpi_companion(dev))
+		name = acpi_device_uid(ACPI_COMPANION(dev));
+	else
+		device_property_read_string(dev, "label", &name);
 
 	if (name)
 		name = devm_kasprintf(dev, GFP_KERNEL, "arm_bmu_%s", name);
@@ -440,6 +444,14 @@ static void arm_bmu_remove(struct platform_device *pdev)
 	cpuhp_state_remove_instance_nocalls(arm_bmu_cpuhp_state, &bmu->cpuhp_node);
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id arm_bmu_of_match[] = {
+	{ .compatible = "arm,bus-monitor-unit" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, arm_bmu_of_match);
+#endif
+
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id arm_bmu_acpi_match[] = {
 	{ "ARMHB001" },
@@ -451,6 +463,7 @@ MODULE_DEVICE_TABLE(acpi, arm_bmu_acpi_match);
 static struct platform_driver arm_bmu_driver = {
 	.driver = {
 		.name = "arm-bmu",
+		.of_match_table = of_match_ptr(arm_bmu_of_match),
 		.acpi_match_table = ACPI_PTR(arm_bmu_acpi_match),
 		.suppress_bind_attrs = true,
 	},
-- 
2.54.0.dirty


