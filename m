Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A567606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pkLQg0aJ;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jqNdXovO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eIFevFDGAP/WEwAEGTiR4DGoC6c6i0A/XzAhuHxSskI=; b=pkLQg0aJnXNQDe
	dUthTcUTJ5XNlsbW5BGAxLAN+860pX931MFRWjdSYpowDTQ5WbFrfvXmc2q5eu14bFOOpbeCSbHrx
	XMCoks47xFTRpU1vl8MqHk1uLNE96UIyrfZj50r1hKgaREe6vPWnGY2RlHVXU41n27bZUX+b3EJxe
	HijKBriSdOYx2KY4S+h/+wWU3J8iAZHoI0ohigOcz4hqlt36fSS1YzH+rHq04kd678DpUwzdPwpr8
	1W9g/X6gnzPVCbJvjIxFvCQA8dk6C8Gcb+Ilu2fLueBBXFVLevm2Z6lwUkW7T7Em33A9Jqt5rgHed
	thArKJj0Bdphca9TEZtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYXY-00000007m6r-112J;
	Wed, 18 Nov 2026 05:49:04 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYX8-00000007lmL-1knH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:48:39 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-381d542bc29so1232668eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980918; x=1795585718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eIFevFDGAP/WEwAEGTiR4DGoC6c6i0A/XzAhuHxSskI=;
        b=jqNdXovOM4mSbtpuTpzkgmBn6p5bPesSO2TEh9kRARtok+Lpjtt6AcVjVpBJhH7evT
         EWUPk3b3uhpvGlJQKrrwR8rlhBs4mxUXmFCg96eMaqWK0sAGHymRYUMVomx7M+Q6J6RV
         C+dw87MDTDy/VwhHBCs5bSMtaZzC7Tfa2ro9nterDP4dX/qPDgNQAp2jxc8ouM8TCsVC
         bm52TGeOnjjuD8LgNohKhVoCOxvoExRwEqYg9pHhYSxyiq1tZxcnFF/ZB0OC6x0HRYdx
         NO4v+9RjPr0ziueSDy0k9STKf01yWYQg6X6BrmXwk/ZiyO8XZI3YmB/OkQ6K5Mc28y44
         +nVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980918; x=1795585718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eIFevFDGAP/WEwAEGTiR4DGoC6c6i0A/XzAhuHxSskI=;
        b=i+RB9WBt7Nz4DckyOILPsQ36BkkHRWWvNB1Goc9Tmnx9nDXJH6utKk5LTN94ewXJJA
         NAjbggH32vKnfrExh1LDTPeMizB3CgfHrl2Cr4/Ndmgp0eGVuNb0N5aImw2KeqaQHRaZ
         vPvWZkfNjRTy3kFy3e8B81xTW/qq8wRW6gIdB2dWKO1rmfl5X/qNKdtbFY4OC0BdWpJu
         RLlNjmNwmDiyUeTRUn22//B6qcl37OgsRU2vyJMPv3ufYtnVYOy8o3AyGZmfBKT3UExj
         ZMU/2qM18aEpu53z7Inc7xrmS1o/i0P7VAF3QLMQlYLBXpumoeumeycuOvMTjKiFvpJh
         UCrw==
X-Forwarded-Encrypted: i=1; AL+hErGYfwiLzqdL3298yp+jeqLYI49OK48zUT70lx4/OBSd1ItTXfZQUKylfStrum318Mz99z6mZOAyUw88fAxEen0B@lists.infradead.org
X-Gm-Message-State: APuU4Z/CP02QrwkQthjHbD+aZbNZw3Nv/9msgt8054qEDuF4HT0YEn3m
	52iFU8mznhVchJ5BoO+g8WCKlG//nMdxApli75d8uPeHsTHxn7QgZ1M4
