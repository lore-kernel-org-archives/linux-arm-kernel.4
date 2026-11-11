Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFE7606B034
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g2BrGvbi;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mzoSw5hT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=izp26nvx9wc5IViJF9WfgnBu+cgLDrOEH0/MefbUalk=; b=g2BrGvbiYyyRrL
	aB4ntKqwcIrXI8O0R3dIzgvEOgC/rE7W2MfTtdkAE3UF1hn6IQjcVbPZJQ2Cd8ez83mY5tOSaDl6K
	VjiWv0rJmHtxv4tHglOG3MM9WppSpo8v/oqifxIamNy/rcg1XxoxrjeZz/+FySjd7w9w1WjsdGl2q
	/cb8s+vYBcP+Tb5eGMMsINHVjYfubsAwK33ViW1yzd9VFFEytAdpgEgfLhi4nAKT2EWLKeWSSk0vN
	79JjwYjA/CMPu0v7nAZhE7kibNAA1fO93MeocUCqL2kzQwoL0fmq5zEgx3c5E2fDflrBFkmrGKjwp
	6YXjzSSTQ9vy5lltkZvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH2W-000000080PM-04wc;
	Wed, 11 Nov 2026 22:43:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH2J-000000080Im-49aN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:43:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5AA7C639D2;
	Wed, 11 Nov 2026 22:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0CED1F00A07;
	Wed, 11 Nov 2026 22:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794437003;
	bh=izp26nvx9wc5IViJF9WfgnBu+cgLDrOEH0/MefbUalk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mzoSw5hTl8QsWO7Bcd88PjwbDCRc9wctopgbdcNn/gMnEsDssHjNhk7pZkuuzLvJU
	 ngvWlaHZpzsCtOBORQnizo8jWT9h8EeMH3Bbqxvy44owz7iRaMzFoZE1st6MrVu87c
	 QXTt2Kd6EmKq2DPSy+4RHD6r89hQtNwJL5Yzzi+CTzBBiJlD5TNdMjd+YLU7W/5iVz
	 6UB0Odn7kR7AkUCxxblcYfk0/7uoj+Iia4u6ueXOLiyvXeMroUyk6Dz2+UdrtwmLjs
	 5amBmLnI3/cQ3t2cX8picgJ+2tvzACZBOc5Zzitt6VwM+xymUqC4hyYCoDbP788sK4
	 x9FlCVpEOzeyg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 16:43:03 -0600
Subject: [PATCH 6/9] arm64: dts: marvell: Fix w25q32 compatible strings
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-marvell-v1-6-938788aff3ae@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
In-Reply-To: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The w25q32 SPI NOR Flash is a Winbond, not ST, part and is missing the
"jedec,spi-nor" fallback.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 2 +-
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
index 101d1518e28f..0de09d126104 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
+++ b/arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts
@@ -590,7 +590,7 @@ &cp1_spi1 {
 	status = "okay";
 
 	flash@0 {
-		compatible = "st,w25q32";
+		compatible = "winbond,w25q32", "jedec,spi-nor";
 		spi-max-frequency = <50000000>;
 		reg = <0>;
 	};
diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
index 006293931c78..067951cd7449 100644
--- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
@@ -361,7 +361,7 @@ &cp1_spi1 {
 	status = "okay";
 
 	flash@0 {
-		compatible = "st,w25q32";
+		compatible = "winbond,w25q32", "jedec,spi-nor";
 		spi-max-frequency = <50000000>;
 		reg = <0>;
 	};

-- 
2.53.0


