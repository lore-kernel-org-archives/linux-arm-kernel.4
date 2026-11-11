Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A819606B032
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 22:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JVj2W+sc;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=We1CzFn3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qPjiFEL/KvMKPxsB3qj3BGsroSuozksKUttzqOJzzek=; b=JVj2W+scGfKSnm
	C9TPOfj92BN57+C7HqJO14NJhXY28jlccS5bsdqXoUkxyZAEXAIvwlGGYBL8+riW1cGAn75Vh8nsR
	tBjKh8Nos6vvTs8KvRkQWJNY0VSaykIdVq3ma+DHuzmMZASTlZq1o7nmeFikdSfZxRBacg0pw/QpK
	JsUQ3vV3irtaCRFy4ahrUDmpMURox938spVmnslRn1qQlw+btYPOQ3MSBYGGpEO/ReFUWr1p00e8y
	32Efm/k7Esf2J8FGQUWJNQEdTtJkiGxnlPtIpDmko8DQH84Sp17cukz0pxOrwJ5bo0OIG6f90L/aA
	IkjAIA8qf/25m4lBZkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH2V-000000080P4-3u5c;
	Wed, 11 Nov 2026 22:43:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRH2F-000000080Ft-31Pl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 22:43:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3128B612E0;
	Wed, 11 Nov 2026 22:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C88E1F00A05;
	Wed, 11 Nov 2026 22:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794436998;
	bh=qPjiFEL/KvMKPxsB3qj3BGsroSuozksKUttzqOJzzek=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=We1CzFn3BL1WrJhdH9qzHLb1osxrR7Ct1iNxIYzDWZ/5LIppsoV0zRmk9Vw6zvt5M
	 9B0wrQDl/VUlIX/E7EQlpHfc3yBPnzo2ndFSBRiHUuLe2nx1WMW7cS5n8FwXeVdVt2
	 hF0sxfNCb9T0f7a9DM5fYEFW5I2gVrVRJmWQabtcm2geLxrgs9Z4BJXDOvo+Gwx5J8
	 3v6E8q84gWWZzZJ06kf9JGpKiUqSNlDft1dZ3MQfhTlT3v0HZ7XlN6lsz0ExmSbtcm
	 JN851I8IIMXrXSMBMxvTv8MUD1Dirp2BsJrEcCzcVMKJjpPr91hf+tnZKCzc7Ai8ON
	 4k0uOIhfj5qpQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 16:43:01 -0600
Subject: [PATCH 4/9] arm64: dts: marvell: Drop SPI max frequency
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-marvell-v1-4-938788aff3ae@kernel.org>
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

Remove spi-max-frequency from the CP0 SPI controller node on the
CN9130 SolidRun SOM. The property belongs on SPI devices, and the
flash child already has its own maximum frequency. Plus, pretty
sure 1.8GHz is not a possible SPI bus frequency.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi b/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi
index f95202decfce..7200f72b934f 100644
--- a/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi
+++ b/arch/arm64/boot/dts/marvell/cn9130-sr-som.dtsi
@@ -106,8 +106,6 @@ &cp0_spi1 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&cp0_spi1_pins>;
-	/* max speed limited by a mux */
-	spi-max-frequency = <1800000000>;
 
 	flash@0 {
 		compatible = "jedec,spi-nor";

-- 
2.53.0