X-Gm-Gg: AZFdTZdK9uaxgaftwl38kim9rxDc1+sev3ySTLgwejmuWkb6QcKMpljy2NuuKPR3p5p
	/2Se12HOjH81m4jkePojBZ+Cd4ZLKXtLgGSQVKHH1ZIUihVsB64w0x/OcwKREYAuJ3pnYEPNUGF
	Whwru67rqypTuVx61N98Rm0QaYxmWMucs4b5XKPHFM2vJrTDSMXcJ1acL5bTzFrrfnDiwLUmsRv
	rL+UMGQqvCRuU3pSTYuJRKGx6aNkqBuvOktlA9ltWku80rieyGBwXmIMWkqetUNftlwEVKlH0AH
	WKeF1NynCtmHei/BJLemLOPvYkPE5nLFE/Pioc5ozXMelo18xlGF2BsCG/LJkyhhceS7XJ6z1/F
	6E3LmGF3yxcaYYJJiSbo2xP8CZp8aa5j/+F0Gw8h51teZuW1L8YH+pazKKwwvlUXbyesqYasOHO
	vIrFqzgwmzl3DVzyrcwitRCekwqARyRyyfzMI2TDzWuO/GOX68BJ9pOUdFAg9shEDMvi0auXgDB
	vgCbp6SBc/vDEppCstpg2atbxvPWnQhBXwGemJ2ktuDKO8eMdRxNpSV1kQfhvscAmw+rwaNPHOd
	mSYaMP9+AuhrBl1wlseSnWC8HozSI8YQ7w0oPOZNNWpWujZzSZl9kR+IMYk9KUB/1iJ/u+romni
	BBydG7gSk8bejpspoIGv0S8XTRS7tEsK4AsCZZAYrk7GMPGJp2tkqXhBjwoeyZQRMZc1O/wEiD8
	/WPFaG889ZzgShv2pgSxa58QA=
X-Received: by 2002:a05:7301:da17:b0:378:314:402c with SMTP id 5a478bee46e88-382814260bamr1567467eec.28.1794980917821;
        Tue, 17 Nov 2026 21:48:37 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:37 -0800 (PST)
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
Subject: [PATCH 15/17] ARM: dts: BCM5301X: Meraki MR26/MR32: use gmac2
Date: Tue, 17 Nov 2026 21:47:56 -0800
Message-ID: <20261118054758.132233-16-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_214838_479121_268754B7 
X-CRM114-Status: GOOD (  11.44  )
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

Use switch port 8 as the CPU port instead of port 5. Port 8 is the
switch's IMP port and connects to gmac2, which is present on all
Northstar SoCs. Move the MAC address from gmac0 to gmac2 to match.

The port 5 fixed-link only repeated the bcm-ns.dtsi default, and
bcm-ns.dtsi already describes the port 8 fixed-link.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm53015-meraki-mr26.dts     | 19 +++++++------------
 .../dts/broadcom/bcm53016-meraki-mr32.dts     | 15 +++++----------
 2 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts b/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
index 08abfdc63d18..890945a5690b 100644
--- a/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
+++ b/arch/arm/boot/dts/broadcom/bcm53015-meraki-mr26.dts
@@ -58,17 +58,17 @@ &uart1 {
 };
 
 &gmac0 {
-	status = "okay";
-
-	nvmem-cells = <&macaddr_board_config_66>;
-	nvmem-cell-names = "mac-address";
+	status = "disabled";
 };
 
 &gmac1 {
 	status = "disabled";
 };
 &gmac2 {
-	status = "disabled";
+	status = "okay";
+
+	nvmem-cells = <&macaddr_board_config_66>;
+	nvmem-cell-names = "mac-address";
 };
 &gmac3 {
 	status = "disabled";
@@ -137,12 +137,7 @@ port@0 {
 		};
 
 		port@5 {
-			label = "cpu";
-
-			fixed-link {
-				speed = <1000>;
-				full-duplex;
-			};
+			status = "disabled";
 		};
 
 		port@7 {
@@ -150,7 +145,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts b/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
index 45bd27906f29..d6dc448b2849 100644
--- a/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
+++ b/arch/arm/boot/dts/broadcom/bcm53016-meraki-mr32.dts
@@ -104,15 +104,15 @@ &uart2 {
 };
 
 &gmac0 {
-	nvmem-cell-names = "mac-address";
-	nvmem-cells = <&mac_address>;
+	status = "disabled";
 };
 
 &gmac1 {
 	status = "disabled";
 };
 &gmac2 {
-	status = "disabled";
+	nvmem-cell-names = "mac-address";
+	nvmem-cells = <&mac_address>;
 };
 &gmac3 {
 	status = "disabled";
@@ -178,12 +178,7 @@ port@0 {
 		};
 
 		port@5 {
-			label = "cpu";
-
-			fixed-link {
-				speed = <1000>;
-				full-duplex;
-			};
+			status = "disabled";
 		};
 
 		port@7 {
@@ -191,7 +186,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
-- 
2.56.1


