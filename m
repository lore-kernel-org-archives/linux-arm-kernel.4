Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C416A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 06:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GFw5sDW/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JmYqCVbi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=htP2+aPrpKFt+HsykgI0WJWWWQvaF3s5InUokxPNh5Y=; b=GFw5sDW/GRUwLYYloRb9CsnST9
	8cwfV9L6guTASesUVClA3/UJQrLXizcG+wPTSjue7dj+tIpsTLh1hF6um0KZFrf6Z7vQPaC5pdnsJ
	+0jZv0xHAEPxnNMf78GaKZWv15dnVECKKkD6PaJ1FhdPBEWAcEg/a/lstHB80L5lkfSW32ZB6LTkb
	AC13HbhsHUVpQ6bIx+03Eynqv9Vj3V4pS5bP1f8yBjxo2bQm+8bhp1kWUMvu6L2JlobkzOaigobHB
	lmj7KHvnG3zSxjStcylupJpurHnXr/1JP/wooxsqnfUNYvDSfjWkVzzti3UiN8D8RbMscmxjfJEgo
	+5fiFAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1Ng-00000005guu-0inx;
	Wed, 11 Nov 2026 06:00:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1NW-00000005gqm-2bUx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 06:00:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F18647282;
	Wed, 11 Nov 2026 06:00:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794376814;
	b=lM9BZUnNJm0I78quSOO4kNoWh30hNGC3m4bm0OLw/NLf+1VAjjl00v0frfN/uNNJw1sa
	 iTiCVOfQ9uqmTQ9QimZa8SIoC5i8fsZtMwQu3E/cAwwT1R8sxApV1ZSlLngq4RhgBHtyV
	 56zVE9qx1Z6ycX0ORib8VGpO1RnJPNJQMHDly0rZs4p4jRuqM+miAkwDF90n4Tnky2YWf
	 Z3ej2j5zyEyGqm8nonvUvRf4YGgD9+mF1Lqf1ovGp4S65NAkh4mEk4x8GU6eBUDbTyyFa
	 013/2rTzDlrSsZVU/wsPq7UQyjo2GkCDt7ErXH4Sl6DLnNBo9K0ujiHpw6xECTv5aQA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794376814;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=htP2+aPrpKFt+HsykgI0WJWWWQvaF3s5InUokxPNh5Y=;
	b=T9wNHiO3IyfQCKizGl7Eee65vo894pbiuwaTEAzcecOX5oEVBUkZJEDURGudbC4vajAB
	 VXd22Psw1wyajdEBe9PhFw6vBF8vnOnMBpTesgKigb4K4on7WMTqKNTg36gMNcHLfiMxj
	 6W9p6sBYNTefeGNWSo19sPfAsXhVdYSF2uFtIDMjivghAR6RW7jeurYNWCLCmtENKZm4m
	 i9GdLRMmEY6ddW3xQPk7EDDL1YkCDOQh0RqxMYn9+lmJOMOumnNP1tzsBif0HhfPbCvlU
	 DLr1tT9HzBl32qc8GFpSQuZJ6bPgTZQ+r36xbql+4hGrfjPtu5PbXxNc5rr44ICx5cQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF6011F00ACD;
	Wed, 11 Nov 2026 06:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794376814;
	bh=htP2+aPrpKFt+HsykgI0WJWWWQvaF3s5InUokxPNh5Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=JmYqCVbiQdZol/lpjwrNKoEnPToOdufQ2sf/nZ1v5GAtQOxdGT9A51Mc3U1b4cReg
	 6iDrD/V6S3s22aHqyhzlBUMNe2rYnirj+fdssB0xy7jfJjMkhsRHE/jWLrpjKjbt5I
	 1huV1o+MkNrZXCejVfBacJkCIw8O88X7/2wUJ9Wm/La0MNsd1xsLWR4+Z5AFnLwr3w
	 +zArV5+rdbTiDnp1XS1zZ/aSDEHNVPv8H71A7Y8oUfqZxKZPYdCklPwHK27RTl/q3W
	 d5NUOLCYmzAS0jMUnZ+etVdD7o4WGy536OxNHsRsAH+v3y3h85lUFycSp1Q09UcDye
	 UvagQEGz6pcEg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 43BED48DF6;
	Wed, 11 Nov 2026 06:00:08 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 06:00:14 +0000
Subject: [PATCH v2 8/8] arm64: dts: allwinner: orangepi-zero2: Add i2c
 aliases
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-h616-zero2-dt-v2-8-88d8030fc975@gmail.com>
References: <20261111-h616-zero2-dt-v2-0-88d8030fc975@gmail.com>
In-Reply-To: <20261111-h616-zero2-dt-v2-0-88d8030fc975@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794376807; l=1421;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Iab2h5Ns40ufO6oTUc6or65fgVwB87DFnCvwebhE2a0=;
 b=MuO6b/d4vcn3cxElE63zppLAfL39s+IfQeufqI3/tff3t+6PLHMGd9ZdP71jf8sy1++Avko8U
 v01poRE8azNB6n9d7zpmfRT3ttBSeyWubuohvePTfbSzwzEPsoHQxnh
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

The I2C core numbers adapters after the "i2cN" aliases and hands out
dynamic numbers, in probe order, to adapters without one. The Orange Pi
Zero2 DT has no i2c aliases, so a TWI controller enabled by an overlay
for the header pins gets whatever number is free when it probes: TWI3
on header pins 3 and 5 does not show up as /dev/i2c-3, and the number
changes with the set of enabled buses. The vendor manual and the
vendor BSP name the buses after the controller.

Pin the numbering as the vendor BSP does: i2c0 to i2c4 are TWI0 to
TWI4, i2c5 is R_TWI. Disabled controllers get no adapter, so nothing
changes for buses that stay off.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
index d5d39bac5915..98fc83291dc8 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
@@ -12,6 +12,15 @@
 / {
 	model = "OrangePi Zero2";
 	compatible = "xunlong,orangepi-zero2", "allwinner,sun50i-h616";
+
+	aliases {
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c5 = &r_i2c;
+	};
 };
 
 &cpu0 {

-- 
2.55.0



