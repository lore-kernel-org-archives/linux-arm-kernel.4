Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E22D606A681
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 03:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KX/RCJFV;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xqvz13RY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0ZWZLu/w1jICIPNubiDLFJqwBNFebndugYmx7HGUGWo=; b=KX/RCJFVtTt1hTTpBVRuqixkY4
	93BGolXX+QrprHwMyP29+oNTaBKdRmh58+roGMSaUqZ3rMABi6vZ6t6l0RqRpuZ1BbcHBgb2m7IYC
	YmS7ZNz/06slxMa86H8hHufPHic4Ji8AcTlQ0HrTpOn4SWma+j4SjAK5OpI6pPFMn6AgfwfJxgQP/
	xJAEaFZShToe4wA/oW2OCiouLAadJTCgSrannTQRiVSR32jX4pR5gjJNV04VVCIt2+toSb1AF57qK
	AmXqxj+tW4pK14twM5cZ5UHqlYJ+I3A/NgvJHoua6+G9nRZp3UvXUcI3QSgKx3pZuABNSZ3fnSYk6
	vIB+PueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVheB-00000005TSJ-0ncP;
	Tue, 24 Nov 2026 03:56:47 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhe4-00000005TP4-2gGb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 03:56:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYoqfRgYmlHdw0fJi4gInBFdu6g7JFbglfv0JoMkp8eXyVNbtNjjO4KusyL8wS+NWtm1sHn0ukhvGOR4JhHdp3o3DwEZYDh/kuWBoQ1ahokjma3YwphDjyCkuSgACvQqgxmh+mKeCmUC5VbmHd/DwrY/SrKPr6QVshn48XW/K9s/DP4NDvlXuZHhGY7m0/W+hrDsL31CD58Kf71BT8DJF54nJ3pYXgYNSSAVXFs8z2XroDUU25HnjMiAXi/0yZ0YepORBjlwvn7fd4cgxfDwDV95vEFfP6DIhpLv0nLK+MhIEEbyBzwPR4lCp8gvfowanU995HyGw2jgbOPy+f1MdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZWZLu/w1jICIPNubiDLFJqwBNFebndugYmx7HGUGWo=;
 b=t2rQHRxD1wmRTD6n2EJJPpZzknNttCECJUbncP9sQQhmiKiTFCzjbUky9SWtuJhPxWgI2b4yUM7PIHYisWPv6PGhlNqZ/O/t4kaqyDO/x58sUmsRu0SAEXzFahwF+yMvtFhKUW2yH4kMKDmKkH4JDVTtD28J5EC2RWDcvugHMRIj/Cips4u9PorJ3wjqjCTtD2yP4SBkRE4NHG6ggIHQrFS45pztGIDFHP6vb11oxGrjwKDRAFusAsprtkBUu/vjM9TALChcgeLIr2hSi71I8cTQ1kokb+7wxF59R9ULP2DkcjLh9eLOACy5xoVvaW4/Yj5j9zWYNmBbtU0gXuUGfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZWZLu/w1jICIPNubiDLFJqwBNFebndugYmx7HGUGWo=;
 b=xqvz13RYF5pCV2pzQkY3k/Z7cmZUeYaBcGLd2RHZT9ksnKWc5w7EgAlzJXIwAsIETvZLqZD8quDQSvgJWK0yu5v1W1qVccss1BerciTFBkEX6VE79wFykOWrU61fiwg1ll0gJD9fMT7+MSNNisHiBs5yPk9laD02p1fC5zgdXeI=
