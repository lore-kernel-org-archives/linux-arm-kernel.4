Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146AA606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 18:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XuCt89fQ;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nfnStZQD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=iOSfLb86QY08ej0RawPxXcRECun5ow2DaAauKLhZvic=; b=XuCt89fQAwJ5BbfMrq79NkHKfR
	6xmxqjbJg805YRJsLmbnPhiilSgxBHlSLczTSlh3UzzdtF3RmN/0L3xIAhF3KyaBsWWavYqegDL5v
	FvLturGva1zgy7F9PBnAf8mq0xacQN3kwW/URE8DepAgE8vKoWgKrNwVN0ZT3kGEupQnx54d4SbBl
	ZXCEO2Sh1sVe2DD9WxpBIP4vxaUkm2ktwHtbI5l8TeNgQ9YLByuEnCBxErV4+pRvO1rRdD1Sw76ua
	2nl1LET7LJ08m+TAigZvXePzJlUR8zcUXITNt7upYQVvUjz6xTeeiEpjKXbrTq6WOllwXNlRgP2Ca
	EENoxfbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPP0b-0000000DSGC-14Ue;
	Fri, 06 Nov 2026 18:49:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPP0Y-0000000DSFK-3u5o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 18:49:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CD0C1650;
	Fri,  6 Nov 2026 10:49:46 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 91F3B3F673;
	Fri,  6 Nov 2026 10:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793990989; bh=KnzE4VmiVmM6UAdxWSUgepdIWMCIhJvuARplG3Gxblo=;
	h=From:To:Cc:Subject:Date:From;
	b=nfnStZQDrWiZp7Q9DdPQCjg52ets9l5SI+kta8RUw8uP44rkLlmEJT5d5HW2LfKER
	 Zh3jwXbIpvMty/DzDvO6nHZ0+CPj/kvieBqnu/JTlhv0jEApQH3LzYqZnUAcxaIZFC
	 YAugKva6TeScAyGIfU/eZi/QFe3t+UTel7+TizRA=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] perf: Process subdirectory Makefiles unconditionally
Date: Fri,  6 Nov 2026 18:49:37 +0000
Message-ID: <4b2e518499270b2a6cab3e04a1123458d82d2759.1793990977.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_104951_005189_86E7BF3B 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
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

Our subdirectories here are purely for file-level organisation rather
than any particular build structure, and everything in the Makefiles
is already conditional on the appropriate config options. Plus they're
not exactly big and complex, so for simplicity let's just drop the
top-level conditions.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/perf/Makefile b/drivers/perf/Makefile
index eb8a022dad9a..8c3146c604ce 100644
--- a/drivers/perf/Makefile
+++ b/drivers/perf/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-y += amlogic/ arm_cspmu/ hisilicon/
 obj-$(CONFIG_ARM_CCI_PMU) += arm-cci.o
 obj-$(CONFIG_ARM_CCN) += arm-ccn.o
 obj-$(CONFIG_ARM_CMN) += arm-cmn.o
@@ -14,7 +15,6 @@ obj-$(CONFIG_ARM_SMMU_V3_PMU) += arm_smmuv3_pmu.o
 obj-$(CONFIG_FSL_IMX8_DDR_PMU) += fsl_imx8_ddr_perf.o
 obj-$(CONFIG_FSL_IMX9_DDR_PMU) += fsl_imx9_ddr_perf.o
 obj-$(CONFIG_FUJITSU_UNCORE_PMU) += fujitsu_uncore_pmu.o
-obj-$(CONFIG_HISI_PMU) += hisilicon/
 obj-$(CONFIG_QCOM_L2_PMU)	+= qcom_l2_pmu.o
 obj-$(CONFIG_QCOM_L3_PMU) += qcom_l3_pmu.o
 obj-$(CONFIG_RISCV_PMU) += riscv_pmu.o
@@ -32,8 +32,6 @@ obj-$(CONFIG_MARVELL_PEM_PMU) += marvell_pem_pmu.o
 obj-$(CONFIG_APPLE_M1_CPU_PMU) += apple_m1_cpu_pmu.o
 obj-$(CONFIG_ALIBABA_UNCORE_DRW_PMU) += alibaba_uncore_drw_pmu.o
 obj-$(CONFIG_DWC_PCIE_PMU) += dwc_pcie_pmu.o
-obj-$(CONFIG_ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU) += arm_cspmu/
-obj-$(CONFIG_MESON_DDR_PMU) += amlogic/
 obj-$(CONFIG_CXL_PMU) += cxl_pmu.o
 obj-$(CONFIG_NVIDIA_TEGRA410_CMEM_LATENCY_PMU) += nvidia_t410_cmem_latency_pmu.o
 obj-$(CONFIG_NVIDIA_TEGRA410_C2C_PMU) += nvidia_t410_c2c_pmu.o
-- 
2.54.0.dirty


