Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19151606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 00:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E8ySRHJC;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ZgY3z/Nc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R5SW0FOMhQcjJVUD0F86AXrkpvjc/n361QEV4FcYPNA=; b=E8ySRHJCWRqcay
	D5Bo2KvtOfEmENSj5uUn3ZhhC6JV1k28ZcNHUEnIwljsB6AzRpYIA7C2dJF+offJ6PY2IvTIPwP4+
	8vdCKLFNMsQc9x7Ftr8XrUg/WcxAFWp6uwMwzeiUtD/FUzASCaPGxXyhp4sgUkmtDSpYNuO/f8DUy
	MpeRdP8um2eU8uj3gL5rmHUNICpn3rSoXwetp7oIE1RZ2jbX4m1UzqMuBXL/L2WFf37Yn/amROodD
	N99YdyIjND2lwBC3Si+fFCUwQBmAuLHb5OX0AVThy1+W+BpQO8XyBenM3+fiWn2XfB4x+m+HmPU2h
	FfWbqOW+mNdRvyUAwWvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVI5Q-00000001ywU-2D3l;
	Mon, 23 Nov 2026 00:39:12 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVI51-00000001yfx-3ynl;
	Mon, 23 Nov 2026 00:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795394325; bh=R5SW0FOMhQcjJVUD0F86AXrkpvjc/n361QEV4FcYPNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZgY3z/NcNev4LfJvDw4KQF1Vr1bWNg47aHRKW6J9Q/Woj1KMWJol9Ooh6R4VEjXKC
	 vVY4SbYTJawKNQ6o0MWPSqosVYVEKuNyJfaAWu75/UdeUP7Lyv3xyDiYZpEXol6VYx
	 IhpYsPBHXlOAO05PZatVdBtY4NhMEIp6vqbyo2Dg=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 9A63524B; Mon, 23 Nov 2026 08:38:38 +0800
X-QQ-mid: xmsmtpt1795394323tsgfkagg7
Message-ID: <tencent_4C9312830F80807EB3C015E9A2653587B906@qq.com>
X-QQ-XMAILINFO: OWaxIeuIQ9KIGEqtwE0vT9/Zpowm+sfxYEE1IB6VHMV0uc+fiZy95LrX8KQ4LC
	 qBUYvyRNUVv1CjbDPoAP/Hd98OqgsJb7flgoliQiZ5sZc42H1qYCQm68AoTboME5nnOA+6N3yVpp
	 QMBQSxaSJabMEnTYzuYSSlyURmmOn25pda5gEIPxsfMuVJLnegUkxWgYSUMA7fXC6ANLxH4fQaBd
	 2wzqYDtBYmyZTdkcDuE6W1hMRrPce/w4Laho+7xTqVxTHWoOztwCs501F1FiqPJa/btWuTOM5PAd
	 4iboqH7lMMZVrXutRnCIGyWmlAawL4Eec54CfIgwPHVC2TqrIMGvqu6VOSX4Xo0ClGx5kF9kbw5G
	 W5ckSFZAubQon1NGF71TBFjL4XwS/wRDaSnHe4zV4xXKeLLNCdzZqVBa7JZHRH1IPg4HBHlKMJXG
	 tbEyHZikPhSZWbOlI2E9Xw/8DqaPIu7FFswh3USKpLfrcwL134j0RGtEwx/UN6SDwpI5DINpI1M2
	 XXwbBYag/PXaBwZLq75RKZv0UmVfjlL34BUzndmHUXCevW7Rl5PTq5LpsnZzUGxcVNEZA2UyEfHM
	 8FLKq3shpveu29UdrwUBdEWvL57+Mpq8mVUAxbRUNPryMlRNfmVpYgWg6LRu/7MQVQBXARe7JseP
	 bp7aTY16IMirj+ClWvLT/9cFEmPhDK0Y6Bd94Z8rq8kelyiixDNsfsZnPwO9JdbrHcXS2e4HyvLz
	 NNBYvJsRXr4I+JuFg2gDiXZw6iM6z2QApxymGKUZMos/9Id+0rfkXIlms4Wu/uS/Ql39OioJYD+k
	 XhVZbFIsdNhVDAXrcxycMCwHo3HnPSc6VI095t6Zq1BzVwun/f/DxI6NQg1JrCu1Zir/gQbWi2tB
	 bR0qX+E+2oFB+WfmJKYMKmfZzmAp9GpRwR++7bI2LsaPSEXY22Q5pEG3IsvmUVcU2i/v7KgnalJ9
	 u0OElOlr+tH2vqdRu6orq/7ztcnDicMQJzVY5M6XEVo/M2YjrJ5d6+zCWHfrTWsvWqUsa8aJh2v0
	 GBPdIQHFjI5P8sgI9EE3hIbI73fadTil/TpD/MDI/mlfHUJPq+vef/mclxZBnDnfRSFoq4Wdw82P
	 okBDD3LBSN6FLIgIrQ+czANYkVYxULAzPxQ93hk4HkVSa3MvJAYUOZFKuE0JHs1kD+TEr29hQnDS
	 QWcHCarAMVgVE/tmDXXWgdCwi6ItFgkc0wgYBiOutpt3WdNMWBUJENh/uK
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
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
Subject: [PATCH v4 3/3] clk: rockchip: rk3506: Register the SAI MCLK output gates
Date: Mon, 23 Nov 2026 08:38:36 +0800
X-OQ-MSGID: <68afab974dc2a9fe1800c648a342cb59be7af45d.1795394137.git.1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795394137.git.1194781887@qq.com>
References: <cover.1795394137.git.1194781887@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_163848_303964_011C4B5F 
X-CRM114-Status: GOOD (  16.58  )
X-Spam-Score: -1.9 (-)
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

