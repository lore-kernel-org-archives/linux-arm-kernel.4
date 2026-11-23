Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01F1606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qQUIBu7N;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=CydGhKbC;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UnEo0pMP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IOJDYtfScd2t0QcK7PUKDNPXJ/Q/smzuGFyvSLeCO3Q=; b=qQUIBu7NJ1/BYQ
	a1aEbeEuE6fJDgdhXaTvtdHsmVKuUFSF2ZlVX49yPAKKZNRDmtpK5vUnlBVH5paFLngTDf66rZh4p
	YCYYipLTqfe/aWLLqh6bEDFvh2P17zu2Ordkxyp5L/517OMPEiK3gPKcJHhqw1w8W2xSuKHAA5if8
	jblqKlYI2sMJMSUM8oLo3VJOMjJ9m4ZLOhYTZCQrUkt3GrqamdELwlCbkMWyFfEyhbbFd4luyVnok
	Nl26yPtW6SwjbtoNaaPxiw/50Htz+HxEWFF9oBAAAdlh08x95++BV0E+O42rgVz2M47SQq0a4dgag
	FWnU0Yy4YZnY4NVmzyXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQEV-00000002grv-1qMr;
	Mon, 23 Nov 2026 09:21:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQEL-00000002gn8-3iZs
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 09:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IOJDYtfScd2t0QcK7PUKDNPXJ/Q/smzuGFyvSLeCO3Q=; b=CydGhKbC7ixqktdN6VNdGRg1iq
	F4KdgDS9j4I9TorvamAdtzWrX+sZZEuG7T2QfoDEknthCcLaFRoM36xSHBMQbCv5KKIKvID/j9SJH
	TmaknbW29iz0/yI5p4OcJ3nDC4KDNdRMvxrS+pjX6b29Zq3DJscKr7QBeQ6Uez5+fyVB71QnzFfam
	T4U/ZVe/S1LL1jtJ7/OWwaC2ozfow2V1s7exbX+AuvOfnP/71avEbetusFc8z0JPa0SrACo3FKn0c
	mD0amaRXDueMy5tJFdBJYO43LpXN1TDUuq7D7mwpoF9JmmHzVWrP4VpOvVBLmBzB2doH0ui68jk42
	G6C5gDHA==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQEI-00000002ueb-3mu7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:20:56 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so16419015e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 01:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795425652; x=1796030452; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IOJDYtfScd2t0QcK7PUKDNPXJ/Q/smzuGFyvSLeCO3Q=;
        b=UnEo0pMPRSt1CiIrV4h0bzFJbiQl4VpKwQ1miEt2Ax0ZxgWzrbtkBBK+brZu2gceFc
         kTbK+Dew8/nF+IxPO8C34xZIy6lSxqWX8mtevaF968d9iAESahmr8Scrmg+VYvZ2mMqq
         ime6OVOA9nVZEEEN92kYfko3AIwTCay486J3wNnxifwPMPKwgOXHsmay0aiEAa4/5is7
         J7vHRdflUtugTItQvoRH0WdHpGaCg+md6X6e0Jgm80KwuOw69/5Idfn4KuLluKWOyjdU
         AHyu1b1SfiSdl7pX/EyBOXfGJ1FVG6Z3zvys/sVT6MH5XIq5ovN4jTyE9xNRlEaK8mic
         GlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425652; x=1796030452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOJDYtfScd2t0QcK7PUKDNPXJ/Q/smzuGFyvSLeCO3Q=;
        b=1dUSbc6npLabdxpdqHpZBb4Y3U0HtCcAXePrXfL9J+FQQ4WDJ1LHBN9H0jR8y/w8VJ
         GgQsepaIh8HPhQwDwSSqvB/BoDQyecPXRlC7cGMiyua2scdZWX+Ic7EHCwzT0Rg19ZTk
         CIgjkAnrJ31gUHUkEpif88um1lNPI1OWPhu4SWlYFBNuGS54DJm1S2i/D8b9Bl+XSjNu
         6wislHt1fD4EL1CXhViUwhW9SPOgwYix7QDJYAi6f8tLD3sGyx9fcxw9Qy9CDxrdY66Q
         TKC9UJIH+i7M/L1jxnk92yOfB+WISzlEzjOYhwma/DeMWUWTVHlF1Ksv20PT+V9HHNPI
         yWyw==
