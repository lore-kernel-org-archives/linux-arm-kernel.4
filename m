Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142BC606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oLN9FLO3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Jm3KiFsK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=wBKIZBbnaGGwTlRnxL0v3Y+Cuzyi1jR+j3R4Vk9G0P0=; b=oLN9FLO3FnRl0l
	QKg032M5lTRLXDQaKqpBOFaF+aij1gUZZs6ZvGgf9LGKzwUb9pmLMNviaQzsHdrFtdOFBSCQS4A4q
	O8ccqo8b5qwasVDNbeE8AiHbKTZf+oiU8AMGN/hev1qrJH2+RZaLLr8EMKas5QoYfhT/FZ/l3c8aq
	+XOEG3okm4uKoHBZYV10c8cfw8Ol13ekB2JBUBnd6FCbrphYnvhAIG5KYxGnnkktPP4Iw8GtOTA9y
	FSqTcMCV+gF9TTBS9dDgeKy3WDgSe5ymnDw2SQFE5vwDSPrQU5wB8I40qkvMSpr2evWLN7cDZCEeP
	Z/3mrrIwsYL7ZArv+p3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzox-00000003IN5-0U0f;
	Mon, 16 Nov 2026 16:44:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzol-00000003IG3-3TjI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:44:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2AF2C42AB2;
	Mon, 16 Nov 2026 16:44:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794847471;
	b=EM1rCWltmvEunEx3qgo/VsztbzM5JD3jTFiYZl9mD707Z78uqv5mHHRDo5RelTp/diDE
	 Ij/Xp6P7gYhTo5sb0tkBo+MvtXOPHIPNBu3qyZRXjv4UYNThJ9zSQvyZGODBKRgQxkE8d
	 JUwkHbkYvjbmPfVbF8ePTS9WvibaSyM/2Nov9PQX12kPvrr1djIOZPqBa6NvqVQC1NLSI
	 D4m4iLsrdJpelZ5xE+0i2+SlR0vo+CRc9HL9PqDOnH2MCvFv+3PFpZ8PYnJu2nfFriNNB
	 QdDYuSevVxuEatqdDL7hGn6MRjaJ++gkYYV0ClSfl1oITSyGA5EP3qEYtjFVsbaykgg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794847471;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=wBKIZBbnaGGwTlRnxL0v3Y+Cuzyi1jR+j3R4Vk9G0P0=;
	b=0gwSlzPu8Rc9D3Geb3Nk2UHBiPzvFXyGeD2HtGN7BGJjLQTHlYTlF5iRYS1IUctODSbg
	 GeRfsd0CbdQ2EMNyH9oYGwAQQNTyG/ueKsLrKbuOqprQ4Kr1gkFvOnJUv0cMaue6AjN1Q
	 iuCjUnvM3DH1sGQiClmcAWQdB548Hs/Mtug3o8hyF91UrcWp2/1xgr6hIArbtN5oRrw73
	 R22YFTFO9yYIYEjIxB5lPNTZYbwLl3mrWBEF8O0u0fmr98wAH6F5SSt5/0MoBP0GGH8uP
	 RkK0XlPESGLgKpnVBj0nMBMTiyKKF94FqOyQCGAuWT+U52l8NwBmNmi5iTaZ5uD68OA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 859A01F000CC;
	Mon, 16 Nov 2026 16:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794847471;
	bh=wBKIZBbnaGGwTlRnxL0v3Y+Cuzyi1jR+j3R4Vk9G0P0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Jm3KiFsK+hTpa8nKUnc5uKeHsyMuhmXMgHH45mCKUHToCAwFSzXULpSywJlZoGIYl
	 t7gNaQR/ZYjoEpmOGz8+Kwavw6mQMNzfDWC4c2yHeQku2cdO0ZrQfsqGGUX1yrKJDW
	 TMoCSU2P4pb2Ci0KiZPrSfPel38s9EJ/73XgRc0HP8j4IzEUy3k6Op0IiDPNKqzPrT
	 XScoQ1A7ybRSEy8QB2LO2xIX8wW2LaXCBXSQzV1iUc8ccq/waFjkvrONtv+RjypLL6
	 PClGHPfOT8FlzNeY55CpeowrG43j4zI60kClT1kMFOOtmt9273tYwZbuGwF9f32PiV
	 aWk5Fsigla/vw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 006B74A52E;
	Mon, 16 Nov 2026 16:44:30 +0000 (UTC)
From: Cristian Filipescu via B4 Relay <devnull+filipescu.cristian.gmail.com@kernel.org>
Date: Mon, 16 Nov 2026 16:44:30 +0000
Subject: [PATCH v5 1/2] dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-sunxi-orangepi-3-lts-v5-1-979cf5474913@gmail.com>
References: <20261116-sunxi-orangepi-3-lts-v5-0-979cf5474913@gmail.com>
In-Reply-To: <20261116-sunxi-orangepi-3-lts-v5-0-979cf5474913@gmail.com>
To: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, linux-kernel@vger.kernel.org, 
 Cristian Filipescu <filipescu.cristian@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794847469; l=1216;
 i=filipescu.cristian@gmail.com; s=uboot-20261021;
 h=from:subject:message-id;
 bh=+XDJz0LTRdXtzmy7z9nWAVOh6GK17d30rwYrEMm9hTc=;
 b=NhWGVV7Ok00haVrOTt7TgyJyAxsu3JZz1yDburMsDo6A07XFmZaUlkhd0V09IaEhsCHcLDukd
 70gJ0gSIeq7By9QJPNbEuzvAEdjfNaOadE+4VxK0WigvRcr9WYct98R
X-Developer-Key: i=filipescu.cristian@gmail.com; a=ed25519;
 pk=o7Ui0tU3x+X/6Pq6PZHmd2KFtOdPWttoPuNFOvdD8t0=
X-Endpoint-Received: by B4 Relay for
 filipescu.cristian@gmail.com/uboot-20261021 with auth_id=1255
X-Original-From: Cristian Filipescu <filipescu.cristian@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: filipescu.cristian@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jernej Skrabec <jernej.skrabec@gmail.com>

The Orange Pi 3 LTS is similar to the Orange Pi 3, with different
Ethernet and wireless hardware. It includes 2 GiB RAM and 8 GiB eMMC.

Add its board compatible to the Allwinner platform binding.

Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-2-jernej.skrabec@gmail.com/
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Cristian Filipescu <filipescu.cristian@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 28437c47a..7da84e2de 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -1018,6 +1018,11 @@ properties:
           - const: xunlong,orangepi-3
           - const: allwinner,sun50i-h6
 
+      - description: Xunlong OrangePi 3 LTS
+        items:
+          - const: xunlong,orangepi-3-lts
+          - const: allwinner,sun50i-h6
+
       - description: Xunlong OrangePi 4A
         items:
           - const: xunlong,orangepi-4a

-- 
2.47.3



