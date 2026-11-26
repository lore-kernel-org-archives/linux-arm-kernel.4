Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8A8606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jkpAhGQF;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=5h4fqntK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=A2bdft652fdVAAhhhUDBYGj4mjukgD2GthVq1g6a6+8=; b=jkpAhGQFDcSXtt
	xV0czlwiOR4zXR7dYkH6WhQbhGi2Ra1lseplr6zWFRIfrp6vgos8sfKFaolRK6lZqSq560IYMUXIR
	dF602mg74RuSvP4UEHfmrN8SFEij2bOvulb5HRosixjvKkOnTqq3HLFBKI8DksSuDcdJGzkThbJxO
	Fb4LzNDbzjO3BwthzCPC6LAU/jrKdscOvv+ZW34RKuBMh1ERfPEwJPq+5J7Ftegl521Osz9w/9MSd
	RN01LsVPH/WYE8VBF8GuAq4cTz4+1a5mTfa0sulkLwWvmboQ1WEyLaC6Bl5T0rxXPjJLm7wdNp9y6
	vYwfvp6WEewGlDf/bKSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXG5-0000000CngF-1Bu1;
	Thu, 26 Nov 2026 11:03:21 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXFd-0000000CnYe-40zc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:In-Reply-To:References:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=A2bdft652fdVAAhhhUDBYGj4mjukgD2GthVq1g6a6+8=; t=1795690973; x=1796900573; 
	b=5h4fqntKsdJi6MWStC+kit6BQ5zKDMEaTl2Hlu+irYdKGthqkw56w4ZBmwgrCe0JO7CD0C/LXD4
	S0FAFoDlhvUohD1h/SYCyuJwIxhsXi2zG2TkCcRaRbIYz+lkoFesEu8LYrhbETbYcZbYygGuuxE77
	Ob7cP5zyMxwHbcHA6BBSjWbRMcLmWtSNQxJqNQs83FEwcpwSBw5Sx/tP420ZV4MWFeoACNChRD1GF
	QmLxAUCBvGIXbZeEWm4U7uHUNx75j/oAPDTyAoYCSbhV/Ojzzu2ea0p4pGAkY7++xdqUs0jpeAXnZ
	2jKVzvVu4wtbc4gfOrjMzenyEBHqsK2aDdlg==;
From: Andreas Kemnade <andreas@kemnade.info>
Date: Thu, 26 Nov 2026 12:00:54 +0100
Subject: [PATCH v2 1/3] ARM: imx: enable STOP-ON mode in idle if wakeup
 requirements permit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-imx6-idlestop-v2-1-c6987e7a392f@kemnade.info>
References: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
In-Reply-To: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
To: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux@yoavmoshe.com, Andreas Kemnade <andreas@kemnade.info>
X-Mailer: b4 0.17-dev-1b309
X-Developer-Signature: v=1; a=openpgp-sha256; l=5480; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=yjfM1ZMU5BXbzh2pdCc5rlFOp5ocZsDyiRAVIpWxHHU=;
 b=owEBbQKS/ZANAwAKAYRhRfpAKNzxAcsmYgBrCBG5QSNfJgeOOzypfaDHl5JACFfaJ+frZI/Gi
 Pn0aUyuVZuJAjMEAAEKAB0WIQTY6xCZL0TEE1XHfFiEYUX6QCjc8QUCawgRuQAKCRCEYUX6QCjc
 8RfKD/9+WvcFw1A3jGqoK5T6l7T9Sm2YUhu/Qmww72jzEMtrdCAdJTQ/VPyFO6sY0557Nyde1JF
 zgRMqImCag1I4MX/l919zgMtu+lW+TDJjwj6bzooVHzcS/KyR5z7w3wYjCDT2BG9QNxkEhqsPts
 iXsDaZQix1yu5QDu/m/SgYccbLhv6i0CF54jXH28qjGqJFoEpwKfrO+BKZXmwla0TgvUIe56WtX
 2NjTKZch64EKex2iWBrgjtiCQxhbuCPv4alIhqXpSMK180R7i5yMU0kPim0po/u1h5NRfXSDqdq
 aKU5FD0ACYejokTmQNQDd9cG5iitIkyQZLwwR8kONwLz2evyuY6eL1Uj1LaiELgQzY81OahC9nR
 RNtLe0ae+/aLD8VeEBa+JfE/b3HsUcTry3RyEpEg/8uFQVjz5SODzQvj4OSthFjm2j4InfWnRjB
 ip8J6unG5Li+p/YHu9uO9rp7DL2Efi/o7aMdm3bLThTn9o6Npfd9sMbT7s9lz50U4R4vpuylYyP
 zpNQzX6CO5Z0Eg7ncyEwPXIr3kIwNwESVpBrKwNXLR2bR+VIdmvoxIx0C7NG9kemMZzoKmzQvkG
 vpY9hJvKbvNpctoyfGZKuj6xaeEB5O3iDcn6Z4c1PUTs1G0tdh+qqJiIO4X6zP9GCiARpn50Sp+
 +FbcZegWnf36WiA==
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_030254_159670_C3F6B2B2 
X-CRM114-Status: GOOD (  21.53  )
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

