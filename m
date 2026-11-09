Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478D0606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 21:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oSWa6Lyr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GQSf27vL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=XUsyqx7ECPHW4CQONcrbGlANSZUF1R9oFqc+hq23tPs=; b=oSWa6LyrejlLFUn0QH9KE1zkiy
	kn/MgUJtdb4lTSif64jAmE0/JyzwfBy1zMI9RV3B2rPtVht1h3kxzwuYD5eI1oeREkXMd6W3nyn16
	00WMuMlt7lvQj35E6uz+VT8E+zwamI4gCic1YJ8dDVwAWjRwMUP8GO0xwX8oRO1rg4befdWS8OKZd
	ribtV++XiRGN5YgyJ0bRsL1P9yPzl4Xq+rMAiae/Kieycgqlf/LO3SHVFzuy3iqfW29VDUKpdeoUn
	78I93dLHQYcgup4isG+7bjIvaZtVSTNRzTACf+wmnQCPAuU2HdQULwZF1nXzy0OpSJVwcerDXDCP/
	cVF8J5dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWVL-00000001irr-0Oc6;
	Mon, 09 Nov 2026 21:02:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQWVD-00000001iqe-03kW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 21:02:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E04660F2F;
	Mon,  9 Nov 2026 21:02:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794258126;
	b=QC8j/6g8iJOoMGNr85K2m9cwiYaqz3L18fX65VRJOSeOtXrV1fJTRBo8OFoC9Lj/dP3m
	 UWcK/LE4Xub8/TmscwBElGc7OH49u0EO5UMZ2k4NnPD8Wi0fdyrvtjW1NMn41qDXoKTDs
	 kSvnvFjAMMI+ZKGguFGUOi7NVnoIVU10P/N2d8RlRNY2aTFANuKhbNyiHVA2G125RmYol
	 2nQX8oNvps7swhl5GbrV8a9pli6n4X6rRyuhi6kN3m8sVbCPFx5zKaSSztDduE/Zt9WQE
	 7yZ5A5p/d5ZTJfO4Q0T824VaTTJ0/eM2BTWBrCVR+VBvEDLn1RnYTfo4S54GMRmtQuw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794258126;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=XUsyqx7ECPHW4CQONcrbGlANSZUF1R9oFqc+hq23tPs=;
	b=OAdd96u4h5uGdgZd3o95cTycIdL92WFnakzlPg743FdlTyX9OuaJNMdYRTx1ywGYI1dQ
	 jKwV0y4VGTCujFu3bOkvu3NHqRg64Qo6OnY8uFE1eVRKhkOs3J1f7nrL/FBSV3+gs/83P
	 3rzX2vCHAeO9HVulWlqqR5vxQBUz6q8mnBhzQy6R2q3KjGfkhvxCowNs4/fvkdvaLhSvB
	 bzXuOY6hgF1zxoAS3XEPJhIaVcczQze/MbuzpSj0aHoG5jst4h54WEZo0OvnCTUfGU0U/
	 QzTHgDj3TqdVOQkvg8jMRAjCfm9vEszGldXvbhYe/ETly1w26HkXewqFoG0+qiGiWEQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 02E881F008A2;
	Mon,  9 Nov 2026 21:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794258126;
	bh=XUsyqx7ECPHW4CQONcrbGlANSZUF1R9oFqc+hq23tPs=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=GQSf27vLaqkigPKWESjDjl3lrLhMTaJy+2rI7l+qzM9xbWMphbiK3YmCO3uf7MjdF
	 r8BjMIOOsU5iXH4drHXcxLLRdu/0e2gJirIWSZndtG3pihgwfLqPjvX77DzzGrwNPj
	 cKEy3vj/z0tBlSfkJcmcCZaAN5RmW1HCutiFLmcKRy5ak1fQbh7xQaL3ZumWucxSdg
	 rbqyB3SfoZqPwm1IRBCTPSzSZn9pUn0C6tBofGEQs/KPRv1ybvIoY2/e7MwXS0GrKq
	 5iY1iFU2rFZUv77SdtyugsC0pcEcfnxvYfyFT+AU4yNjRcrEnepZyzn46HUfEWELFF
	 W574tHmBBfNgQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5278C48679;
	Mon,  9 Nov 2026 21:02:04 +0000 (UTC)
