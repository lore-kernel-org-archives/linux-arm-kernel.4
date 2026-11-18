Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BF4606A338
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 10:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3TIwtpX4;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FLmSuKsn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xrAEk6/4WGNXDqt6SdPWcxivaPvWRQHVDKqiBuuVVeE=; b=3TIwtpX4Q6x+7ICubqpHlGQhF6
	XN3AVRd3C+avMPkA4wcYgR3cIQH8KLy6kG6y4CHFN/wMDB7i7sQai2RiXrI56E6XFOF/NEKdS6ytA
	hpyh/ildYFNaGriL6/W0iz2wpANfnm2lUKGzPx/IQ03gH1VtvFG57sdMR4+NPYCqfF30/fkV7vB+r
	L5LSsIQ/mBXjcecOqLoaJTg/L6gU/HpqHfGDf0wZLymJeOjQbkL2z6F0CWnqi3y7aNIgmUFcV/vjy
	Z8/xqaXo+arfXfSJm4B0q37w3oPioaqibRzRcHkDqCGEeoV70CITIEtnJUT2Ir2pBXPvksQ+qDXwb
	0vxaJwJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdHB-00000008d2I-2Flv;
	Wed, 18 Nov 2026 10:52:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdHA-00000008d0w-1Hwe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 10:52:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1510E4025D;
	Wed, 18 Nov 2026 10:52:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794999148;
	b=mg8UbZCYxgwekOA0F1e5ThM4Etrp+N/FjM4oMu5xIbuQkTUSgu50fpZH0iPIXvEpph+X
	 hDRXDn9ybpwKAziPKoHxstjQyhkYBfNpSDdU8+SDY/HcYViw4oIkEGG8iStDFNpGoi1tj
	 3uQLHCxJRCfdDGZicCU4Wisn1xV6monq5jBZFzf6nL1TbvZpZbOwn+QO8NrOoRmD/pMD9
	 uOxdLmsFxXzyH+pUVQ+9A0k9Ze0fUsI0RxvlduvcgGFW+aQ72HYWAJ/L5hNu3aGySyWER
	 Eq8YPbBv6QEqQm0BRGvROISrMccMc9+EAE+8rNG9YfkQKnojpI3hc2rUXd/1QbS98zg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794999148;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xrAEk6/4WGNXDqt6SdPWcxivaPvWRQHVDKqiBuuVVeE=;
	b=rW8aq4KbrhhZDyd3vQmXjVbsbZ+o7LDKu/3qcHNY342OuQSZa0HczBZPRSGSrFlsroTS
	 aLTEOw85Xl/p6zL/b3jHYdg7RP8XdU1GR57WsSEKApHxSScpTypkMgTcrqW1VyNl/1JYd
	 /ZFaSz5rlYnRtYNSujtcI0JC4QEGfUQWDtXDkAhiEsSQx4etxK6AnN3b9R5sWXjF5F1SC
	 /KQcKzb3Xtaao55kDkmbFXb61ajamNteNFxCGqJvWepRITwYk9SsWzDXjpsaQi7iMRcGu
	 GpVvI4+j0mAZZm0/cdqw3tpufRGgCztPmYK/kqeowCquEodHfi8g9MpfCSFNpisnhuQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2736E1F000C8;
	Wed, 18 Nov 2026 10:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794999147;
	bh=xrAEk6/4WGNXDqt6SdPWcxivaPvWRQHVDKqiBuuVVeE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FLmSuKsn0a8nrabKv3rbcj8Q7aPeYDxgKLK4EBmfDubuBX3Ym6U5yevh55ttN4/49
	 WO4rLPEprjk7HPS1Dga5CaaIk8Ag7E0SQHyB4e2XSy/GBRtuyVI6jKHhORQbsMvhJ4
	 QSuXzEksAZ8rGlwlgZjCyoYZzuU9u3XEo9T5P+ArPukkedHfw1uEbW4pfpvq1J/Duj
	 qsawcGSbje4wxV2a47M9u66T3fvs+kumYQ1u0JmGUdgClnD8qavsdJORXWHvn3Wdlj
	 /6X3+Cmv5aJrFl0hCvRwhmkfJICZgBT3yUyAfZSckZ6KXhmemk5uy9ZZ5MF3Sil/Xa
	 4h96mY/HElIhw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A75664AD1C;
	Wed, 18 Nov 2026 10:52:25 +0000 (UTC)
