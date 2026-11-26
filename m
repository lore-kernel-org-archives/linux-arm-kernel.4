Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA167606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 00:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ysNow9YF;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=omMnXaoo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=97qLk5qZEben3Ei0lHE03MZiWrEcGrpcpEHOGYx2x1I=; b=ysNow9YF7AQIEG
	uYWs8ZSZdonyHEqUi62eXCx7b2xtEYfIdUgIVZ9agcaSGGWQD+i6+EaVpL1Moq2TnlPqZdmlbvi64
	abR1EIabNBppN3dcDufn/FY6O/NK1zA28eTQfkhGiGyKN+bqGih8DigJrQVYUtjCrvJP2eP3hkx7f
	bYpkM2s377q3ap5TdMSygOHLJWDwYoGwfYeFhtQCZcsrMO8nQma+ybCzaYFwVLtay1Fj+pbfLUyi1
	RjPsQaaFLtLMK47bUJ/4mIZm3D9i6+3h020GU01her74SCxXuX8ojz2oQEv2rqu/UQ/+sSVKOm8gx
	n+zSYKw7+514/Ib1Ekag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNV4-0000000BftT-0aFC;
	Thu, 26 Nov 2026 00:38:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNUX-0000000BfcV-1aoG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 00:37:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 280D744E7E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 00:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC021F000C0;
	Thu, 26 Nov 2026 00:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795653456;
	bh=97qLk5qZEben3Ei0lHE03MZiWrEcGrpcpEHOGYx2x1I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=omMnXaooTyt7Fd4c4+SmIHqi4dqsf7FD9hdwQfwYfnbz0vuqJ0wm9SvOzL8ctwpft
	 qy+xYX9EeCruKhc5wOvUG1/ktUh/nDrz6ow6jqwD7uu8KvOMlsqQPLhK3CVFqwlbv1
	 NwD/RNt8SMly6WeJw3X6w4ATEpmoCVayWiOsNAwUC1o6y4iyC4sd2KWS5I68r6CGBr
	 MGPrY4QrpL9QIEdD+TX9Ju91XBD4fX0n8dpGRO9huS6pfNrWDcWWwPO3UY39pjXbE/
	 53rW2hwlq+F6bQmwDBaAKMiNAyKG2aNJUTopF02mWqAXkFK2I0czqTyhEWL3darfL3
	 ADD/PU/DShWAA==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 01:37:17 +0100
Subject: [PATCH 13/20] ARM: dts: ux500: Correct the STMPE interrupt pin
 property
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-ux500-dts-after-powerdomains-v1-13-791cd62d8870@kernel.org>
References: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
In-Reply-To: <20261126-ux500-dts-after-powerdomains-v1-0-791cd62d8870@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
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

Nomadik pin configuration groups use pins, not ste,pins. Correct
the STUIB STMPE IRQ configuration so its pull-up is applied. Found
while validating with the converted pin controller schema.

Fixes: 07523a6cb6f8 ("ARM: dts: ux500: set pull-up on STUIB STMPE IRQ line")
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/st/ste-href-stuib.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/st/ste-href-stuib.dtsi b/arch/arm/boot/dts/st/ste-href-stuib.dtsi
index 1f0f4ed74fd2..e2bd0418bb7a 100644
--- a/arch/arm/boot/dts/st/ste-href-stuib.dtsi
+++ b/arch/arm/boot/dts/st/ste-href-stuib.dtsi
@@ -128,7 +128,7 @@ pinctrl {
 			stmpe {
 				stmpe_stuib_mode: stmpe_stuib {
 					stuib_cfg {
-						ste,pins = "GPIO218_AH11";
+						pins = "GPIO218_AH11";
 						ste,config = <&gpio_in_pu>;
 					};
 				};

-- 
2.56.1


