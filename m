Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF6F60A2611
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tVGy0Hhq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F/jRM855
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GkBybTkwE49kIc06+RCvE13RGhar/sx9sHchhnfXl5Y=; b=tVGy0HhqqhmW6o9pRvuKVgL1qq
	ckoXm+DiKDhtR7NdGd5ef2Umx7LJ8NlFDx9Iegya6r3wnVoWHqCG1x3FWy+Xr1Ve72r8qwMb28d7w
	9AN06062bdNYtqlRiMTQ1R81tVGcXmF1VHn16qM4+rp3jiOnkMIZ/EvbK+LfFK0doYTNZgGywPRso
	PxcvkvLX5aUmAjDn9quMx9wpcJLNLwipuKeQwjBJ1YhHJ7Ai3JB/NVC0/+a5lwkW7JOyxjnA7HPKY
	A1VV3NIQLcrwa2nOOjCkqS3n5Vg4PKeBwOnb1tURViuYXu+3qC+KHZ09MLYH/qQ+zdbLsekxDsQXR
	9p8vMuXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg1N-00000002mGH-390f;
	Tue, 10 Nov 2026 07:11:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg1H-00000002m72-15RK;
	Tue, 10 Nov 2026 07:11:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9714563789;
	Tue, 10 Nov 2026 07:11:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794294710;
	b=Dg2CRgTjbinFmI1uK9T4OwgDt8yn5aZDNJZHjbOf/j7MvkmUVPJ/k2GbfbSa7dEsSqsH
	 JUdZDb58JqxrstemicQ4gM0CGCG3cOqrnUISIzUUMhYGRN7Sv2a8UT/grcdWprK1V2zfs
	 +UtYxLiZFaMw7a7mpXKL/A5ppfGI2J6xILAaXhQdopAoiTwMCDt9heGfVRvSkSJUX30uk
	 458J++jnXGjZ80B5X+SobeT18TIeqyU1jpy92I4igR2sXJNjrb3wBmvEokO9Et+NwH/p8
	 iMPRYMyXWSfDCfkBwaTH7U3I8s8sq0ONt3AqRCpa7uC5ecZRuPOfl6ksh2Sjz5tEaUg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794294710;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=GkBybTkwE49kIc06+RCvE13RGhar/sx9sHchhnfXl5Y=;
	b=kmNB7ylJoLS43Wk54DYB4IwPY7R4b9pIC+2T2tWlnuhJALyX5dPj0ipw1R/3+wRjeddC
	 KI7iHnM44rXAPh+JrGcENfdVCZqaMazxthJYk+M+2dEOCXduJOFlhZmt1IWNeOZezKBoB
	 SJQkr4KSYc39VXGh3GGRqsaTZl9mQEl+uDwXI/MBpZcRHLu8hZqf5iuau2K76EowWD/gk
	 J+Muz4ULzulqmCnZ/5laANgU0vvixlHB7IfHT2cecX7wyjxIC9RBZg7ObCllAH9bTP4jd
	 scDIQBkDD0n6WJjhrtN3djGKv5eNw1ocJD0U2GDIOnlBE2QAIXuiwA3cl8zviQsLN7w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 60ED61F008BD;
	Tue, 10 Nov 2026 07:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794294710;
	bh=GkBybTkwE49kIc06+RCvE13RGhar/sx9sHchhnfXl5Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=F/jRM855uprZIIFgV7t9VH7WNEZSaAI6GD7zm/dgo9q1WSi4zX3kr+x8EgT6KFvGg
	 mlvZrSohMJtkXDs/WYhEWUYgwEtTM1/xIr1aocoF7EtbDpZD6sSZHsh+Dz5DeCGibh
	 o3uJEzqdnzQCbkm0nwGauvVwNnuPQxuTNPPSwbGG4u5NGxPINZmdO6KKN38eefHLOu
	 KUZu3n7VZuIqGrLeDM38PWh57bVPOFldrDdpOtMJvW5AblkHj0m1TbKDIKVphsuBDG
	 o+sJACVdxd7cs2Or+2IOfi/Y9FWqchEfwkKyA5VYNgZDMR1AD+4eUB89CvvaUEg9gu
	 Vm+PrLUACSHHg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E84DD4894F;
	Tue, 10 Nov 2026 07:11:48 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:11:51 +0000
Subject: [PATCH 4/5] arm64: dts: rockchip: add the PCIe power domain to the
 RK3588 PCIe SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-smmu-v3-pcie-pd-v1-4-628819ca44b9@gmail.com>
References: <20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com>
In-Reply-To: <20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Niklas Cassel <cassel@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794294708; l=1589;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=XjCTjW7WX2P6Yil1lroIFdMhtw3N6JLNEl/nbTe3Rtc=;
 b=KT3JAHOImp1NNVgBlK1O+84HkPyq2khzDT/ZgpgGMhXk6Q8ZUnIvjXRkQhFMFSDOZHumy00Z7
 ROfIwWwGlmIC+fICCGyWRiAcj/Z0XCId4AlPvl96YptG5dDrNNRRMd9
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

The MMU-600 for the PCIe controllers (mmu600_pcie) is enabled for every
RK3588 board, but its node does not describe that it lives in
RK3588_PD_PCIE. It only works today because TF-A leaves the domain on at
boot and, on most boards, an enabled PCIe controller holds it on later.

On a board that disables all PCIe controllers using that domain (the
Orange Pi 5 with its M.2 slot in SATA mode is one), genpd powers
PD_PCIE off as unused after boot while arm-smmu-v3 is still bound. Then
at reboot arm_smmu_device_shutdown() writes CR0 and polls CR0ACK on the
unpowered block, which stalls the bus: the kernel never reaches
"reboot: Restarting system" and the board only comes back once the
watchdog fires.

Describe the power domain, so genpd keeps it on for as long as the SMMU
is bound.

Fixes: da92d3dfc871 ("arm64: dts: rockchip: enable the mmu600_pcie IOMMU on the rk3588 SoC")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index aa69fd3793fd..bcd342c025c9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -560,6 +560,7 @@ mmu600_pcie: iommu@fc900000 {
 			     <GIC_SPI 367 IRQ_TYPE_EDGE_RISING 0>;
 		interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
 		#iommu-cells = <1>;
+		power-domains = <&power RK3588_PD_PCIE>;
 	};
 
 	mmu600_php: iommu@fcb00000 {

-- 
2.55.0



