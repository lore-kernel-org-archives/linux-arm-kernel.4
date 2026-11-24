Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396AE606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 00:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=odfVeSI4;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm2 header.b=LdtMYsNQ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Ljh9v4ta
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=USuWAzJaEpO2tz+1HoJhHN3oMTp4mj4DRvQNdSwIcO4=; b=odfVeSI4sX9WBQ
	0CqQYpSFGa1qnFhTu1gpTwGcoOTKY1qGkOAaQ8ot3ciNJrtT7/hCfnMEehGDoiqmuu3DjC9KxCeTV
	hacYAtyIvOK7I925G9wkD2YVypIO/eNBLegWDE2WcivocXIEW4oqxHE74o/zYUnxhTyl/MoVYfuLs
	ll8H02P4HHIFAt+6B7KELC9akpr5+6pN+FxMITg9Ha9/UNsTTZb8b7rqJ3VaLLFIoM8kzD+ud+2Ls
	scH2JFaqRrHI3kt7oDn3XEwwKNc34jsAmIRyT6lp7gEbemGn5/NzLsiL3AiuXpz/3UUwe5IGJYHIt
	71+o5UhrpSGXrsW/0NnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVe0M-00000005EYu-3aq5;
	Tue, 24 Nov 2026 00:03:26 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVe08-00000005ERx-0Wyt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 00:03:21 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 5D3AAEC0B29
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 19:03:11 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 23 Nov 2026 19:03:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1795478591; x=
	1795564991; bh=USuWAzJaEpO2tz+1HoJhHN3oMTp4mj4DRvQNdSwIcO4=; b=L
	dtMYsNQbwH8Nkl1fRe9g5vEPo+dzzj22szDLZ+R0CirgUqkaMjPqNCw6FCHkma+S
	fVDjmX/zAnFHD2YohdywiC/pGkDB92sbdjyFAIW3db07HpfamVXY0d+5Od7yyDzg
	RwCVgRKq0bMqGkNXmvJLFVGPeNh541IVEOFbvfBxn7dGcWFMUOSHucndBKHx0C2z
	HS+DoCpigubadb8OCTZdEyFTHMb96o1TbbpHru/dyWXJ8L9GBJaoe3tRIRJaUjc+
	33+B8RbZAYEAnKaVcdHvvrv33mS0Pv9TMJJdOwS8u5FORIKUMvfJKcGKIHIdB+Sq
	I26d+7CneduB1eEah8V6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795478591; x=1795564991; bh=U
	SuWAzJaEpO2tz+1HoJhHN3oMTp4mj4DRvQNdSwIcO4=; b=Ljh9v4taklrAs/W46
	wFCVboPispzxoyEgq7LKfK+RYzECWjVfb9rWaRcP42w/ebgqx3ZavIQLSEz1aaH9
	LAtYhC6CttEtZVGcHxMk5Wh6e6qoNJLAZw5So9Dm7V7OFBRR5oRkSm9IrMFHGviV
	Mh3dtdxqPeVm2trJ+TqsoH6MXcdyn+O0WQrS7tsTC0oiL1kio7IUDz1oBXE70OVl
	fk1dsJN1+WPBKMJXzs64OFmoulhqpp7keMlq8UtY54TMzDy1fDTxe0fU1z2CyBjy
	QZqnqXKBgYt7m+uJi913GlJ9/43NT3EqpXPaGq0wbk4vY09RiBPf6hZyQHDG0lNL
	tUEZw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795478591; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm2:rsa-sha256:CfFNeFQUWjak1PPVI9x/pgbduyYR0lAgvkl9AizB8s1JvYs
	ICwKDuWk6Jtp1VIPHSSszASdKFoUuy/o0zofuc2tK8etTYY0K8KKP6RdBGx/1ZI4
	/DjdFFnXBNXEOSJhfky0BSPXWJLIEYoyugYTGYXb5moJPW4Z3hcdJbSlGxmAVrop
	Y+HTj/PGfBIf+nIUGDie+5qP27nxYjmFWmXdqiKLnfhpxXtCP7aXJxz2T+x9JKB3
	nMiYKkSjyFdXeT7RcAKcje8g9QlCtTgasBmRwkjU9MMQNK20ZKDk2v2ziTNxAxnc
	pwjw/ZE22Q2adPjwCt6Say4e2rpgtUQr8IUIcvA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:NK/ol6VMFS1g2Tzz3DCQUhee2qCzx73EgnI/mJceXhY=:3qmchG7VMWiyCnFksjWyxYLSQ2dl7VXMaogtUEZ2IfI=;
