Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6555E606A89F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xrCzPDEx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E6z+1PLw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ea52I2vnQCe6Ni6efkUTjPrh+GmNSqV3kj5+yTLJAXI=; b=xrCzPDExYK+00r+9aWbYdND7yl
	lt9ROvKfiw8NJ38k8BDLeF537ck9eX9NgN3S2IsFwhNMaofZDJRCJq/KnIb1lkIfY6Vzjgc+OMwPe
	nk8LLHbL14SwiEiGDSzyHxR1Ym/0si4aboVeORW77PiqfX+w7U2mGTaKA5EBnPoAMFl4Qf7GsLZ8M
	jvNVLuhMxCyfzwc2VdwO2SOMfoWfEH8vKwm8u6N8nVCTRo19HD1h2BtNYnVIIACWOHzNu7AZmIQtu
	0TqvBLlwXuaQZiKzdqn6Lr55JoyY9+mMzhxVq+NoaY2HsFaYiGVyge7WI0dUTqgzKu2lixbnoLEj0
	MGhV0+qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuLC-0000000Dbqx-1wId;
	Fri, 13 Nov 2026 16:41:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuKM-0000000Dayb-1A5i;
	Fri, 13 Nov 2026 16:40:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0470B43DFD;
	Fri, 13 Nov 2026 16:40:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794588037;
	b=rWHVYq8EWtVlBdkATnfY2VCI5cA5S5Qq3/Kp4u0Vm6u6e9QMk3Ly6EClQADtmFqvNjb7
	 JkD/oFtXcVZbnzzvdKNmFu1uIihZXgA+FUJYtvE8sw2cx/qQGwQW8U5C/ZrHz0TQQsPfh
	 z27/HnOme71boanfhwtjsTo14qd0/30AtQo+W8sGhIChhHA8GYcGhw75FsILTxt2/lYB9
	 4wxlEw6hhq+HIiqi4rAVBvi/BNyKDNqTIlFnKzX2NbsGwfqpruoOo8DYIYxzIKAGKmJQs
	 m765hfgxQtDa4nVla8b2VfGjCm2x38HP7weUCV9bWqlFWfFTBHiFzmjlqbv4la3HUmw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794588037;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ea52I2vnQCe6Ni6efkUTjPrh+GmNSqV3kj5+yTLJAXI=;
	b=iIu5mM7nW7jMxPT7HweHlWsQ9iZC3mrOkaJf8VnqqwFw4/M+2tPWrJ/kfPJNdLFcTwe1
	 u98XgGcjNTABdZ8bJEe8fk7yklwqQNhnMwIIjDSmqeP4a8UBsW93F5uqGcYttTK7e5P9m
	 RxpEhIZENNT61dJ3lJ5SptNSh7LBbrW5XQ07xGrW9dkdr64zPTArlhdUXA3sGLTepSVYq
	 nAXZkdvetotubfwYOyHRIPZB94VKQ7OBCAUsQMatBR1fylXbW/8ksyCqA5TA/8sSA/f3m
	 pP47DoEfOYYIByKQFk8KjbcYocHFqGWb3Y6vNJn3N660nOW7U8Mu1myEpFLIkcJvkiw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0CE771F00931;
	Fri, 13 Nov 2026 16:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794588037;
	bh=Ea52I2vnQCe6Ni6efkUTjPrh+GmNSqV3kj5+yTLJAXI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=E6z+1PLw8ZgAazWXSe/Qw4zD+zAqi2H3Z5Kcwfn7C/AiwBCNpw28yhjPMtymk2QuB
	 P6sSxXZzhObCZtfShROoo2fgNwwI1B4xqlVDi8I30JsJcUqug85DI7JUatjjPVryWR
	 WZvVrz8jRD8cH+CKvqQza9dTw9KTakTtcX9FpXayjtAd2dHd3iA9aPbGL+Y/Z8JR7q
	 FfYI1hrx3OxBWNjo923169tWLrmZ567rMD5z5DW7ApxFFm5BHOFc3pMeMQi7FEqLgj
	 rTxJoqUyokjDYaI9ZwNyIuPNSPfNWs72fF3EQeUA0pV8xjCol9YNxVR11UUcc1qAxt
	 jBKTFUTIfgW0Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A7008499FF;
	Fri, 13 Nov 2026 16:40:33 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 16:40:42 +0000