X-Gm-Message-State: APuU4Z/lLSXzthlpQuBPxNGKpERYaRcR9mZjj1DAg8Tgew+IbTo5N3W2
	3fjm4FW8Dwkij85T4x9FhbWDUxLrNYVN+Wik15hxIGiLfLu9FJz/RIJUsnEQxQn/0AA=
X-Gm-Gg: AZFdTZdBVotvDJigU2SofIk2D8XxkkCwOcj6teFqryTfuYCaWLOKTl3F2KNGaUMYAEb
	ry8JXzLaBvT3gWOyqbv/N+9IQi6IbQ5nuhOwsQ7GQH/TveMd2Hyvo4Z95brQNAzj1+vxZsQAlUP
	ihn3f70LuEu8coDk7lAIolOxAKYlhSJn8hhhknZBBsoVrTUJC5+5Zl8yf4aRwqEsOfkidory5uc
	frjzXwHgCPhOdcAY2IhVlamZJXhVtiMOaP1R0O1zlAaFiT7q8J9w4yVH4ZwA1D6TJu/VJtVI1u/
	7iwg+qF/O/f4g8IkVxeoUiI0pKOqt2oBLqHRmlqFwDQlzSkqsyVkKuYidJe6M8sbx751XtDCwNb
	XV7jaATAQOK016Z1VChRgAWXIruVNVBKfLchwuFnaU2rK19AhZry11P3rzmY1h0kb1RCS1MfGpO
	YFXxac5oVi/YtxyTAeSxuVD300Lu3eT+0u0nu/TgZHjrwn2BfxqoBhGJpnUUiC7ZhGqzc/DJsJ8
	J0ivv7En/7FHBXwFBopTHsOhL6aUgt+FvUYqxv3bBeSUDZ+lU0pyL5dlt6NEKkDfYD5eMMHEZpd
	DpCQdOIfIibIFsqN5qHTFHbhtc1nU+XixlLxqZfYtMPyfDg1dHmijGZ7BDdua9WrEJ0BPT9n0Zj
	Orw5RPcP9wkfLtg7y58+ADgzRzt5Ss6Bj0v3FovWNbVKJFg==
X-Received: by 2002:a05:600c:154f:b0:4bb:6842:66ef with SMTP id 5b1f17b1804b1-4bb8893a963mr216221585e9.30.1795425651936;
        Mon, 23 Nov 2026 01:20:51 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm296458505e9.12.2026.11.23.01.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:20:51 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 23 Nov 2026 10:20:46 +0100
Subject: [PATCH 2/3] arm64: dts: amlogic: s7: add the PLL clock controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-upstream-s7-clk-dt-v1-2-95f46d67d8b4@baylibre.com>
References: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
In-Reply-To: <20261123-upstream-s7-clk-dt-v1-0-95f46d67d8b4@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_092054_913293_091804F0 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.2 (/)
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

Add the PLL clock controller of the Amlogic S7 SoC family. The fixed,
GP0, HIFI0 and HIFI1 PLLs share one SCMI reference clock; the HDMI PLL
has its own.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index 69dec312e7d6..eb123d022bce 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
+#include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
 #include <dt-bindings/power/amlogic,s7-pwrc.h>
 #include "amlogic-s7-scmi-clk.h"
 
@@ -161,6 +162,22 @@ apb: bus@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			clkc_pll: clock-controller@8000 {
+				compatible = "amlogic,s7-pll-clkc";
+				reg = <0x0 0x8000 0x0 0x1e8>;
+				#clock-cells = <1>;
+				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>,
+					 <&scmi_clk CLKID_TOP_PLL_OSC>,
+					 <&scmi_clk CLKID_TOP_PLL_OSC>,
+					 <&scmi_clk CLKID_TOP_PLL_OSC>,
+					 <&scmi_clk CLKID_HDMI_PLL_OSC>;
+				clock-names = "fix",
+					      "gp0",
+					      "hifi0",
+					      "hifi1",
+					      "hdmi";
+			};
+
 			uart_b: serial@7a000 {
 				compatible = "amlogic,s7-uart",
 					     "amlogic,meson-s4-uart";

-- 
2.56.1


