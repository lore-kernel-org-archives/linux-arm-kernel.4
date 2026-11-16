Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8E4606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 10:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y6bigikO;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=JlNnYkiq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=clgnn/l0xxn+YplSr3tGwTORb9AMKRayHqXQE17fBq8=; b=Y6bigikOsCe39OZRbYdIdz5xSU
	Nu1jY5ibvdTtSDoGasWQe8HwK9YWqzXL/WGTAaUyfvMnz6eAcAziyar/Y9UYDYIjTQDVGRdikJybM
	bvMcY23f1y1EZGPQUIDxCxYm7/sGk1t7Pd7kqd8ZdrKUvy9DWtYUt6b3obbiPAj8xuaiRPfZBHMI8
	AzGEH4AkzxmdW2PrHufDhCcoj2Rbe51hllg+VtRP5R046AvpMdP3F3MhilRtlUZd3a3maQaNrYOu8
	zgxxuIqauykrONhVBqiZKwJ/kH7gaYzmtCuk4ODpBiRuOfLoNcDkmppbBr8/NgyxgpQBryGUUwxzS
	aUR3Nt0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSu9R-00000001znH-3nLV;
	Mon, 16 Nov 2026 10:41:29 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSu9B-00000001zdT-2iO1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 10:41:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5SmWrGGKwMscp/jTH1bjoyaXXk4HbtTCN1K+qMR4hhB9w2qt8wwQUi02y1J9wyqvEp+p/9z8Uysco+vfqFnsu5DVrWCmWT/8Y7TmynXdXfm05EqPJsMeVSC1uyNzmBbt6cdUI64hBPUnOzHnHM5CKwesAZ9VR6AFMLJcapcJhPfVQiKJMKVwQCQT5yaXnMave4UtcEyOJ2SeS/M3+LZUm9GenHye3yxPbO1V7e5jNxZdvXe01dlnwHXCRdkp4HVE2WONSXaJWtQuH12/vsPxX7V82HtVEF35rMLgemFk1G3Oiu5Tkhc2o5dvSQ3xPSM5GeqbW37Bu0tOTqNJAY0Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clgnn/l0xxn+YplSr3tGwTORb9AMKRayHqXQE17fBq8=;
 b=u+m1u8v4pMJ9o9MC5S94spARv1EAqMVm/VP6OteHb9f/hAjjRjkKRZJw/g/BhRdlQdRLx0ReJREewf1NNTxHD8SjC4hhB0W+p5DTj6jmRrAqUx01vv+4pKuCpg57SPxchUbYn4JuNXqzOdKKAJudvOhM74m4juc3ACZWSBnkkQnhCpp5r7RvEFDbakjpo8XKR+VvFojw4AavF/0q0UTq2YF3883hBMGsKjL8wnH4O5cyoTug7hhjF4DowLKPtvO2ErINOH1UiQU+4RWUr5EDdzhepItkwQM73W8rKu0zPm6BSaNhqkCfU2z+lg4EJAB0Q7JCvRz6V7tV5L+eHrDjYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clgnn/l0xxn+YplSr3tGwTORb9AMKRayHqXQE17fBq8=;
 b=JlNnYkiqILtLNUnPkalMGngR852LMFd0a+ZHdrh3NhUbpvqKrMT0LlXpuja/GaSq/B27HrV28vTre1hU4tzhIpNDZVPfcVKhEYW2YvvX912LmFeJJxNoiJzyHYpQAMqwnqv9HRXNy8BkXGOzOrU7P8SI87YZu4VxCxhc6Oyy41fvdOuDJeUA4bvpCLpRuHRKWr+loBC43OCLOocKYYFKBj/+SNqhsy5CW/AIXlV1csXbCSj2kGi61qYDBA16sm4r+MvdhQX2bWJkDuEzljABSV1Qq7EwdpHLQaCR2LowlKIX1+ROcP3DmQSfi5ZAm+1MfO2F8n8e2A41kjOC54sftA==
Received: from PA7P264CA0037.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:34b::12)
 by PA4PR10MB5513.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:26e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.6; Mon, 16 Nov
 2026 10:41:09 +0000
