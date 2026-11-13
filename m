Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86361606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RsU+/nCh;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OfkgP1FN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Us1gVL4HePkaxbUhVypXyAHCO7V+bnBHInwTgzPnw0o=; b=RsU+/nCh7o/wVkHmFs80aRw/0q
	/w0uBGcGqeFZbOVkR0At7nc5yLCiq1YNoC6y8oUyHeamDaHQDvwSI2ujS1qFQtad9Zka+At5DPBJV
	ZalsCSG4hfbobOjCOui6mOzbZ63YM2Fp3idXS9gV0wXZmNPYWKqrDBPgQJzqJ3cBv0LuB4Z9dF3xM
	YIELKXmTqsyXIPavoP1KH4M/hdjRgMD9dvqw0BYlgWVCIsBljM0TNkrWwITHsqVeT2t/0nk9jMyjP
	0nKBclJqO2xViTifduhiMLR3uin3Y0pnhy7Kgany4WyFRSzj1JdaD2kgc+PI3Jg0cENMxexCiIC4A
	zX+h7Ssw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmuQ-0000000C7tH-38Cr;
	Fri, 13 Nov 2026 08:45:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmuB-0000000C7pW-27Vq;
	Fri, 13 Nov 2026 08:45:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EB1B462615;
	Fri, 13 Nov 2026 08:45:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794559506;
	b=EFM4klSjwUhk/cFW8f5sjUHxri3eEj/foSS2SpLdOLUVlBNMnsytZYo3+c+7HVRZ8wEP
	 qDmFjVFpTHs2yewdhqO7pUI9UszoQI137Xdxry+FGhvx6lULOhYN+01iRULpxdnY7ggBe
	 bOLNo/qBuZkiaqN/c1/PuXiHDCs4NMovgfMIqFEnyrEVsNKBuBMe7Nc+W01d47hUUERmU
	 O3M/8KwaIV9FSIVXERYs6yCz7/OzBbe8GKPF0asZ1s6PxdB9WXgWH8LcaWHASWdpajweB
	 jCOS8IXwWMso2aEihtZird8LtXMC9rRgJOHn8dtowsAIf+r7+s0Znj3Rlo6vrYZhItg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794559506;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Us1gVL4HePkaxbUhVypXyAHCO7V+bnBHInwTgzPnw0o=;
	b=3e2tZLGbppNmbWG5AobDzHt+SshaIjGcLyChYMwyYYrxVN9nq5FufNXt8lyV0z19UwVm
	 69kGna9SHzLgKtPcsFSLP8Vm+47Us4gXNfVwwLqpGoWSQM2NLyYUjMo6tWfcA/GgToDVH
	 329WwLWvPZCgg+vvgeMNwI2pWe4VqB7+5lX6/dAdnmOVa38/dF8WGehbI2f1JRu0D2N33
	 YdCKTgDxSHbCGBWTucxxilQht5cOsjFaixo+CZWDYf6m4usBGhpP31FspVFlJGoE9LM5B
	 9/epvyrvBBzq2XDAJSWY3JB0+ynDtnSxIx0MlftVDASN7jkNJNe1aM4uB1NCdGb7mCA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D5251F000CB;
	Fri, 13 Nov 2026 08:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794559506;
	bh=Us1gVL4HePkaxbUhVypXyAHCO7V+bnBHInwTgzPnw0o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OfkgP1FNooClVGWHFEjFO7pDjXRBgzj5AroB4DIFskipX/g9iNXUv8KSBXJyYAOlW
	 C/Veru8CC1yH8JgxsnAviFc8P+QMU5QDTP3Wu51lkK5Ggq6G9Nza5JBd8vCRK/bXKE
	 rSXKAx02DGe82VIMd+mUIwGevuiYKbT6PxkwjaF/jxiej05v4cZ/cBcA1giy/YAvDK
	 OEilpprcoD8QF0l14dWc6Mb0dgsz6TREZUR2sC93kkBDDTN4ElUNPhv9aKyPuWf7ps
	 gbOLLOaiGE2NOMNvAxVmYbTEWDa/ihZAZ9wTF3EttHbGuB1JgoRuyuU2Ujq5noFCoi
	 MSLdw9wI5hHZA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9B187476CD;
	Fri, 13 Nov 2026 08:45:05 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 08:45:06 +0000
Subject: [PATCH v3 2/3] iommu/arm-smmu-v3: Enable an optional clock
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-smmu-v3-pcie-pd-v3-2-39eb4f919529@gmail.com>
References: <20261113-smmu-v3-pcie-pd-v3-0-39eb4f919529@gmail.com>
In-Reply-To: <20261113-smmu-v3-pcie-pd-v3-0-39eb4f919529@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794559505; l=1706;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=7zvWTrIyWfGyWvQ0NqQRx0ysMD5mOH6jVqLwWsAbCjA=;
 b=iB/b/B6lXe5GW9lrzof7V2M+wHDzQOeYjXWkLR31k1MNGJ+wI4j8G9ACorIgUxMAbVXg92/yq
 xjHrCRw97DzAYCXduuqoYeCsXbRcpK4Uqh8NOT9cweRDp2q3FtH0ujJ
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

On the RK3588 the PCIe SMMU's clock is gated as unused when no PCIe
controller holds it, and the next register access (the CR0 write at
shutdown) hangs. Enable the clock from the firmware node, if there is
one, while the driver is bound.

Do it first in probe, as the firmware probe may take a Tegra CMDQV
reference that only arm_smmu_impl_probe() releases.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 6d4520c47308..d3f42316b0d6 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -12,6 +12,7 @@
 #include <linux/acpi.h>
 #include <linux/acpi_iort.h>
 #include <linux/bitops.h>
+#include <linux/clk.h>
 #include <linux/crash_dump.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -5786,12 +5787,22 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	resource_size_t ioaddr;
 	struct arm_smmu_device *smmu;
 	struct device *dev = &pdev->dev;
+	struct clk *clk;
 
 	smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
 	if (!smmu)
 		return -ENOMEM;
 	smmu->dev = dev;
 
+	/*
+	 * Before the firmware probe: it may take a reference on the Tegra
+	 * CMDQV device that only arm_smmu_impl_probe() releases.
+	 */
+	clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to enable clock\n");
+
 	if (dev->of_node) {
 		ret = arm_smmu_device_dt_probe(pdev, smmu);
 	} else {

-- 
2.55.0



