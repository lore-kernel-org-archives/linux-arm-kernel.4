Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECF0606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 16:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XUR8qu8+;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=hqgcn7Cy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XmT6pkmgdrYZRHyHCI60obMGWQ9y9UZjI+1K357Yy1E=; b=XUR8qu8+8SEcAB
	GZfK7YJHtb/J6mFR30M/P0QKhMm8EV2IYsMVmpaIjC5wEeAr8rEHdBJjq64Yk/FXCq1vuJJ/QjTb+
	qrmemmv3O2lrP95l78cAnPV0QK0+28og+z+xiIRXWArzgjmPyL71aVUbAsW1OqLpaL6NdJ0qRiWtl
	tdgESi6M0mAL03hInbpR5vlRb9kosluAnrLPQrxXz1g4gH6rrNOVcV8t3JkWIbLH3KNeTDi0E1iVD
	C4sq6l7v1RJdcZEhrNL9cEXznIDCgK2iIN/LdIc8qXWlCDx8udnhCmn3mGdqCxx9elZLwvWvAY6R7
	iZ6shb+kGCT73s7UN12A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVANj-00000001Ldi-3CN5;
	Sun, 22 Nov 2026 16:25:35 +0000
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVANM-00000001LS4-3S8t;
	Sun, 22 Nov 2026 16:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795364705; bh=XmT6pkmgdrYZRHyHCI60obMGWQ9y9UZjI+1K357Yy1E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hqgcn7CyAEeUUSsd2pzpuqGmlMzBhm0d217Gz9b+VTlgbACnnyTK5mYrilGfpA6m1
	 /bqZXpPYjJ8QYIAEoiMbm+Rk0HPJNI05i6/k88ZuhSPyhal6fXrHuHYMMnV/ECr/Zr
	 xpdbebOgIYGyC7bSRASNKog/m1SKiew9vr/1i7Hg=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 640042D7; Mon, 23 Nov 2026 00:25:00 +0800
X-QQ-mid: xmsmtpt1795364703try2u705y
Message-ID: <tencent_C39B83AEA61743AAF1CCB394F87DDA05E409@qq.com>
X-QQ-XMAILINFO: Md0EpfRTqfgW4vF+D0wkc2AmIyGZH7nDUeMkpNd4JR1iZEWqDaPxriG5EBwyT9
	 uOvtTGt4399yvngR5ZtNrghItVbTYzjpV7FZUp0wrrsCatkYIxRggENNOf8ul9A0nnovjbXvg9wi
	 qURuYsxwJXv0xFX1OsC/jTL89+J9jjCjXcQQpEXpGyE3j70q8Li+HChvAtA98PzDZOs81enGDodQ
	 W5BD3Vlod/ZxX9euwCVI7pI1nVNlzbT5a5iO7xtaaSJYcg3mlPF6lbqJJP4fL8O0gsaZldKA/zjp
	 iegaeEczcBsAKFtg22iyey/6YuIoBSwpkYQHe2nzM7iL5Zqhi5mYV0vKpV8HdidUu6ycfOZZjH5f
	 CDZNzCMMywbHiAM/HKrlwuZeEJ6VWGmzpK5iaM4mzS3N5yjTrV/4XvKgK3ahue8hZwsl125jsh5i
	 PYBA71OPrNDBbdpD0PQHd2bymMqKfLfwteH9xrWBn3B7b4Np2ShWX3eupRFG6gTpGxHbUzAXDezg
	 aA/cTkG1isP6K3hQBWF+FQC7d9He87+Aneh08R6Q7mbL0cAe1CLBBlBlKxf+B+7jivmz6VF7RsMo
	 W5NnnSZ3xFarMVIl2u2S4CG4KuxAwoeWEclcCkhgLU1Bsva/B9t7vLqinV49neoF2+ChZgIkaoYn
	 UkvnVWSjz/uAIUH346Wneeqhh94OV/sPJUcJhje5KP47dKpnS2hEGlgGICcqbqYuQSqmcPmS+UZZ
	 E5rwd6FRhKQgvNXfZpu67cnrP4L/CYq0IBTCiULrxBFnG15o0vOOwsmmmCJM+kOP53JgQpKZ7k6Y
	 ptUDHUcv4UsiNeuUg1CS4Q1x6PSQRkBE+lXa68UCLM4oHDOHkGEFFv3+f1w36EQAP/58+l8+Zw45
	 4OxuqbsJUuFv6sifnOSD2jta5XaAP4aRngE4ZJ8mS8buXCO0w/IEyvBThsiDunmqJI/6Cz7u0Ovy
	 zbiE9+4UpU76o/ZhkU50QS3yN7BgApTDX/sZZ6NnhDdGjIyIQG09R0hge5dgYk5FWysxdWAg4l54
	 eelj9dTAOW7qlZySJ3V89O0xfORuOJxWwWNjQPqHwTGd2hwxgOb3VzTVJW4DO4FAZ3vUHZNR/U6z
	 S8mgunnD78OT+m6WEAjhcjneWAlYFPceIrP4Kk+glYamSu72R8Q7iA8G0svQv2pPL44wbK2VqgzH
	 VAFKKjLAjRo86KOQ==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Xiangyu Zhu <1194781887@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Xiangyu Zhu <1194781887@qq.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] clk: rockchip: rk3506: Register the SAI MCLK output gates
