Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C734860A5BDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 07:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hUINPowl;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vnm/FEgh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lgsY04AReAKTLU8j5Sx8DG+/2fT14QzESzN7pVjzbt4=; b=hUINPowl+2zio8b1WwmvGbsix1
	LqaGa2GBVf9uti8ee0MDYnScFm72tneDZPw+mG9CG7j32V7nwRRqC3U4il+rskvzSveb5VGNA2qdT
	P613AJnxB8e3Y3+FRCtdGF/1eO37JmK0+kK9EEeVaPdyB1dxfABPlSwFn2/PnjtTJDff8ntE+trUg
	vg+DL7pWFRFrRtBtYET2dO8IrXG3Gh49jfMYgnEJbXqBOUeelpI8oQckBvMmKDmo+UiEAKNbdbPDY
	5TxGW1vQytJp4NRAA/cMA7MqefuUmYqu+skv5cSx7IVE+OC8V3n3pCSLTJzflyrkeGVv58X3cjqCW
	NWm+jAfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg1M-00000002mCq-1Imz;
	Tue, 10 Nov 2026 07:11:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQg1G-00000002m6r-3Sac;
	Tue, 10 Nov 2026 07:11:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F42B469D4;
	Tue, 10 Nov 2026 07:11:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794294710;
	b=K87UOr3H4LNJH/yeDPezOmu16w9nnNhGn99wiwATmdoM1ZkLL/WwRcIR97/c3Fj0eK2m
	 kZXGjr7ue3Jr/V6vVcXU/gRpsR+hhe8UykGcOjx9dZdXD9R469yS6uwJZO5iNSZ90lJuG
	 h3QDauE67LqnGir0NVbEMbp71ATKEhCDk89ZA7YvREJrM3wFxaZzCgqk1qPa2U7stVXeG
	 rJI5S04ubuGY7cfe2Kqq3+fjjzJMLbRGlH9179w6QWQDVeYiG6lJnMYhXU2QaBfocMac8
	 ZmaPRp9arGU6QdupARHlfsXN3i/0yj6CUu4F1s7qaRxFJMwA3ob2T0k3Mc3/wCfhqPw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794294710;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lgsY04AReAKTLU8j5Sx8DG+/2fT14QzESzN7pVjzbt4=;
	b=Cp9GxAspq4OzdOocEe+mEU5jUboZbG6YoqprqUZ3lQ1qZMcjufc8tJNq3wsdC7/pWdIx
	 X+8d12Q/h6G0w94ps4nCQ8Nw8RwQsev3S1wiWt3TGHDF3f0IasqTyVVSgpYOtrjEYNTzd
	 nMgBSKQWG4Gp9tTCvSM98RxpK/4c9g3lSv/z7RTWas67/E5jcL9ZywzMKVvvwYjCPdy2N
	 mk9VS71X5x8Z0jnCLIpQtBgce875fubfzJXY7a2c/6879uFmsWgSo8JfWMS10rdCegZdC
	 CEFR5DjLp91gpfZlOHpiBnlUjA2EWv8JRZhP9yrExWUCPLTzz142xsO14DjNxyGNAtA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F83D1F008BC;
	Tue, 10 Nov 2026 07:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794294710;
	bh=lgsY04AReAKTLU8j5Sx8DG+/2fT14QzESzN7pVjzbt4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Vnm/FEgh1XG18ZuKEXvI2zwEbBs4Fm19wberHlrABra3AYOHbCaX4XUUQsiYppsxL
	 ZI2d/tXYeRtRHWsO9W+TJE75k5OC6alyAkTNKuFOWSYzjmEu3JNj5smC8MSImCblww
	 Isl7HSmCocnYaWDyy6arTUXM6y2Vz0YxaEzlksoS9i1EkatobMnUuwbsSRCJyGfPzK
	 Jka8axIlVi7QQhL/J+xZe95drEc+9jNKwBT6XUCh9BEM8frO+wgD2ZHvLUBzTv+sLS
	 JGZw68QyLUFesUll5XWcZhISI48M2GWfvi1Sia9NzLXgZi8K73b6wizeImr0ifTTOq
	 wm0lDcgCZrfFg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D6F7B4894B;
	Tue, 10 Nov 2026 07:11:48 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:11:50 +0000
Subject: [PATCH 3/5] iommu/arm-smmu-v3: enable optional clocks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-smmu-v3-pcie-pd-v1-3-628819ca44b9@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794294708; l=1852;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=1jSKUYxMXlwd6GjaT82AOfCUOwP/umlQOFLtJr1OQVY=;
 b=NrU8nzbqEB6wQaUAemybLdDL7kdPwIu8BxlTC7zaLyd7fjp+gpXYyH0f5a1eD0GhcLxN6zqQW
 UGlU3FMVIS+CZDY6N1NEw78+vVRiw0iJPL/wm35Eu334rP7gbRSahB3
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

On some platforms the SMMU's clock is controlled by the OS, and without a
consumer the clock framework gates it as unused late in boot. Any later
register access, for example the CR0 write in the shutdown path, then
stalls the interconnect. This happens on the RK3588 when no PCIe
controller keeps the PCIe MMU-600 clock running.

Get and enable all clocks described in the firmware node before the
registers are first accessed, and keep them enabled while the driver is
bound. Nodes without clocks are not affected.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 6d4520c47308..cce66db93219 100644
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
@@ -5786,6 +5787,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	resource_size_t ioaddr;
 	struct arm_smmu_device *smmu;
 	struct device *dev = &pdev->dev;
+	struct clk_bulk_data *clks;
 
 	smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
 	if (!smmu)
@@ -5800,6 +5802,11 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* Optional clocks: keep them running for as long as we are bound */
+	ret = devm_clk_bulk_get_all_enabled(dev, &clks);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to enable clocks\n");
+
 	smmu = arm_smmu_impl_probe(smmu);
 	if (IS_ERR(smmu))
 		return PTR_ERR(smmu);

-- 
2.55.0