From: Rajan Yadav via B4 Relay <devnull+rajanyadav0307.gmail.com@kernel.org>
Date: Wed, 18 Nov 2026 04:52:27 -0600
Subject: [PATCH v2 4/6] arm64: dts: allwinner: a100: Add A133 speed grade
 efuse cells
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261118-a133-series-v2-4-8bcec9c9aadf@gmail.com>
References: <20261118-a133-series-v2-0-8bcec9c9aadf@gmail.com>
In-Reply-To: <20261118-a133-series-v2-0-8bcec9c9aadf@gmail.com>
To: Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Alexander Sverdlin <alex@sverdlin.org>, 
 Cody Eksal <masterr3c0rd@epochal.quest>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Rajan Yadav <rajanyadav0307@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794999144; l=1665;
 i=rajanyadav0307@gmail.com; s=20261103; h=from:subject:message-id;
 bh=QDA+B3vGjPJfqlQByEbIUmG8/8wRVGARGoza4DrglDc=;
 b=hKLNDqmnQeDuJKQ7lx/vsNw7nGNI8PDmyb6Eo9Oy/s3ocVt9hvtNz/XziotlRlyPxC7g9ztRC
 F8W7C4Be9nyCsMkCNgx/hxLqbVshw8HalMmPmMOMJ7gBbd1MQThH8UG
X-Developer-Key: i=rajanyadav0307@gmail.com; a=ed25519;
 pk=4ZPeiP5qrv2b44q/Obxi2koUS70Q6npbttJnpUoTlgg=
X-Endpoint-Received: by B4 Relay for rajanyadav0307@gmail.com/20261103 with
 auth_id=1391
X-Original-From: Rajan Yadav <rajanyadav0307@gmail.com>
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
Reply-To: rajanyadav0307@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rajan Yadav <rajanyadav0307@gmail.com>

The A133 speed grade selection also needs the chip marking ID (SID
offset 0x00), the word at 0x20, whose low 12 bits the vendor BSP calls
PCPU, and the word at 0x28 with the bin extension bit. Add nvmem cells
for them at the offsets the BSP uses. The H616 reads the same kind of
marking ID at offset 0x00 as its speed grade.

The cells are used by the A133 OPP table added later in this series;
the A100 OPP table keeps using only the existing 0x1c cell.

Claude Code (Anthropic) drafted this change and its message from the
vendor BSP device tree; I reviewed it and checked it with dtbs_check.

Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>
Tested-by: Alexander Sverdlin <alex@sverdlin.org>
Signed-off-by: Rajan Yadav <rajanyadav0307@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
index ba6020989ce..d1164f3b549 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi
@@ -176,6 +176,10 @@ efuse@3006000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			chip_marking: chip-marking@0 {
+				reg = <0x0 0x2>;
+			};
+
 			ths_calibration: calib@14 {
 				reg = <0x14 8>;
 			};
@@ -183,6 +187,14 @@ ths_calibration: calib@14 {
 			cpu_speed_grade: cpu-speed-grade@1c {
 				reg = <0x1c 0x2>;
 			};
+
+			cpu_pcpu: cpu-pcpu@20 {
+				reg = <0x20 0x2>;
+			};
+
+			cpu_bin_ext: cpu-bin-ext@28 {
+				reg = <0x28 0x4>;
+			};
 		};
 
 		watchdog@30090a0 {

-- 
2.34.1



