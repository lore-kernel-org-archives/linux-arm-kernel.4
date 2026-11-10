Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACB0606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xKnxWC8N;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=esPVOOLa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BlGCS7+vHVkCstdONHb4lplbAMJsQFpBwNtspRDMc5s=; b=xKnxWC8NR/oUF9VikZxkrhX7J5
	nxrG9EnyTetrXMhZHUGfBpkxjnDzkCZ+pADtXeXD4ZsMYEtZ73wtnNqD4IerVv8jcHD5DV1Kh06ui
	qvn11RMnTj4OeC7rR6NsRNxvX7T910nVcpWGcrFHrw9qLg2ujzT5QmpGFQBzpThzSLvJRMFqTiehW
	ev7WkhNx9shRJy0aspPQf5nXZm302pwXcovOVKmEcZuHJuWj0yzz/hxOj9A3FghHpBKsB9yzo9sxq
	cPqVH6i5JJZNbu/++ANoI1cnWsVU3PTGAO8pvaEyKh4Zl/KHC3QkYU9Vs0SCQeWQlqa4vkWng4ecM
	IqGzkPyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg1P-00000002mKZ-2sjO;
	Tue, 10 Nov 2026 07:11:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg1H-00000002m8Y-3sQc;
	Tue, 10 Nov 2026 07:11:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 462666378D;
	Tue, 10 Nov 2026 07:11:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794294711;
	b=0M94otHKyl4mudNDAt3db1l+rwNo0ipUqBKBDs4SFK5tlzVAOWslHGgVANsCR80mJ0DD
	 AHKOLJ4maP2KdG68M5StKKFoFyio9fPnwIcywgtWmzLEodYPFVipEu7D7dzG+P0/f+U3E
	 /rCP0dqX9kncj8Tl3hxWE5Y6ewkNrL0DMd/mzC31H4Dk7C/9rDmyCovdP5B47iu6uGbvf
	 hEDLEfc2MwVFTPc3tv4seMyZ8apn43EGjVN3JPQvP9OMelamdjMxsalzLru/TTmK2wFOA
	 /YeXcqio7OT/X1vo7iHY9K8sIpM4ayHwoXCY0FCpl0q13XkoxfXB8SgWH/3VtSAnuYw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794294711;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BlGCS7+vHVkCstdONHb4lplbAMJsQFpBwNtspRDMc5s=;
	b=2OxjPiFkQSX5kWQ03hKUjiAcFtD7MKDSKUA4Ud/KelQlUz8uoZ7CpvaNbqOyPf6OdAIr
	 IGU9yx9b0WXlLKH79TJR/I7B88HIXf5cGQdDwUVfl9QRK60Oc8WYJzshsN6SzQrr1VBhe
	 viS9SLaARjx7YBMpx0V9VkKUkE7ymMQVEayzfoi4K31/4zSyKzDvD+1L9B03VZHbcPubK
	 620q+f66sQJ7lwQXYN7QSo0aAWak4EnqM2TRrJVuZYPVvfjMHHCiCMsAV76wdwzQhzxnI
	 UEoh8s12ht0JwWxvENUfC9Z6vk67ZpA8JmmIiuHjNBelPQ7haWUYSfsytsYva7JNBLg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5AF0E1F008BE;
	Tue, 10 Nov 2026 07:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794294710;
	bh=BlGCS7+vHVkCstdONHb4lplbAMJsQFpBwNtspRDMc5s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=esPVOOLaMVT39KsaHoKCU3BrHLcXfeldeZ9alhMawxuZDFCOYNlelVdqwksjFQfsz
	 5kQ+KLrqd5zL+Nst4pLfLM7u+QcigCSvO3q5tTXxxExs0RSQqmYigKoQcoh070SKGG
	 Cac6KzhUSt2yDvygQKP+OKUsYhHignxby4ImqMDYIbO++obf88ZuaMMkU8uhkAHmXB
	 KdB2hMpGXMHH5tWtXrBkGYuyUhkUUwYcdtOgpfbI59vHzgl2ATdLvaxQ6NsvBCKf2+
	 8muu29sXN8ZOlPOOwwQMeSOOG99gwntQ7t5IGtYclamwVvEUMGGJFZN0VKitRjHV6Q
	 J2NfqAZqNh27Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0609E48953;
	Tue, 10 Nov 2026 07:11:49 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:11:52 +0000
Subject: [PATCH 5/5] arm64: dts: rockchip: add the clock of the RK3588 PCIe
 SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-smmu-v3-pcie-pd-v1-5-628819ca44b9@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794294708; l=1149;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=bLcKcj+LRANwxoiMM46Cd89sIDqhd3QCt7Lj2mURtSQ=;
 b=z/amT++A9MqE0D1vOB9Z/nfaV7eqMvL0FbII2ljxfJoqQxQ3SwBJ94YvBvnKfIr81kZIptXkc
 /SnPZWdCfrxDT1hrAOLYlG9Pag59fuWPCU3SGV3HxnyEFzaypVbR4VF
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

The PCIe MMU-600 runs from ACLK_MMU_PCIE, which is also the parent of
the PCIe controllers' master clocks. When no PCIe controller is enabled,
nothing holds it and it gets gated as unused after boot, while
arm-smmu-v3 is still bound to the SMMU.

Describe the clock, so that the SMMU driver keeps it running.

Fixes: da92d3dfc871 ("arm64: dts: rockchip: enable the mmu600_pcie IOMMU on the rk3588 SoC")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index bcd342c025c9..8eed22ca69ab 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -559,6 +559,7 @@ mmu600_pcie: iommu@fc900000 {
 			     <GIC_SPI 374 IRQ_TYPE_EDGE_RISING 0>,
 			     <GIC_SPI 367 IRQ_TYPE_EDGE_RISING 0>;
 		interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
+		clocks = <&cru ACLK_MMU_PCIE>;
 		#iommu-cells = <1>;
 		power-domains = <&power RK3588_PD_PCIE>;
 	};

-- 
2.55.0



