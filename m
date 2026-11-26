Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24701606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=awW4Ono7;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F+3nfrFb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LrXkkhn+csZHwC0v+/65n16FhGVifrxEgQhE/Pa5wFw=; b=awW4Ono74EztnZfl4s383w626h
	Qa5Wp6AWpTE3p+T/K83rEJ2T5Emxo+qHKIM6yqIwaoXbuBVNaw9iD6lqevJniqxQ/RtMct48y9mnM
	cy2ScSZrIcbLxapusf5V+yp2beVTG5Aoh4AnwPNIjo30awI00FhUWehT3S3uuvWtYZWysjj+3Blig
	PXrK8dcepyhmAysVw0kXoEowf4DrPQ8ZQ4/TrBH6wZMv5ktSAEoLDG5f1WD+lXo6SaiQjYYNUl8ie
	bi1xHVKKwAs2yntOoqzMJJkDKnFW3L71PqhzkIxrD+pOWg8Y9CDKVUs4GprJWnMLqhVUSZRQW9/A3
	w53gCfxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWBd-0000000CdTI-1qbG;
	Thu, 26 Nov 2026 09:54:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWBb-0000000CdS9-2jaL;
	Thu, 26 Nov 2026 09:54:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BEEC628AD;
	Thu, 26 Nov 2026 09:54:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795686878;
	b=TDi1yMZh+0pTTnRJaOEDo9LEQJ7EfmonNLsLcLZ9XHiaPD2Xsr2coH3DTIoBfczFEOKd
	 SBz+zIA5UUo3fAaeLZDA7vB5S08YYlht5mDfsiUQ97Hk6JSK8dnykprjfgJBrJLCzFjwO
	 v61ynUBVGUJMNlkaRpHL27cSywkYKILvLHW35NLrSz5iqkOHMDKBY3GgCYtnD+/ACRfj2
	 AR9MyjZaS1bM5+zCjx8oLasv1WoGl3eKod3ksOVrrHCXhs8Oxc1rsSd7mBKRA71EW7OAS
	 S7efwz1GcVBOoGXpBtlhdInujsSNcAmukvmWJLZ/Z8LmCRStjmwk25rfS3/hbDGOvXA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795686878;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=LrXkkhn+csZHwC0v+/65n16FhGVifrxEgQhE/Pa5wFw=;
	b=fh9wQmP/9fVf4DStKALhOi1haMRb3WJNKSq21SMdDFeWCsc1eMXjNTL/51QejcxIB2ww
	 Qvo363Pv/St0z13kCFlCgaQ+AOKCu1fvXL6LpasE6VH7O5BHRyAw6z1oFu49FfxeKojY+
	 Tom3GdowWO1EctIhx+yPahGJfQrwhCK2VqgtUDNXbG/ANi9aIT4dy3z3sKM0cne2iMgIC
	 Fkd+RDwp11TIIiJdfzzLP83eSvBJmsMMSf29AvVPnxE6oFrzYtN+8hPHDZD4+dk8AVBA9
	 qzsmOIff8xqcaStxfOyAbZHXH9x1BL4pObIK/9ujvECADq2c38cCseM6rjLRt6IImsA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 67F8E1F000C4;
	Thu, 26 Nov 2026 09:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795686878;
	bh=LrXkkhn+csZHwC0v+/65n16FhGVifrxEgQhE/Pa5wFw=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=F+3nfrFbvd2n9Exq6P/RJBPmUwQm88ebWYY57R9qicJHbttkmhGDjz0llWSf6yilI
	 dJMdxVuMiWAJkRzKM7FdTe+h2KZdiYXhSUDGpsVodq6rv4MKOEGg19VYUMNS1ynoe0
	 pbRlxDmTEinR+U6OFjwbP83B15JepldMR6UTANTtWxpiVzEJ60E2PNks+3uE0Tjkhz
	 oczQkpU/qIPlyy656Kl+ejSPndotet3F3yocGkaEHFR7rLVM7FQau3Ol7dwE+yqQwV
	 twdKXvLsuMsToxbOPMvXsG5N6zoYoqA1e5tVF0xFC110kK+a2UzoqbbwnhsOVg0Anb
	 3PhNn9IhINYOQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E02944D3BE;
	Thu, 26 Nov 2026 09:54:12 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v4 0/3] iommu/arm-smmu-v3: Keep the clock of the RK3588
 PCIe SMMU running
