Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83BD606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 02:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hYCqjjHX;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H3CiRXRJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P2b3ibZfYLI/rA4iAlhtTumPUKIx/cMHtlCujWDHvss=; b=hYCqjjHX5pA4hh
	YZ+R/nKA2nzfqmlAe8DUj1AWaUFFinHr6P7ku+f9AeHivNwqi+AhF2kHg3f0r+UqpwmiS9mJycwj3
	GNIF9aC93j9uLQeMlUoy5reJAfc0WfKbGCiv/Tyg/bJTuXbB8N3n6FFKdkuw2PlQSNQ2OcZpJKaI4
	d+rVqMcSc0d3zrUkUau1j07qcE+60viNkueBwCUwVLNcUflMW0+3q6qvGYDm7rdAJgeZw6h22phKW
	pp8VIEgarUR3QOajZXMGpLBC99ExWQSovGEZPqsTZUVFMaIfUO4cDqCA+iF5yl+yyInNCODf6wTXj
	wJQWTGgQKZXsKkp2VpYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPOH-0000000BvDw-1Ioj;
	Thu, 26 Nov 2026 02:39:17 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPO2-0000000Bv88-3dMu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 02:39:04 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cc758830601so4867316a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795660742; x=1796265542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P2b3ibZfYLI/rA4iAlhtTumPUKIx/cMHtlCujWDHvss=;
        b=H3CiRXRJ/B+BP0PXDfSM4o6xaX3d6r1AekLhlqEepDbueYIzdp3ecTekhiaJZfo3KZ
         RHvo+zgsM6ThIIPRcPojIRD5EzGuSzwPGmNycA9kP8FXROClkCcdKv/IbCgNVRehJSzE
         0ae3vc3Yl41djJJwJIcBC87fNhrp/uDvWA+yw5+m5j16H5iBAEmVlXvN4d043XpR8Mp0
         ylyqZFQ//IyzUiRcfaEjRfSDrkOOFpOzaFnatWe+Bz3SzMvtbVOhK12zDeS5TNaJoq+0
         w1896e46kzsYar7PKUAqNsxr8D1JkWF0lXsZ6bUfUxhn1/EAFzW77uDu6m6LvIPXOdzd
         36Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795660742; x=1796265542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P2b3ibZfYLI/rA4iAlhtTumPUKIx/cMHtlCujWDHvss=;
        b=osw4DCDv2Qwq8JaWHqQzxCKW3r6JFGDs9z/vanoykq0EFrZcHEzXiw2IWvKyeW4UlG
         zRUUdlYw8LD+Cl3WCIKnK0iISyMjJeYKmpVCar5VJdmh0Uc/slgnpEoqXv80edejtywx
         YnDkjXJVwnzcf+lIGn1JAIaWYBa9TtC65gWP8d7TV3oD2yMBIRLjdhhVD4xKELNLNZG8
         /AhbL6m0oiL5hz5gS6rI0DHDeSvJzWtehXL8LlyVvkoZTaaAj+awmhVeE6d3lVunzSSO
         mDEXirHlNvpOzSEo4c5IVL+oBE6mF2CRiHQ9bcNFmVGhXHWSRRVKL/pBRog5R0CxdX2I
         zZRg==
X-Forwarded-Encrypted: i=1; AL+hErGnX4SOqa0XFhfjZ+AMjrPu2C9phsTaUzST7ZHrSwvxHO80RJY8W4Uikbwqxrp2ARfBmGNW5JABBbhVCvzHmwsq@lists.infradead.org
X-Gm-Message-State: APuU4Z9YceyuBSQrxKDU3p75lZCQ0NGUYXzqT/1nHbCFXuBm+1Wl2Nhq
	jiB4fGmRBgOUxEZ/3Flu9b8qXQn7UNsLFG37bhoEy2SczjpWvtDN+4B9
X-Gm-Gg: AZFdTZetl2FOe4YGrGoso3mfMb9nd0fg7YBEuon0wldVvyRXal6ukRCj3NZivRn5vx6
	keVhZ97cUX6iva6q9vxEqfU89RS50zN7R0h/OfAZIVwozgL67s2ZtO549Zv56wBauwF5DIVhGee
	XfNs1o1r6jutYvxOsbVLTaMPz5KM/XPv1P/vvCNuK1QjJD3MV+u3bIem+symcMoIBwWCMRTfQNh
	N+zY7ddYjvRHP+irdlLlnP/w0gP+JHAWpLEEJYli6GDuu/yvsTXvwoMaWcT2dmT/QvJsWxnH8RT
	ogzq8E1NJutvtmkYF+lExnaFskC+wBmZWgMN3C4/nQc+aFZpgWUqyRRwtylLceS8TanSt8AD05T
	oYfwHF4ET1gZxYBUyLEN7CfcEno+v2zDj8tMOIqMtxayZx04Qz/7wN5k+Z4zOAlLlY3NZjItbXH
	Cke89GAWoC8jSmOTGzw2PEAfutvnFckkoE9Tezjn+sJsREkTWXjRlVXZ5AhYieHjSdf2Wmk4UAT
	zyRYGVOYiJ3iMz7TpwGsw7rQtiMTPfzy3ZojJ2cnWGNIgVB5OeqKgaOQFwXBFReY+EbvSEGYnN2
	V8R2PkdfFkEXVjS25BDJ1lxKT2VXgHN2kL2vS30D0ZkDQYGIEnuqOl1l6uGVHjCpSGdCYkXPPNn
	p8zJaqj+vDhFQxd4vRrY3FpD4DDQXEi+tZSLfmyjRtqNqzlmb06pxKTBZdTu7swG4PNsxzaJhZJ
	cW0w==
X-Received: by 2002:a05:6a20:51a7:b0:40a:5639:4a6b with SMTP id adf61e73a8af0-40a56394b39mr132821637.30.1795660741806;
        Wed, 25 Nov 2026 18:39:01 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d026d6fsm9909018a12.19.2026.11.25.18.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 18:39:01 -0800 (PST)
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
Subject: [PATCH 2/7] ARM: dts: helios4: use a level interrupt for the GPIO expander
Date: Wed, 25 Nov 2026 18:38:51 -0800
Message-ID: <20261126023856.767961-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126023856.767961-1-rosenp@gmail.com>
References: <20261126023856.767961-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_183902_980266_EFA64370 
X-CRM114-Status: GOOD (  13.27  )
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

The PCA9655 INT output is open-drain and active low (pulled up by R60
on MPP23). It stays asserted until the input port registers are read,
and stays low as long as any input differs from its last read value.

With a falling-edge trigger, an input that changes while INT is
already asserted produces no new edge. If the handler's read races
with such a change, INT never deasserts and no further interrupts are
delivered from the expander. Use a level-low trigger, as the chip's
INT semantics require.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 965e9972c9d6..b87e3f8fd12d 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -175,7 +175,7 @@ expander0: gpio-expander@20 {
 					pinctrl-names = "default";
 					pinctrl-0 = <&pca0_pins>;
 					interrupt-parent = <&gpio0>;
-					interrupts = <23 IRQ_TYPE_EDGE_FALLING>;
+					interrupts = <23 IRQ_TYPE_LEVEL_LOW>;
 					interrupt-controller;
 					#interrupt-cells = <2>;
 
-- 
2.56.1


