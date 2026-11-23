Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162C3606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1PyuYJTg;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Yn3NtIas
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FeWTS8Q48bWPnQCGmjUGgs00u6eCx3a6nfu0+I6v/Og=; b=1PyuYJTgP4Bf3a
	/MQfbtQHywC5QKu/yGEE7/svtyIYMXUTrYQhPLFp1PkKFfmLQ8pt/Hy9anX+81eWRVxW+Kp0Cs2/N
	c6HS70TkKsjHMarbNNE52LGDkoDJ6cfWISNcYEgHAH5PSltt+HzuCGdmrURMNJI2ApGOh84ExQzYl
	ibvhptT1d0nALu+yl6w1W0dvMIcxtOyEeN354zPRF2xDZJZZM/vG6tpToCnla/SmJGQALABoQf/Cq
	HJDqTR7f62avFyA9e1IM2fZTpnXxQMI7fqicQavBOT1FrRJPIB3/GKSf5xkarOIPdtfJm4/k3Jz+l
	rvNvOiOwBnKRNTINsRag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVvl-00000003yQO-2TKK;
	Mon, 23 Nov 2026 15:26:09 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVvM-00000003y66-2nMV;
	Mon, 23 Nov 2026 15:25:46 +0000
Received: from [127.0.1.1] (unknown [IPv6:2a02:560:5c0a:3200:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B82AA20228C;
	Mon, 23 Nov 2026 16:25:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795447538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FeWTS8Q48bWPnQCGmjUGgs00u6eCx3a6nfu0+I6v/Og=;
	b=Yn3NtIasFB4bNE7hi+meOpZRKsfmggAyxK/Lt1XQcngGebdL97xbLGrBLYV/S6aru4k9e3
	8XbLPmmcnjA2ogBJVTSeopfkQU7PFmo+LiAIqEl9WMCVT2HKvYRsKjLl+jzh24MQcfiRU4
	ORo2OCcDiJwtBdqrHde8xpb7M2LCdz0gwd6m5QxbBRXW+QE4A+sVjqYj6cinz/tbx+f+Ja
	v7Mv23v70VdvUsQspP6vYE6t40sVCNCPsahgvD+C7vVUWWvUAceekF5v/52i4JAXFJWaLo
	4K8Jh4pH1YqFLw2AFMnPLMu+MAUbpG0A9Ul5Rl+XdzYfmJuBxjKUO9qcOHe8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795447538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FeWTS8Q48bWPnQCGmjUGgs00u6eCx3a6nfu0+I6v/Og=;
	b=daweakudbzmXaAc8BSHk7NvyNlAz6B/bgoBK7LLyaMMRSwXoYFHhhVWS0JnPBhC0R6cU5y
	CJ1spp/BFcD4GYCFYtiNJU5l/IsSXgXz+dZGU1XD87gDwEtl6KJZVm5h8TvLNMi57wTubJ
	/RJoX0hr5bAYKH9Vmq5m+6zANy10/rpbQ3aP8PdprW4bT72dVs4grNpE5DnZoGt+odNK0h
	H1diJYCcULeu7bXD1SnUfZJlslmj4v00wVtGwVsVVAfZseJIy3iFSFRtACLnOuDDkhnqux
	d2+KZPd55hK54zCt/ekG13KkPr1Xb1UQe8nqkUW9KivuQ+/8LSeU49f6savByg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795447538; a=rsa-sha256;
	cv=none;
	b=NVQAQ9R5wm3fVB0ui2uwrt59wxEhUq8rqrmW7s3mFMKBI6Q+wn5KxHJf4/qulzs11qxHMV
	odSY0DNSvbFMl4XfL6ITdI1lv3J7pT7/H+kvPn0yzQAqJAEPWaRT2cIj1Y6oIMYY2IP93t
	3PdseBy5yjXotyCo5fblAmgGmB6SuvrnQj6YjXtrrLWkpxdhNVTH0yUxQ3HzLecNZIfcV+
	jjFb4wSy4OcDgFiu8l/f0Sz726c7MLQJ10H3y3X7TWNnr2l6WcOozK8NywrvZoPnDhfpst
	6t8MCVXvRIjvjIDHot/E3FLv4jFBZoEb9PAbufCM10J/CazfTM8H1qIXnABKdg==
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 23 Nov 2026 16:25:23 +0100
Subject: [PATCH v8 4/4] arm64: dts: rockchip: rk356x: Add JPEG decoder node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-rockchip-jpegdec-v8-4-3316cd31b043@pengutronix.de>
References: <20261123-rockchip-jpegdec-v8-0-3316cd31b043@pengutronix.de>
In-Reply-To: <20261123-rockchip-jpegdec-v8-0-3316cd31b043@pengutronix.de>
To: Lucas Sinn <lucas.sinn@wolfvision.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795447521; l=2421;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=XKKZeAn83nsSxMgXM9Bvv6Y9OauycMDu579tqOq4OqA=;
 b=jh7bgTelvaHbCA5tQHRb7KpAP9ZtNbAJvWi5fzaI3ndM4ha3PDuG/w1OsEgUkdSFlC2TmWhn4
 HcBgXQRZoWhAIEC53vTjocjrmVx9dq/38iJQZbu1KNr2NdgSuLb0Zrr
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_072545_113334_4CD991F7 
X-CRM114-Status: GOOD (  13.10  )
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

Add device tree nodes for the Rockchip JPEG hardware decoder and its
IOMMU on the RK356x.

The decoder is the same block as on the RK3588, here at 0xfded0000 with
its MMU at 0xfded0480 and the same 0x400 register window.  Only the
integration differs: ACLK_JDEC and HCLK_JDEC instead of the JPEG decoder
clocks, SRST_A_JDEC and SRST_H_JDEC for the AXI and AHB resets, and the
RGA power domain rather than VDPU.

No rate is assigned to the AXI clock here.  Unlike on the RK3588 it is a
gate off aclk_rga_pre, shared with the RGA, the IEP and the EBC, so a
rate set for the decoder would move those too.  Its mux tops out at
300 MHz, which is also the default rate of the downstream driver.  The
downstream device tree assigns no rate to it either, and the vepu node
on the same clock tree already leaves it alone.

The domain needs nothing else, it already lists qos_jpeg_dec.

Both blocks are entirely on-SoC and have no board dependency, so they are
enabled unconditionally like the other codec blocks in this file.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
index a5832895bd392..e6c7ae908a99f 100644
--- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
@@ -619,6 +619,28 @@ rga: rga@fdeb0000 {
 		power-domains = <&power RK3568_PD_RGA>;
 	};
 
+	jpegd: video-codec@fded0000 {
+		compatible = "rockchip,rk3568-jpegd";
+		reg = <0x0 0xfded0000 0x0 0x400>;
+		interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_JDEC>, <&cru HCLK_JDEC>;
+		clock-names = "axi", "ahb";
+		resets = <&cru SRST_A_JDEC>, <&cru SRST_H_JDEC>;
+		reset-names = "axi", "ahb";
+		iommus = <&jpegd_mmu>;
+		power-domains = <&power RK3568_PD_RGA>;
+	};
+
+	jpegd_mmu: iommu@fded0480 {
+		compatible = "rockchip,rk3568-iommu";
+		reg = <0x0 0xfded0480 0x0 0x40>;
+		interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_JDEC>, <&cru HCLK_JDEC>;
+		clock-names = "aclk", "iface";
+		power-domains = <&power RK3568_PD_RGA>;
+		#iommu-cells = <0>;
+	};
+
 	vepu: video-codec@fdee0000 {
 		compatible = "rockchip,rk3568-vepu";
 		reg = <0x0 0xfdee0000 0x0 0x800>;

-- 
2.47.3