Date: Thu, 26 Nov 2026 09:54:12 +0000
Message-Id: <20261126-smmu-v3-pcie-pd-v4-0-c340c2dbd1d2@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ6CMBQE4KuQrq3hvVagrryHcdGWAjXyEwqNh
 nB3KW5Q4nKS+WYm4kxvjSPnaCK98dbZtlkCP0REV7IpDbX5kgnGmABATF1dj9Qz2mlraJdTiQV
 gqjLIs4IsqutNYZ/r4vX2yW5Ud6OHMBMalXVD27/WSw+h93/dA41pglkGQkvOlbiUtbSPo25rE
 tY9bj3uPS6eyTRVSiUKNf/1bOvZ3rPghVG8ECBO+PU/z/MbLIR2xEABAAA=
X-Change-ID: 20261110-smmu-v3-pcie-pd-a2f127b81d8f
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795686852; l=2915;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=OykbgClr+ZRK4+0ppCdomu1EHFQbW+fawWJaWWyDfFk=;
 b=4w4KGwCAjg+suLsY7Wb+HjUF+MXqiHM+K6VvQS1vu8dKFbs1s3X6LFFI9MENRlif9M9NxN7S1
 uwd52RE1j4wBnUqWqyH26/yNQulQKg1cKZ6csv8oSQrHEfUy1zQE0eT
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
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

On RK3588 boards without an enabled PCIe controller, ACLK_MMU_PCIE is
gated as unused while arm-smmu-v3 is bound to the PCIe SMMU, and reboot
hangs in arm_smmu_device_shutdown() until the watchdog fires.

Patches 1-2 are for the iommu tree, patch 3 for the Rockchip tree. The
clock can move into the runtime PM callbacks of Pranjal Shrivastava's
pending SMMUv3 sleep ops series once it lands.

Tested as v2 (same code apart from comments) on an Orange Pi 5 with the
M.2 slot in SATA mode: reboot reaches the boot loader in 0.59 s (was
~89 s, via the watchdog). The resets property is unused by the driver
and untested.

Developed with Claude (Anthropic), which wrote the code and the commit
messages. I reviewed every change.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
Changes in v4:
- 1/3: Acked-by Rob Herring
- 2/3: kept dev_err_probe(): the clk getters do not print, and the
  message records the deferral reason (Sebastian Reichel)
- 2/3, 3/3: shorter commit messages; 2/3: shorter comment
- Rebased
- Link to v3: https://patch.msgid.link/20261113-smmu-v3-pcie-pd-v3-0-39eb4f919529@gmail.com

Changes in v3:
- Shortened the commit messages and the cover letter, and dropped the
  "on SoCs where ..." part of the binding's clock description
  (Sebastian Reichel).
- Squashed the DTS reset patch into the clock patch (Sebastian Reichel).
  His Reviewed-by of the clock patch is kept.
- Dropped the description of the binding's resets property.
- No code changes.
- Link to v2: https://patch.msgid.link/20261112-smmu-v3-pcie-pd-v2-0-3a77bbb6b2c4@gmail.com

Changes in v2:
- Moved the fix for the Tegra CMDQV reference leak on a bad
  #iommu-cells (Sashiko AI review) to a separate patch.
- Dropped the power-domain patches: the TRM puts MMU600_PCIE in PD_PHP,
  which Linux does not control (Sebastian Reichel, Shawn Lin).
- Binding: one clock instead of up to four (Sashiko, Sebastian Reichel).
- Driver: one optional clock, got before the firmware probe so a failure
  cannot leak the CMDQV reference (Sashiko); shorter comment (Sebastian
  Reichel).
- Added the reset to the binding and the DTS (Sebastian Reichel).
- Link to v1: https://patch.msgid.link/20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com

---
Arun Iyengar (3):
      dt-bindings: iommu: arm,smmu-v3: Allow a clock and a reset
      iommu/arm-smmu-v3: Enable an optional clock
      arm64: dts: rockchip: Add the clock and reset of the RK3588 PCIe SMMU

 Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml | 8 ++++++++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi            | 2 ++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c              | 8 ++++++++
 3 files changed, 18 insertions(+)
---
base-commit: c9b82d9808c4af1734e6d08f06fd411c30438ae8
change-id: 20261110-smmu-v3-pcie-pd-a2f127b81d8f

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



