Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592BE606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 16:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GOBmPwPQ;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=jAejy0p3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+dRaeVfgsyPtrbZOsuqy4B0zrN0QNLB0gPpKiOiCtw0=; b=GOBmPwPQgbJK1W
	497kB8WiCSHlZ6vtsPopkRTape1FM7FtIIVFiqAFycEf9J7IqS3abuHA5GFRkkaADUD0nWY7GERqd
	EbGbHJR6zMpbdt3+m04E6yP0RMm6dPsroGs4x6lWrMAdz077oeU8PmzNkTMu/IAY2quNqF3ve+Ozc
	Gwmv5jR195otd6F+nxHsGyGacDsL9LS6eNILHtTFNqCZdAkixbDRKXMn9kKMxjvNlwMiGbYhWyTCE
	Qq5v9AJtNLbd4CIE5tzyhsZNjFCVtN/tXZCoITo9w9P94zS7TsnnmbW9yhuwhHDTdIyRqfLu5SutP
	fV//F0iTxJjxKpwagqmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRB0H-000000079vv-0oN7;
	Wed, 11 Nov 2026 16:16:53 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRB07-000000079q0-1maM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 16:16:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so33007905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 08:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794413801; x=1795018601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dRaeVfgsyPtrbZOsuqy4B0zrN0QNLB0gPpKiOiCtw0=;
        b=jAejy0p3guaoV4QGwqXFT5mIZl+qKsSAZeAo1FdFaSjO91iBZz6wjLKDeg0S9ICYX0
         hkDPt3uf9NKIQdvVfxw9t6qOrJloikpEGoM0ykJradEkHK34N1gst4s6EbCGulZYIRJz
         zlRA5raawqhBUZiq67oAJAsAmNU7heOHIlJCmAIUYpzqT36J7kHcWL4OZFNqcMbgt7fq
         zFUp4wJopPxgdsBNSzmFLRkfJkXGT9f7Jp0LB+72ncuMmjkPQC4h/ZcigkqQOLHjUIKm
         75uVJrr0Tt3H0yjta8cK/rkCSmKrO6H8Lwkspht7u7ZwRJeL6UnMJjAPBMWfMLEDLPlV
         3P4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413801; x=1795018601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dRaeVfgsyPtrbZOsuqy4B0zrN0QNLB0gPpKiOiCtw0=;
        b=Pg7FlCohAIDlDAQuM+7oF8h5Ke/ZXsxU2t7su392SFao60OR/kr+SiYxBnFUhdN9xH
         6P8asWoOkffoEWk8VHlj1CoJWCDVPXjcdxgqupp/+4ngRfkg4jb8j6UulZkdYN81+Qkd
         mUu0UTkicpzBE50rQzp/9Ys0wdwov1sajxdVZ8oirBrNIexLz/mLNI6gCkhpjxl14+w1
         5GrPUQpBVUDEq+p2IkYDh4jVGwT6smcplE76ruazbMJsaYgftKfEWPddz/Bty/XdQAmI
         ns8pKIys4wDr7SlTS3TkIBusDwFl0BxS2rQdVrmjrHLfthvBu35SArHkDoMsCPK05gjZ
         s/xw==
X-Forwarded-Encrypted: i=1; AL+hErEQpAI1mS7KsCCx7NUSvZ3GnlytqTzwZ+etWNP69jCdyVi+K8Xcv9g3KRDBricRVgaL/WUNEyHKRiefk9uqwu/S@lists.infradead.org
X-Gm-Message-State: APuU4Z8FBSeIppuVUO5vSlXPe72TZGjgNF/oycWaA1tREaDGvILbmFM0
	l6Od+R2LhxffO7ESxvwOeeW/Sr4t6wUIZlneviiKEhpt6k5BAksUcf4CcvfVb3io1TE=
