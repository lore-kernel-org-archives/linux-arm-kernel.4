Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DC6606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uMBTwC1E;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y0ROpJIG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lyzGhuMOMHlziF4wP2PnDrjLAU20OQZJbENrKw1pfsE=; b=uMBTwC1EYvMgNJL9JDps0P8BMz
	JkuKcuRXm1pfPQDIvieK11XjjztjGpIo3vWclz1GmnRS1sZlbvyTOzqgykpN2tz6ZSCXpyCRpJRG/
	yvImgykgpey/8jX1yAbtFVg7dEKXVPS9vqzBghcRxaQ2X1M0d96yrokwkjqaZRqKsxDcVLRURkN/c
	T3nORYmExijuI+jw6nQDBTm81vt4CTYkFfvlu7Q8uQ3a68F116uwqAQlPV+DLJYaZF/aELgLYMAyD
	O2+gxSBwEnJlkpVnUCdMBaZK3JtFmsBACT/0oprWnCvSm4WkoOtdXbmvyz85+9MNf/m730po26emk
	q2glMCfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzrC-0000000HI4L-3ZPu;
	Fri, 27 Nov 2026 17:35:34 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzr9-0000000HI39-3Ozj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 17:35:33 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-7a6e560f580so5062127137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 09:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795800927; x=1796405727; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lyzGhuMOMHlziF4wP2PnDrjLAU20OQZJbENrKw1pfsE=;
        b=Y0ROpJIGZNV8ijbYHGJBobRIWTZxMYCESuvWcSVU9sa3r6PbuooVMhXv2N8cgcJ7m+
         HiyDecyVDDse7J5ffRNgzkBr4kLEGlJl2WGZoaObDXOxR6hp0xpmKc7KNJGNtbDibOAn
         iKEGuRABNUQzIXdl0ODW8cPRFOvNFvcxxYOl2GQjCdpzdA6jYKgtuYfIV/3NoWEshaf3
         D6hIOxo5gtkOdazSAtdvyFZV0G9lQCsrptGwSPhVAW6oyNxQoFVxCaljMhZSZWspVG8c
         SXRXVwvOwfQegKKqnOUAYk6s2ZMChKVAE0JxSeJGdZy7WGG0wddIQyDZm8cGC7UEY0Fo
         0TBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795800927; x=1796405727;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lyzGhuMOMHlziF4wP2PnDrjLAU20OQZJbENrKw1pfsE=;
        b=M3AFC7fcdchviaBR6t+GCheKFxqdpBJNIZq0xZgxQJfLXTptx4+NMJSeCi9Dj9uHll
         zDU7JqAhPMRSMHTPBf7IGpdV1jJolYkhRVRNAXTZb2MSsoOb9NI4sAUFkTVyPkiynQ50
         Sc6gq/T7iBcZTVpgK1vhOdBTgBe/sZhPbFRjBZCUM8NJN8Rt1aBjzLFiL9DMhP4XoQDg
         TJbx/BGTpVk7Th4LMJqNgz3yXlwrH8eDa7k0/VF2+9W7FoAFJguYzMia7mIO/xpu9gNN
         Qa/z6Z1EZI3n9Ixp/duiSG3V25M0AFXaQ9YRtl+Nj6LioHtfQ/TSA2fJ1esfapJSPx/Q
         vluQ==
X-Forwarded-Encrypted: i=1; AL+hErFZ4joBlnpo13/bcYcxs8hZVVfsfNd06BulpUhQLEucHTLhn87PObg5E4dO9WoOeyIjVo+4TC0gg1lKYgggrHHk@lists.infradead.org
X-Gm-Message-State: APuU4Z8EKEsG5gtBBmb2xF6Q8Nbe0cV6QIuWr1b47k4vH/2Q8Tv5QpvP
	15VpPylAXFeQ7QZSMFAY6Owhlk5AcgshXe3IUYazqz2/E4xq3QSAlsq7FxuMiOBj
