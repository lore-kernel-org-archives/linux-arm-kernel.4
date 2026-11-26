Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECA9606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qbFto5C9;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y8viLU1F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HQOWs16y1/eFC3awJ/S60wuu/9tLYEZ3KFYM+GNL2Kc=; b=qbFto5C9i+5kvQAhKqVJCtYAv+
	iy/nN1BKy/J5T5i5qFPRa9uw968SFYNHeXRzBJ6l0uCZBTu+uno3FhgpfPPonOPjiSEjD7iJAqC7C
	9auHqZ0kJK22jFkZg410ZFb+kAsuYNuXE3rCoTTOI0qMotgOSePyMPPsEh6G054G4nlo4ymfIPHtP
	ea0PBqNEP68WIXayJMOwd40JTPzHsD4WDwe8CeGPZfKJL1zSofcm6hTS8Uuuy3moSO8TpX6K2okiX
	TrFcZy18t9AUJTMfGa7W6VuDLagW9NkdsyFdeZDboVR3HgvVG0/nHUSd2Zoq/INSbyvjXfZ5cX7sP
	Glg5/WBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWC4-0000000Cdot-2BL2;
	Thu, 26 Nov 2026 09:55:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWBd-0000000CdSe-14WB;
	Thu, 26 Nov 2026 09:54:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 01ACA42EB0;
	Thu, 26 Nov 2026 09:54:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795686880;
	b=AmOHBczvARE5i2VNRzasL1TVo+KP7yxEYFyM0qOBMSZK37OvKKcSTCivyVldqtm/wwUM
	 oJgEdQa4QZLcx4ihJxr5CIeq/J1T67kwC9Lw2XF74D2ts5qkLLCK7by8zbLw1hAf+sOlm
	 WmhGIKFNb5GMrdDUesCchl6yzYhX+ay3NS3+c7jCRGMnOL5MrIHGg6StY52E9eJ7GjHKt
	 x539umzNYfi2K2FYsi0aoPPBpRoYLJ6gkcgnQj10zsCCeE+ZqP/sJUJCR/GOYQH1h0h+h
	 zjSXp2qK+2zrdstuAY8sTS/2+uwmUAeeIAenT7iFT6K5r2eX+hQ6W2KhrrSL9WqR5mQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795686880;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HQOWs16y1/eFC3awJ/S60wuu/9tLYEZ3KFYM+GNL2Kc=;
	b=X74FhZ0/WZZcSbi7EyrMsfD6cN6tU2JEsq3nkC122UqG6QZUUbZb78JjW5LnvmdP8fK5
	 COTSda8USSm5NlYHfN0smSTcWodkMzvQWHOXJAfWHKjX4dFOuESQlAkZj7DXyG6kZoRlZ
	 gXknT29EEG3FuCJp0wQJhs2CC9shnmKpLJyxKp+1yd++XQCnzIy/YBX8InX8CYtV/RRnc
	 RG2Rh8gQi+K1PAavqtOJMSirkxCVvEz/hF31B8Bp3d2MqCDmKo+QaQa1yECArdd48leb3
	 ZKqdveiaXnawdMnRNn+qZb1BirJ2t2uqIp32UNB2XLybs04m4hd0YaqLv9WksP/YUwA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D78111F000D2;
	Thu, 26 Nov 2026 09:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795686880;
	bh=HQOWs16y1/eFC3awJ/S60wuu/9tLYEZ3KFYM+GNL2Kc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Y8viLU1FRAKKsZChVzjh7vJoJKKBaxBmtXYcuwH/zVoJQt7/sAVniHDUn4fzhORiA
	 HUP6Q8seu3RUJOX4rRTOoVT99pc4NksQ/wHT3kXOtmAEFnUvew3g50QmL69ZLG+nqr
	 84Cd12LBm6Pv8ys6NqbxmAjJ44J6dOIoMOe0EPhsAZamv6b56QNBkxpx3/5bvADORw
	 d2Ax0kUHUs00kL2urE9pHBPATNiZi+zn8MmdGn4k+rrqQKIqpytSRtBb19ZKxdShYs
	 ih65yCzFiZMwwDemGhVXThAPMNVce1mnVVwaCKjMLsoLFlGecuoraBpVt9Pq7TSSjH
	 t6CsG/nmgG4Ow==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 666C34D3D1;
	Thu, 26 Nov 2026 09:54:13 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 09:54:14 +0000
Subject: [PATCH v4 2/3] iommu/arm-smmu-v3: Enable an optional clock
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-smmu-v3-pcie-pd-v4-2-c340c2dbd1d2@gmail.com>
References: <20261126-smmu-v3-pcie-pd-v4-0-c340c2dbd1d2@gmail.com>
In-Reply-To: <20261126-smmu-v3-pcie-pd-v4-0-c340c2dbd1d2@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795686852; l=1455;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=lCcYyOtmQB3eNSuw9WLfzwzQ/FRb4bdLv3eGq+ciMVc=;
 b=xJ5TqNglUYP4qkntJy9fB78WeKA2qNRggzpgnu2o5dsQ/3h5cv0EehwW8w/8UYZh5zN/pU5t0
 XwRWI1cW4I6CkGfU1bYIGfwSOTJ4oyJWyE05Q8boO3/1nAabR0MuIvc
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
controller holds it, and the CR0 write at shutdown then hangs. Enable
the clock from the firmware node, if any, while the driver is bound.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 100b34f07032..beea222dcf57 100644
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
@@ -5786,12 +5787,19 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	resource_size_t ioaddr;
 	struct arm_smmu_device *smmu;
 	struct device *dev = &pdev->dev;
+	struct clk *clk;
 
 	smmu = devm_kzalloc_obj(dev, *smmu);
 	if (!smmu)
 		return -ENOMEM;
 	smmu->dev = dev;
 
+	/* Before the firmware probe, which may take a CMDQV reference */
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



