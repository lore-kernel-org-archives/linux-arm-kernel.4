Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E698606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 13:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QR2+t4nj;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=hsy6uLuP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LKWAw/AZxDTQtn5ObFqcUuzM3ObhugKfW3Vkn+etxwQ=; b=QR2+t4njBbzOuL
	xiKDJoG0q85vujQ+tDAqWBb7NQWsXUgLchS3aDCjB6zEqs/yWMuk3pEQcei8oS9uEoqsyuoF/XQBr
	EgPqLH8R5rzRieAwB1fseXxzUyXz0LCGSBL2AcOM/zVNdSaWunM4wwADd6EHKKCwNXX4N1mOJWXzr
	EWnzHr1nWNBlM/Kr5DCdDBAqIHtva+wqlFE7sP5XwN5F45pjndxpZ26xsE0Qp0Jb3arqz9zfATTpP
	AVUQNdblD+K2CnljzuBCDveY+XxGshjRadwowTFoJTqSkqyk53C7n0l+Zf0pDN2eckD1e8jTzvw5p
	HHxlpGQBwftFhaHED/RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPYH-00000000ptY-0BKj;
	Mon, 09 Nov 2026 13:36:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPY3-00000000pi0-1Efa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 13:36:36 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso5891815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 05:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794231393; x=1794836193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LKWAw/AZxDTQtn5ObFqcUuzM3ObhugKfW3Vkn+etxwQ=;
        b=hsy6uLuPzSbdytpIFkBcXhS7NkG4jtLD8K/AkEhgIwRxKB3HQ3RZ+e2LwqW5M0GPm0
         7xgLWjxTxgdFEgRPm/u6ff36XbiHaxQ94xiR135JyFUZJ5PcytVZS3EqX+aEDsReE3zP
         hsHoD8kSKvNHlVcPZF21g6+yKXLuAqSiew6I3fxPTJFw5vZLOfmKKZ12DTYLSoLIF6ZD
         kvWM9+HASMHkkTt1ga8alN1FZlqTaejfwUem0vBo9l23YgCQOJUGnbp/mQDSYDEJVVBe
         qzXc6QSylvj4jY6RH+ruWLl2Kmgco29W4+vw/vOn9mR5CU4/X/zLBrc2swa1NlMp6Cae
         eR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231393; x=1794836193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LKWAw/AZxDTQtn5ObFqcUuzM3ObhugKfW3Vkn+etxwQ=;
        b=ypXUdtILP0ykFZ9w32+fOn3fXgiaTgRPJHqolllGI01h34+UsRCnsu1SUt2WEM/6FF
         8R/I9vGNS7rHQKFT5GutIjQfIl7YoZuQ5zhJv38Awp0hA2itZGdRf8SGyln/L4q546Xs
         e+sk2EcBYwGigZ4zhDcowjjolWp6Nk/5q67AoukytdzIgTCqfxgJiq2ycRE+fytLIDY2
         AUJvzLq2bI6YKxZD6gNNyouBaPQLLTYJuI6Kq0ALUrgNFgiW36NLF8R39tkLZZMBiv3X
         fkjG++FzmA9QjUUQLFA4NEGMkshJO6Ihv8K7PbysIA5aBp80Ts81tEOAbvJqfYR1Kv6k
         Qp0g==
X-Forwarded-Encrypted: i=1; AL+hErGWvwDPtzb+HGQIx4pmql1iKvkvvyEgXojjV2WOcT0L51BmRl1vqb1WrtSnLjQ4g8MTJTlgGBOjluq2Qg0hngoT@lists.infradead.org
X-Gm-Message-State: APuU4Z/AwYJ0Zm9RofdySNNzdTrI6bryVOvgHZklEz8sVOL81BGZSBA2
	qeiuAVMJPKddUsU0PDC1FIJuZ9yOZtRH4TodXuyb5voo92AI2CSELSoCymlB6mBQ6/8=
X-Gm-Gg: AYBFou05zWvY/aCWkItAN1YaEOd9IyFuztBip+inHA0DV8XKHFW7SxnRxkurcEmMsY6
	YgVbz2J9nobgNmjidB/+H9niFcFo2JKlC8HpSLV5nhyGasOwKCtei6/OIKznqFTC95KCU+cXApu
	xF3DXqQF3BvTyS9s3rvrZFzhhCKtkD0iAj1vQ0JpXRnBG+j7rpvQcSxzaoEy3/CdwbCXaXxR35H
	MzF9sqeasJBy2q5lr8MlGTJFVpkI6cxjJdOMc8QXXuCKKealBp8qIdLbUwPveosOCq8sBNK1kqO
	cUe73rmTyWmKQQEdxYU86Tz9xHLI/19V4gIxz2dtyNAhdvXTBx6dpQtJnoelb6aMDHwyzR5Bqpb
	cbJ9x3iAGjLQIAZhWWiEAQMejnTBox1ZMwKJTkpCpH2Az1wT8rE2Og5Y9DAC+TipxJXd/TNTdKO
	7A1Ai1YAgjuxwrwndm7JevDVTKl/ZkF0JeMoehvZV8D/oh6+uG++diWRdvuMEEM7QdpZoOIbXhj
	X9MN+/vQ0pcjkUp8R5+D8TqfNdo6oUcs+CRVmsxs72+1NwZs7JDKMy1PLG8XuBjf4H6MzBWs0bB
	4uDOVRFjD7hORuKinbaZ/AtprzJnqhB/aOEZ6NR/wFi/xYjxrccZIAtOz5qiNNVNIou2shCFspu
	nUS8MjdM3nf/5cabM81vwcVIr6OHa0bfxdcgBKvP/4l+6vhc5UAumwDPX2LkWIMke+eHYPpMfw5
	+MeTk=
X-Received: by 2002:a05:600c:3f1a:b0:4a4:de70:2ad4 with SMTP id 5b1f17b1804b1-4b963c6e08amr75104175e9.22.1794231393335;
        Mon, 09 Nov 2026 05:36:33 -0800 (PST)
Received: from threadripper-fedora-workstation (cpe-109-60-83-229.zg3.cable.xnet.hr. [109.60.83.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm245418915e9.13.2026.11.09.05.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:36:32 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 6/6] arm64: dts: microchip: lan969x: add fan controller
Date: Mon,  9 Nov 2026 14:35:10 +0100
Message-ID: <20261109133609.810876-6-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109133609.810876-1-robert.marko@sartura.hr>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_053635_469231_39C450E3 
X-CRM114-Status: GOOD (  11.91  )
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