X-ME-Sender: <xms:PtQEa9xszRmRJSNo59v5vLuXttDEOby3M1_B-6Z_sSECV1JodHaEGQ>
    <xme:PtQEa3rphU3zGDLWEZF2xH-hzsp2N7KoImLGvUEeRHm2YyVnYgpquv6gebJn8cLSQ
    DpnPZ_r1bdSUQEP7_f0xEgwLZNov8X6eHNTyzYZNKa0SiHDMO261Wi4hw>
X-ME-Received: <xmr:PtQEay6GGfa5c1kTbWWt54W6-kDI3JDm-YiSo4oSgH5VSXINmP55QNl_L4e1wJw1B9CndyeJ>
X-ME-Proxy-Cause: dmFkZTGKP0BuMVQ3da0kgk8xyu0FeulfFYiNwWsz1ncbbHTgCdKnIzqgtj8HE+Sx3Bdzzv
    UHBTv71EZVKpqeV9rxm1MIvNJL9AXj7xVBZmLE1eixpLLqayua7NAs8x5H0q1ciBofCLjp
    NMw7pEcY/WV52tz2iQPP0EmzGBLCISFgjTntJipgTFdXESJrU8iFlgEO+fAeoHXz2DOy1e
    bT9+yAkscfEZkaph3J6yRPtOAvFwXcm30bt4RskxY+A7l9M33XtIkcUJBggauJtB7ILkPB
    +nBCHuNp7bm2KuVS9+xfSl6UrUwwTUWs+yOcGSXlxnTMCiUc7Ag4WRGv2u8Gu/NL3Fomis
    yLr39kE1PWGjDQd33GTFoTtzq2wmTHyhxKUsr8devUTd7LcN+GMULeP2KDZhj0G005d7Bf
    n8Geo3w0RCm9ICHjIElOtacNN6kjyG6V6VPqD4CygQfFUt0Zet7Em9+FK/i96HU9UAYsyq
    HVebR8R5p8ISWcsSTN0NQUzg4wbM2OKbNi+4KwONMmewyCwsTj1chqllyeWOQxAPIAF2Hq
    NsMfdeX7XSc2wa4eBKcn9gF55DR1FT3pUeoMUnS4rG5YSu6ObUgD6LjLJk60RRTJC+avhq
    6QzdjsJnHRNeIe81zAkVO5MXpLRxjFzWXrIzsSOIP9YStbEbf/AiIwINRkSA
X-ME-Proxy: <xmx:PtQEa5gwc5tukPH4sEtwiG6FSDKGvDbC48qX1c7bUqGNqpMTplPuGQ>
    <xmx:PtQEa43SDBmAc1vvgLzwNoNfsh6Qh_Gfr2NTQHfVK3OXHXr2QvghJQ>
    <xmx:PtQEa3UgxGElwsw36dFsTy2jtN8RFn8t8yTbE5Z-2Obcvy3rH-LHgQ>
    <xmx:PtQEa92nbkEgP-5SEfnU_Cm3M52tQpH1AD56pEgjUUWbl4QioGJ8XA>
    <xmx:P9QEa7d2sbQlK88AzG3B5D2EBciDrxQeRSO2TFoz7WeIvx-gb_f2qKSh>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Nov 2026 19:03:02 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: ddrake@baylibre.com,
	royalnet026@gmail.com,
	sidong.yang@furiosa.ai,
	ulf.hansson@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	chaoyi.chen@rock-chips.com,
	shawn.lin@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	vlwwwwww@gmail.com,
	jeff.hugo@oss.qualcomm.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v18 7/8] arm64: dts: rockchip: add NPU (RKNN) nodes to rk3576