X-Gm-Gg: AZFdTZe19ZnDe9jRohVfDzxom5EVlZ5x+3VCpmnMhkHcdCqJp45WFlfASuoOkt1UC9+
	sHGgXUD/LzpbeCogTssf07LwEp/wVmaeT3dwdvPEWe1PZjqMvt0gSNXTIZBNPzMJGok/9OvvDLG
	jB/Mqlc0ZOqsSbRI3Hkr4CSLQyAzOFyI1nLkp/dZV6NobKHuZ7Ts3O5BwGOFOCFrATRz4Df015V
	onQDbCPjJKRDnvBrejC7Nv/D7KKIpw7zbZigHDtrYi0Ymncql1YnKXlCoUWmRtggUzIcMx0eDRa
	24ejNX6zXmpYouQatwSqWfND3sARiacRfRR2cKI/4OrZKCpxxtxpRsGRHCbUyMJb/DpJiDMSxe4
	QwW9R7zvepOxtOa2VPuNahIfa4BESxNnYAFMRV2DQR5IDJVyluBwG67zpswSkbYoeAimfkrmKQe
	nkXenS1X9/wFCAHO6ZOhDAkXIWGxqnhnafF8a2WpWMw2nMvALqZPcOUVSojPBC6c6g6eNzUshSO
	r9No7WXNWEO3JsQOKBE/38wsyFM2VbcCKl4jX3DDA9fVHNWcjihxCaKiZIY5SRrZ1/1RHm7K064
	G5ISDm3zbVhEUIwrUNz7073KLgt2kXvyyw==
X-Received: by 2002:a05:6102:b03:b0:7c3:c0b9:9028 with SMTP id ada2fe7eead31-7d739450a75mr15786710137.24.1795800926783;
        Fri, 27 Nov 2026 09:35:26 -0800 (PST)
Received: from [127.0.1.1] ([2804:1b3:a700:1033:f688:69e1:e4d:ce91])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e0686b1sm26107747241.10.2026.11.27.09.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:35:26 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Fri, 27 Nov 2026 14:34:52 -0300
Subject: [PATCH] arm64: dts: imx95-aquila-lotus: Add internal voltage
 monitoring
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-v1-aquila-imx95-lotus-add-missing-nodes-v1-1-162c7ad8c302@toradex.com>
X-B4-Tracking: v=1; b=H4sIADy/CWsC/x3NwQrCMAyA4VcZORtoiivoq4iHsGQzsLXauDEYe
 3eLx+/y/we4VlOHe3dA1c3cSm6gSwfDi/OkaNIMMcREFBNuhPxZbWa0Zb/1OJfv6sgiuJi75Ql
 zEXWUkJh7CqOGK7Tau+po+//0eJ7nD3Ngo5t5AAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-bsp@toradex.com, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795800922; l=1592;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=ZxK2MgG5q/LBAnoBWmanwjQtuKQAwsd2KRSb3AQNx0U=;
 b=fZ3SskkRL+/kfEm2nx7HRYt46R1l2PAl/6TN9QxLtD4GvefiuN0cqUMqFN68SMXgstgNXiBP8
 sY8QNLeMM/vBzuFC3QyrLocz+cMYwskiJBnsKtSaP6+1StD2RJak0PX
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_093531_974671_FFE98233 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

From: Leonardo Costa <leonardo.costa@toradex.com>

The Lotus Carrier board routes its 5V, 3.3V and 1.8V internal voltages
through resistor dividers to ADC_[123]. Add the voltage dividers so that
the internal voltages can be monitored.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 .../boot/dts/freescale/imx95-aquila-lotus.dts      | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts
index 4ae600636106b..7c20df249eb20 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-lotus.dts
@@ -34,6 +34,30 @@ dp_1_connector_in: endpoint {
 		};
 	};
 
+	lotus-1v8-voltage {
+		compatible = "voltage-divider";
+		full-ohms = <39000>; /* 12k + 27k */
+		/* Aquila ADC_3 */
+		io-channels = <&adc1 2>;
+		output-ohms = <27000>;
+	};
+
+	lotus-3v3-voltage {
+		compatible = "voltage-divider";
+		full-ohms = <54000>; /* 27k + 27k */
+		/* Aquila ADC_2 */
+		io-channels = <&adc1 1>;
+		output-ohms = <27000>;
+	};
+
+	lotus-5v-voltage {
+		compatible = "voltage-divider";
+		full-ohms = <39000>; /* 27k + 12k */
+		/* Aquila ADC_1 */
+		io-channels = <&adc1 0>;
+		output-ohms = <12000>;
+	};
+
 	reg_dp_3p3v: regulator-dp-3p3v {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";

---
base-commit: ebe46fb6c3c40292eb647d0bfd5d1beb05b923c4
change-id: 20261126-v1-aquila-imx95-lotus-add-missing-nodes-d06aa510fe04

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>


