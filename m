Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2626A606EE86
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U/rBocxK;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=nl6dS3AY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Eo1ZaLZZrfd/YOlbBrEYtHL95TbpUNio/UU04zuP9t4=; b=U/rBocxKeIbDBQdHQFGfNjpfuV
	nx/kHQO+M8alCzHCSs/wESTpA4kDWD4QOHFAhCvubdYw21JIzw+Dj8fKQxn9PbWtW9oppnke16jcO
	oV393HswKzGpY4d2h/r32yOEJMRNCaEKyIU429oKpMMj4rST5impYDZvYau28+rc9KzC93z5qC5g6
	5qYhe+TTIX6t1LcVTBDkRnTpD2von/PlBkk7U3bTo4MCmchI7lRCfyY8ILoJS3HQr6Ao948u/ykkH
	vmZzMup3eoYYNLvY6/5cWwmKe3tUs1I1O00w1PAaHLJJu277ia2H0AkczVlSN3o1WtkhIocBRkuQK
	8W7mJpCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ53s-0000000GKDf-0Tii;
	Sun, 08 Nov 2026 15:44:04 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ53n-0000000GKB7-0Zwt;
	Sun, 08 Nov 2026 15:44:01 +0000
Received: by chaosmail.tech (Postfix) id 0C32A1C8E49;
	Sun, 08 Nov 2026 15:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1794152634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Eo1ZaLZZrfd/YOlbBrEYtHL95TbpUNio/UU04zuP9t4=;
	b=nl6dS3AYWV/kVOO5HGd7Dj5S0JlGe481c0Lj7hBqwgRj8RGTMR0ByIaCbWv2fNCtbpkgHW
	+So4qaocJFPMB3Gtr3UJBJxtPd7+tjmz6KJo7Paw+IpDnHVfAqJRnRya5AYj5BdoyKhsMI
	iXV2Vq+ibylYrU4s8Rt7HxMNZYkD5M8=
From: Sasha Finkelstein <k@chaosmail.tech>
Subject: [PATCH 0/4] phy: apple: atc: Add M3 support
Date: Sun, 08 Nov 2026 16:43:39 +0100
Message-Id: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQ5AMBBA0avIrDXplAiuIhY6BmOBtAgRd1csX
 /LzL/DshD2U0QWOd/EyTwEYR0BDM/WspA0Go02GqHO15miMWoZTWUqw0GSpoxRCvzju5PheVf3
 bb3ZkWt8B3PcDTMf27m0AAAA=
X-Change-ID: 20261108-t8122-phy-bc3190cbcfc4
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>, 
 Ramzi Abdiche <abdicheramzi@gmail.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794152633; l=1027;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=hj5BkU6UvfYLxZj+OaIPtriXpAtA2vo4TSElMSijvvY=;
 b=nQm+YUCRhVUPUAOxMfU4UtWOOrV/vO1wbquxn7QSjkoYHDo+taxeGoi8dy1tOQ5fH/1XSC1+I
 ECVeJaXMMOiDZzzOFYpPVO+GXHAKDfgY8eaooj2qmgy/8B1Mt18ttb1
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_074359_641817_28618A96 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The M3 series introduced a new Type-C phy. Add support for initializing
and configuring it. This is one of the puzzle pieces needed for
USB3/TB/DP support on those devices.

To simplify the merge strategy, the device tree entries will be sent
in a future patch series.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Ramzi Abdiche (1):
      phy: apple: atc: Add T8122 DisplayPort support

Sasha Finkelstein (3):
      dt-bindings: phy: atcphy: Add M3 series
      soc: apple: tunable: Allow passing NULL to tunable_apply
      phy: apple: atc: Add initial M3 series support

 .../devicetree/bindings/phy/apple,atcphy.yaml      |    6 +
 drivers/phy/apple/atc.c                            | 1021 ++++++++++++++++++--
 drivers/soc/apple/tunable.c                        |    2 +
 3 files changed, 924 insertions(+), 105 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-t8122-phy-bc3190cbcfc4

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