Since there are situations when only wakeup from some GPIO IRQs is
required (besides the timekeeping infrastructure which can be fed by
an always on 32K clock), add another idle state to allow power-hungry
PLLs to be turned off in that condition.
Since some clocks are not turned off by RPM and
implementing it seems not feasible, keep a list of clocks to be ignored.
This includes clocks marked as CLK_IS_CRITICAL (romclk, aips_tzX clocks).

Collecting references to every clock feels a bit too much, so just list
the bits with comments.

To avoid spurios thermal misreadings, disable the new state when thermal
might be on, until these misreadings are sorted out.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/mach-imx/common.h         |  1 +
 arch/arm/mach-imx/cpuidle-imx6sx.c | 54 +++++++++++++++++++++++++++++++++++++-
 arch/arm/mach-imx/pm-imx6.c        | 31 ++++++++++++++++++++++
 3 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-imx/common.h b/arch/arm/mach-imx/common.h
index d7ecaa822adbd..7804cf5d83922 100644
--- a/arch/arm/mach-imx/common.h
+++ b/arch/arm/mach-imx/common.h
@@ -35,6 +35,7 @@ void imx_gpc_set_arm_power_down_timing(u32 sw2iso, u32 sw);
 void imx25_pm_init(void);
 void imx27_pm_init(void);
 void imx5_pmu_init(void);
+bool imx6sll_check_pll_are_used(void);
 
 enum mxc_cpu_pwr_mode {
 	WAIT_CLOCKED,		/* wfi only */
diff --git a/arch/arm/mach-imx/cpuidle-imx6sx.c b/arch/arm/mach-imx/cpuidle-imx6sx.c
index 83c5cbd3748e1..d2e8a98cc6ebb 100644
--- a/arch/arm/mach-imx/cpuidle-imx6sx.c
+++ b/arch/arm/mach-imx/cpuidle-imx6sx.c
@@ -65,6 +65,40 @@ static __cpuidle int imx6sx_enter_wait(struct cpuidle_device *dev,
 	return index;
 }
 
+static __cpuidle int imx6sx_enter_pll_off(struct cpuidle_device *dev,
+				       struct cpuidle_driver *drv, int index)
+{
+	if (imx6sll_check_pll_are_used()) {
+		for (index--; index >= 0; index--)
+			if (!dev->states_usage[index].disable)
+				return imx6sx_enter_wait(dev, drv, index);
+
+		return -EBUSY;
+	}
+
+	imx6_set_lpm(STOP_POWER_ON);
+	imx6_enable_rbc(true);
+	imx_gpc_set_arm_power_in_lpm(true);
+	imx_set_cpu_jump(0, v7_cpu_resume);
+	/* Need to notify there is a cpu pm operation. */
+	cpu_pm_enter();
+	cpu_cluster_pm_enter();
+
+	ct_cpuidle_enter();
+
+	cpu_suspend(0, imx6sx_idle_finish);
+
+	ct_cpuidle_exit();
+
+	cpu_cluster_pm_exit();
+	cpu_pm_exit();
+	imx6_enable_rbc(false);
+	imx_gpc_set_arm_power_in_lpm(false);
+
+	imx6_set_lpm(WAIT_CLOCKED);
+	return index;
+}
+
 static struct cpuidle_driver imx6sx_cpuidle_driver = {
 	.name = "imx6sx_cpuidle",
 	.owner = THIS_MODULE,
@@ -95,8 +129,19 @@ static struct cpuidle_driver imx6sx_cpuidle_driver = {
 			.name = "LOW-POWER-IDLE",
 			.desc = "ARM power off",
 		},
+		/* STOP ON */
+		{
+			/* times not measured, just hopefully safe values */
+			.exit_latency = 500,
+			.target_residency = 800,
+			.flags = CPUIDLE_FLAG_TIMER_STOP |
+				 CPUIDLE_FLAG_RCU_IDLE,
+			.enter = imx6sx_enter_pll_off,
+			.name = "STOP ON",
+			.desc = "ARM power off + PLL off",
+		},
 	},
-	.state_count = 3,
+	.state_count = 4,
 	.safe_state_index = 0,
 };
 