Received: from ZR1PEPF0000E6AE.eurprd05.prod.outlook.com
 (2603:10a6:102:34b:cafe::3e) by PA7P264CA0037.outlook.office365.com
 (2603:10a6:102:34b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 10:41:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 ZR1PEPF0000E6AE.mail.protection.outlook.com (10.167.241.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 10:41:09 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 11:41:52 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 16 Nov
 2026 11:41:07 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Ulf Hansson <ulfh@kernel.org>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>
Subject: [RESEND PATCH 2/7] pmdomain: st: add STM32MP power domain
Date: Mon, 16 Nov 2026 11:40:27 +0100
Message-ID: <20261116114024.RESEND.2.I59b2ea87f07947037b772c49c277092c887f4310@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116104054.94115-1-patrick.delaunay@foss.st.com>
References: <20261116104054.94115-1-patrick.delaunay@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6AE:EE_|PA4PR10MB5513:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cdd9159-5f53-40d3-a554-08df43ce201d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|11063799006|56012099006|261026140227099003|261026121527099003|261028144727099003|261021135927099003|261021123027099003|261021121427099003|261022075727099003|261102123227099003|261022105027099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: aJIjpaFvA2Y6UQBzBm9hbzZ1e7JDm2uJzj+vCNjvbCWI9h3CF2cE6lTx9F5NFJYA9Bcej8S6IT7EbSA9inNsDwsk2EHE1F5RHUVOwZ0B8bPK9nRZjPfNOi5zFtbYOHnjOZEiXPHpni+QtLysoNN5dLO1jH8KtO7nPHkuCAWj0tye2PE0IyMFJZDjNnP/lTtDVVi19vXCCQUgZKtDavQ/KGVpXYu0d66JwJ7KIhBFALdWgnwGpSDKJVpEkTNOpYgvG9EsqHtMDcU1g1g5t41V6QoMgMB/4S2ThBp87JnFGaMmwi+O3ppPp+2UKTuwZ8CxzMeQ3/XlEkcecoC2zwatAkRXDo+r20mMLtnt8QfQrTW8XO5imjR4AVZcwZuodAFsAVd/7kWyDOHnP+/5tqyDH5+wk0cX36mjwYlf6u6CQHi59JMF4X7SGUiqVZZ6xOATE4GQTYWRasZB6Cj52Fqi67HDvEcaPuGSsqUc20lYcEV1D5Bp2KTyyTNKvnhvnX2+7RvPoPbfvQu2wVrKWR1qEjdMxtQY4hhS9YIZHwauzWTUCgdTkW1LrFURAcXg0jjKSh+YKp7s9ll3olDGJenLGFBlPe84gYeAjd9/aToEc3IYEww5nTc3Y+yoK2Sulta+YBHtyzc2QExC4ErQVSFLJKIdf+QQli/spPsft/cTWoUNQpIGKKYfpANQKxBXIVhAi2egBFAMXndMPh2RbN0jAg==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(261026140227099003)(261026121527099003)(261028144727099003)(261021135927099003)(261021123027099003)(261021121427099003)(261022075727099003)(261102123227099003)(261022105027099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: V9WaSGB2z3rFjgr6kGx8oE/97XWBWtTxinDVbcMM7IsREeYAk2dANmcqI0/XAVSaWlpNnimnipHxd8KitVg3VnTGQ7iIW2ZcyEHyeNvxzar5qkS9v3Q/No4uJ0kq31zdwjW626a+XhXfxxY3Qlc1D3bzWV6cfG1PouBiJy0sEnLwJ87zUknXEKNs3qpqEPKBMpAvpWF7wSF9PLaajg14OShjTy5u6IingWmcOnyEq5ZGjgzqZ2dwzM8pwrBlunZZY3jNIEcCmR640GeDBVDujxtustUP53Wq3b/mFi0ojlCu3fdYWoGcmn2gOS7OX5V8OSFBjiRrq3xuHxU64EwcCOcg4twB+W9WieiSLC6qo2mZJDw3fMMfQ/ruxM+C3YL5l4H9NU+KeBduWv+aYTaJOBwFzXXtq3sLnYUrthMDc67QRATNMEpQfzpAU0nNEEoZ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 10:41:09.0712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cdd9159-5f53-40d3-a554-08df43ce201d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: ZR1PEPF0000E6AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5513
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_024113_696644_6CEA7260 
X-CRM114-Status: GOOD (  22.49  )
X-Spam-Score: -2.1 (--)
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

Add a generic PM domain for the STM32MP D1 domain, using the PM
framework to manage attached devices.

Make D1 a subdomain of the PSCI cluster domain, so active devices keep
the Cortex-A35 cluster in Run1. Do not set GENPD_FLAG_ACTIVE_WAKEUP on
D1: system wakeups are handled by EXTI1 through the RET_PD PSCI domain.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 drivers/pmdomain/st/Kconfig             |  14 +++
 drivers/pmdomain/st/Makefile            |   1 +
 drivers/pmdomain/st/stm32mp-pm-domain.c | 128 ++++++++++++++++++++++++
 3 files changed, 143 insertions(+)
 create mode 100644 drivers/pmdomain/st/stm32mp-pm-domain.c

diff --git a/drivers/pmdomain/st/Kconfig b/drivers/pmdomain/st/Kconfig
index a77a70211f61..da8a54d44158 100644
--- a/drivers/pmdomain/st/Kconfig
+++ b/drivers/pmdomain/st/Kconfig
@@ -1,4 +1,18 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+config STM32MP_PM_DOMAIN
+	tristate "STM32MP PM domain"
+	depends on ARCH_STM32 || COMPILE_TEST
+	select PM_GENERIC_DOMAINS
+	default y
+	help
+	  Enable support for the STM32MP Power Management (PM) domain driver.
+	  This driver implements a generic PM domain for STM32MP SoCs, allowing
+	  the kernel to manage power domains for various hardware blocks using
+	  the generic power management framework. It is typically used to
+	  control the power state of devices and peripherals on STM32MP
+	  platforms. If unsure, say Y.
+
 config UX500_PM_DOMAIN
 	bool "ST-Ericsson ux500 Power Domain"
 	depends on ARCH_U8500 || COMPILE_TEST
diff --git a/drivers/pmdomain/st/Makefile b/drivers/pmdomain/st/Makefile
index 6d8b617eb834..0e8131b7fe9d 100644
--- a/drivers/pmdomain/st/Makefile
+++ b/drivers/pmdomain/st/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_STM32MP_PM_DOMAIN)		+= stm32mp-pm-domain.o
 obj-$(CONFIG_UX500_PM_DOMAIN)		+= ste-ux500-pm-domain.o
diff --git a/drivers/pmdomain/st/stm32mp-pm-domain.c b/drivers/pmdomain/st/stm32mp-pm-domain.c
new file mode 100644
index 000000000000..1a6393840f56
--- /dev/null
+++ b/drivers/pmdomain/st/stm32mp-pm-domain.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Implements PM domain using the generic PM domain for STM32MP SoC.
+ *
+ * Copyright (C) STMicroelectronics 2026
+ * Author(s): Patrick Delaunay <patrick.delaunay@foss.st.com>
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+
+struct stm32mp_pm_subdomain_link {
+	struct generic_pm_domain *domain;
+	struct generic_pm_domain *subdomain;
+};
+
+static void stm32mp_pm_domain_genpd_remove(void *data)
+{
+	struct generic_pm_domain *genpd = data;
+
+	pm_genpd_remove(genpd);
+}
+
+static void stm32mp_pm_domain_release_subdomain(void *data)
+{
+	struct stm32mp_pm_subdomain_link *link = data;
+
+	pm_genpd_remove_subdomain(link->domain, link->subdomain);
+}
+
+static void stm32mp_pm_domain_release_genpd_provider(void *data)
+{
+	struct device_node *np = data;
+
+	of_genpd_del_provider(np);
+}
+
+static int stm32mp_pm_domain_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct generic_pm_domain *pd;
+	struct stm32mp_pm_subdomain_link *link;
+	int ret;
+
+	if (!np)
+		return -ENODEV;
+
+	/* The OF node must specify us as a power-domain provider. */
+	if (!of_property_present(np, "#power-domain-cells")) {
+		dev_warn(dev, "%pOF lacks #power-domain-cells\n", np);
+		return 0;
+	}
+
+	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
+	if (!pd)
+		return -ENOMEM;
+
+	pd->name = dev_name(dev);
+
+	/*
+	 * Domain based only on PM clk framework, no GENPD_FLAG_ACTIVE_WAKEUP
+	 * support, the wake-up path is handled by interrupt driver with its
+	 * power domain. GENPD_FLAG_NO_STAY_ON as domain no required sync state,
+	 * domain allow low power modes even if devices are not probed
+	 */
+	pd->flags = GENPD_FLAG_PM_CLK | GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_NO_STAY_ON;
+
+	ret = pm_genpd_init(pd, NULL, false);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to init power domain\n");
+
+	ret = devm_add_action_or_reset(dev, stm32mp_pm_domain_genpd_remove, pd);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add action\n");
+
+	link = devm_kzalloc(dev, sizeof(*link), GFP_KERNEL);
+	if (!link)
+		return -ENOMEM;
+	link->domain = pd_to_genpd(dev->pm_domain);
+	link->subdomain = pd;
+
+	ret = pm_genpd_add_subdomain(link->domain, link->subdomain);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add subdomain\n");
+
+	ret = devm_add_action_or_reset(dev, stm32mp_pm_domain_release_subdomain, link);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add action\n");
+
+	ret = of_genpd_add_provider_simple(np, pd);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add power domain provider\n");
+
+	ret = devm_add_action_or_reset(dev, stm32mp_pm_domain_release_genpd_provider, np);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add action\n");
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable pm-runtime\n");
+
+	return 0;
+}
+
+static const struct of_device_id stm32mp_pm_domain_matches[] = {
+	{ .compatible = "st,stm32mp-pm-domain", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, stm32mp_pm_domain_matches);
+
+static struct platform_driver stm32mp_pm_domain_driver = {
+	.driver = {
+		.name = "stm32mp_pm_domain",
+		.of_match_table = stm32mp_pm_domain_matches,
+	},
+	.probe  = stm32mp_pm_domain_probe,
+};
+
+module_platform_driver(stm32mp_pm_domain_driver);
+
+MODULE_AUTHOR("Patrick Delaunay <patrick.delaunay@foss.st.com>");
+MODULE_DESCRIPTION("ST STM32MP power domain driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


