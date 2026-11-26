Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010D4606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 02:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=30oJR+kt;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RP0Q6aoQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VtfSKv7AgKViVzaZbsWW1gLH4mEfcX2kGOpZgRDzjQM=; b=30oJR+ktijjBya
	4fFoOCfwS0Bq80nbA85Yq3+fJr5GIChr4ivC5meQQ+YPkxZC2xudWPEQ4Bp4VQRoXKgSks9jOvSEQ
	6cKYw2M/O9/kCEaBRRMglSQp1C0i40I5VnXpN2yDFTMTSFOoD87PiLyqnt1PGM113QJyMbR9VpTTT
	3YFlFUAO05Gc1yPKWXq2OB7MgVBqAS3zwvNmX/A6YGlHaZq8AZh1XnayMh6ntCjEG9ckyrO14rUY/
	aVJARMexlPFIRxkn3UTjaid7SJE/794lzWBJSdqITbS0hLoxRNqL2v5/q1GoH0/jsSR8h2pDtFqda
	FBpO6Z0zSPzRHqtpr75Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPOH-0000000BvEG-2SVs;
	Thu, 26 Nov 2026 02:39:17 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPO5-0000000Bv9D-0x3n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 02:39:06 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cde7e8abf9cso2347496a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660744; x=1796265544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VtfSKv7AgKViVzaZbsWW1gLH4mEfcX2kGOpZgRDzjQM=;
        b=RP0Q6aoQlMxYzgTFOBkHefAXYkYvLprIjdmo6dcXP8Kw2iyvHoLddDsbViaWTkKWml
         I3RzcFN1WnGdWnut/5O7qwUdxVJqD9C5K1OT4QYsbVWxGFb/5GxzgXQXSQjwqSbbeO+i
         hquCLvWwFdQrqBWwdoX7w9mgNIk36M0MkyYwHQjLt9zVFfqQtnnTEm4LNCzb8XQw2SiZ
         CHKd7Wm/e4tYcI6UgWVmtIhZ2gYGCx573AD+R8SdSes0zjXf/2KSQMdu9Vu/0XXo03/8
         Cp4w1CjBvLVKp2/SS6uI1Bjcj2Q9XELH2EvVdmnSAZBOWdhh1N+63cC/7J6xJWZa9ozH
         oQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660744; x=1796265544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VtfSKv7AgKViVzaZbsWW1gLH4mEfcX2kGOpZgRDzjQM=;
        b=NDKmqdTX5MSs4lfOq1bXdOz8kZJfXWC9saiFDDjnX+31LHf60ndMv0q3a2d3+xJDQS
         orjEe3+paULf3G4tvCe35x53dVIzODgWUIiNpcZdeRkfA4T+zfe+vwR7n3cXf2Zn0Ycy
         XiOqWB2uuhykC39J30ldB4bJYjOfuN6nQXU284NttD8BzhhncHR5Vw1LOTL0+dkgnYNj
         zi1uKL3hx/5DD/m49/7K7R+5+//6namMA2noCAmA7GAUPSZkugTH07LV0G/kFARwoFdP
         yDaLSTjeYJky7WHdAe+vZvO2s3OecOBAjuT6MhSny0EnHstCvZOlUlwXhVo310/BMrIY
         oUiA==
X-Forwarded-Encrypted: i=1; AL+hErGIMWj5qfY9bppRjqZkyMM3AOpskr7DllY0w+9NJANyewlm1tmhRgYBv9qslCqUmICDPuNUwUj7uYjlGBOvjT5U@lists.infradead.org
X-Gm-Message-State: APuU4Z+BtKzOMdnNqmHpKpAt1PKrrYv8rcNQqG+Yf6bjHMRjIoWIYlVP
	vkD+w5tH62T+O9AZ+PJ3+nl4n0OlLi0PmLCMOYxKKeDM4kbrcZ00Zht1
