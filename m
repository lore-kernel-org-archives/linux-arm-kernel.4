Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77826606A332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RUKN9JjM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=XbJFTtbj;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=R1vhHnIQ;
	dkim=neutral header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Gc9FLxKO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5NV8OaQSZ7s+r7c0sSTXcrTmsPtD1g/zVQ04gw9pcrM=; b=RUKN9JjMmPL/cX
	snKZDe67lfonQHBF9ZPe0W7B40kRQwS1F0nO+rtXwDBLKpKfRUTTvTGHrwbY6H8+NWLGA+867Zn4f
	sQxSpPdfi0CzTH5WWdv+guIIkA93CwTU2m3JPnGhiPiFPyAU6HNcu1saFVA6zs0m/+UnoUWEHRrxi
	Mq20WRW7m0/KvM2y0LPQE0bO5AB9W2DkBm0JV/pwXrNaFcv5CiTVoYkxWm/Qxs/Oz5D1IypqL/ALH
	Z0SvaMsDUuPD2N3PoCl0loaxC4NIPgWpCaP8SW6kLyRqnfBSnLNBlC03GlHfHITZJDohZb25IhLZa
	ydWoTFQf8epuK/x3WoHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS47L-0000000FCHz-2XFa;
	Sat, 14 Nov 2026 03:07:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS47J-0000000FCEy-2Jzp
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 14 Nov 2026 03:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5NV8OaQSZ7s+r7c0sSTXcrTmsPtD1g/zVQ04gw9pcrM=; b=XbJFTtbjFZCysypQIDX0bv/Rpg
	tfuvT4+nr7YcJGXPGFSmp8FMfpY+CZhqm0KFc5Gtf+HEdhNRhwT9COaCetBHbwsirm9zT/Ypg6Row
	PzNC0RVpEcB8YAOV1acDll3e8bL71uQUU90iad9ghqu6gCAAHEScP3SplNqXRQBzIP0T+71so9MXw
	oi9r/7RUyKu1exwY/CLeZN+5qR84YoEzIjtitL+rfzzHU61pA8b18b8Q3EADduOX/gNkaiFC+02nR
	Ajl9bXfo8eKbBQUyjqFWbPHpYsA2wrKdrRohn/qbzngX861fIJ/tU9okgcDaelH4yuBKe9wTTlntv
	5wlxsRmw==;
Received: from flow-a4-smtp.messagingengine.com ([103.168.172.139])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS47E-0000000C5t5-0q3E
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:07:45 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id F0D2D1381A4A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 22:07:42 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 13 Nov 2026 22:07:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1794625662; x=
	1794632862; bh=5NV8OaQSZ7s+r7c0sSTXcrTmsPtD1g/zVQ04gw9pcrM=; b=R
	1vhHnIQ4bbAw8oPh/D60xC7FBBYeSd5nl0ZeKwg4Xb/zNxsj+9VXLfrOkh9dEl/0
	Byn67zzfK6z4J1K1NkDjUx+G5a0KiIza/dcW3bjSBcaXCNcBTPEOaxNQl2uAf9OB
	8FkAfcj2yRgxKphK5El+K7AJOAEUOsQxNo8/9vB2Xe/vF9im7OqfosiTUZBXAHfo
	CCaJAI6kGDF+HSDFPYAsNVbvLpStcGDLBtKtxacxHxcwzesxIhYqwVx3ggBerU+H
	GfDCSB3oNKcF9G+HjvD3DoChsz6bChOmFHtYdo8bs6M4x/auftAv64ARU3szQjIh
	6xLz/YQRUukEva5surOPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794625662; x=1794632862; bh=5
	NV8OaQSZ7s+r7c0sSTXcrTmsPtD1g/zVQ04gw9pcrM=; b=Gc9FLxKOhrzHk8W3V
	D2ZePDCnZfutHOhApTrREPsOrkfMca6Kied3FmbLUpyT528EUSeq8iQf8LExD5zU
	5HZUqfbHo+RTM81AtU0FQYOvxK/B8Qs82BUhQ94ASukl/hLHCuAMXBopIt0Ncwpg
	tqdZtE7pPgPxpagnhYEy0FShFleyg0pZ+aSI2Rq037sxfveD324wmE5DWrt6pjea
	fvSZUqLZcBUambnJLVWGTlhwxL+nu1eKuJ2p3/rYU3Nzsvzqkbqmkc33HFK2JbFn
	5BmUvkkVl7jG7GezLnRcmioPqma0FW3sX05kBUvjNMQE62ioVYEHk/XFqb/5u5Sr
	Fj90g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794625662; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:d4SIKQgnMkXAwIeX/cDgssr38VvbAexCzoCVxzGFC2T774f
	ee1TM+LG7zXt2BAGhce/zJUOpM54P5SGQmIwvXTJrSob1yQ3dwWwDC9QYCNi2mfn
	MBqiInPuNxteqGSwDoES21yK3tPHiEfN02CRO+sFBeejzdP+Hre/hDCw5qunkluH
	3CCkLmPOpGk4ASIJBsEwWlXkWUSCvfW4b7frMEr8pjakJLWbTv/EwPBfRyZt7yl1
	tstFIcRsOlAUjqUYW54raoTNbKcXjxAAoJXN3zxhU+5yJ++XYprcp8Pj4ob57zCB
	V5RO5t7YP1cJdzFqQD1gS+eqgZp3MWFCVu/5Daw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:hjRPWJCWyoOpSqgCj3KvdXrgdgv113Wad5wxch666Ks=:mwDJ+2ELBB9MTmSRrMVH8YClnLsBuP4IPdronbv7tPs=;
