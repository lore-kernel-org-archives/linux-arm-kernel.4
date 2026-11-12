Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD9E606A8A9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pEXNnzO+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JJApeob/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ifn3rhc/aaZsY5m1CIrGkh+6CUMXhWAN0wg/qVoSa1M=; b=pEXNnzO+Du6FVnxC7WukPCxSSF
	FD8lLTQ42n7sASiJumt026nUziss9XKL/xiQ32cuyGrH15Eb9OaaVqt0vQBIQimE2p0zfN2TUeU8Y
	McuLy6Gf/i6UHU7kybk2xBtT661bZvXOvdzSo4dqxsdGxY95oQUx2OX50jsyreJTrh+wCgJ9W9/qj
	aUbvDpKR+y23huah+fraNilaJCwPDMvnZ5JGH+QdeR4+GpUIud9qF/gK3zS2nTv0x/9ym0p/7pz1S
	e7ZnJctoQVyaEVk5YcR67vNDOPbuXRoJK6Nc1Zfb3qyULXuel1zZskZ783ZUETvpjZ++ylUlJ5Ldw
	6nM2KGGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQ3D-000000094CM-1CjY;
	Thu, 12 Nov 2026 08:20:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQ2j-0000000944y-32fQ;
	Thu, 12 Nov 2026 08:20:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9696840A07;
	Thu, 12 Nov 2026 08:20:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794471624;
	b=pF+s6M1hebni/j3Nj3VBQ7qWt1q2zSeH7stNRca6JU793e7KdpIO8Q8u99IFiKbUzQC4
	 Lx//wDM4WT/wOU+tYsoZ2HejC5vvccpC4Nqu7kjq+VXJhwNpTDai6FWjT0SEzCOn6+bb8
	 QIarZGTuVB9PMfpJOmUV6FLQvIslmb6ZVcTPUhpg2OwLHb9lFBH2dt2+ptsHEji7zeGdH
	 gL8AQYZeOOZOMA0slKPAuy/xkuDjGlQ1faNe+/+evUN3eka1I8UZVRYPlx08PmsBSx9FT
	 wKVwCyfBW1/m8QD/RTLU1y9ayD0GORfDtvCNkI2Dqg8Y5i+0Dq04bPSF9PoNlgRYTow==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794471624;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ifn3rhc/aaZsY5m1CIrGkh+6CUMXhWAN0wg/qVoSa1M=;
	b=uNaOsOktK7kOLVQ2HMThY5fBeEWOK3hszkP4oJull8BJ2hBy056HdCcR94c8j5gVtMnA
	 Sb4o++YEYHUniSzhLkewfhoGH41tZJ7bf1tTNNinwSk04dftg6E0OysNzzqzsm8d8jxIB
	 4Nyaz+S2Jsvsjvf6mjjTrAUErS8MuppY/NkpYqev0R0iWmKOYqTqzkOS864jY9uUrGehF
	 VYFNKfLpDBwdBCCwxzDyGii+2izJTmGKqQK3NGxP5UCrTjNeG9ad4F0ED3QjyPBNINNEx
	 ZSw80Mtv10OyxPZbW0FZwRv8MjXGcc66478nqufMb8y4AMT1FIGZqrSm2+1CzSajmpw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C82581F00A10;
	Thu, 12 Nov 2026 08:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794471624;
	bh=ifn3rhc/aaZsY5m1CIrGkh+6CUMXhWAN0wg/qVoSa1M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JJApeob/6aKjmYks/z6TpS++jqNPqNVGjs8FB6BY9sicAa57bT7HLrOuUGPDbcbAK
	 HnTKvWLPu5E/SaWE1TbzvlbPrDO/w1au+qIYMNJ9El8AK3t4D3+PNcGraa8n0Hkt9l
	 5pYhSbxLliwv1nt0fb7FhzhMlwU7mp7kgcNmH+Xrmki003Clhsb1X78KjnC42QWoZV
	 M3AuSfXr/JejRea8LxcaltNuKyrowr2HpRn1pKO2Pd+Kf4bAIxK5OQ9wXLx3ZAOl4w
	 Ji64POLDy8jGWehMJbjvKNI7qxwqsDLwysq3eSPRVbjtF3ch567gIrcJ7JnT4d+ODD
	 Be935tV+Xu05A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5554149345;
	Thu, 12 Nov 2026 08:20:22 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:20:22 +0000
Subject: [PATCH v2 1/4] dt-bindings: iommu: arm,smmu-v3: Allow a clock and
 a reset
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-smmu-v3-pcie-pd-v2-1-3a77bbb6b2c4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794471621; l=1761;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=JzTX29/TpR9nxeGBdiZSgKclV4i70sBR/P9CmAq8ikE=;
 b=meanwe78j5XeCWZ+lc3cXV+gk13lyQBfIrhT/Usf6uvGl6Qs3NxLqmQXwoOl4CPLYS3YZIBO6
 bAOb6gHoUQuA6jkHrGNmy7DV00xKs/7FY55AnihnTg3kBZxeuBP4R/9
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

Some SoCs feed the SMMUv3 from a clock that the OS controls. On the
Rockchip RK3588 the MMU-600 for PCIe runs from ACLK_MMU_PCIE, whose only
other consumers are the PCIe controllers. When no PCIe controller is
enabled, the clock framework gates it as unused, and the SMMU can no
longer be accessed. The same SMMU also has a reset line in the CRU,
SRST_A_MMU_PCIE.

Allow a single clock and a single reset, so that both can be described.
The architecture defines no clock or reset inputs; the MMU-600 TRM lists
one clock and one reset signal, and the one integration that needs this
has one of each. An implementation with more clocks or resets can add
them with names and a specific compatible.

Link: https://support.arm.com/documentation/100310/0202/Signal-descriptions/Clock-and-reset-signals
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
index 3c044e4f03d4..29b81b4fb650 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
@@ -63,6 +63,17 @@ properties:
 
   msi-parent: true
 
+  clocks:
+    maxItems: 1
+    description:
+      Clock of the SMMU's register and memory interfaces, on SoCs where the
+      OS has to keep it running.
+
+  resets:
+    maxItems: 1
+    description:
+      Reset of the SMMU, on SoCs where it is controlled by the OS.
+
   nvidia,cmdqv:
     description: |
       A phandle to its pairing CMDQV extension for an implementation on NVIDIA

-- 
2.55.0



