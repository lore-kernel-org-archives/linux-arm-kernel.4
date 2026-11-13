Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4A6606A88E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=S19PYIYH;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SYoZpfZ7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=31dV+hbb4hVRp8z0uoBI2OUNQZcOaUvP3vksNhkTFGo=; b=S19PYIYHqKKQlwkXv3PvAmDaHI
	hGKVqORJF/lS4Bi+0mdakqTL2XSyPlPNhQIxX0gwHwOBzP+BUAeemtc8Esoi9MI1thMKM7ndhutFu
	qJGSxAVWt+XTSWspf6xcQCxjTO3PlC4Zx5yvUPTa+/7lIDmZcjlX5mPH1vK4hclNaZfZkH3jv5dCy
	6PHlNGH6iHW+6qQouWYvvT5bpk7pkJzQIbM+qltNVIm/iETvE63OsCEY5MIe/2+V16Ywn51r/D+c5
	GEoofCpsji2CMHyURlurcHHJPgM2FUgX9yj/7mapqTsrk3tvdonuk8cCk5ixJOBOHsJ3Mcpcw7H6I
	tXmyMBcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmuS-0000000C7v8-0Q3I;
	Fri, 13 Nov 2026 08:45:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmuB-0000000C7pj-3HnY;
	Fri, 13 Nov 2026 08:45:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 648084168A;
	Fri, 13 Nov 2026 08:45:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794559507;
	b=u2pCk5CMdkNZ+3MTt4wM8kVjpQx5qCKoFlRrNLyVxSsnD40J9XrTb2hxdnkCiXBnxmWI
	 v7rzYifibccyVIwAg5q2bKvvrHXbyan+W2CrQ5hJn2UcNMaYTDeBYjywu/M8VvVSAeosy
	 p1OATfU41ppdniQey3MCyOvY5er4/y1iJhAmXzz77MqWzpkEsjU6etq9eLkH0xQEH6tzM
	 aJoROhlnv0W2yRI+alUkFn7QD6dCEmFHvTk52X+ltHoSnOCe2u9szIBQ4S5RH6PxiT8qt
	 L9ftT6J24yM+JD+/kOYcghVBS4P9KpJjnbvF3GfLZw/UPHQ4QZRhgX7hm0LHd3jnlXg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794559507;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=31dV+hbb4hVRp8z0uoBI2OUNQZcOaUvP3vksNhkTFGo=;
	b=kjW0HGekRsPrW0xmxt0hHK+N+sqvdQTwcO5eAtwMU8F+KX9451MfvzeiTBLPNzrXv/PK
	 SvwnqRFsKm53AQIGqWFjupGrSwxSaGC6iollcgHfUmTx1jJYZI43WzTd9awK81mMmYgrS
	 BwRrzqV0vmY+h1j86amKydFoT4tqZ6dnP7c5caSUOb0zSiNI5IEYUMecY/gJqVQQ44YbM
	 29XhzaWA+xq9EKhW30Wt6rnxLA3pUHrYtc1Mp9RcxPuLmZSUeZGB4nmE3ZLr3SvGIHmyw
	 WA1eggl9gkjvuVo79FVjLH7Vj6tCxOrMmo4zaoXSGnGKEKgF6dBAIqeODi9BTtATF/g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1BF541F000C4;
	Fri, 13 Nov 2026 08:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794559507;
	bh=31dV+hbb4hVRp8z0uoBI2OUNQZcOaUvP3vksNhkTFGo=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=SYoZpfZ7hEbNeF5GTYyX72hicta2768hYXtnnzo6ZxFe7HJIbP4fYij75bGBr8DKd
	 PxRFuHiDn6PldT29VYXSIAqIynvHYQHE0U3mQx3want1w1L+Gt0CY1ae0MDSAJScK4
	 b6q2qDrNh7goz4lpr/8XGaftfQV6ep8mBBPHYbKj5qE1n7Xehtc9YbZjvnfugThDZP
	 deJI5vFVJD1+rc4yjNtuu/fy3FJxrZ0I+hsCm5Y3TKlvNYzK3T6eooHmL07+Gc4T4P
	 lQlE3ZGTENgEfPGJkMBN2btYksZCBZ4Ix3pzi4KuzwNN51J/HI1YalaupOLFmgFf3B
	 pdyn3rTuOtg5Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6D5B8476C9;
	Fri, 13 Nov 2026 08:45:05 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Subject: [PATCH v3 0/3] iommu/arm-smmu-v3: Keep the clock of the RK3588
 PCIe SMMU running
Date: Fri, 13 Nov 2026 08:45:04 +0000
Message-Id: <20261113-smmu-v3-pcie-pd-v3-0-39eb4f919529@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4V0bQ0zECiu/A/joi0FxsgjLTQaw
 r/b4obEuDzJPeeuzBlLxrFLsjJrPDkahwDZKWG6k0NrONWBGaZYAEDKXd8v3Gd80mT4VHOJDWC
 pBNSiYcGarGnotRdv9y+7RT2MnmMmLjpy82jf+6WHuPtf98BTXqAQUGmZ56q6tr2k51mPPYt1j
 0cff30MfibLUilVKNT50d+27QOoIzUYAAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794559505; l=2819;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=JFQF5/x0xcmOO0il+Oumud6dGqDqEHGMJfPbBtaSTas=;
 b=r+ccjvH9jrVlYhNR5ezOijurYTiyt5yfiemcGV3RXLrUNiui61CYNJy//fe7BhE07XOPhzNE2
 wY7ACapqPM6BUGt6qS9vDJkBwcln639T7ld7v8/RoTqPdZ44VyBNH3n
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

Patches 1-2 are for the iommu tree, patch 3 for the Rockchip tree.

Pranjal Shrivastava's "iommu/arm-smmu-v3: Implement Runtime/System
Sleep ops" v11 (not merged) has no clock handling; the clock can move
into its runtime PM callbacks once it lands. mmu600_php is disabled in
rk3588-base.dtsi and is not changed here.

Tested as v2 (same code, 7.3 kernel) on an Orange Pi 5 with the M.2
slot in SATA mode and the root filesystem on SATA: three reboots reach
the boot loader 0.59 s after "reboot: Restarting system" (was ~89 s,
via the watchdog), and aclk_mmu_pcie stays enabled. The resets property
is not used by the driver and was not tested.

Developed with Claude (Anthropic), which wrote the code and the commit
messages. I reviewed every change.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
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

 Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml |  8 ++++++++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi            |  2 ++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c              | 11 +++++++++++
 3 files changed, 21 insertions(+)
---
base-commit: 2cf4be57b301ed2d7af82e70cff5dfd96894d8de
change-id: 20261110-smmu-v3-pcie-pd-a2f127b81d8f

Best regards,
--  
Arun Iyengar <aiyengar1990@gmail.com>