From: Umer Uddin via B4 Relay <devnull+umer.uddin.mentallysanemainliners.org@kernel.org>
Subject: [PATCH v2 0/2] Add support for Samsung Galaxy Tab A 10.1 (2019,
 4G)
Date: Mon, 09 Nov 2026 21:02:01 +0000
Message-Id: <20261109-gta3xllte-support-v2-0-85c31b6efebd@mentallysanemainliners.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6DIBQFf8WwLg0ooY9V/6NxgXBRGgTDRaMx/
 nvV7rucZM6clSAkB0iexUoSTA5dDDuUl4LoToUWqDM7k5KVknP2oG1W1ex9BorjMMSUqZXCWHG
 TptKS7LshgXXz2XzXP8ax+YDOR+gwOoc5puU8nfjh/etPnDJqNNOisereCPHqIWTl/YIqQK9c8
 C5AwmtMLam3bfsCD+HNL9UAAAA=
X-Change-ID: 20261109-gta3xllte-support-f64df476d3c6
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Umer Uddin <umer.uddin@mentallysanemainliners.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794258123; l=1578;
 i=umer.uddin@mentallysanemainliners.org; s=20261109;
 h=from:subject:message-id;
 bh=agqWjBLMvEse0eu1plUAKimZM+XtZzwOh/y90EL/9AY=;
 b=9onZelZpLaXYd6RnSVn5XhXY5jMFeZzxh9Kme4kcVPNeUPmqcwl1ca/2BCLee1Pj0m0HMWxtF
 VQFrfwzVOl0BhYFfR1zeC6zjgyBK5mimt26TUQifjzlvtY/cshDbcpd
X-Developer-Key: i=umer.uddin@mentallysanemainliners.org; a=ed25519;
 pk=Hsgrt4A72CFTe27AI1AAWlnLsiQrlb4+T+cbrfWDhUA=
X-Endpoint-Received: by B4 Relay for
 umer.uddin@mentallysanemainliners.org/20261109 with auth_id=1466
X-Original-From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: umer.uddin@mentallysanemainliners.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi guys,

This series adds support for Samsung Galaxy Tab A 10.1 (2019, 4G).

The device trees have been tested with dtbs_check W=1 and scripts/dtc/dt-check-style
with --mode strict flag and both results in no warnings.

This initial bringup consists of:
 * pinctrl
 * internal eMMC
 * gpio-keys
 * simple-framebuffer

This is enough to reach a shell in an initramfs. More platform support
will be added in the future.

The preferred way to boot kernel is by using a shim bootloader called
uniLoader [1], which works around some issues with the stock bootloader,
primarily the decon trigger control quirk, causing the framebuffer to not
refresh.

[1] https://github.com/ivoszbg/uniLoader

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
Changes in v2:
- Fixed dts oversights pointed out via Sashiko.
- Link to v1: https://patch.msgid.link/20261109-gta3xllte-support-v1-0-dc0c4bfa8b44@mentallysanemainliners.org

---
Umer Uddin (2):
      dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-T515 board
      arm64: exynos: Add initial support for Samsung Galaxy Tab A 10.1 (2019, 4G)

 .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 .../arm64/boot/dts/exynos/exynos7885-gta3xllte.dts | 129 +++++++++++++++++++++
 3 files changed, 131 insertions(+)
---
base-commit: c916d326360966fa41b1d9c3fb659215053387f5
change-id: 20261109-gta3xllte-support-f64df476d3c6

Best regards,
--  
Umer Uddin <umer.uddin@mentallysanemainliners.org>