The SAI2/SAI3 gates sit in the system GRF, which the CRU already has via
its "rockchip,grf" phandle.  The SAI0/SAI1 gates live in the PMU GRF, so
they are kept in a separate branch table that is only registered once
that syscon has been added as an auxiliary GRF.  Registering them
unconditionally would make them fall back to the system GRF and toggle an
unrelated bit there.

The PMU GRF lookup stays non-fatal: it only carries the SAI0/SAI1 gates,
so a missing syscon must not keep the whole CRU from being registered.

Tested on a RK3506B board: the SAI0 MCLK output runs at 12.288 MHz and
drives the ES8388 codec, audio playback works, and the GRF gate bits
were read back from the registers to confirm that they get set.

The PMU GRF is matched by its documented "rockchip,rk3506-pmu-grf" compatible.

Signed-off-by: Xiangyu Zhu <1194781887@qq.com>
---
 drivers/clk/rockchip/clk-rk3506.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3506.c b/drivers/clk/rockchip/clk-rk3506.c
index dd59bd60..956d5e92 100644
--- a/drivers/clk/rockchip/clk-rk3506.c
+++ b/drivers/clk/rockchip/clk-rk3506.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -608,6 +609,8 @@ static struct rockchip_clk_branch rk3506_clk_branches[] __initdata = {
 			RK3506_CLKGATE_CON(18), 3, GFLAGS),
 	GATE(MCLK_OUT_SAI2, "mclk_out_sai2", "mclk_sai2", 0,
 			RK3506_CLKGATE_CON(18), 4, GFLAGS),
+	GATE_GRF(MCLK_OUT_SAI2_TO_IO, "mclk_sai2_to_io", "mclk_out_sai2",
+		 0, 0x4, 2, CLK_GATE_HIWORD_MASK, grf_type_sys),
 	COMPOSITE(MCLK_SAI3_SRC, "mclk_sai3_src", mclk_sai_asrc_parents_p, 0,
 			RK3506_CLKSEL_CON(52), 8, 4, MFLAGS, 0, 8, DFLAGS,
 			RK3506_CLKGATE_CON(18), 5, GFLAGS),
@@ -617,6 +620,8 @@ static struct rockchip_clk_branch rk3506_clk_branches[] __initdata = {
 			RK3506_CLKGATE_CON(18), 7, GFLAGS),
 	GATE(MCLK_OUT_SAI3, "mclk_out_sai3", "mclk_sai3_src", 0,
 			RK3506_CLKGATE_CON(18), 8, GFLAGS),
+	GATE_GRF(MCLK_OUT_SAI3_TO_IO, "mclk_sai3_to_io", "mclk_out_sai3",
+		 0, 0x4, 3, CLK_GATE_HIWORD_MASK, grf_type_sys),
 	COMPOSITE(MCLK_SAI4_SRC, "mclk_sai4_src", mclk_sai_asrc_parents_p, 0,
 			RK3506_CLKSEL_CON(53), 8, 4, MFLAGS, 0, 8, DFLAGS,
 			RK3506_CLKGATE_CON(18), 9, GFLAGS),
@@ -782,11 +787,20 @@ static struct rockchip_clk_branch rk3506_clk_branches[] __initdata = {
 			RK3506_CLKGATE_CON(20), 0, GFLAGS),
 };
 
+static struct rockchip_clk_branch rk3506_clk_pmu_grf_branches[] __initdata = {
+	GATE_GRF(MCLK_OUT_SAI0_TO_IO, "mclk_sai0_to_io", "mclk_out_sai0",
+		 0, 0x4, 8, CLK_GATE_HIWORD_MASK, grf_type_pmu0),
+	GATE_GRF(MCLK_OUT_SAI1_TO_IO, "mclk_sai1_to_io", "mclk_out_sai1",
+		 0, 0x4, 9, CLK_GATE_HIWORD_MASK, grf_type_pmu0),
+};
+
 static void __init rk3506_clk_init(struct device_node *np)
 {
 	struct rockchip_clk_provider *ctx;
 	unsigned long clk_nr_clks;
 	void __iomem *reg_base;
+	struct regmap *pmu_grf;
+	bool have_pmu_grf = false;
 
 	clk_nr_clks = rockchip_clk_find_max_clk_id(rk3506_clk_branches,
 						   ARRAY_SIZE(rk3506_clk_branches)) + 1;
@@ -804,6 +818,15 @@ static void __init rk3506_clk_init(struct device_node *np)
 		return;
 	}
 
+	pmu_grf = syscon_regmap_lookup_by_compatible("rockchip,rk3506-pmu-grf");
+	if (IS_ERR(pmu_grf)) {
+		pr_warn("%s: could not get PMU GRF syscon\n", __func__);
+	} else if (rockchip_clk_add_grf(ctx, pmu_grf, grf_type_pmu0)) {
+		pr_warn("%s: could not add PMU GRF\n", __func__);
+	} else {
+		have_pmu_grf = true;
+	}
+
 	rockchip_clk_register_plls(ctx, rk3506_pll_clks,
 				   ARRAY_SIZE(rk3506_pll_clks),
 				   0);
@@ -815,6 +838,10 @@ static void __init rk3506_clk_init(struct device_node *np)
 	rockchip_clk_register_branches(ctx, rk3506_clk_branches,
 				       ARRAY_SIZE(rk3506_clk_branches));
 
+	if (have_pmu_grf)
+		rockchip_clk_register_branches(ctx, rk3506_clk_pmu_grf_branches,
+					       ARRAY_SIZE(rk3506_clk_pmu_grf_branches));
+
 	rk3506_rst_init(np, reg_base);
 
 	rockchip_register_restart_notifier(ctx, RK3506_GLB_SRST_FST, NULL);
-- 
2.47.3


