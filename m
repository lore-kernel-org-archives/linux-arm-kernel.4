Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A1960A2633
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 06:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iVZhtBu/;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m47d9TLw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zOej3OSGWxWCJ3XeVUCQdSFsxuuEIjtPwatxLCH1n94=; b=iVZhtBu/9apNFi
	60VnyEreBoc+zrVxQjg+9kO48qU/jIaCn9ZjUST3t37hzngLJLNJRKWEn2XmTS0UhLVlhECDr9doM
	BIHvmH1p9qQ3iusa3G+sAOKXVXYveGNrnlQJPFvMLYRPF5vNxQkNemfZ0/f4lr41CAu67HhOM5Xkq
	lbtwTfqYHU1z7ciGrp3oDzXI6sjxtHo6CH/S8hD71HfnqE0qVdlpCvt97BrQ204x19lIlCqK4GVdM
	WkzE6cC7TXBy8LpxtnwTMSvuQs7YjO09tCK0i+JCQ0Fkgj0TRr/+HUnX+Kn89uq5frMhJ+lDv/VO1
	ZQlj0IxmKzHCxwJeGU6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1Xp-00000005iBt-0SmQ;
	Wed, 11 Nov 2026 06:10:53 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1Xl-00000005i9q-0VHw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 06:10:50 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so1762755a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794377448; x=1794982248; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zOej3OSGWxWCJ3XeVUCQdSFsxuuEIjtPwatxLCH1n94=;
        b=m47d9TLwAOKbcebBhC/UdqCE2griKLXg0fybTDrC8nipC5cyDvWKHQjLFngS1ANTZn
         oWoxvxZug+UPNYPZ7RePRWpNMinAvlcrvI79J+epo9xJrJDcPRS7w1jJiE1awpRN9pK3
         nogcUkqhF2DaUvTidxTxAwFp3E9dhn9xtzDulM+ZjHEq+u64Icy/FA5bhSI5kBSlmwSQ
         5vygVKSzwpUxwJuX7pwWQpwlY5qXvcBMPzlp3zvhWaVPEd1K2VWUvJ8/eWVDrBn0zyNA
         mH7bWFzgrrCJrT8pQCXWQbUEj2L1h+Zx/s+sHNKrP+4qnqU0c2H4vkU+cWMxcX3pz2eh
         UfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377448; x=1794982248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zOej3OSGWxWCJ3XeVUCQdSFsxuuEIjtPwatxLCH1n94=;
        b=PVQk3eoOknzPnJKB8Jbfn/AlVBWzEM97nBHRYJv+42m0vpZJR1/guYDfDagdjOiCul
         VZwYCkNJimIiT5Bycj6QxnlR8U7WIALsidjNqbGY8e7GvbojU6Z7dImk2UUhek/OKlnC
         Ayzgx9+hCtelSXlYlVWZBi6ePT0A5nsYgryKEbN6cNmrkHdSE1/sqwgNPFzUWMox7oZ4
         WfGofndyE+HuNbNl/0mZbBSQluHRONLijw4Wx4ldqAmjNvMqgsaLg6Eh3Bv21PUBIQAc
         /Tba0CCqbkkEqbTPq6lZmJqlFKzcGoU+fUxb74ZTu20XiHhLBJ2oh2HBwgc04xbcqXke
         HZgA==
X-Forwarded-Encrypted: i=1; AL+hErGnRhAoM8Jsrk52WUhHUEugAE8ahAe4oJFkFbK74awhPlI/VSWHh3huEEzrM9NfHiolNtxuP233rl3spt2FhbXe@lists.infradead.org
X-Gm-Message-State: APuU4Z/I7r87lD25wpZCReBPlG+elsy9V16MQQzo8ALL5fOCOAjADaQz
	+rgUlZj8OucQADC8RpiQJLmkxuaefz2xjKlUKsIUsggzCP5iD7ZsVZuy