Date: Tue, 24 Nov 2026 13:01:42 +1300
Message-ID: <f1d20ec832e10a80dc813aa10697632e8024a685.1795478392.git.gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795478392.git.gahing@gahingwoo.com>
References: <cover.1795478392.git.gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_160314_498828_198E8DCB 
X-CRM114-Status: GOOD (  10.56  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the two NPU cores and their IOMMUs, disabled by default. Core 0 is
in PD_NPU0, core 1 in PD_NPU1. Label PD_NPU so that boards can give it
the NPU supply.

Set CLK_RKNN_DSU0 to 594 MHz. Nothing scales the NPU clock or voltage in
mainline, and the boot rate of 786 MHz at the boot voltage of 750 mV is
outside the vendor OPP table and gives wrong results; that table runs
up to 600 MHz at 725 mV.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 70 +++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 7828736bf9ac..6ff95066d470 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1131,7 +1131,7 @@ power: power-controller {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				power-domain@RK3576_PD_NPU {
+				pd_npu: power-domain@RK3576_PD_NPU {
 					reg = <RK3576_PD_NPU>;
 					#power-domain-cells = <1>;
 					#address-cells = <1>;
@@ -1350,6 +1350,74 @@ power-domain@RK3576_PD_VO1 {
 			};
 		};
 
+		rknn_core_0: npu@27700000 {
+			compatible = "rockchip,rk3576-rknn-core";
+			reg = <0x0 0x27700000 0x0 0x1000>,
+			      <0x0 0x27701000 0x0 0x1000>,
+			      <0x0 0x27703000 0x0 0x1000>;
+			reg-names = "pc", "cna", "core";
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_RKNN0>, <&cru HCLK_RKNN_ROOT>,
+				 <&cru CLK_RKNN_DSU0>, <&cru PCLK_NPUTOP_ROOT>,
+				 <&cru ACLK_RKNN_CBUF>, <&cru HCLK_RKNN_CBUF>;
+			clock-names = "aclk", "hclk", "npu", "pclk",
+				      "aclk_cbuf", "hclk_cbuf";
+			assigned-clocks = <&cru CLK_RKNN_DSU0>;
+			assigned-clock-rates = <594000000>;
+			resets = <&cru SRST_A_RKNN0>;
+			reset-names = "srst_a";
+			power-domains = <&power RK3576_PD_NPU0>;
+			iommus = <&rknn_mmu_0>;
+			status = "disabled";
+		};
+
+		rknn_mmu_0: iommu@27702000 {
+			compatible = "rockchip,rk3576-npu-iommu", "rockchip,rk3568-iommu";
+			reg = <0x0 0x27702000 0x0 0x100>,
+			      <0x0 0x27702100 0x0 0x100>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_RKNN0>, <&cru HCLK_RKNN_ROOT>,
+				 <&cru ACLK_RKNN_CBUF>, <&cru HCLK_RKNN_CBUF>;
+			clock-names = "aclk", "iface", "aclk_cbuf", "hclk_cbuf";
+			#iommu-cells = <0>;
+			power-domains = <&power RK3576_PD_NPU0>;
+			status = "disabled";
+		};
+
+		rknn_core_1: npu@27708000 {
+			compatible = "rockchip,rk3576-rknn-core";
+			reg = <0x0 0x27708000 0x0 0x1000>,
+			      <0x0 0x27709000 0x0 0x1000>,
+			      <0x0 0x2770b000 0x0 0x1000>;
+			reg-names = "pc", "cna", "core";
+			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_RKNN1>, <&cru HCLK_RKNN_ROOT>,
+				 <&cru CLK_RKNN_DSU0>, <&cru PCLK_NPUTOP_ROOT>,
+				 <&cru ACLK_RKNN_CBUF>, <&cru HCLK_RKNN_CBUF>;
+			clock-names = "aclk", "hclk", "npu", "pclk",
+				      "aclk_cbuf", "hclk_cbuf";
+			assigned-clocks = <&cru CLK_RKNN_DSU0>;
+			assigned-clock-rates = <594000000>;
+			resets = <&cru SRST_A_RKNN1>;
+			reset-names = "srst_a";
+			power-domains = <&power RK3576_PD_NPU1>;
+			iommus = <&rknn_mmu_1>;
+			status = "disabled";
+		};
+
+		rknn_mmu_1: iommu@2770a000 {
+			compatible = "rockchip,rk3576-npu-iommu", "rockchip,rk3568-iommu";
+			reg = <0x0 0x2770a000 0x0 0x100>,
+			      <0x0 0x2770a100 0x0 0x100>;
+			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cru ACLK_RKNN1>, <&cru HCLK_RKNN_ROOT>,
+				 <&cru ACLK_RKNN_CBUF>, <&cru HCLK_RKNN_CBUF>;
+			clock-names = "aclk", "iface", "aclk_cbuf", "hclk_cbuf";
+			#iommu-cells = <0>;
+			power-domains = <&power RK3576_PD_NPU1>;
+			status = "disabled";
+		};
+
 		gpu: gpu@27800000 {
 			compatible = "rockchip,rk3576-mali", "arm,mali-bifrost";
 			reg = <0x0 0x27800000 0x0 0x20000>;
-- 
2.43.0


