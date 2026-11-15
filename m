Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D11606A880
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 20:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3uMquxKt;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K8Vg1AN/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=sE8fCk4typDnJvD+nhsRN4p0pLAgbnUmYhrIHo3jb4E=; b=3uMquxKttbA1xkxv5+fhSwpUXM
	g8es+GSKifnM9VErcR0PK61I2eiScUVwF1Os0VWrjIqFPf9F6v4yQ/MzI+0w/B94x1yCYhGnCle0d
	NM7WkO/YHaKLMV4pYWM9I0rfgs74nDA55YFHNAxT1rkjFnHi1h/ABu2/ROhg5cfGCz+quu59i5sTP
	wEaHPySOCsI8POERHhLguRy3Km5KDRqpu8gJ0o9CtfPFh3MpPeOcQ7w0+pvLWEItN30Oed95leto/
	zcgIC5KGVK1AHUiwp0as8EcomOQoAqvpj75x0fHkiFdwE9e/+w3NgSHrv6v6kG8gwLKcdspiu91Hx
	CMTk1wUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSghV-00000000QEX-44MR;
	Sun, 15 Nov 2026 20:19:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSghV-00000000QEQ-1Akw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 20:19:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 40E8E601BE;
	Sun, 15 Nov 2026 20:19:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794773984;
	b=xE7D35lV9kOVJTzLYy8gOoJtYj6XpZe+fzclgtSKi4N+W7s4N1cgPtRIBIdVrqvYFUUu
	 mJoq4HcZjnrFVuEv/9bnDkMDsC/K3MidfzfZHTq/kv0XwTXw/pBqNpC6uheO87GCSSYOw
	 gv/krGBvm/6t32gpl8UyQKQ0hJEFkHRYBbEpiCHoeOf8XJRXdAC7XhM8Fx/a9i5tFCQA9
	 F20jaEJvNFiLfdCtSO9kxnSdKm89LuSJjp51skbXIzxJUb1BeMva66XaV+5jfAxDjzZhS
	 Qqb1R+uvNWjXEZaY4IXTeji1p1Lxe4kx1PiH4NMZJSa6FuKILnEaTRYVAjkeVrXgFSA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794773984;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=sE8fCk4typDnJvD+nhsRN4p0pLAgbnUmYhrIHo3jb4E=;
	b=wtrEhu8RJGKys7Las56Q8dFqAqniHqU/mqYvXk7JvXa0gLPLn5vkWzcSqoJ74ste80r7
	 AgpqaxYWkGxlaGfIkUoi0YfnMExkP7hoqaSwb09/nbGrSmI63f3c0DOx9by3OhSTkEfEj
	 JHmg56BW2aGeEi8tTjjbPx4l/Zta14BCCxVg43RAnXcoyIOe2lThur+g3QIXsxMtnYIW+
	 iCUwqBvI82V7g2PjxQNll6q8skJqgloKy9zIAFy6f7R86Mb7Sf92A1MGxPDEiUwfLLsmN
	 TottgyK2Anu0aOHOdCLe4A6TSSHkpNDtbc2yHOPV289w2djw50ODAHDzeCYb2FImduA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8730C1F000C4;
	Sun, 15 Nov 2026 20:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794773983;
	bh=sE8fCk4typDnJvD+nhsRN4p0pLAgbnUmYhrIHo3jb4E=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=K8Vg1AN/kx9sz5cvK5OFTnumV+vS2Gz37/rJLinZQfP8rbfaFB2LjOjl+WU7H/Gpp
	 pdGd/oeE20Z+ieCkfFyx0/ddUiK5kGtZWmC0KybqntRwhC/w7T/Bvqf8JYQklyPh16
	 uygJNivUf8z5gmAomS+vJTm4IhpVNesvM0wizPs96HhnEaKdVYU0kTGb/SO62hAwqU
	 dtI/vfl8eRv6N9sIIJCRKOS2efqer1lvjeOjxP713ktGap6fEZrIknw6OOEjA6TeyB
	 2/1tYTsa/5aoTISNk9z1zL3qT1gaeaTDuFiP3mnwu5lW8LoxfS828wvGBDH7ZPVJNH
	 HOTIDVVOBox9g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 187ED4A170;
	Sun, 15 Nov 2026 20:19:43 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 01:49:43 +0530
Subject: [PATCH] iommu/arm-smmu-qcom: Add Kaanapali MDSS to the client
 match table
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261116-molokai-smmu-v1-1-54b682313b66@yahoo.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mz3dz8nPzsxEzd4tzcUl3T5ERDy9TElCSTtBQloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loASejl2HAAAAA=
X-Change-ID: 20261116-molokai-smmu-5ca19eadb4fd
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794773982; l=1779;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=tu+NFiw+fOcsWLYvR0WEdnLT33HysKPDUYnretNByDs=;
 b=usbyYu8k6ChN1bte4HvsGANsBt1ix37tDWesx4q+KT/zXgFn31cltG79xKwaZgpNHvZ8W++10
 DmrUBdISdqdDjCahETGzpqd0el2vERJN6CcIqrwg1/QQPkxdppHSk2G
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

An LLM was used to help write this commit message.

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



