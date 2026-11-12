Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0737606A881
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wUmJdWHg;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UfjcjxHw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FPtSYDIVMTzneVOc/lShGERpGf9ZXly06LM0wT9bXXM=; b=wUmJdWHgNXrfViFWx73+WE3uCh
	sPlgWs93Ho9019+B8MOfaaTaIU9HNwauwMKW5g9GOURrkyNGdAgCgbtjcgYQxN3gwo7zzuYpldg4A
	GEWFcqLG1lpYUJRDClGZH4MzSPwnABmHjuI+HwvK+ZdlpAFF2FIjd83VF9iSzFwCb9/Qf5nd7DDol
	JPAJSI++ynrgnwPmIeXUhSzkMO0br/k+YC3mvj6TDrUyOygW3V9nOR8SY6HZeLlkzPrEfQ1YcAaf2
	PyK7FC+wbBw7Djlsanx3RGuVVRjlakqp3m74Bqwx7YRd/is9jwUCafeC7xF8gbAToq4dVEklqE/bK
	D81EBhxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQ37-0000000949n-3vrx;
	Thu, 12 Nov 2026 08:20:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQ2j-0000000944w-16rW;
	Thu, 12 Nov 2026 08:20:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B13A47427;
	Thu, 12 Nov 2026 08:20:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794471624;
	b=Zyk/j0r0OtByJPlriSyvKDjwV7HicLWBA013JIigAFeTm4wynNV/bG/nDNmPg6C+6R6I
	 CZMSY7k+rjzCSRvWRui19KrX5ES5WSEZN7VBsnl/LiHz15XmxR+bWxPUcl3SY1wVVskFn
	 vvVGLYr/OLzs/7bsXsF4gs+tk403hskYq5qU1WQgX/5pSkEc1SLZX0ezswSPaDcofSq3t
	 iNCHERzRgGb7FZDYJl7gZlriLjKvy6+WinbzvPUOh2VLichRzayA3dg0Ql9Hzqu9YsPPU
	 ghhkrWzXRzq1AwJ8IDihfu7X78xKaidalPlxfvtNIKzAAIJRoeysDJNu1anBI7bUqBg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794471624;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FPtSYDIVMTzneVOc/lShGERpGf9ZXly06LM0wT9bXXM=;
	b=sD/8p1wasVcS+hdl/eajw4CUl7tyU9R3+qVxZbsKDpTtEG4WZaLsO5GUlMtSM+mYc0fa
	 mcwbN92lBqxfMZAWC4dWbGSMUjMc/dEfI2jQc/wpBnsN+wc6kzLRbKnoV+RrGRPHKh+j6
	 0FbcoIyn50wi/vuagr23oGCW5sQ6fCCUBJ5y4Pt0lHbQaRIf0fg8RrqqQHrIwqq01Puym
	 2JmSEDH0/4Q6M8hCs8hURrBPluHHFevymGkIMGLJFok074/ZXlZhTu1n2gbYW0uIOc+NI
	 Q4n26pqMAcTINJQqCLtL5es0Nhl4YAUNE5h7GebFAW2w1qLFAEqJq6pFvd0Q7xsTVIg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0FB661F00A11;
	Thu, 12 Nov 2026 08:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794471624;
	bh=FPtSYDIVMTzneVOc/lShGERpGf9ZXly06LM0wT9bXXM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=UfjcjxHw7wYMmapUoxMpum0tedlIVJTrRjFUj2/K4KS6uIMu4zDl7dPlPGB/OIKFo
	 1Zmg2QY77NS9Aja2pmRWDao6u5ZjC+P1AX0NFg5ZdnAByCx8XDPioaDMyH4njmINAB
	 3TGCd9YoiYGj48Z4EYNWitdhqQEHzpR+ktuhEKCYbu18spstegKcbEdBuSzOh4A46i
	 +YcAH2xEdeOd1AssVHaH808hFMe6kHTQhX9KQm+cyKS+/5UO+c2D+ErL+Vd609FoFn
	 d4YlH2EdaQEj5Bh3lCl8zO8zWYmdNQ0gKe0FZL+F4cAZYvewLUTHFlE39lrsja9HhZ
	 BDgo818T7g8yQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8E92F49351;
	Thu, 12 Nov 2026 08:20:22 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:20:25 +0000
Subject: [PATCH v2 4/4] arm64: dts: rockchip: Add the reset of the RK3588
 PCIe SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-smmu-v3-pcie-pd-v2-4-3a77bbb6b2c4@gmail.com>
References: <20261112-smmu-v3-pcie-pd-v2-0-3a77bbb6b2c4@gmail.com>
In-Reply-To: <20261112-smmu-v3-pcie-pd-v2-0-3a77bbb6b2c4@gmail.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Niklas Cassel <cassel@kernel.org>
Cc: Pranjal Shrivastava <praan@google.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Simon Xue <xxm@rock-chips.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794471621; l=901;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=yMU3CRWnB+XjuBD0UcTK2F5C3aJnFDvPe+6GBdY2fjI=;
 b=y93n/EpF6PWfLsnsaGUaIrO2x+dm5s9ksej3O2HvYP5uoOYvsWIgrwvy3c1b9Y//j0fLwRh9p
 FrDhoOPM321Ah3I01Gz/9hNlI/hAe8q5/i9zBRk7U0Rw2yNf8aNV4Gk
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

The MMU-600 for the PCIe controllers (mmu600_pcie) has a reset line in
the CRU, SRST_A_MMU_PCIE, which its node does not describe. Add it, so
that the node describes both the clock and the reset of the MMU-600.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index dfed34a8aa57..45c1bb335447 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -560,6 +560,7 @@ mmu600_pcie: iommu@fc900000 {
 			     <GIC_SPI 367 IRQ_TYPE_EDGE_RISING 0>;
 		interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
 		clocks = <&cru ACLK_MMU_PCIE>;
+		resets = <&cru SRST_A_MMU_PCIE>;
 		#iommu-cells = <1>;
 	};
 

-- 
2.55.0



