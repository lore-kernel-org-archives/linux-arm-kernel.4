Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFCD606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 08:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AdVEVcfd;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CnLIUx79
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=FdqVVWOxFkbFsE6ZV1qJmxaxC6EDeXb8IgATHhWIBQc=; b=AdVEVcfdXw7r9vJMULJnjzrHOU
	WjrohFcAPEfdYnxjiHzZ8wVfAaH2nXWjyJab6wizcfMuoJnvIYcjtGBv/8DCkr+/x0+tS/p4J1XzP
	NocoBqHdoB792X6AicPTwlwg2n7Zj/S0zbgV4oVBUEhGqirqXpPpolWzzAZF2p/87TXWNtiybDWtA
	n2TQ6c0cSwOX9nf+UNfSCWIa2au79axvcIpohYTevarAKue5qPgZukms0OUzluYSFuFsfJh9LZahj
	DrUm53zkkwzoCP9BSLBIrj2rkdoyfdxJSQ+65iyNZRxi9HNHqU8zNmy8Mz30XiaV4dZMLdE+jIKDY
	kmUtlI/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQ2g-0000000944j-2c3U;
	Thu, 12 Nov 2026 08:20:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQ2f-0000000944S-29M9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 08:20:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 739846380E;
	Thu, 12 Nov 2026 08:20:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794471620;
	b=QZOkzsdxkjt3e/2QV5LeS/U8wbFGaKQFbBrRo02aHmZG/FA1ZOTL1WW4oQawpS8yRS0g
	 J0N+U4tMs3whUNsy0UL4Vfk1kkQjQIogeZiVFn8BezvcbNXH+ZrlEPg72cqyOWHbH4Hxq
	 OWlfoPFJfjncuakJrbjovmfOSwi7KaMs2Ka31JmaHQ1u5AVMWtWQTm1pvLCnwfC8rPp0k
	 Mrne97+D3B31dQAvOV0ugRywlybILPnvRgBX0kwUzu6IZAiB3YzFYtJoZQGqfkoJzlKFz
	 6eG6WcZj4bEyatBNlYgLewCjgHAlXQ+XyB/AAn7JzOeQA9bFybv+SNsr1byAXdLwMmQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794471620;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FdqVVWOxFkbFsE6ZV1qJmxaxC6EDeXb8IgATHhWIBQc=;
	b=vQAiHzbPbcPWf13mL4PwHEMggkJo6cukKwH00BXpf7JaKGF6qquQIxPnxFxDjn8030D2
	 ixy6wqAJphhk8TgdYNPOWzO0jgs/4bbUB02FPsEPQpAue7BFfeycfn6r0fS7G4Td7+6IO
	 VSSSDSfRK2YddzMvWHXD4NhEnHlkBJyWotu3ijGtknbdXC2irDFwzac87CcZUaraLmfuz
	 SD2H4+2zNrLrYMvwGkUhNPiosZAWgtFeXlS1+SCm1Q73NSUZ1Q5JOJdjKeAP96ByrJwT2
	 xWyvFaqCKOHLgJgCt2HeYCq7tOg+xNUmWbort1Liu2s9nwLk2rCH9Z8uDlZ5IDxs/gw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A01A11F00A05;
	Thu, 12 Nov 2026 08:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794471620;
	bh=FdqVVWOxFkbFsE6ZV1qJmxaxC6EDeXb8IgATHhWIBQc=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=CnLIUx791o6mNCf/kN3ic0erEOZkhtM2CIjhArkcjs6pEzuN2rb4Ne5OIqd7qkiip
	 WUJ1VjYWjCjmu9cbFI3rVoOLGblZsI7Z6r5td4trZm6MukZQdwgh0rOZ1IlRkHFolK
	 S/BYfoBpX1Fyro04Aqs2EAp4TkZ2LvuPm9i/rEEl4PB2xH4SINXLc8QLqmRv48GV3r
	 JyAZyxxlPTkVa1mFAqnbvRtJTwVcmlPon0nUeRRQbJtZNlzrcna1tewK7eWOiUTmtm
	 uB7cstYTtBP8q5voUEfQaGkNtyz65HlYv0x7Qm8n3C1wvFb1zD2s6hWKoJUsBhb2V3
	 PNwaVQa/SL6MA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F1AC049336;
	Thu, 12 Nov 2026 08:20:18 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:20:19 +0000