Subject: [PATCH v3 11/12] arm64: dts: rockchip: Add the reset lines of the
 RK3588 VEPU121 cores
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-hantro-robust-v3-11-82383c722ad2@gmail.com>
References: <20261113-hantro-robust-v3-0-82383c722ad2@gmail.com>
In-Reply-To: <20261113-hantro-robust-v3-0-82383c722ad2@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>
Cc: linux-media@vger.kernel.org, iommu@lists.linux.dev, 
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sergei Khomenkov <shomenkow@gmail.com>, 
 Tharit Tangkijwanichakul <tharitt97@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794588032; l=2128;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=pWGgDNReqboxSyr5VfPbRCUDYTeDvzJsJNZ3jQadXZk=;
 b=xlaQlRPGNedb+7Aggz+XzrrJ5V2GEFZb3cM3x2htpaw4NA4fX5zQHfHCaZ26hKfcMjd+YQkLU
 0XqMYpqifR5AhYVZjF+SM+b95Ukk4rvYav9GDAd5ZwXPXSEPWJMgVFE
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

Describe the AXI and AHB reset lines of the four VEPU121 JPEG encoder
cores, so that the driver can reset a core that is stuck after a fault
of its IOMMU.

The IOMMU of each core sits in the same register block and is clocked
by the same clocks, so these resets likely cover its bus interface as
well. This relies on the driver not leaving the VPU in reset after
remove ("media: verisilicon: Don't hold the VPU in reset after remove").

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index aa69fd3793fd..227465d446a2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1325,6 +1325,8 @@ vepu121_0: video-codec@fdba0000 {
 		clock-names = "aclk", "hclk";
 		iommus = <&vepu121_0_mmu>;
 		power-domains = <&power RK3588_PD_VDPU>;
+		resets = <&cru SRST_A_JPEG_ENCODER0>, <&cru SRST_H_JPEG_ENCODER0>;
+		reset-names = "axi", "ahb";
 	};
 
 	vepu121_0_mmu: iommu@fdba0800 {
@@ -1345,6 +1347,8 @@ vepu121_1: video-codec@fdba4000 {
 		clock-names = "aclk", "hclk";
 		iommus = <&vepu121_1_mmu>;
 		power-domains = <&power RK3588_PD_VDPU>;
+		resets = <&cru SRST_A_JPEG_ENCODER1>, <&cru SRST_H_JPEG_ENCODER1>;
+		reset-names = "axi", "ahb";
 	};
 
 	vepu121_1_mmu: iommu@fdba4800 {
@@ -1365,6 +1369,8 @@ vepu121_2: video-codec@fdba8000 {
 		clock-names = "aclk", "hclk";
 		iommus = <&vepu121_2_mmu>;
 		power-domains = <&power RK3588_PD_VDPU>;
+		resets = <&cru SRST_A_JPEG_ENCODER2>, <&cru SRST_H_JPEG_ENCODER2>;
+		reset-names = "axi", "ahb";
 	};
 
 	vepu121_2_mmu: iommu@fdba8800 {
@@ -1385,6 +1391,8 @@ vepu121_3: video-codec@fdbac000 {
 		clock-names = "aclk", "hclk";
 		iommus = <&vepu121_3_mmu>;
 		power-domains = <&power RK3588_PD_VDPU>;
+		resets = <&cru SRST_A_JPEG_ENCODER3>, <&cru SRST_H_JPEG_ENCODER3>;
+		reset-names = "axi", "ahb";
 	};
 
 	vepu121_3_mmu: iommu@fdbac800 {

-- 
2.55.0



