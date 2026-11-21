Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180F8606A695
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ICmvRICG;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RaJJoUku
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hdM7pfy5fx0fv3SX8+99cZSLyAjio050LadxpfZlP88=; b=ICmvRICGHuvrnD
	+YiICse5Vs05XdlDqhuQl4n/Ytt/UWmHNUbKHVZkjGdy0A1+6CPpoVIhXoSjKr0A5qTon1ZOm5GWb
	8jeFglxZS3KVJ7VPc9ePI47INiDS+7R968T3otEhc97+sTGFZiYG2JCc3C/wOUZ9mh+krcJg1F9oJ
	RfKh5GIe2eHdonu6OBuiR1sF2mplrsK6Br6UQwU3/uzqmji+3YAPYe1XNGaLfWALhWCwmKkQBpQXr
	bGKeyprp6i8U4VXGp7+/LxM3+N11um7EV7SGx4POrkkUSD9Z99wLIIQxJwLITSHGsq8OReznGTtw/
	mHqZuT68THLirIwZdULA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYw8-0000000GV23-0tTs;
	Sat, 21 Nov 2026 00:26:37 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYvy-0000000GUze-00VY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:26:27 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cddc597d062so879791a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220785; x=1795825585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hdM7pfy5fx0fv3SX8+99cZSLyAjio050LadxpfZlP88=;
        b=RaJJoUkut9jdObhyQkKMpbzhVCDwL93uWyH740246svD4Tb43s7TGVqf5nitWhDtv2
         B6+nTFVS22fVdSFIOCZFUMgFLF1BlzgziQTWHTHHQIS6M1kPkvQ0cucdG7d5V2v08OoF
         VWl4ouDPT399IC8CjY8RY+a3UlY7mQjIH17J7AYmvKDINms+T6fPmolrJ/Vhf4lqzN6g
         3iL+0bev06FhYd44eJGIBMEqAzmsmJIOzTZhqz0wcHidUTHcO4ZazYmEmXoylUI8ScDB
         iOmq873cTHxEJv12j5wCvFjWuOna8U/on2RjZPJjbUR/sVnYhVBN5LFXPtu4i9vNQKgG
         /vMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220785; x=1795825585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hdM7pfy5fx0fv3SX8+99cZSLyAjio050LadxpfZlP88=;
        b=BFDgNRLAZfIHqLMUVvtT8hptH45/ef8FB582rliBvp+zDkyfLzNBS8wz69BUF6FVAh
         ls3TQEYkabBGWF8NtaDUMyXWMDjcUEb5HGwiICzOBeL6oOtosYhILsqWl7kWzE1KsXWt
         kDkvhla55cgVdLi8YRSCv0TdnXz/eNJ5SGgEMV14aPoJfLwWR6mXiX+Aot/hb+k+ZXjs
         7KPVTMIhtX1SawPkPEP/nsepmUQwL9giBqEsbIUWR69sjncKlJTcoeA+imsENPFvdcW4
         BI7bKXUYXoBQBgEOubxCr1leTvHxuBeP9+jTBhfokfkm5GzFpZHCJOCpzPAZYQNq/vjH
         rxHw==
X-Forwarded-Encrypted: i=1; AL+hErG9nFsrDGqlPo34M7HjUDAeLedWAX7QZ1B4ChS0yHotlUflLuwwMP3z/uacGbq8gcORpA1KZc7RjAIXJ78SN5x3@lists.infradead.org
X-Gm-Message-State: APuU4Z+1w3KOwDxBT6eUkdUEvi2uVPEucSsd326wUaB1y3ogTCR4a04N
	wrVc+FlBzZtLPogPfxVNcDG9i21YP+A77GKIOcrMpknsrQFPj7RkpLXU9LrOew==
X-Gm-Gg: AYBFou0p79KSgLQfhidTKZpPr6DKUaWncIJUoj0JmZgye/mvrH0aDyXvIcsC6/Y/Vht
	UwXuCRxYIYcc3QTn+NPCSAypL+/ZcSb3lxpDHGKfliVkhZ+cubFI1BUohBexdlw8jtzxTl7e/ye
	a9NaM/2BZDRwhZFH/t3vE3Ran3nWCD5oCEsBomNvXVXO5iAiLNYe6t+9QY1VgRxydi/X/DhQa/Z
	RUviGytR08m6HpPvbUhYNNBg379Ec4Vfo+bSyXHwQ74cEraCQZ//EN2p4t82SBO9al7ob/3E+fo
	1vVSwhm0gYSQmgIWdUxrpCjBDJBOaP/ngoVBtlZRQ99p71msOMb87XRIomboV3Y2X6uCunyM0/U
	+LglorXKc8RBHXpJ1TcPLSszHEBts46FtJJYOO0hTx7cjI4AQlkPEqtZyLtzDo103q9v4p+2LiN
	ZZLokWBLyPHfOwB2ESBn3Jr+S+9SqSTZyrz+nKJUw+6Wflhbsst0W0B97o/yo0KfnPPuy5QJjec
	9BH0X3cKuGR2hgK4+GUck+yLnwMM6Z18T628coRLp2PrGmwqWbMv2N/oxKbADC32U5f+wbSlBye
	/CEZxaszadvzsWlXPmc6eEli3sYqHqtVw9sHNTvSU89csmy92AsoSUg0GpgB7qPCj26x2/ew9Bb
	kukLY1cdiIgcCIBEPeC7EQLqmqJtWXhm06Mvpvo0MFhCFsRyci8Dj82r3CuHIppdFAtN5Zg0/WQ
	X6cg==
X-Received: by 2002:a05:6a21:3b8e:b0:3de:4c08:174 with SMTP id adf61e73a8af0-4014d457f6emr5156002637.33.1795220784824;
        Fri, 20 Nov 2026 16:26:24 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:23 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 01/22] ARM: dts: BCM5301X: AC56U: specify switch
Date: Fri, 20 Nov 2026 16:25:41 -0800
Message-ID: <20261121002603.25254-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162626_062550_53E1A4B0 
X-CRM114-Status: UNSURE (   8.84  )
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

Add labels to clarify which port is what.

Also set WAN MAC from nvram, which is offset by 1. Set in dts to avoid
having to handle this in userspace.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
index 708599f8c4be..574fc4f76e75 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
@@ -106,3 +106,40 @@ &gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "lan1";
+		};
+
+		port@1 {
+			label = "lan2";
+		};
+
+		port@2 {
+			label = "lan3";
+		};
+
+		port@3 {
+			label = "lan4";
+		};
+
+		port@4 {
+			label = "wan";
+
+			nvmem-cells = <&et0macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@5 {
+			status = "disabled";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1


