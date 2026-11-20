Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5E2606A6DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=psKCSxun;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t2sWuc2I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bBmqP69mry+lGbki19N79NWmhaQ/6EL+J2EA0Ie++Zo=; b=psKCSxun/9dnoq
	A7tYimYgDdsNWTQ+OcV1VF+H4xS/jTzx4obFiNSMfTt5ZCPZ1bkUg9gn3rEnOLrZyJuFqKO7g2/CO
	HFu023VajzAOPohCFXNsXdHLh8muJluxHLrP3RMluB/SEt9jVfK7c6bltaA/Pofx7FOSxJ/B8gl4M
	hEDrUZaZry8VwD4RAl1KVr0/q54j+VR9M9uj45f8WP+jZ2sqRsji/aB++wB99EOFwRMqZhejFvG7U
	4zbCjMAwv+Ptg0BGuOrmUQ0l6KgtomXHh6Pf7QxFeN8lDjXDRMwAUc+07y4dehsFhcuePvdA+5sGF
	vDdXghExaWn+CMQYuWDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUBU-0000000G49O-0TMX;
	Fri, 20 Nov 2026 19:22:08 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUAx-0000000G3xD-08v7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:21:41 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so725480f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202493; x=1795807293; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bBmqP69mry+lGbki19N79NWmhaQ/6EL+J2EA0Ie++Zo=;
        b=t2sWuc2IFC9AsEXgmNKXhTZQ8e82AR8x9r46X32Tdw1t33HM7v1ZbqHTLi+TZdcfF9
         Cm2qG0C3bBF3dd/gEx/PZcmCmhYio2Y/hkct269uQpYt2DBfHuHLTkMlKafGsmDPoowz
         XfSRFLExzoPpkmRnZAkhmTBx4t3XabQKlj3xfcPKFOVSNh0gd3soB5nKdk7fwlWhwKM3
         5xYZ70M664TeHYgMvbtY2gjPoKEcsdgD6L1Y9ShAoZDuuh5OCf2K6gJKtW1y2i+oDhwn
         n4IElfvsplPaBBQArBjVLwFXlj88iUMo6HNUhNarBpWp2ZBkIzoNcXIrZir91gsK7FzB
         jQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202493; x=1795807293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBmqP69mry+lGbki19N79NWmhaQ/6EL+J2EA0Ie++Zo=;
        b=Dnv3DxXNV+Z/Gu+Xl9iC4ur/JGlX/Ynu2TQh0YgV5tjQoigIaik4YkQPlAMlIAj/T7
         aKKjOTOb5+I89Id7vdMAiZsOn9HA/GyrdVoWzUNWxMh3Hsg9soNUAfGDwoRZymaQ9TA7
         9G8cCyTuKV1JFrOEFqYpdlY1FcFIZGQOd2dI0jPFRQ3gFkY5xYNr0RUHECauS0g2nM6f
         1DeR3gJ2EDqvpDxgk7m/tXmrltKa15vttg8V9KY4qGMDVGEwgLsrDZSpmefPNxcc4DkI
         mBcdgHyy7utotATis3efeBMaONnFh7ayQYmZURd7vjpJUaDrMT7zKF31AnjXxBFvtZSJ
         XJjg==
X-Forwarded-Encrypted: i=1; AL+hErHpDi5O7UZrar6EK/DQ8QDXA5dhOqUfGJmIwjaJRHAJZnyNHgybt959LtDR2WER8/stwVmHYJCDDqbtb0PSFkDQ@lists.infradead.org
X-Gm-Message-State: APuU4Z+fL7G/psmdITpKZPNVmeIkwDMjaMuWcCujAWHeaUd55uvyUie0
	EMR26zGUC0pxxomvcB4QSd8USQMT7iDReam3OMbKrSqnv+G2XymIv1wP
X-Gm-Gg: AZFdTZdccyxER13iLCWA1970cpSsjCd4X4nd0Xew2/Sqe7M79TlACZJZXqLhgERQcAz
	g8lnyNP4wB3YsXpnumxzZsBTfCoYLiXlehRDgorrVH79h2jqcEs3pXLGKQtF4LJX2tdk4yxN9+M
	URnsY4OOLjtDcgdOJ8RsarQRcVBt6nvLH9j4uK5iCk1t+dv0kta3OzfkowI9TzD3eYnv20YooE3
	CLfGPWC1G8LpFMabYeMvgAN5wpYka4IsRuHFD//ucS4qcYu8JzOhN9a9AZQ5AJUXGuLHizglSUC
	BSBJDm5sssx+SpOxxK0C8V6Gt0Xdud2iI1na7LMvSyLQWiK6iMIKtct30yGtJLWuFUJXjJODH8e
	cHPAdVM9U9XQ7LQvOgy2i8yz0O86igwCChwfL0KSOsm2/TNAdArTDIEwVJ97m31/Rbm6IvtChrJ
	ESWbw7iJ7efLKlgDU42oI5OwNaEbf2GRW40hhve0TvPzim9V9syfZMlE4/b1Y3hnaJQ9FJCLxKP
	gBucU47Yait3jb+wBwJws9Ts+6D1emXaHCTj21d8JDp/QDZQoDCTSlgUibiOIp2OfQNkntj7mG3
	IACbS9GJ/oBKVJIGzvvdQTPGi2+CqLgOllzK8IugAw==
