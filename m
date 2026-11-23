Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5213C606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 08:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nl+HWTLk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ogRty5oH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=eWwZSVnTTdj+etI/fDq4YnbyDy94jcEEPt8yqACsXOY=; b=Nl+HWTLkomsDDzrBQxJe+Easps
	IsiaUjk0BOH7aSpvn6I7Ziu8+hx1u2eQfqO6DkvYUmz30ECQQ92Hz8aZB+mOB5cGh3v0JIas2Mz+X
	C6+SiuplHCCuzZ9mCYHwRMgs7jwi9HhRfnpq/sohCTaYTApWmJOi27iULMuZ88IFK1+5Zjs2riauC
	n8r4L3EGk1CFb8dYiaIAKyHmon3QYoz6InVQqRgqTUj2GgwqW5hA9FdI1ZVe5sykbSWO2V/sOXcFI
	H896ak9wyNsa6+dt/myqfpRO8tKq9GpTtMzQGPSeiD8wDT8hDmZidVkG2yOhYVeIYZNR+j8BnoTNt
	t5KCSiDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPMI-00000002YrA-0fFo;
	Mon, 23 Nov 2026 08:25:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPMG-00000002Yqt-2Vjb;
	Mon, 23 Nov 2026 08:25:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AD51261865;
	Mon, 23 Nov 2026 08:25:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795422303;
	b=2BXkzopxQFLzqfYRGc+JAp3eepRK2A8PI3yfFNIyE5blOOaJMF4FSSaDDDNGFBe47H/M
	 uhfE7IsD66Ro9LemuVBpWvbzuy0LngrhuUklbnfl1enkh++hQamTyQkWis8RE2KcEAbbv
	 y2n/hPbgUAzs4t18EsS2FvkrkxTG8ljp2QtFZBDZ2/0DXEQwSNSSjiQBT50nRrEXEIvFC
	 JoO26Qu4eKf5FYFGyvfL9byF4Ye/dlTUHtRfD3HrBgnhATwsnQ7ukimJ64if21dtdSfcy
	 YgshyUJZbMCRJluCMk9N0SMz7yKgfjCreRi9DklVYSRjffI4LT1onov5pYeMjIG1KaA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795422303;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=eWwZSVnTTdj+etI/fDq4YnbyDy94jcEEPt8yqACsXOY=;
	b=t1jlKfDqA3FxGNEnGepQ5lFK7+USshMX2+szWT64/q9PFywRhre9jBLHN4bxdACnMwbl
	 BZoMuGMmUzQ2AtRqJrEc6NIN3nXv1UXQShkQMiA3BO6smb/8qP+dsuAggKmwqqbjebfNC
	 PDa2m0e79fXMcSUZGv7tf7Yd+f3kRl7jX/YYTOxok4z15q9ixBGx8FKEbCd6m80BYE1+I
	 uJvy/HQWPCCjlqQI8jVhopLkdCjeyulSSbfA/m8pZlfemm2ZLLU305aI2HMtNz6ng+r8Z
	 1qLmJFZaN9fKITJ6PeCGDR6R6CRaulsJX85tK14gY121MKN6x7ZhOoyXnXbF2a+qEiA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 17ACB1F000C6;
	Mon, 23 Nov 2026 08:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795422303;
	bh=eWwZSVnTTdj+etI/fDq4YnbyDy94jcEEPt8yqACsXOY=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=ogRty5oHHmLAONxMDMouuQ2HjewcC3aF6deTwPDZ6LdkITKQWRs64oeovH/M1TxqX
	 bRVQsv+xEeSLgyeOAZJB9++tEpg3eae7Qw7yePc+E7uBaGk1aCjNZ5T1h3YMv/IA28
	 EXNGDFcInSw+90Qqwh8sxelAoYb5ZATb2qLwHLtisry4GEoVCEp6AEyi2sDv60xguu
	 cZ5UCdWiUZQ5gQkPlnlhCZjYiT/2m8fcmNm2AvXKGEA0Qe8GIfjgO73IujdQQvQpxN
	 vNmVCjlVfWZaHuhWHWhg3rMgirmc7ScQhBqqBDgdf9k7AekE0K+sHg0BK8lf5tAR4y
	 RwC9+G8xQQA/w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6A7984C3CF;
	Mon, 23 Nov 2026 08:24:54 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 23 Nov 2026 08:24:53 +0000
Subject: [PATCH RESEND] arm64: dts: amlogic: a4: fix pinctrl node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-fix-a4-pinctl-node-v1-1-c92b931a1766@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795422293; l=1293;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=F6Np6Gg5OfDL8SOtdbBhRnTvyEqILZTAt6VZ6iphZjU=;
 b=2dxV+0wsY1Ywhc+kDyD+eZvF3rsgbZstTiIl1B/WVrx9YK6YakfBPZQrpFk5WF0T3+IeHAgt1
 9IA6xRRM3OjDcCrYZYMLqMJTZzDCqnCVhf9KFj6lSByienpTJswTQpr
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Fix incorrect pinctrl device reference when adding GPIO to pinctrl device.

Fixes: e9bb91734871 ("arm64: dts: amlogic: a4: add pinctrl node")
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Fix A4 pinctrl node.
---
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
index fce45933fa28..6587e3578f8d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
@@ -218,7 +218,7 @@ gpioao: gpio@4 {
 			reg-names = "gpio", "mux";
 			gpio-controller;
 			#gpio-cells = <2>;
-			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
+			gpio-ranges = <&ao_pinctrl 0 (AMLOGIC_GPIO_AO<<8) 7>;
 		};
 
 		test_n: gpio@44 {
@@ -226,7 +226,7 @@ test_n: gpio@44 {
 			reg-names = "gpio";
 			gpio-controller;
 			#gpio-cells = <2>;
-			gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
+			gpio-ranges = <&ao_pinctrl 0 (AMLOGIC_GPIO_TEST_N<<8) 1>;
 		};
 	};
 

---
base-commit: e3194dfb772304a1b7ca3bcfccacefec3468b7bf
change-id: 20260128-fix-a4-pinctl-node-6d7f9c29b32a

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



