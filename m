Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C272606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 03:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XAlwx7hx;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W8T+YacM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MlNq259fQdyBNl1lJWVsWFfj9prUCecygCmOZDgOoHQ=; b=XAlwx7hxNq48r0
	G5YrphhH4lpp/+flDJDaEAMJ0+BiwST6qTRIhi/m3iDUvbmogf43WEd56wiE7/WijuMQ6YHpS3snN
	Kzz8y3AnPZd5fFGwsmOPjWwV7ky6AViD9FLzRkBZXwzUeoVb4JM/0ERqCfFBC+RcGuzJ3H8xGlRbU
	k/vXY+mcpYgUiPPEbxH56qNO2MdKO0Kzc6cZnd5hW3/nzj9sOKy8K+zy0I9kF606Y5r4Ayj63EPOP
	Vw6UpsreiH7aRR5FcBngH6+N91nHWUha9pZq0kULhSAsOKFolrWnjr6sPHbhOKwO+WKJaiFhLYJ36
	6U/aKnD5XqjkCFQHNIXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPOI-0000000BvFS-0kUo;
	Thu, 26 Nov 2026 02:39:18 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPOA-0000000BvC3-2syh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 02:39:11 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8a05b210703so3158851b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660750; x=1796265550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MlNq259fQdyBNl1lJWVsWFfj9prUCecygCmOZDgOoHQ=;
        b=W8T+YacM5fCgc5MXBJ5in7Rvlgl2PZt7e7IGUQci9WilR1ttNvmAMqR/pk5lg+6dQU
         pF9b2AsC7GnpXelX5YbTcqkrOS24ZlFWQ5TS7A8dAmc1O6VynY5QTYgj/Lsr6syKnBqM
         hLXRizZn+3mwbqCrIhRXFtomhsXF4/qcGK6bJUGfXXuIWHwrEmamXMajUQF+hI9MoYSp
         9cK2a3ctcxNrHTF3TaVNzn+8EINfNazW4N6F0XwTaD5R0cZdePl9caqoKE2lsMHUJKIM
         cq6c7Nj/qhMWSIXA6mqs0tUUwXmqfbjnx/MTXFxyWWcYLcbOGWIbKrJXZPkyuwIo70YV
         8CrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660750; x=1796265550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MlNq259fQdyBNl1lJWVsWFfj9prUCecygCmOZDgOoHQ=;
        b=P9dJvyXrvNWwgz9QdA0/0BJJMCBC+pxkHHg/AHCFYoX6JnFfNHienQ5+WvihVSugBc
         C3bVPHloYji2ZhCwF64TXyEklfqBmnko8TJDLJpbN2AyduQmSY0zMOzVXKin+xZqGDXZ
         yzB8bQVMvqC7eqYTFqmeb50PayHTzRqjGZLBm8RvF2X6Kkbrur3cF0LUwd1QGQ8tZ+FN
         x3pzRMnduvBj7DC9vrwS5M7CW35UWkxqbPud739coupBzkaXkxhETBt8EWTinnaFKNvz
         gmyY9JpKjmCvARbPw0ZvUtUHqbjfRvRDSCOGBD3m2lxVr68huogz/l++T5FSHvjqbbyC
         x47g==
X-Forwarded-Encrypted: i=1; AL+hErGCRt3Arx0FpYEIP9Sa4VN5Xf1E3giV9dIxTeSN/AVf12qAGQUU7l3FUKo3PGGPESWFa0wLKsETYcIpG9P3iWA8@lists.infradead.org
X-Gm-Message-State: APuU4Z+NUw0wUWyZ2yT9eq9/mTsArGJ6eLBbJpP0MdI+NpxVRAZn4pPE
	LffxCfM/dMx2HKPGjNHs2vdjjwHsi2SIxKOhf+ilNa2ABE7sqoxk2zQd