Received: from BN9PR03CA0682.namprd03.prod.outlook.com (2603:10b6:408:10e::27)
 by BL1PR12MB5827.namprd12.prod.outlook.com (2603:10b6:208:396::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.16; Tue, 24 Nov
 2026 03:56:34 +0000
Received: from BN7PEPF000000A3.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::95) by BN9PR03CA0682.outlook.office365.com
 (2603:10b6:408:10e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 03:56:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN7PEPF000000A3.mail.protection.outlook.com (10.167.248.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 03:56:34 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 21:56:33 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 21:56:32 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 21:56:29 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, "Shubhrajyoti
 Datta" <shubhrajyoti.datta@amd.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v4 4/8] clk: clocking-wizard: Add static-config clock provider support
Date: Tue, 24 Nov 2026 09:25:49 +0530
Message-ID: <20261124035613.1968260-5-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
References: <20261124035613.1968260-1-shubhrajyoti.datta@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A3:EE_|BL1PR12MB5827:EE_
X-MS-Office365-Filtering-Correlation-Id: 6884b866-7526-4c21-13da-08df49deee75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|7416014|6133799003|18002099003|22082099003|3023799007|261009223027099003|5023799004|11063799006|261102123227099003|261026121527099003|261022075727099003|56012099006|261102130727099003|261026140227099003|261021123027099003|261028144727099003|261021121427099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info: cYjsrUmNEzGgyA5LHA99M0KlRjo8fQWi0HmZc0hzj95RY1CMBJzZjldZnyNSs6E5p6Lf48QV6tfdO9gSQNd8JkubhI3E++8Ge73QDwnrNfX8lz990JF2mfC3E7oTgvSKFQqWvaeH/arp1hrFU5UHTnEkEF5q6Fxng81oNsfbUe7YBiX2Tp1hVUyGn+Gy6xzq3fnxgKBybsj3P6b4NO9R4ekiJ+PQ5n1eEsP5d9+yNbpbNJBJAPp6ZHhNkfH77B0MpqzlBj9dhXyCF8nvlpHhG2Zkd8gWX/kcnIslv7AQYCEWVNZMejaeDqG4cpcqDpGalMHAgv2Jqvu//3kxQVRKbS9NAVPKALZNyqKkeSq8+sJuC0LmmyrMEHFoKbUgVIzc+m8xwosX4giZ3L1FjKi8VAbV5O4NHg7lOsEF+2fy0WRzlTqjg5IAnXteT+Ww0ZST/uXRKl9s+YZg5+OtY/7qntWkuISHuWhOOMlia6Bi5lpEpj+aU0oDo5gxVOl5WK3HA0KyQBcQDTblj5Gr+6mXZ6twGM86OUuwg2cufivlSzEf0+EggJxy8Q8RsBICekbJK20V+bycnjOSbkjpC62sbxm52gyPs98ptzCH7Of6rmmZY+HSFyFImN61yuevbaoJEgnfsi3DkFquSyI9uP64r9fJ+5s6mUpZGK61sUZ+N7Hh1bqqq6Qcc+XB4XWGGeIaGU69GXEBiziBTlzw9uN3zw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(7416014)(6133799003)(18002099003)(22082099003)(3023799007)(261009223027099003)(5023799004)(11063799006)(261102123227099003)(261026121527099003)(261022075727099003)(56012099006)(261102130727099003)(261026140227099003)(261021123027099003)(261028144727099003)(261021121427099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Lsk/KUSuw4QKlvGNrFMBxeY5Z/vVhuAyTuAoO1ZZwZ5hz7dtLayu/7dX2dmXCNVM9jznlngJDc83SKXhd0UpBXrEaQ+O3osIFTB8WC1nMgcwJfvZr1lM2yIHOvtY2OkgXFba8WM9tudgU6H661hX92fWhbIu5B2GsyeAGuR006PwQNHJQ8a6tgfrMPXtbcbv50MZK0tkcqrDmvebxJ7d0V6cYejAO8nqLar+MrWPE2PQ1zwhU+FlOsrph8JKvhsbhogHdtCACMf3cLc1fWYfbnY/wm45PRnABXtO3km7ln7piTjlNsxNCrVAmAmBez3z8+UFcojRiyKx6O+jxUZYXej82+mMusEjmtbUyKxK34W9Sv72D6ni3AU+88Yms6DZV19rSzs+cV6aM5t58vg/Oujia3+2erSfcaiMpPUuVZ0UWQaKP8P3TEiG0ju7samG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 03:56:34.1686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6884b866-7526-4c21-13da-08df49deee75
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7PEPF000000A3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5827
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_195640_963177_D4E5C4DD 
X-CRM114-Status: GOOD (  23.47  )
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

When xlnx,static-config is present the divider/multiplier path is
synthesized inside the Wizard without exposing runtime MMIO
reconfiguration, so omit the AXI register mapping and advertise each
routed output clock as a clk_fixed_factor child of clk_in1 using the
synthesized ratios exported through xlnx,clk-mul-div.

However the parent clock of clk_in1 can still be gated, disabled, or
(re-)enabled after FPGA programming (typical FPGA Manager flows,
CCF-managed parents, PLL fabric power sequencing).

Add a 10 us delay in each output clock's .enable() hook so consumers
wait for reference settling before first access.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v3)

Changes in v3:
- Removed duplicated number-of-outputs handling

 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 137 ++++++++++++++++++++-
 1 file changed, 135 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 649cf2d21943..31fed0e1ed30 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/of.h>
@@ -114,6 +115,7 @@
 #define VER_WZRD_O_MIN			2
 #define VER_WZRD_O_MAX			511
 #define WZRD_FRAC_POINTS		1000
+#define WZRD_ENABLE_DELAY_US		10
 
 /* Get the mask from width */
 #define div_mask(width)			((1 << (width)) - 1)
@@ -833,6 +835,13 @@ static int clk_wzrd_ver_determine_rate_all(struct clk_hw *hw,
 	return 0;
 }
 
+static int clk_wzrd_enable(struct clk_hw *hw)
+{
+	/* Allow the output clock to settle after enable */
+	udelay(WZRD_ENABLE_DELAY_US);
+	return 0;
+}
+
 static const struct clk_ops clk_wzrd_ver_divider_ops = {
 	.determine_rate = clk_wzrd_determine_rate,
 	.set_rate = clk_wzrd_ver_dynamic_reconfig,
@@ -926,6 +935,85 @@ static const struct clk_ops clk_wzrd_clk_divider_ops_f = {
 	.recalc_rate = clk_wzrd_recalc_ratef,
 };
 
+static unsigned long
+clk_wzrd_static_factor_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
+	unsigned long long rate;
+
+	rate = (unsigned long long)parent_rate * fix->mult;
+	do_div(rate, fix->div);
+	return (unsigned long)rate;
+}
+
+static int clk_wzrd_static_factor_determine_rate(struct clk_hw *hw,
+						 struct clk_rate_request *req)
+{
+	struct clk_fixed_factor *fix = to_clk_fixed_factor(hw);
+
+	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
+		unsigned long best_parent;
+
+		best_parent = (req->rate / fix->mult) * fix->div;
+		req->best_parent_rate =
+			clk_hw_round_rate(clk_hw_get_parent(hw), best_parent);
+	}
+
+	req->rate = (req->best_parent_rate / fix->div) * fix->mult;
+
+	return 0;
+}
+
+static int clk_wzrd_static_factor_set_rate(struct clk_hw *hw,
+					   unsigned long rate,
+					   unsigned long parent_rate)
+{
+	return 0;
+}
+
+static const struct clk_ops clk_wzrd_static_fixed_factor_ops = {
+	.enable = clk_wzrd_enable,
+	.determine_rate = clk_wzrd_static_factor_determine_rate,
+	.set_rate = clk_wzrd_static_factor_set_rate,
+	.recalc_rate = clk_wzrd_static_factor_recalc_rate,
+};
+
+static struct clk_hw *
+clk_wzrd_devm_register_static_fixed_factor(struct device *dev,
+					   const char *name,
+					   const struct clk_parent_data *parent_data,
+					   unsigned long flags,
+					   unsigned int mult,
+					   unsigned int div)
+{
+	struct clk_init_data init = {};
+	struct clk_fixed_factor *fix;
+	struct clk_hw *hw;
+	int ret;
+
+	fix = devm_kzalloc(dev, sizeof(*fix), GFP_KERNEL);
+	if (!fix)
+		return ERR_PTR(-ENOMEM);
+
+	fix->mult = mult;
+	fix->div = div;
+
+	init.name = name;
+	init.ops = &clk_wzrd_static_fixed_factor_ops;
+	init.flags = flags;
+	init.parent_data = parent_data;
+	init.num_parents = 1;
+
+	fix->hw.init = &init;
+
+	hw = &fix->hw;
+	ret = devm_clk_hw_register(dev, hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return hw;
+}
+
 static struct clk_hw *clk_wzrd_register_divf(struct device *dev,
 					  const char *name,
 					  const char *parent_name,
@@ -1290,9 +1378,11 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct clk_wzrd *clk_wzrd;
+	const char *clk_name;
 	unsigned long rate;
+	struct clk_hw *hw;
 	int nr_outputs;
-	int ret;
+	int ret, i;
 
 	ret = of_property_read_u32(np, "xlnx,nr-outputs", &nr_outputs);
 	if (ret || nr_outputs > WZRD_NUM_OUTPUTS)
@@ -1302,6 +1392,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 				GFP_KERNEL);
 	if (!clk_wzrd)
 		return -ENOMEM;
+	clk_wzrd->clk_data.num = nr_outputs;
 	platform_set_drvdata(pdev, clk_wzrd);
 
 	clk_wzrd->axi_clk = devm_clk_get_enabled(&pdev->dev, "s_axi_aclk");
@@ -1337,7 +1428,6 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 
-		clk_wzrd->clk_data.num = nr_outputs;
 		ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
 						  &clk_wzrd->clk_data);
 		if (ret) {
@@ -1360,6 +1450,49 @@ static int clk_wzrd_probe(struct platform_device *pdev)
 				dev_warn(&pdev->dev,
 					 "unable to register clock notifier\n");
 		}
