Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2643C606A8BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KwgMvowu;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VOCsxfYX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FKWK2tfwOubwz0NYfMnsGtzNrT9KfhXRngDWEiE1I+k=; b=KwgMvowuEow/L7/9UczFZNlxs1
	RdruwLWHyYwYgLeK34mUvatz2ZMAWPk26ZbpSTpYflQQVTTG4GUj6NsPsFEZNedAysJdULwKVSZ/Q
	Z1Ab/UnoolQsxclC0o8zTPtVZlvRs6SVZPhIfJqHAbRx1qDeYYKZICtwn853tBHTP0vMUziA+jRBD
	FP+Bd43BRK0ce5tUHC5bRE7EmmhlBpE2yrsONemqc1OezwX+dopZLT0dbjpNgPUINYPPLvBNsbnHP
	v9kJSgxARCEHWLc8q75LgijBlO57la1OpLEHiIiX/TwETqQr4Aw4Ahkw8wxadG53nvdfEDlkzX+E6
	ybTZCNCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR17-00000009LQJ-2KX8;
	Thu, 12 Nov 2026 09:22:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRR0t-00000009LIL-26qF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 09:22:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BA5CC637D3;
	Thu, 12 Nov 2026 09:22:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794475354;
	b=cPqaL4dhdozxyZB3qvOC9h/wWg7JoQovAOCr2AVieIhV3L65mi0Lv2boibqG4hBjl0RS
	 ETuw6pT3m12+l5UNxaTN0PlsxkbTyWcztl2PFbLTrRoqZu+FUXg88VnMO9A7n5CQkQeQc
	 aaHqYzImcDaQL578LEN1iymPR3hB/CWRvez7hQ6V7AUNp85vGs1rp1Ahp1xrUEU+xyhoD
	 jtMlxR/yVtYn7mlBBlCsL++8fqLqda2y54WK+CaKLCG+I9WBZTN+ge5IpOhnoI+E/SLdc
	 S2QtZCvxZfTxUzjbn5Jl7a30RB0Vj2bvv8WhNtA5A7BbSM02A8zg87nhnxGVbXBQn6Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794475354;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FKWK2tfwOubwz0NYfMnsGtzNrT9KfhXRngDWEiE1I+k=;
	b=y/amPLXjNhSqjzuVCTDt6WlSlUUaO5dQWfPfMKjKDVfHWSp9IhMXZW8gA7i9kN22qawJ
	 RF1mWqKFeI1IC6TTq0fRATQZWrv9MBiFL+SJdTL6xILVnBXa6fIiA5wobUbKziFpV/dt0
	 qSC4TKFiOvBF0Moqv73WN6rcvkxGKkZ3jLOW6RVPt4fRZOZ4T5AFM8NQeDp/CpcbbNM2B
	 MFWH0BqfSjfoM+5B5BuGTLnyZIakVTlBELn0gAM5xmmU+qWjB0DUpnrxNx9HXTvL3sbIC
	 8mVyv1qw1Wxgo2Y3clN8YZTb1nAhWOJDi0kZ1DfzUxCT0hfKb2DDz1pF2P1vJm4muCQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B81AF1F00A05;
	Thu, 12 Nov 2026 09:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794475354;
	bh=FKWK2tfwOubwz0NYfMnsGtzNrT9KfhXRngDWEiE1I+k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VOCsxfYXZ9V9V4BgwYp92CooSN2ep1L/7nZtHNFeC3bBzVMr0/DtZ3jzaGqjh04Qn
	 TAfhoIDOudT47H2ytTtqhR671btFQ02zdUJBsNItIbReO9LR/SXj5jrP5v+ihWGRqC
	 nLyT322CU5QhcCWDivzyHss7ORsMt9afe1zxlOG4gQOovyaqckZQTnCBOlvL7fa7HX
	 zHjwiwUZ9grBF7LXyPXYiGLPjF8+63EfO6qm6LvGl81AISU3iIYp5snKduz6V2UXju
	 SszXxjSeaSBiyFPOe9D/fHvio9U5j6JuHfbkUGkYMm/VonWuD9XGF+A2HTbivufzRe
	 cWdqI2x7bwz8Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EE71F49444;
	Thu, 12 Nov 2026 09:22:31 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 09:22:37 +0000
Subject: [PATCH v3 7/7] arm64: dts: allwinner: orangepi-zero2: Describe the
 SPI NOR supply
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-h616-zero2-dt-v3-7-1cd2664230c8@gmail.com>
References: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com>
In-Reply-To: <20261112-h616-zero2-dt-v3-0-1cd2664230c8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794475350; l=1094;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=koI5LGgxBRvtt44PpABti87vN3ELbNOlU9mgjrDscGI=;
 b=bA8JUFUa3d6iI+xHYYsxVNtM7HtovRgLm6fMnexLvlvWB6RAVaZCH86+PEpzbGK0qVtBhrLTj
 HJSH8S9WM2rCVT3L2b3X1uZ+XDqyWMC18NABBNlthwVONcI+xmS43a0
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

The SPI NOR core requests a "vcc" supply for the flash. It is not
described for the Orange Pi Zero2, so the core falls back to a dummy
regulator and logs at boot:

  spi-nor spi0.0: supply vcc not found, using dummy regulator

Per the Orange Pi Zero2 v1.3 schematic, the 2 MiB SPI NOR flash on SPI0
(port PC) is powered from the 3.3 V VCC-IO rail generated by ALDO1,
which already supplies port PC here. Describe it.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index ca78d094c431..d5d39bac5915 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -148,3 +148,9 @@ &pio {
 	vcc-ph-supply = <&reg_aldo1>;
 	vcc-pi-supply = <&reg_aldo1>;
 };
+
+&spi0 {
+	flash@0 {
+		vcc-supply = <&reg_aldo1>;
+	};
+};

-- 
2.55.0



