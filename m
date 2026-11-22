Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6610D606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 19:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iLNWCChM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R4VmCOuz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rtJLIuILq38S7+xf1t/xBeKv84+48DNp6gcsQ42UeLc=; b=iLNWCChMQzpZbx5lm31yDbHYmg
	45NzELzoz61RDSHrs6RoX65OhyMGJl45wxLoGtFr4WQgFxli/nogUKYxXuWTrwKEdCFdFKnvEFb2e
	D4JengP8bP0+mEBLXzZ7F5xnPZFcYArzXEiBEwFZWVFnhjyP+QW7DgOU2+267S7hejomsLNtf9jAn
	Ku++oJHz50ohpPXUzm8LT8idwXAnuFaH4/qnE4rPfqMm+S2nycHoZ6jmyPTVAoU5k9aOy6c7wOtCm
	BTEd6N4MhIRZCHatLPcaNuiF3LFHKu3Am4cmfdrQyrj1GQKqvIQWmFkk1vz1U2bZ8FGKN8yl8knOb
	PVzPYWHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVD6u-00000001cvy-3CPz;
	Sun, 22 Nov 2026 19:20:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVD6t-00000001cv1-1pFB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 19:20:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6DEC961D3A;
	Sun, 22 Nov 2026 19:20:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795375221;
	b=PkfXFP0hjCCsGSr6H3fQfOFZbSyLpqTyjpONUsbsD2ZNQpIYub84MO5lqw5UmByJTJMp
	 Q4NOlzRES6iHmfSBKGHPxJdBIkoYbLEx8TdROx2M7TduP+W/Y0jtCvOqCfcG6210xw67q
	 cbT488gNKk2yss26w5wX0MyIIXAJ2xLjuQF3cfznh/g7krsQQoxdN3B8BXufIkvTn0nhZ
	 m5e6LS4tR94JtxsEoN569it8aOdLUOmiRJRty/8OjzI8vZZ/stfdry8j6OmFYNijCd947
	 8WUCTkwJgrWH+fqrQ++eKEO8TFsGzXcOz/xfTg1IlIAFdApn3aENtgIPu8qSAS8G5kA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795375221;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rtJLIuILq38S7+xf1t/xBeKv84+48DNp6gcsQ42UeLc=;
	b=O/BttoSJTz/MacHSW/L5vQCAzMKsx45qDlqo64jOY7VUtNZfo9FuHERsjZD93t5vFiJM
	 lLW2vfzzDxQ2CMpPmFgcTQgEkd9k/g/lWk3K1liJBY7wk1KB76EKhEfmdZ63VPLVh57Tr
	 0vWWL6rrCH9fY7VPIMIVwx2oDOozlXUo7h2l3Mr43ctCuy1TSsAl6i8KfDcjseT5lAJqa
	 XAhqRZRtf7dLk66KehGTtVS/X8ozcJ1sC8LJSvKqov8VvskQ94FksyLhY72B+apNepNr7
	 lvYaULkDuQHHwLayNs5X2MMZwBCXSx3tHxs+GpO0YdKxvL25KZGM+IwL7KHLXYOOhag==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A8ED1F000C4;
	Sun, 22 Nov 2026 19:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795375221;
	bh=rtJLIuILq38S7+xf1t/xBeKv84+48DNp6gcsQ42UeLc=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=R4VmCOuz3WiLEv2VvbqPMryLSSv/H+jsEAzZ3mbFnNcHuJsyw3Mh6x5F8EkXmlD0h
	 JxCa1a2NPsrt7DKgxgZE/Tm+Fn0hgk35H8+6+dXs2AAvoSdHYjfkVeQ5ZFh9xe2TJx
	 aRX1mf82QaSVl+VJfitfcQ1ogGO9oE/16ibiAv8nRh8VLli3fX6UJSxCL1iHsIY9a1
	 qtW18dTjub3sSOSQPYzaX2IbvJoreZ5NQg7MHlrx9HNEhqS6qys0KYc5tULQoNPD9X
	 lwToUO9ADZp+LRTnx2d+cp1zodZGGNJJGh+vqsborZJYVh9NGEVwQgfPop3UviEy2r
	 n9snbELkiCn5Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 964D64C1D2;
	Sun, 22 Nov 2026 19:20:11 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 23 Nov 2026 00:50:11 +0530
Subject: [PATCH v2] iommu/arm-smmu-qcom: Add Kaanapali MDSS to the client
 match table
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-molokai-smmu-v2-1-b269afb64de1@yahoo.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr0JmbY1ToFFX3sOwaMsgo5YxLRAN4
 e4Crl2+5P33J0gUmRKcswkijZxYugX0LgPf2u5GiuuFQR+0QUSjgjzlYVmlEAZVeosnsrUrmhq
 WyStSw+8td61+nAZ3J9+vjdVoOfUSP9vfiKv3Jz2iQlUWzhx1jrkz5vKxrcjeS4BqnucvMqksf
 boAAAA=
X-Change-ID: 20261116-molokai-smmu-5ca19eadb4fd
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795375210; l=1960;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=IOvN/fb6bq9WwffRaDqPrhV/ORJ4j4dNprZUstTRU0k=;
 b=LLBgn4fdGwva15pz51X5172y3KS1/TKgkPtY3er9X7hQioL/I5XY0vaKGmdkTsx+Q3P/9rBQn
 brpbiwrIZsUBV5gdT07l7JxFaGGJxI5Pwh1yyXUNdic8emQS2bgXhsF
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
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
Reply-To: venkat.yadlapati@yahoo.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_MSGID_YAHOO,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

The display subsystem on Kaanapali scans out the bootloader's splash
screen through the application SMMU. Use an identity domain for it like
on the other Qualcomm platforms, so the handover to the display driver
does not cause faults.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
The display subsystem of Kaanapali, and of Molokai (SM8845) which reuses
it, scans out the bootloader's splash screen through the application
SMMU. Without the identity domain the handover to the display driver
faults, like on the other Qualcomm platforms already in the table.

Tested on the Motorola Signature (Molokai), where the display subsystem
comes up through the application SMMU with it.

I used an LLM (Claude) to help write this patch and its commit message.
I reviewed it and tested the result on the device.
---
Changes in v2:
- Drop the Assisted-by trailers and the LLM notes from the commit
  messages, the LLM use is stated in this cover letter.
- Link to v1: https://patch.msgid.link/20261116-molokai-smmu-v1-1-54b682313b66@yahoo.com
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 795e8ec7e8fa..0ee9a9cfdf8e 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -407,6 +407,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,adreno" },
 	{ .compatible = "qcom,adreno-gmu" },
 	{ .compatible = "qcom,glymur-mdss" },
+	{ .compatible = "qcom,kaanapali-mdss" },
 	{ .compatible = "qcom,mdp4" },
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },

---
base-commit: 2cf4be57b301ed2d7af82e70cff5dfd96894d8de
change-id: 20261116-molokai-smmu-5ca19eadb4fd

Best regards,
--  
Venkat Yadlapati <venkat.yadlapati@yahoo.com>



