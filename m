Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99D1606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AnqEdqvJ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lNU3gMqO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CuMg05a98HcJAkKkDl2QaTqHQIdMFGxRksNhla9SB8E=; b=AnqEdqvJdqu3pM
	QjjPEOk04A+/MBZsoZowPesbtC0ALmQOBf5UCOhudeBJazjVUEbLdQi9mwqd0GzqMCo6LM8mAKzcF
	aXME7/eqCanZNYZf7mdmgSdCkp9Z0th8H2/F6wDscG3yE+bTOXFFTkueSWJrQ5APmhFkH7GF1z4b7
	xNF3yttZU2Bo75zq0rs7hQFlYYRkrXy2USToVznG1klI/OrZLU/c+on6TRK4HXI6/ISSFdiHE/Wgr
	QTL0fXT2XTFH2KTTj95gUuHdrOIxHobf/yYtkb26jQCEpOfUfaub3rUrojA6nBEySMJDL4AWu0qmW
	zESjOOT1XcFKNYioeoqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxQX-00000007lcJ-3hWv;
	Tue, 24 Nov 2026 20:47:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxQT-00000007lYf-0BFU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:47:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CA8FE40313;
	Tue, 24 Nov 2026 20:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6811F00A3C;
	Tue, 24 Nov 2026 20:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795553260;
	bh=CuMg05a98HcJAkKkDl2QaTqHQIdMFGxRksNhla9SB8E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lNU3gMqObQuk8TM7A8W9Rc8yaIsKKJ+Z0Y/yfFvghzBJOAZRaOUh8uHwPJ9r3XLg6
	 rr1PFpcnWihTp1M7xLILD2BYHW15tw4u7wUdN5WrZlhhvb9YgOwpIdA/s3PH2LWMk9
	 IDR3b1EgM9POYUf090Z15syvEzGfzdJ2eZS5Vju5lSXc9sE8QPZOXMAF5efr114mO7
	 WsrxkBf88BImcfdDfsEr/XsiIy+KA8KS32LZDAhjYxnD7Z25HKdchcTgPovribQ5Cn
	 wYNOiyrDqfxVw3Ln5boLERtUU8P8j447gBr1fHo3Dbnewv0+XLubMTgYrIiIbxiuuQ
	 JjaMJGv+gwyXg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Tue, 24 Nov 2026 14:46:38 -0600
Subject: [PATCH v2 5/9] arm64: dts: marvell: Fix w25q32 compatible strings
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-dtbs-marvell-v2-5-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
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
index f9695b25da79..ee3cb89ead0b 100644
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
index f2d278d171eb..1c36763178a9 100644
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


