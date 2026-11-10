Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDF3606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 05:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t02x2Gmo;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=auBiWIK/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FKWK2tfwOubwz0NYfMnsGtzNrT9KfhXRngDWEiE1I+k=; b=t02x2Gmouwm5UZ4CzEd5i87Gjl
	wvcHhRfUd4ocBOnYiEtSoZ4d/m89t2oQgCtZLzbgekB+N2ORZQUPEFl1jyOmkiQXvEpopAbRvVVj5
	66egk8zj13R49YTKaNM0VL4M0Y7W7omwSfhv1t2DYjh0LwbRUON6tZVjVj8CH66mSK1nzQKUm3sky
	+UHrQVW+VxQF66yBd2sbBsz2j2WXMdpcNemxlPgFT9jkLyq2ml95m89J5RchV0hqj0UKPBrpfmEhi
	R4gk3Ti8eTdVRbJr3EY63MEPGH+gV0mfp2k6aMa/JRNaQbdjjI5NO9BvesHyvm4xVnUpsfQTcKqPW
	fLPxc7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeXa-00000002Xjj-3XiT;
	Tue, 10 Nov 2026 05:37:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeXT-00000002XeL-3Uzj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 05:36:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E449468E6;
	Tue, 10 Nov 2026 05:36:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794289019;
	b=szjmGzYmkoQQ6+VT/BqSkZs3XC12I/Xcmgh7vH5RjAakeKZJfXe+pt47SVlvZegxFdD/
	 NyqQIxav3wgCGu0MioL+oR+djXfSOoHPrj/c1bH8V9jwygBT6Gw1YaAEbON27YmhSWrB+
	 jvPxSd9tHi0LDQgjgMcalddTudPw/cmNEt2jQawrK56akETVmc3TKB7/b0E/Y09eWQmAT
	 gilyWKLF1GVDMu8mRyQEWU4/vXInJcP5WVwpB3owbW5fiHIY8FYOSjIikMwTDLlUi5MzL
	 yqVvfND/KOh7c7mh0OrP7i4OrcapqU64WEeqiJYY7OWWkIY3qmiL0ES8qKmt4RNhtgA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794289019;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FKWK2tfwOubwz0NYfMnsGtzNrT9KfhXRngDWEiE1I+k=;
	b=kCvkiAU/AE1brdStBY096b5jJkpOV5BB1EU8LXRmXwsuqRQyAh2Dele+Y+QBfAGl2lf3
	 mGUQCbHRDbCNe9dJjt9XUztTZv2D1jGGY43r3RmZHULbR9yWEUDquKjKACiu76AvbFKPJ
	 RvvPvI/QMJhcTDksUkDFJ1P2fR6RYtzuFom/hi5LXcw4EO9z314Z9vdyalYQ/d5J72b3r
	 JuewlqiGS5v2zsaa39DUhHAGctRgDCAB/9q+Zwcrmyj3QMZpX86VwVo3LX8UJn7l96IZg
	 yRkwqcU5gPWj3IlPgBqQ4YLRsgJtFNMfjfcaY9i1PzzZbmSb26fSm+LaBzlVUsl7fmQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AE6481F0089F;
	Tue, 10 Nov 2026 05:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794289019;
	bh=FKWK2tfwOubwz0NYfMnsGtzNrT9KfhXRngDWEiE1I+k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=auBiWIK/Jn16hGySQivLe/h24YZibN7yRCeMySbCLrQe0dN8TW1JLP0amCqcuzBPn
	 ugw86n8fmV8o5nA+qMzyJIDqp1NaqGvdQCGezZsKFLP4fl9SG4gOmUQ6hsCgmEGcPl
	 cn7EW7922kg4x9BGcFLhx0F4ZDK158Qzg6aKENrAiTkRomctusd88ipTJH6cpwMvQ/
	 sdtKv7OyHjaMq2JTK1SgoPPD73wQGLh67j1PuS527aa3WtrhxPbmiqo5IKvSbxcLjm
	 t60ztHikMoWM0Oce3MjyT2OfMdVwUkOcgeji9ageDwp3nFbfO60/J28Q+abTSi5Fs7
	 /qBJgJMnyXK+w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 06CFE488B7;
	Tue, 10 Nov 2026 05:36:57 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 05:37:01 +0000
Subject: [PATCH 7/8] arm64: dts: allwinner: orangepi-zero2: Describe the
 SPI NOR supply
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-h616-zero2-dt-v1-7-05506d760f21@gmail.com>
References: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
In-Reply-To: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794289016; l=1094;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=koI5LGgxBRvtt44PpABti87vN3ELbNOlU9mgjrDscGI=;
 b=oEX/FmZHomOl+iCF0b554Eyi8+pe/+6f+ODCdqu2Zhe6vCVkvYvrYRcVVLfavogj4oiQNwsSZ
 W3LvZ2qsiTcBsQOI/ypPhTSrc/bhfWnmpOtEuumRepx40D3QY9EsSM4
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