Date: Mon, 23 Nov 2026 00:24:46 +0800
X-OQ-MSGID: <e88e39b85de9397e0436d52bd1b32f4c7c1c23e9.1795363509.git.1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795363509.git.1194781887@qq.com>
References: <cover.1795363509.git.1194781887@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_082514_955338_EAA4FE4F 
X-CRM114-Status: GOOD (  14.61  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The RK3506 has four SAI MCLK output gates in the PMU and system GRFs.
Register them with the existing GRF gate support so the SAI MCLK pin
direction can be controlled through the clock framework, the same way
RK3576 and RK3588 handle their SAI/I2S MCLK output gates.

The PMU GRF is added as an auxiliary GRF and the SAI0/SAI1 gates use
it, while the SAI2/SAI3 gates live in the system GRF, which is already
available to the CRU through the "rockchip,grf" phandle.

The PMU GRF lookup is not fatal: it only carries the SAI0/SAI1 MCLK
gates, so a missing syscon must not keep the whole CRU from being
registered.

Tested on a RK3506B board: the SAI0 MCLK output runs at 12.288 MHz and
drives the ES8388 codec, audio playback works, and the GRF gate bits
were read back from the registers to confirm that they get set.

Signed-off-by: Xiangyu Zhu <1194781887@qq.com>
---
 drivers/clk/rockchip/clk-rk3506.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3506.c b/drivers/clk/rockchip/clk-rk3506.c
index dd59bd60..d3c3452e 100644
--- a/drivers/clk/rockchip/clk-rk3506.c
+++ b/drivers/clk/rockchip/clk-rk3506.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -520,6 +521,8 @@ static struct rockchip_clk_branch rk3506_clk_branches[] __initdata = {
 			RK3506_CLKGATE_CON(14), 0, GFLAGS),
 	GATE(MCLK_OUT_SAI0, "mclk_out_sai0", "mclk_sai0", 0,
 			RK3506_CLKGATE_CON(14), 1, GFLAGS),
+	GATE_GRF(MCLK_OUT_SAI0_TO_IO, "mclk_sai0_to_io", "mclk_out_sai0",
+		 0, 0x4, 8, CLK_GATE_HIWORD_MASK, grf_type_pmu0),
 	COMPOSITE(MCLK_SAI1, "mclk_sai1", mclk_sai_asrc_parents_p, 0,
 			RK3506_CLKSEL_CON(41), 8, 4, MFLAGS, 0, 8, DFLAGS,
 			RK3506_CLKGATE_CON(14), 2, GFLAGS),
@@ -527,6 +530,8 @@ static struct rockchip_clk_branch rk3506_clk_branches[] __initdata = {
 			RK3506_CLKGATE_CON(14), 3, GFLAGS),
 	GATE(MCLK_OUT_SAI1, "mclk_out_sai1", "mclk_sai1", 0,
 			RK3506_CLKGATE_CON(14), 4, GFLAGS),
+	GATE_GRF(MCLK_OUT_SAI1_TO_IO, "mclk_sai1_to_io", "mclk_out_sai1",
+		 0, 0x4, 9, CLK_GATE_HIWORD_MASK, grf_type_pmu0),
 	GATE(HCLK_ASRC0, "hclk_asrc0", "hclk_lsperi_root", 0,
 			RK3506_CLKGATE_CON(14), 5, GFLAGS),
 	COMPOSITE(CLK_ASRC0, "clk_asrc0", gpll_v0pll_v1pll_g_parents_p, 0,
@@ -608,6 +613,8 @@ static struct rockchip_clk_branch rk3506_clk_branches[] __initdata = {
 			RK3506_CLKGATE_CON(18), 3, GFLAGS),
 	GATE(MCLK_OUT_SAI2, "mclk_out_sai2", "mclk_sai2", 0,
 			RK3506_CLKGATE_CON(18), 4, GFLAGS),
+	GATE_GRF(MCLK_OUT_SAI2_TO_IO, "mclk_sai2_to_io", "mclk_out_sai2",
+		 0, 0x4, 2, CLK_GATE_HIWORD_MASK, grf_type_sys),
 	COMPOSITE(MCLK_SAI3_SRC, "mclk_sai3_src", mclk_sai_asrc_parents_p, 0,
 			RK3506_CLKSEL_CON(52), 8, 4, MFLAGS, 0, 8, DFLAGS,
 			RK3506_CLKGATE_CON(18), 5, GFLAGS),
@@ -617,6 +624,8 @@ static struct rockchip_clk_branch rk3506_clk_branches[] __initdata = {
 			RK3506_CLKGATE_CON(18), 7, GFLAGS),
 	GATE(MCLK_OUT_SAI3, "mclk_out_sai3", "mclk_sai3_src", 0,
 			RK3506_CLKGATE_CON(18), 8, GFLAGS),
+	GATE_GRF(MCLK_OUT_SAI3_TO_IO, "mclk_sai3_to_io", "mclk_out_sai3",
+		 0, 0x4, 3, CLK_GATE_HIWORD_MASK, grf_type_sys),
 	COMPOSITE(MCLK_SAI4_SRC, "mclk_sai4_src", mclk_sai_asrc_parents_p, 0,
 			RK3506_CLKSEL_CON(53), 8, 4, MFLAGS, 0, 8, DFLAGS,
 			RK3506_CLKGATE_CON(18), 9, GFLAGS),
@@ -787,10 +796,20 @@ static void __init rk3506_clk_init(struct device_node *np)
 	struct rockchip_clk_provider *ctx;
 	unsigned long clk_nr_clks;
 	void __iomem *reg_base;
+	struct regmap *pmu_grf;
 
 	clk_nr_clks = rockchip_clk_find_max_clk_id(rk3506_clk_branches,
 						   ARRAY_SIZE(rk3506_clk_branches)) + 1;
 
+	/*
+	 * The PMU GRF only carries the SAI0/SAI1 MCLK output gates, so a
+	 * missing (or not yet probed) syscon must not prevent the CRU itself
+	 * from being registered.
+	 */
+	pmu_grf = syscon_regmap_lookup_by_compatible("rockchip,rk3506-grf-pmu");
+	if (IS_ERR(pmu_grf))
+		pr_warn("%s: could not get PMU GRF syscon\n", __func__);
+
 	reg_base = of_iomap(np, 0);
 	if (!reg_base) {
 		pr_err("%s: could not map cru region\n", __func__);
@@ -804,6 +823,10 @@ static void __init rk3506_clk_init(struct device_node *np)
 		return;
 	}
 
+	if (!IS_ERR(pmu_grf) &&
+	    rockchip_clk_add_grf(ctx, pmu_grf, grf_type_pmu0))
+		pr_warn("%s: could not add PMU GRF\n", __func__);
+
 	rockchip_clk_register_plls(ctx, rk3506_pll_clks,
 				   ARRAY_SIZE(rk3506_pll_clks),
 				   0);
-- 
2.47.3


