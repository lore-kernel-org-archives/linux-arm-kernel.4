Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1472606A332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 11:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1J03MTiT;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=P32bqnuf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y+AYtfVk0LkCTNbc8GOpJgwDHV5K3ThuTa26y9mHfAo=; b=1J03MTiTC9Blq3
	T6hNGDbEbJBeG8iR06OS2y7P2Tqzbzp85frFwd95FstPpvsArH5y6HNg/5Sea48a46xbH7ca80zsC
	Ovt0eFWOeoD+2ofIoXfzWsICtuE89+52zJBSA0nSe5SL+jbOlXDwBEnPorclgecO7OBWd2BmMqJfJ
	aZhd1pfF8JFc/59Ax+sNxkUYlalp0SPQF1lwnHKn0sm7COP5JJlQAaQRMIZz/EWP38Tt1Su+6YoOr
	WgpihWkwCHp4+Npw5OwZo3SBEK9ScSMgmkJi12VQeE5/ClBpZm2x5seUfk1JBam4fYWFX6A/fPmCd
	g2+iM9eWTK7xT/rDwWOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUjT5-0000000H6a6-0Vrc;
	Sat, 21 Nov 2026 11:41:19 +0000
Received: from out203-205-221-164.mail.qq.com ([203.205.221.164])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUjT2-0000000H6ZK-1iTp;
	Sat, 21 Nov 2026 11:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795261273; bh=y+AYtfVk0LkCTNbc8GOpJgwDHV5K3ThuTa26y9mHfAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P32bqnufmrxVvq9fqpUbuKboJgfUREEdeNy73b/aUmjyhFFmEVUzeSeEsZ8ysnxUq
	 /ec1JRAXCxLqmJ4AF5P51kJVIo4UXgFQGzlAWnjI0xxDAIDNCaXPwPfNtjLsZZA/RU
	 7lz7ddu/+arAEk5Smb/DS30w99kJ68PcPx3oBVxo=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id A483CACC; Sat, 21 Nov 2026 19:41:08 +0800
X-QQ-mid: xmsmtpt1795261269t3sk748np
Message-ID: <tencent_27C5C9EA21F34B25719F07818366912BB407@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLgVnKCHPq4TKmrtsqjLlnWFixUpd7RAqUMfvIq8rLc10uB7f6m6
	 Pd5xPUqBsCvRep8z3/QvdQ17PMxayD00x5ZY6LCbHWjqqNv3Wb6/NzI/ENVt1KhHm4LWCC33dcMO
	 a2HchLcNOtrZ0HQKGpuvxoVAOFa2FUcHhpx/EYMHOfV71r7GBHHLoHHRZ1SzRpQLNZmaRZDue9MB
	 1U2kT/7MGjeZw3YaqnU83a3wD6fYgZjiJRokUiOLRUS5IXjoYoG/HwyJg0JzQ4yB0hC9FZQU3aUC
	 zgzW7OqJlfS58xF1r5EsllNhrlSTg4zxeLrKbvxIFi6WfLfMXbh0fqMMLEf001kXgQmfNtxQy2b3
	 NgdOc7Gv/x6bq3o4iCbAXMaTYK094dwTTkoJlF/OyqYOp4UcqZO7gvG2pDGM29ikNVNAu4K6Fy0w
	 uLooprOeVLJBVc9KCNFpvCTN0dYD7LSBNG2ZOALyeorUZIxEw7CUwspCIhGIKoGsg/8SGeNxv4eT
	 5aytPc+1QTPP2Ht3NtDZQmv9rbeP3qP85fhPoAun/VEku9ApgpJkh7ooL1o/azw+TuMHNSdvT6Q8
	 j0Y125z5VTTzRiX6wWBP/sTrq51MUEy1eNrKNH+ZnKlbPofcsUVDHqrkl8WrfASTWOjfGS4vORKu
	 u8z7+gL4f0Vxg3DNU86lXyowXm9nqMOrDhMG9/JHuLf4uMFgYcTKTeLJHtUAnxAw9CGpL/4eI3EI
	 p9NgxqeZ17PccHxEHVvq+utPjajz6YGotJauE7mH6oY13cGlTp/EUw/LvESy5tmqbjNuD++wicDW
	 OP34SskSazum5l0HySjdn5LRPqINBzZaJSzJHc47wEq46UfEczuPSB3d6bNWLYIcCLOtJW1zY+3M
	 39PrDMhPoleAZ7pA2bUrKJWrIuQbM64FLLy/r8MfJ87RsnHEpvNxpHqRtRoA03pVce9Q1jibjDii
	 nTnUaF8oUKSbnX/OiY4gFD/SUBgaLGr77T8fqxc/11cBAMWPxUlQWZeNYI1amHEP4+2UKWDfac2k
	 xjjMCKvUztCINHrKkIrJ0IeR2QGFDEl1iK+KPU9iixkfJy+/FGtfHg+/U6BlQqDjoQzp7kN7Vxih
	 PpZTpfSFDOwCO9sAEkMFYIp0UwIg==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: ZhuXiangyu <1194781887@qq.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ZhuXiangyu <1194781887@qq.com>
Subject: [PATCH 2/2] clk: rockchip: rk3506: add SAI MCLK output gates
Date: Sat, 21 Nov 2026 19:41:06 +0800
X-OQ-MSGID: <20261121114106.1464639-2-1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121114106.1464639-1-1194781887@qq.com>
References: <20261121114106.1464639-1-1194781887@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_034116_773619_88AAA903 
X-CRM114-Status: GOOD (  11.69  )
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
direction can be controlled through the clock framework.

The PMU GRF is added as an auxiliary GRF and the SAI0/SAI1 gates use
it, while the SAI2/SAI3 gates live in the system GRF.

Signed-off-by: ZhuXiangyu <1194781887@qq.com>
---
 drivers/clk/rockchip/clk-rk3506.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3506.c b/drivers/clk/rockchip/clk-rk3506.c
index dd59bd60..4196f4f7 100644
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
@@ -787,10 +796,17 @@ static void __init rk3506_clk_init(struct device_node *np)
 	struct rockchip_clk_provider *ctx;
 	unsigned long clk_nr_clks;
 	void __iomem *reg_base;
+	struct regmap *pmu_grf;
 
 	clk_nr_clks = rockchip_clk_find_max_clk_id(rk3506_clk_branches,
 						   ARRAY_SIZE(rk3506_clk_branches)) + 1;
 
+	pmu_grf = syscon_regmap_lookup_by_compatible("rockchip,rk3506-grf-pmu");
+	if (IS_ERR(pmu_grf)) {
+		pr_err("%s: could not get PMU GRF syscon\n", __func__);
+		return;
+	}
+
 	reg_base = of_iomap(np, 0);
 	if (!reg_base) {
 		pr_err("%s: could not map cru region\n", __func__);
@@ -804,6 +820,12 @@ static void __init rk3506_clk_init(struct device_node *np)
 		return;
 	}
 
+	if (rockchip_clk_add_grf(ctx, pmu_grf, grf_type_pmu0)) {
+		pr_err("%s: could not add PMU GRF\n", __func__);
+		iounmap(reg_base);
+		return;
+	}
+
 	rockchip_clk_register_plls(ctx, rk3506_pll_clks,
 				   ARRAY_SIZE(rk3506_pll_clks),
 				   0);
-- 
2.47.3