X-ME-Sender: <xms:ftD3agoRXmZl70SA6RepnJKKD5XtMRGcMUMMGTIG6OVM3GLMUYxPEA>
    <xme:ftD3ajG-I17qapcP9p6DuYmA9tQS4juVL4bWAzzLJwJCIc4sQOYQlhUM99yqy97Mo
    5o3yFJsnQCxj4uueRlSBfrApF1n5VOK3IQMEGmyllIDIziShG40Gt14>
X-ME-Received: <xmr:ftD3asdLIhBKPO8TdiY25UPb0Jf882mm1FPBCv87Ochf-maRgMXqTATaVH4OqYYd3pS9Ihf0>
X-ME-Proxy-Cause: dmFkZTElRkAdxu5zGHOdHgPmUdLFY/QrwyZqLD5T5+wY/l6JKUOH77Ag1LlIB216kO/vg+
    gEiuWUUjIE8iEhel2feqBBFDbwdBhwVZ4ZVpmzRDWDQhG0tLHJOIbTLc3g2ftxTTci7C0E
    y3DFveseL85DmyJzHauYG/vSKWsrnGHrEDZErUpA2ik1hQSUExU/7YkPyOKnUB4Ev0qMLd
    0dae45wD+byn0RAZNOUIKmn0gTvO3u9kug+tdCqucK/rq6/OIed76A20El2hu0tBP6s6n8
    VDqNJHD0+tz0ilvR03Rhy4I7CrxtlzRPXMoZQyPaodTj5YGh1nwW/udiI6/r9dwMxCewOg
    8vba+8JCNolEpTxnLkmxnm3dR4yFftRd+L/twn6jNO6/ZsxKUUdnnSTSIAlUhtcJfoiREk
    W3Ji6s5N7JwiUc2+FwsBvHYcvg4gAfmuDIGNd2+OMnEj7agYZ3B1kkmqrf26EutUOwhM2k
    Hlo15RV0ou41jZDLHaPP7XSkiHnSvrbb28+5efvWiSahpsgPgKit1rOIS+R8jk49Md/Caw
    Dgi4Y1MaVVXatF9qIyForJIwE2sHREl+NpVOkzLhNQ8bmjoz65Oup2dNC05+sQmZRZLO3h
    wL7lc6UlV4WIQ5XkzBpPo0dRkTCP3ilmP8J84LTHaVSWsYwMkuP9waMoB08Q
X-ME-Proxy: <xmx:ftD3auYpeNnThVByAlC5pn332aQF5bfGnEGXN6Ap-1uQYokx_WLPxw>
    <xmx:ftD3agLgufXXZ3MyJqNmWPIRT4ucH2aX82Ljd7JF8pVK54D0RDQJSA>
    <xmx:ftD3atgjvjPc6OV2qaoMUz9f9qQJD5A70phFmTk6CtzXcDQQUXDhJQ>
    <xmx:ftD3astHKwwMX8nurUwTnqCQBsOYNMyp6jWkebsfn_YnlornbMDCng>
    <xmx:ftD3aiv1_MQ33QYYXQv9ovSltCkZNLWb6xOi7shY41bYTre5GvyavtPC>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Nov 2026 22:07:34 -0500 (EST)
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
Cc: royalnet026@gmail.com,
	ulf.hansson@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	shawn.lin@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	vlwwwwww@gmail.com,
	jeff.hugo@oss.qualcomm.com,
	rfoss@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v17 11/12] arm64: dts: rockchip: add NPU (RKNN) nodes to rk3576
Date: Sat, 14 Nov 2026 16:05:28 +1300
Message-ID: <f9f4f43cd1c4c8c6cee0371b4b92badf37e68832.1794615323.git.gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794615324.git.gahing@gahingwoo.com>
References: <cover.1794615324.git.gahing@gahingwoo.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_030744_424117_B629D0DA 
X-CRM114-Status: GOOD (  12.08  )
X-Spam-Score: -0.2 (/)
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

Add the two NPU cores and their two IOMMUs, disabled by default; boards
enable them.

Each core is on its own power domain only: core 0 on PD_NPU0, core 1 on
PD_NPU1. Measured with both cores running, the results are correct, and
the nputop and npu domains above them are powered through the domain
hierarchy.

Label PD_NPU so a board can connect the NPU supply. The IOMMUs use four
clocks.

Also set CLK_RKNN_DSU0 to 594 MHz. Mainline sets neither its rate nor the
NPU voltage. On the ROCK 4D the DSU runs at 786 MHz by default and the
rail boots at 750 mV; with both cores running, each pass of the 5400-row
test has 11 to 25 wrong words. At 594 MHz the test is all correct. In the
vendor OPP table, the 500 MHz and 600 MHz steps both need 725 mV.

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


