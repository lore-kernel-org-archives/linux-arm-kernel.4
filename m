Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF54A606A889
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 09:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OZpLZZTP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZgJjH+DT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ea52I2vnQCe6Ni6efkUTjPrh+GmNSqV3kj5+yTLJAXI=; b=OZpLZZTPXIjnZYYiuk4ekKJLOT
	oy0AHACLqGo6uvmt7DSQ6UGgkBpu+kYYMdR2U4skSPmUkEvUG20IHPPm1cIMeUCyNTS/P212Z1IWa
	SB8HLwv+iYfuiIHJpL2E8HU1Bi6p19caMHytkj2N2/iiuzK1+Zh42aJgOJySPFveYkJRrvNqhfnJ3
	gxTDlhoVR4F3S8815D3ceANFoN1LRfKAVPUtU2Zrw6TUwWEMo6BHnVv3oN3/NqnE4DVyC5CFoHLqp
	mQH9ZwMaQMfEAc6fpLR5YQ7SxPioXIR87ma43OVc/0N7dkFhUXwDivXGZMJ0Y/6lPGPohCH8/v+g7
	CgxpLKSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQCr-0000000971l-01wm;
	Thu, 12 Nov 2026 08:30:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQCp-000000096zt-1CQ5;
	Thu, 12 Nov 2026 08:30:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 11EDE4697D;
	Thu, 12 Nov 2026 08:30:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472251;
	b=zkMNiwCpJyaTTEDbqI/5ugpkjnLRi7SMFgG79O20HDzSyQx3CDyIqL+Nre/DMnvsY9ed
	 Kzp14xXKHG/t1lrrZ8mgvkTIXFfa42Bqr8Kclc+g2u8hbbm9W4vrKLXx0NEZXhHTDqxts
	 2MFKg+AdX/zf6QURfCeGHWfrIcyuBNaT1wfUGMgItBofD/5/qM9S6SNvws55x1ae0yBEY
	 gHPterDrI/gA0Q/ZtrISia4F8RtT/M9lYR6gMm101FePeuGVrYh4Vt1NrCN9nky8/kabs
	 /fgiWx38SSv7kH9r4lmZKyezxoXZvDhLfbmjFoxlZsW8YTZLwq6sOWhKhWD9ES0R6ow==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472251;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ea52I2vnQCe6Ni6efkUTjPrh+GmNSqV3kj5+yTLJAXI=;
	b=s0PRz1zIbh3GlebPo029b6mMbQoIWyitL3H4jhGAsu9sBz/ntrvB1uveYWDA4F25vAGi
	 i4rXxBqwJO7L4rXoKMbEaZabvHBHoHzMrBJH+9Qt2J9XDLGsp2RHZLjcYXNPjJksCVErl
	 08z4ZE9uRe6ukZ/OeidMkmAMxIrYft08Cm60x36FjJyOgls8Yj/DDdQOKa37DtNyXjeTy
	 Lpr0IIVBsl/5vMz35VS7uyiHrxt17tkk9+/5QvhiwTsQnc3b/0QgsTCbqyzRzrtP5cnCI
	 U6VgSZBofs5lO7Q3S4FB3SopGWGqDEt1LZJMiMoLBMGh7nUU07Nf/Zv+vUnofglJbfw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4A8D1F00A07;
	Thu, 12 Nov 2026 08:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472250;
	bh=Ea52I2vnQCe6Ni6efkUTjPrh+GmNSqV3kj5+yTLJAXI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZgJjH+DTPl91izgxYPqTRx1QSsWfRWKPT6Hq7zKhsUu8M/Wm0mR0o/JonzkAwGCZx
	 XXKvTo22FjnJC0G2NIh9sfkS9qXvfZ3u4rkHbnp3iBY53ESkxTBsWu7M0GX3Li3eHk
	 Be9jcoV/O8xOf7LmXKVFg8UWREfUBGbl5lbCXge5a/0157VOU3+84hVd6+L6eW933k
	 eIgdol9dmgJm1bGEZtbtr42KkznnhjoXETrdQE74/5z/DSa0k9J+IoGJL8aPjXqAzw
	 bosFZVKY1SBsqnxpais3/Y7OvuU+tbJXSMCozOSJxgA27RKl5XWVJLO7fweDyxes1P
	 QkXDvrTBRyM/A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5F5724938D;
	Thu, 12 Nov 2026 08:30:48 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:30:52 +0000
Subject: [PATCH v2 6/6] arm64: dts: rockchip: Add the reset lines of the
 RK3588 VEPU121 cores
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-hantro-robust-v2-6-18561fd48838@gmail.com>
References: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
In-Reply-To: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sergei Khomenkov <shomenkow@gmail.com>, 
 Tharit Tangkijwanichakul <tharitt97@gmail.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472247; l=2128;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=pWGgDNReqboxSyr5VfPbRCUDYTeDvzJsJNZ3jQadXZk=;
 b=e2NIaxKRjQf4kOE2R7y4mzRTGkpfzmZbVEw4CbPSSUUhDvutW0BQz/hLqFUihJHoYOohZ+nD5
 UEHZIihvePxDxy1t8UR/I5gVoWZ3V4esf8vtdLEHxrpKaGX4dBY898T
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