@@ -114,5 +159,12 @@ int __init imx6sx_cpuidle_init(void)
 	imx_gpc_set_arm_power_up_timing(cpu_is_imx6sx() ? 0xf : 0x2, 1);
 	imx_gpc_set_arm_power_down_timing(1, 1);
 
+	/*
+	 * play safe for now and try to avoid spurios false thermal readouts
+	 * and unexpected actions on that
+	 */
+	if (!cpu_is_imx6sll() || IS_ENABLED(CONFIG_IMX_THERMAL))
+		imx6sx_cpuidle_driver.state_count--;
+
 	return cpuidle_register(&imx6sx_cpuidle_driver, NULL);
 }
diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
index 3c73e2cdb8ceb..2494ee4d20c3a 100644
--- a/arch/arm/mach-imx/pm-imx6.c
+++ b/arch/arm/mach-imx/pm-imx6.c
@@ -64,6 +64,14 @@
 #define MX6Q_SUSPEND_OCRAM_SIZE		0x1000
 #define MX6_MAX_MMDC_IO_NUM		33
 
+#define CCGR0 0x68
+#define CCGR1 0x6c
+#define CCGR2 0x70
+#define CCGR3 0x74
+#define CCGR4 0x78
+#define CCGR5 0x7c
+#define CCGR6 0x80
+
 static void __iomem *ccm_base __ro_after_init;
 static void __iomem *suspend_ocram_base __ro_after_init;
 static void (*imx6_suspend_in_ocram_fn)(void __iomem *ocram_vbase) __ro_after_init;
@@ -287,6 +295,29 @@ void imx6_enable_rbc(bool enable)
 	imx_gpc_restore_all();
 }
 
+bool imx6sll_check_pll_are_used(void)
+{
+	/* check for any clock active which provides more than register access */
+
+				/* uart2 | dcp */
+	return readl_relaxed(ccm_base + CCGR0) & (BIT(29) | BIT(11)) ||
+				/* uart | gpt_serial | epit | ecspi */
+		readl_relaxed(ccm_base + CCGR1) & (BIT(25) | BIT(23) | BIT(15) | BIT(13) |
+						   BIT(11) | BIT(7) | BIT(5) | BIT(3) | BIT(1)) ||
+				/* pxp | lcd | i2c */
+		readl_relaxed(ccm_base + CCGR2) & (BIT(31) | BIT(29) | BIT(11) | BIT(9) |
+						   BIT(7) | BIT(3)) ||
+				/* lcdif | epdc | pxp */
+		readl_relaxed(ccm_base + CCGR3) & (BIT(11) | BIT(5) | BIT(3)) ||
+				/* pwm */
+		readl_relaxed(ccm_base + CCGR4) & (BIT(23) | BIT(21) | BIT(19) | BIT(17)) ||
+				/* uart1 | ssi | spdif | sdma */
+		readl_relaxed(ccm_base + CCGR5) & (BIT(25) | BIT(23) | BIT(21) |
+						   BIT(19) | BIT(15) | BIT(7)) ||
+				/* usdhc | usboh3 */
+		readl_relaxed(ccm_base + CCGR6) & (BIT(7) | BIT(5) | BIT(3) | BIT(1));
+}
+
 static void imx6q_enable_wb(bool enable)
 {
 	u32 val;

-- 
2.47.3