X-Received: by 2002:a05:6000:4812:b0:491:a219:8506 with SMTP id ffacd0b85a97d-4abb55183dbmr8227192f8f.48.1795202493000;
        Fri, 20 Nov 2026 11:21:33 -0800 (PST)
Received: from [192.168.0.2] ([197.250.160.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm8405703f8f.21.2026.11.20.11.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:21:32 -0800 (PST)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 20 Nov 2026 22:20:54 +0300
Subject: [PATCH 5/6] ARM: dts: zte: Declare nodes to enable the board's
 dwc2 controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-zx29usb-v1-5-b0433258e51b@gmail.com>
References: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
In-Reply-To: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>, 
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev, 
 linux-pm@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1980;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=VM93HH2t+Y1jF4XnpLTskujk8HKKI0SNwO3Nkis00qQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBrAJ2XsdE4XtHXB32BoPfUssqGek5Snakxjcygb
 ymjgroPEw2JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCawCdlxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKGoA/+Jg//JNfc0k8TCoWlB57VTEUolY5k3Cb
 /BrSS9BX50YVGu/+HzfpBKoj+zDVoYQYMR7YMv3QDqnLEU+zqcZFaXyh476zzi72itSOU4kGTtj
 +9SgKtUdCm9bxN8rdctWmeWLqbXPrcrpQiTk2ZL61TLT0AGOki56beImFwuqbro8vkjpAV8Lr1a
 lSYW04G/FKMIVyuygKvLKGhZ+Mu/RRYRMvtFuPJ4E0XeRJ7JbwR4g0yjpiAhyybMRWetDuHwJoX
 UASgZ7aaIcGMMm7ajBQ/9Iy/r3MxVZNdRk0P4lncHRPXhQuYxo5/LA92VPadtxDJcuBppv6hBar
 aUDxcmjqvs/zZlTHMMQxcHKoqI7tdfmYUx7ziw4WSIDgmSf8myzoZq00XAGfhpf9BAP3ObuDTQg
 R0xumTXxnByaAMo9QJH8ZzLGg6xl6ZdP405AeqkNreNOCBOZxMOcTIomfdZsSo6Dg02Oqu4W+fO
 onN/KsBNwl/BPAny3WdPYb8Fp5GmIbqLvqxXfCqwfi8TveidunVclh+TDa+nb4eSQsf5tncF94t
 c7FQEK65ldHG9HnblB6KbWI42xu02XXFa88SwSd1qspzIKrbBji6lNs+6Yyp27DZLOPb9mJqVll
 NYFWkTtipcDBCYyRbXgSu5TnxIFdOcZePEEYjNqtlJEwn1S+kLzQ=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_112136_296165_A1FBDFC7 
X-CRM114-Status: GOOD (  12.18  )
X-Spam-Score: 1.2 (+)
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

This adds the socsys syscon that provides the power control for the
controller and the dwc2 controller itself.

On all boards I have seen so far the USB connector can only operate in
peripheral mode - including one device that actually has a USB A
connector. DWC2 and the PHY can be programmed into host mode, but there
is no VBUS power supply.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 arch/arm/boot/dts/zte/zx297520v3.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
index ebac3cd137df..2fc888b10006 100644
--- a/arch/arm/boot/dts/zte/zx297520v3.dtsi
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -5,6 +5,8 @@
 
 #include <dt-bindings/clock/zte,zx297520v3-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/zte,zx297520v3-topcrm.h>
+#include <dt-bindings/power/zte,zx297520v3-socsys.h>
 #include <dt-bindings/reset/zte,zx297520v3-reset.h>
 
 / {
@@ -111,6 +113,13 @@ reboot {
 			};
 		};
 
+		socsys: syscon@140000 {
+			compatible = "zte,zx297520v3-socsys", "syscon";
+			reg = <0x00140000 0x400>;
+			#power-domain-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		matrixcrm: clock-controller@1306000 {
 			compatible = "zte,zx297520v3-matrixcrm";
 			reg = <0x01306000 0x400>;
@@ -176,5 +185,19 @@ uart2: serial@140d000 {
 
 			status = "disabled";
 		};
+
+		usb@1500000 {
+			compatible = "snps,dwc2";
+			reg = <0x01500000 0x40000>;
+			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&topcrm ZX297520V3_USB_WCLK>, <&topcrm ZX297520V3_USB_PCLK>;
+			clock-names = "otg", "utmi";
+			dr_mode = "peripheral";
+			resets = <&topcrm ZX297520V3_USB_RESET>;
+			reset-names = "dwc2";
+			power-domains = <&socsys ZX297520V3_PD_USB>;
+			phys = <&topcrm ZX297520V3_USB_PHY>;
+			phy-names = "usb2-phy";
+		};
 	};
 };

-- 
2.56.1