X-Gm-Gg: AYBFou0KBuvHCllMXoRu8GQWrGpWMfFUhofiVtuMAxB/rfXSsTu3hgP4pRRLmE/rhf7
	dvBkV+U2IMrzApH62eQvR42yhewHO3GhxQJSJhEn2tMuxACM2cMxCGDk4UXML6gw+izFrwgd4Mi
	LoiLAPbSR4eJbt7b7WHJXyRFjP6jNJN4WaWFYTV1s5MSVF8AQPNRqdMkKu9ENjwqojEqEPiEim2
	kXVKX88yB4CJm3OK5DvDWlp7nXbWaWJaSRK40WftEX7vUzLmvmPhjkVALCzcOuMbuTYTX6rN3dr
	jdyF99c0IhwBfHnchHHV9Zp3zJIeWoXoBDerTaujmm/6Pf3t/vmY2CR0/OMm+/ao8EOXK4Yg3qM
	fLH4fkR52DmDn3JNG/yNnsRI507MFqDboXlc5pf13VMIsxzzDKGkon5mem80HFyVpjS6MrpSSwQ
	lYoGQJI6mGLmjIwSeEAtTc0z6KXquvCuaU9Y5b/+uCCq6LGoquJHoll5N7BDhjUFLaKVE3hflO8
	0I2u2ZXF5Rq+OW0PL9sG+JXr146MT+bob4pKOIRg/S2JArNTPHTFBrHEPV/ye3JhQp78O5f3XDr
	Erh4x0UD3WAVODrjy8jnsdNki1ywgw04jSRzQgEHzucZQK+K0WSD1l7CKv1rM8AI/gJF
X-Received: by 2002:a17:90b:1f87:b0:3ac:8897:7b9f with SMTP id 98e67ed59e1d1-3b182f0d1e4mr1310292a91.43.1794377448229;
        Tue, 10 Nov 2026 22:10:48 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7e8b1sm2978557a91.12.2026.11.10.22.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:10:47 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 11 Nov 2026 14:14:43 +0800
Subject: [PATCH v2 2/5] ARM: dts: aspeed: ventura2: Add ADS1015 ADC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-ventura2-dts-update-v2-2-bce5b5dafc1f@gmail.com>
References: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
In-Reply-To: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=907;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=xPQqV3YI1Vbg3zoEBrsSwuLJ278Wah93Qbu60OSxVxs=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq9Af1GDj92rCYara8OWnsCKcFq76imAFe5qamq
 9/KCtbUobSJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCavQH9QAKCRClg0K3CVbE
 gVo7B/0ZynYot9Je1040D/lbTGvzkWrbY4vtT8cQRJTXAHiAE6QNwPWG2ALgj+BrhuQRGEc0xVb
 6kw1vL3VB7rbF6TWstqa0zhqev/6glQe4IzGMqn5+HHEHAcVy3SrLRFt8V5YSHpu4ONibR/N3mZ
 U+n44kXd6Djn08M+YX/uIYdFa7gGUZhxd7xVVU5+qa7CxxQnqxPS4NcEvTL93/z0qgVuY0ZjCmq
 0/p93zt3zAiWvPAfAcG0XYdYqraRVFFb0f/XvEBtrRWihLAUR8Vz9tiK8tSrkKEcWx2kFO4aNHj
 LorR0ty1dA80hB0TVYarsdspFdZ7wYGtqSUpIMPimhCkZXUu
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_221049_170198_4848B42A 
X-CRM114-Status: GOOD (  10.38  )
X-Spam-Score: -1.9 (-)
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ventura2 has a TI ADS1015 4-channel 12-bit ADC at address 0x48 on I2C
bus 10.

Describe the ADC so it is instantiated by the ti-ads1015 driver.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index 50e652cc37a1..21c40dd4bb84 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -2405,6 +2405,13 @@ power-monitor@44 {
 		shunt-resistor-micro-ohms = <500>;
 	};
 
+	adc@48 {
+		compatible = "ti,ads1015";
+		reg = <0x48>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
 	gpio@64 {
 		compatible = "nxp,pca9555";
 		reg = <0x64>;

-- 
2.34.1