Subject: [PATCH] iommu/arm-smmu-v3: Don't leak the CMDQV device on a bad
 #iommu-cells
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-smmu-cmdqv-leak-v1-1-7ea8e34277ea@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5EMBCA4VeROe8kbQVZr7LZAzUYq5YOIhHvr
 jh+h//fQcgzCeTRDp5WFv4PAfoVgW2LoSHkKhiMMqnW2qA4t6B11bRiT8UPlYprk8VlQskbQjV
 6qnm7j5/vY1nKjux8beA4TrVEBzxzAAAA
X-Change-ID: 20261112-smmu-cmdqv-leak-003f273b5e59
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Ashish Mhetre <amhetre@nvidia.com>, 
 Jon Hunter <jonathanh@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794471618; l=2672;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=JFxmFN3cIRJr2/Ra6ODT1qA+wurdLXBaqRClozZogq4=;
 b=71xTMvY1LLFHX7uxj1jX748drTLI3BNM2UqILmAnNnTNAEEWxNJAzSMLcLAeqggXptxOpstUx
 nCLe/jcbtjJDHddsDeK88Pvs/8aM7Mx5rzcpgzKi4qhVEDZA/Uyy7vm
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

arm_smmu_device_dt_probe() only logs a missing or invalid #iommu-cells
and carries on with ret = -EINVAL. For "nvidia,tegra264-smmu" it then
calls tegra_cmdqv_dt_probe(), which takes a reference on the CMDQV
platform device in smmu->impl_dev, and returns the error. That reference
is only dropped by tegra241_cmdqv_probe() via arm_smmu_impl_probe(),
which is never reached, so every failed probe leaks it.

Return the error as soon as #iommu-cells is found to be wrong, before
anything takes a reference.

Fixes: ea69dc4e207b ("iommu/arm-smmu-v3: Add device-tree support for CMDQV driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-206486@kernel.org/
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
The Sashiko AI review found this leak while reviewing my series
"iommu/arm-smmu-v3: Keep the clock of the RK3588 PCIe SMMU running"
[1]. It is not related to that series, so it is sent on its own.

Only compile-tested (arm64 allmodconfig, W=1): I have no Tegra264
hardware.

This patch was developed with Claude (Anthropic) as a coding assistant:
it wrote the code and the commit message, and I reviewed it.

[1] https://lore.kernel.org/r/20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 6d4520c47308..f685ed0c01b3 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -5661,14 +5661,15 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
 {
 	struct device *dev = &pdev->dev;
 	u32 cells;
-	int ret = -EINVAL;
 
-	if (of_property_read_u32(dev->of_node, "#iommu-cells", &cells))
+	if (of_property_read_u32(dev->of_node, "#iommu-cells", &cells)) {
 		dev_err(dev, "missing #iommu-cells property\n");
-	else if (cells != 1)
+		return -EINVAL;
+	}
+	if (cells != 1) {
 		dev_err(dev, "invalid #iommu-cells value (%d)\n", cells);
-	else
-		ret = 0;
+		return -EINVAL;
+	}
 
 	parse_driver_options(smmu);
 
@@ -5680,7 +5681,7 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
 		static_branch_enable(&arm_smmu_erratum_repeat_tlbi_cfgi_key);
 	}
 
-	return ret;
+	return 0;
 }
 
 static unsigned long arm_smmu_resource_size(struct arm_smmu_device *smmu)

---
base-commit: 2cf4be57b301ed2d7af82e70cff5dfd96894d8de
change-id: 20261112-smmu-cmdqv-leak-003f273b5e59

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