X-Gm-Gg: AZFdTZchh8QhyyR3FWVPBKb6skPCUD3a+6c6lHxr7N/ypK0yEP8tGbfo+JTcGB0oD4/
	PV3pLZkbCexV67uG+YWg8x8gy12yus2ETp5pHbMag+CMP3r5Y1P1k5IUBp0hx3t5RcFPPp5QTKl
	4qbyJWtJ3/b6g6jktyV3jCBqnnYT2y+baZCcoJy4y+LifdPr9kszpzh+IP/bD8ktMTflGLp5ZOJ
	NX0l361dOUWW1F6Coot6VsDVmXSnZOdbahhV9M1TUmK3PsLrG2mjmFUGPrO3KNeSjlBUnsPM9bQ
	+cdbp4IFuGlKh9OHjG+9Sw//cXh29fepmAXhjkp63teTcvZohZAWoKlUoruXQaRnCpYXK0GVIiI
	tSq8QCzoz6xtll+Sml6MnTfhuUrkgZLeiEJKjvH/v98QcKuI+EVPgaq/zto67YiBxFT6PNvvCCa
	d1sVmAe4J0Plj46rDlvdBIrlH6vkDLHKdQ/y+TDOMZvDiho2qn/JHxHoMO6VLft0Ado+NmF31hY
	fvz2JpmSd2Topz+3NMoUCbhTljWtSYoxtaj2D3QfK+GUUxqiRQPtwNeuzV0IFVyNfMgLzu48KtX
	qxwRkLNyH8T2OkOXxxf+fYzBcJGgkjNOBAARjAJlZUpBhYW0gA/K5XkpzYf+h6fvSRToAyRpGmY
	9a46S7oaWjudBk5WH3bFG5agKY7M7K/eWSSkCBaeVxZ70wjKtCcGWeEDwXpHFpqpme3XO+Kk6Os
	QEmA==
X-Received: by 2002:a05:6a21:170f:b0:3e2:7643:3098 with SMTP id adf61e73a8af0-4014c34e75amr21652736637.67.1795660749742;
        Wed, 25 Nov 2026 18:39:09 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm9909018a12.19.2026.11.25.18.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:39:09 -0800 (PST)
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
Subject: [PATCH 7/7] ARM: dts: helios4: describe LED color and function
Date: Wed, 25 Nov 2026 18:38:56 -0800
Message-ID: <20261126023856.767961-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126023856.767961-1-rosenp@gmail.com>
References: <20261126023856.767961-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_183910_732261_61BBFA69 
X-CRM114-Status: GOOD (  10.17  )
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

Add color and function properties to all seven LEDs, matching the
schematic: green status LED (LED1, MPP24), red fault LED (LED2, MPP25),
four green SATA activity LEDs (LED3-LED6) and a green USB LED (LED7).

The deprecated label properties are kept on purpose. They take
precedence over color/function when the LED class device is named, so
the existing sysfs names (helios4:red:fault and friends), which board
support scripts rely on, stay unchanged.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../boot/dts/marvell/armada-388-helios4.dts   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index b62730b949a4..46ff69c3426b 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -10,6 +10,7 @@
 /dts-v1/;
 #include "armada-388.dtsi"
 #include "armada-38x-solidrun-microsom.dtsi"
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "Helios4";
@@ -75,6 +76,8 @@ system-leds {
 
 		status-led {
 			label = "helios4:green:status";
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_STATUS;
 			gpios = <&gpio0 24 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
 			default-state = "on";
@@ -82,6 +85,8 @@ status-led {
 
 		fault-led {
 			label = "helios4:red:fault";
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_FAULT;
 			gpios = <&gpio0 25 GPIO_ACTIVE_LOW>;
 			default-state = "keep";
 		};
@@ -94,30 +99,44 @@ io-leds {
 
 		sata1-led {
 			label = "helios4:green:ata1";
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DISK;
+			function-enumerator = <1>;
 			gpios = <&gpio1 17 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "ata1";
 			default-state = "off";
 		};
 		sata2-led {
 			label = "helios4:green:ata2";
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DISK;
+			function-enumerator = <2>;
 			gpios = <&gpio1 18 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "ata2";
 			default-state = "off";
 		};
 		sata3-led {
 			label = "helios4:green:ata3";
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DISK;
+			function-enumerator = <3>;
 			gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "ata3";
 			default-state = "off";
 		};
 		sata4-led {
 			label = "helios4:green:ata4";
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DISK;
+			function-enumerator = <4>;
 			gpios = <&gpio1 21 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "ata4";
 			default-state = "off";
 		};
 		usb-led {
 			label = "helios4:green:usb";
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_USB;
 			gpios = <&gpio1 22 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "usb-host";
 			default-state = "off";
-- 
2.56.1


