Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CF4606A897
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yQvmpmDi;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TeVlXPLZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JZStwf7aG1NbM+HrgEyjyJ62lg+knGiytYOfDD7OyMo=; b=yQvmpmDixx1lAHCpWcHdoOR9hy
	QIS6fuCbFo/PON5H1SbAo1EnR2ghcjPUXuWCUyfFzX/RlubBRqb8uwykQed3cIfeenjSrAboD8iPA
	fCvW8+9g/RXcGL+sFTN8Y0Vr+Cw2ftv+/WEdGz3Jz/25uh6EpQgKm8jqh4tBa7E2AhccKt14eR/RD
	MM/R52YSy/On+oTQHBf6GFzajLvI2Lw91Pc3Tty1fQPN3w7QayjQK+kilAiequ2qerbiNfXflXgnj
	+VomFgFlZgn7v6nFun9KzauCvCDRwhIYlK2hQSEM7NLBsHG0527sp5MdQgLpenDxnTqlKwjX+Im9C
	Ow3VLhZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuIo-0000000DZGF-01rZ;
	Fri, 13 Nov 2026 16:39:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuIc-0000000DZ9h-3Zzj;
	Fri, 13 Nov 2026 16:38:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B68E260D3E;
	Fri, 13 Nov 2026 16:38:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794587929;
	b=tanR+BbgVToHeO9s9KF9j3cnQqBLg38aMiJXub/5Y6fps8/vr/WBOKwKDu3Lq8PCu3bz
	 dKukgsVyOyYgIpoXdFhq7IhnJDzPNpymb7eEn/FyOa+PmiESgOVlR5BptoTc3i8FOraeg
	 gz2sj6J7tXhe1AK171Uw7Ev3qC49HNLzJWZTv69G9PLMqAyk7j/IgmJqybm/k4ZHGNsLG
	 WFKy8cMEh7QqwLubjd2VN3d1reGStJmNDkODXT8OjncdHC1SZCLspE9/PWHE/JGurKskP
	 O2ahMdeWYOFXPTjF3717wpNzZNkIlHH9CUAxtACDSXwxEm8XtHL+4H+0wzSOQYNStNA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794587929;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=JZStwf7aG1NbM+HrgEyjyJ62lg+knGiytYOfDD7OyMo=;
	b=vH6x26k39ST6okgKU1Tn84TuA1bfpnw54dOoCurjA/pJeV47nM02RqEd9Nhc5KzKtyHt
	 ya9MpIAyV3MUXydeeNN6WHHdCg1bh/a/EcQu9W7HQZM1Hh+ZOdOVoyaobI64r9yAairww
	 eIq08UYS2lcf9Bs0U6ZcQ6R0wmCHCJCtbkbN1rDZjb1naVcP+8+Y6pMW6fIieWZs4kVKR
	 6vbTEb6idesWPHtRTzCBwhBiV8Cr8T7CQ3UqWcvxEOFcyRxWxcGz84459PwaS1xF/Cy9U
	 iyX7E7HBhDtKdBrObVG7jkDNkGpwmQ84G4otBEhWwNr9QASbH4jTf2kAJGbA+fWN0JA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D2BEB1F000C5;
	Fri, 13 Nov 2026 16:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794587929;
	bh=JZStwf7aG1NbM+HrgEyjyJ62lg+knGiytYOfDD7OyMo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TeVlXPLZGjke2P8Cg1gZz64jMIlrRgPn51XsWkZOC4v1rwIXARSEZtq+6AQ7d45Yx
	 EeRf8Srm9lYDsg2NS10NEXP4ZXSbGKExykmnvIveZ6q7DSXUr+1OINZz/hgLlWtMR1
	 93aDyRieHAHaB+yUP73bIZA1JqsYoOcWNOvYOAHAusZ2kM7EJ7hEOs4Vdn+FAIW0/Q
	 mmbIm4c1g5LPVizWEBujefyccMQIs1YV7aQYv8/3Dde2peRbL2yoLiHoW1OpwcZ8Ky
	 uSBxMa0TvQv2VwXDqIxchMqbt/yeNAX4FWoI9iRwmtKWn7adMDrfMmwyRTDVRga6+6
	 eMf54ouERlJPA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5E0294996B;
	Fri, 13 Nov 2026 16:38:48 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 16:38:47 +0000
Subject: [PATCH 1/9] dt-bindings: net: rockchip-dwmac: Allow iommus
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-mmu600-php-v1-1-231196049a3b@gmail.com>
References: <20261113-mmu600-php-v1-0-231196049a3b@gmail.com>
In-Reply-To: <20261113-mmu600-php-v1-0-231196049a3b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Serge Semin <fancer.lancer@gmail.com>, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org, 
 Pranjal Shrivastava <praan@google.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
 Shawn Lin <shawn.lin@rock-chips.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794587927; l=734;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=ioPYyqo2UgJ2ImvljVKX2vvvxEITz7+0OthqGBYY87E=;
 b=TA96yDOhwfB8bSu2g3uSq0VJeMWZ4VGI4GS22AkEHZlXTpubu6CU3Xq/uEqBfGYxrW7+Dh0xL
 Xqpelmu6JKPA8iGBmfb5Pao2lpIX4MnM3rKZ/0Hs6wU3xQ7pR0o0w29
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

The RK3588 GMACs are behind the PHP SMMU. Allow iommus.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index e8dda1961ab3..2a0cd56fb4fe 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -87,6 +87,9 @@ properties:
 
   dma-coherent: true
 
+  iommus:
+    maxItems: 1
+
   clock_in_out:
     description:
       For RGMII, it must be "input", means main clock(125MHz)

-- 
2.55.0