X-Gm-Gg: AZFdTZd+Mqz2ARlUJBvLLAEEZA03F+Jv2YiFk8hUWekfrjUzb5Bz18brpwVG068tS0G
	jDpfIwq720SYYKNLvFWcJlBwZ2gwb4B3fVDfmUYiA4wIoMFeSMFMmOz8g7c1qykicb3FAjiAIJ3
	4bIILtzVRjjjroarUQ2BfmifoIMjYg8DeSzbw/Ok+IRgePrbpaAMlBZGuG74iGSiJeaflh8w/7D
	4sbs8Wphzlux7ydH2qLOjOJeke1pVmVePIpSJaVZOhjulBR8K4VbPZhXI/JvJfG1RKdvLL495gi
	YI8Xdhb7zF6du9ICWYLKlFnqpuiuAppTeLLziWq9By6YNNBjStmeYKAjQc9agquCldGTu+LQWNT
	GDGx7upTa6T7+iJFC1pmjnXEItIWTOGnc8MYppP5CZRkmtprt+VU/J1JZDWibqJ86D8OvOKMbrt
	J++53tOz8U0aoDTX/91YvMhOzpxDkiek3cANFPczmLYrTzwUwaAZJhZ+PRGDC9GCJj3kOxFn6jP
	8TePdtaADX+7bCJwrROwSIoqZj+QXnXcMzQBCw4OavOno+flspesB8qzv8kLRDYlBOxaF8nq4f8
	ujKrYHEb6I23+YkwajZ2abuHV8wOQoVYSebEJLeSu322MPRjN/86UG6ClfXQcaAbXrWjg2t7emP
	j7knO2pp6Drec3i6KXQ4sTGqy3t3Ok9iyYO3Jw2ZpLP4pkuIUaYF7luU0Jl6giLFpbEWVhvIB+R
	UVnA==
X-Received: by 2002:a17:90b:4483:b0:3ac:bc3d:6fe8 with SMTP id 98e67ed59e1d1-3b41c92f8f9mr17662599a91.34.1795660744178;
        Wed, 25 Nov 2026 18:39:04 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm9909018a12.19.2026.11.25.18.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:39:03 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...)
Subject: [PATCH 4/7] ARM: dts: helios4: describe the fan tachometer inputs
Date: Wed, 25 Nov 2026 18:38:53 -0800
Message-ID: <20261126023856.767961-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126023856.767961-1-rosenp@gmail.com>
References: <20261126023856.767961-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_183905_524508_5E548468 
X-CRM114-Status: GOOD (  10.49  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Each 4-pin fan header has its SENSE line divided down and buffered by
an open-drain NLX2G07 (U5 for J10, U6 for J17), pulled up to 3V3 and
fed to an MPP: MPP43 for J10 and MPP48 for J17. The pinctrl groups of
both fans already mux these pins as GPIOs, but the pwm-fan nodes never
reference them, so fan speed cannot be read back.

Add the tachometer interrupts so pwm-fan exposes fanN_input. The
default of two pulses per revolution matches standard PC fans.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index b86b85e9d0ab..f8ac74d7935e 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -127,6 +127,7 @@ usb-led {
 	fan1: j10-pwm {
 		compatible = "pwm-fan";
 		pwms = <&gpio1 9 40000>;	/* Target freq:25 kHz */
+		interrupts-extended = <&gpio1 11 IRQ_TYPE_EDGE_FALLING>; /* MPP43 */
 		pinctrl-names = "default";
 		pinctrl-0 = <&helios_fan1_pins>;
 	};
@@ -134,6 +135,7 @@ fan1: j10-pwm {
 	fan2: j17-pwm {
 		compatible = "pwm-fan";
 		pwms = <&gpio1 23 40000>;	/* Target freq:25 kHz */
+		interrupts-extended = <&gpio1 16 IRQ_TYPE_EDGE_FALLING>; /* MPP48 */
 		pinctrl-names = "default";
 		pinctrl-0 = <&helios_fan2_pins>;
 	};
-- 
2.56.1


