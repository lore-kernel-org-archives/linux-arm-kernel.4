Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6CC606A8AD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MVWvKqj4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AebHUpoo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ovNdFvN4j5VHctDx3kFirGTCyVStcoGTaw81WNU+GIg=; b=MVWvKqj4shKdvS+WaS3Gd8OQM9
	apbQqI/X9mVFIDHlADRtqpHjYMY1OMy/XLdj2Q3c50k4340veyOFPEDY8XCxAmu8Sjy7qDeOjTsSz
	epiQMTK/XrDzzUDwkBVVChGSybPwFnjMHRcV3UhCxatNh/Xz4X/VnYlXgy1cAZE1BoJOXbVxQLSSb
	DTRJBNml43zV/hz5t4b+9+NtNuwSgaJZOfH/KEb+5WuRw8XKeEVFBrcyb10FJip2F9NqxbM8ZqHeX
	YXquga2BheYQth12Dy6hMV3jRYRvvPrClXZjv6aPLC5PKObeFs7w5TS0iVJmi3ZvCpw96VA8qlDKy
	aaonvCxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuIu-0000000DZN7-2eWD;
	Fri, 13 Nov 2026 16:39:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuIe-0000000DZAS-0H9k;
	Fri, 13 Nov 2026 16:38:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CA34743CC4;
	Fri, 13 Nov 2026 16:38:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794587931;
	b=0RqqBh9FdbZHQbwk5q3Ko02PBehpVj4erQw+z9su5R41j+FMYWiPPDBWK+w+JtPPLl5q
	 CgITaI0TIzLl3xhoY3+sMsLnB6HABXrxnS735k3VC8j/uhoZEPfXdXe0ZIjFPocqF9XP5
	 dHsT1RAduosqkZdAq2M8qLktQZOV8Iqlp0JMQqOByRaQZ7T20JV5EiJf4GrkBE2xCRB/Y
	 KvTXtMpl90U1Um5q+S4lR/jTJhbJofHXKsQs/8nP2M01yYiaZfPasImIyEGkFY7g3zG7/
	 SqlCeUfxEAnOQwrvnAs3gaYDOJaJBAzTeVTqd9pVziDvhOofn5jDlq1gLfa9xygB5nw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794587931;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ovNdFvN4j5VHctDx3kFirGTCyVStcoGTaw81WNU+GIg=;
	b=pIMZ450Q8G3PA2z1NcI4tVLXUgasoODFRlIb1Us493aFdfH80A2i9azg1mcxOU9K7e8o
	 CAGJs1pdiSi0Mv9bXUlGmufiCJD/G/frVEX4T513AVz+2vBLPCYmloaJJNU32H/LqLtxZ
	 2Ct4+FjnvS/nU3oZR9N1lq+1t1PEAFhJZVYnm/83jE/BM3SpolQ7JAhhYCCtYpNwpH1Fu
	 k14R6LrZiOU2Y7OYA1J/H1dUlE+TKW9QY2RqiajJDBBBMif4VXfvATIGhAFjFngZYHbfb
	 3x5Hses3u1xs15ObB1ePAI3U8IRqbmLdkqfSj5VYNsPi2KSpYRBU+bfWL+UZGYRRr7w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E8031F000CE;
	Fri, 13 Nov 2026 16:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794587931;
	bh=ovNdFvN4j5VHctDx3kFirGTCyVStcoGTaw81WNU+GIg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AebHUpoooTPyzyHgqOlj0RVrQyeurOXkECAd4cT0KthQPRs/F7OR+bUZJJdugAI58
	 NflURMv+7gnWf7pU9BfjijmEy/TySlFEoThxZeK9SUB2I+T+DN0vPt0GNzRaF9WpLM
	 2UOYGrreQsYsrstGDY3pOipoCTmt16qneA7TY9GewfUq59c+YidtgOEZ22M0r2DSgF
	 gXKOmyJQkpdidaJn8yhGzIRMFRubJ80HHpUU6L+rkoCj1HiZgCiR9jO4VgnMuw3HaI
	 S8cUl0YURvZDtJMUGGKXAWyziVSyMXmSvFugSCVT70a1iZgUxANxzGywr0I9peb57u
	 nlpZCH7qe1EbA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EACE2499AA;
	Fri, 13 Nov 2026 16:38:48 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 16:38:53 +0000
Subject: [PATCH 7/9] arm64: dts: rockchip: Add the clock and reset of the
 RK3588 PHP SMMU
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-mmu600-php-v1-7-231196049a3b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794587927; l=879;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=xABvrdkxSQnkm1+qfE0iALRBlyW42bCwAyaR90qxPhg=;
 b=xE5R4KcJTdTxZjvybb4lSfLzdvrVQIfHptR+aNxsE46yMNImwKhfOcGx3b+mmYtyw2cwWdFjG
 zQ5Cmhor3HVAPuiOA1+su84pTXGffMRbobChWmNaS3cbBZ6ZE0rcxbx
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

Describe ACLK_MMU_PHP, so the SMMU keeps its clock while its masters
are idle, and SRST_A_MMU_PHP, as for the PCIe SMMU.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 8807ce6193bf..3bf8d0e4ff33 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -570,6 +570,8 @@ mmu600_php: iommu@fcb00000 {
 			     <GIC_SPI 386 IRQ_TYPE_EDGE_RISING 0>,
 			     <GIC_SPI 379 IRQ_TYPE_EDGE_RISING 0>;
 		interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
+		clocks = <&cru ACLK_MMU_PHP>;
+		resets = <&cru SRST_A_MMU_PHP>;
 		#iommu-cells = <1>;
 		status = "disabled";
 	};

-- 
2.55.0