X-Gm-Gg: AYBFou3rExiTy/37FryjRZ70vyoDh4X5mHFExLiy6lfe6vapZTQzvEGbGOa6wSlE5Ws
	8fKyJCKDJomQOycYGQ4Ixfdvpg8Iwgc/Wtrjim3709qpG3cglFlRWAuNMA1jfPfqtVm9oHQQecK
	decgQa4LwH0r6b20vf5Et5cNnPEdmVgFz5a+Mn0YsT+2JzFldrhuTYJCMAG7Q2droSGZhTqVTcz
	scZJX/UWBg4JaqYDDJpeQP9FmarrgqI8+5Mo3dIApqNpD/gV34YC0lzCo3hs9oheo7xS/vOki7v
	P8ad35qhT/0TG5C+oqAsyzMGm9d4+UrGdV6wgBaKNILvAZVQuGr72vOuU6Hy+Rp3rLswl/2ejRW
	q4gefb0mtloEbCi9nTHD3koG9J6B9kGBw5hpDp8halOle4IlFvHJ3nP5fMtjXtFHS5QdrRVRrFd
	XtDcf/2Vx8YlLMXgEVGxfk98++Jo228vnmjLu493r8gAtR3cAyY8Emad8PgxW32OKVTUbk9jC6C
	g7zr95gnQAJ988IotT/baxt5EEQqil6h0xESPMDkpI9f7S/Wnsp8bTlot60KNfJ9no903U07fYO
	Rv0OcMHRZENEgSb73+iCI+75EOYozVAHxfkmseNtIkdOuJAE/jzOuqgCMV4NTSkPg01JiyCMQLT
	Z2NkALnjerR5Qdu7LFwB7ktVlYtKh+6oCyPrzpo9ZO7YY2i+h4NWS2i4jsmd6jXcCsdSLzsKnSp
	ZPvGxFP9B2lYBxEn89zwdzja+9c2QUQAkM9N62gyoy8Z+Q
X-Received: by 2002:a05:600c:1986:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4ba09379b69mr50759305e9.8.1794413801590;
        Wed, 11 Nov 2026 08:16:41 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-240.globalnet.hr. [213.149.36.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fd01sm8374925e9.4.2026.11.11.08.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:16:39 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v3 4/4] arm64: dts: microchip: lan969x: add fan controller
Date: Wed, 11 Nov 2026 17:12:48 +0100
Message-ID: <20261111161619.232141-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111161619.232141-1-robert.marko@sartura.hr>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_081645_103668_4906692D 
X-CRM114-Status: GOOD (  11.75  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

LAN969x provides a PWM fan output and tachometer input in a register
block separate from the temperature sensor. Describe it as its own
fan-controller node and keep the temperature sensor compatible.

Connect the EV23X71A fan to the controller and route its pins. Use a
25 kHz normal-polarity PWM for the board low-side FET. Set cooling
levels so the fan starts at full speed.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- No DTS changes; renumber from 6/6 to 4/4.

Changes in v2:
- Split the fan controller from the temperature node.
- Add the EV23X71A fan child with board-specific PWM and cooling levels.

 arch/arm64/boot/dts/microchip/lan9691.dtsi         | 7 +++++++
 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/microchip/lan9691.dtsi b/arch/arm64/boot/dts/microchip/lan9691.dtsi
index 52c22dd1a15d5..039c2014aa341 100644
--- a/arch/arm64/boot/dts/microchip/lan9691.dtsi
+++ b/arch/arm64/boot/dts/microchip/lan9691.dtsi
@@ -522,6 +522,13 @@ sgpio_out: gpio@1 {
 			};
 		};
 
+		fanctrl: fan-controller@e2010348 {
+			compatible = "microchip,lan9691-fan";
+			reg = <0xe2010348 0xc>;
+			clocks = <&fx100_clk>;
+			#pwm-cells = <2>;
+		};
+
 		tmon: hwmon@e2020100 {
 			compatible = "microchip,lan9691-temp", "microchip,sparx5-temp";
 			reg = <0xe2020100 0xc>;
diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
index abb21a8bace9e..3cbe5beebce1d 100644
--- a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
+++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
@@ -775,9 +775,15 @@ port29: port@29 {
 	};
 };
 
-&tmon {
+&fanctrl {
 	pinctrl-0 = <&fan_pins>;
 	pinctrl-names = "default";
+
+	fan {
+		pwms = <&fanctrl 40000 0>;
+		cooling-levels = <0 128 192 255>;
+		#cooling-cells = <2>;
+	};
 };
 
 &usart0 {
-- 
2.56.0