+	} else {
+		u32 mul_div[WZRD_NUM_OUTPUTS * 2];
+		const struct clk_parent_data parent_data = { .fw_name = "clk_in1" };
+		int num_elems = nr_outputs * 2;
+
+		/*
+		 * xlnx,clk-mul-div is a uint32-matrix of <mul div> pairs;
+		 * FDT encodes it as a flat u32 array so we can read it directly.
+		 */
+		ret = of_property_read_u32_array(np, "xlnx,clk-mul-div",
+						 mul_div, num_elems);
+		if (ret) {
+			dev_err(&pdev->dev, "xlnx,clk-mul-div missing or invalid\n");
+			return ret;
+		}
+
+		for (i = 0; i < nr_outputs; i++) {
+			u32 mul = mul_div[2 * i];
+			u32 div = mul_div[2 * i + 1];
+
+			if (!mul || !div)
+				return dev_err_probe(&pdev->dev, -EINVAL,
+						     "invalid mul/div for clkout%d\n", i);
+
+			clk_name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
+						  "%s_out%d", dev_name(&pdev->dev), i);
+			if (!clk_name)
+				return -ENOMEM;
+
+			hw = clk_wzrd_devm_register_static_fixed_factor(&pdev->dev, clk_name,
+									&parent_data,
+									CLK_SET_RATE_PARENT,
+									mul, div);
+			if (IS_ERR(hw))
+				return PTR_ERR(hw);
+			clk_wzrd->clk_data.hws[i] = hw;
+		}
+
+		ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_onecell_get,
+						  &clk_wzrd->clk_data);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					     "unable to register clock provider\n");
 	}
 
 	return 0;
-- 
2.34.1


