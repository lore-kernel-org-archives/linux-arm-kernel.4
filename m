Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377B2606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 05:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=InQ9P/EA;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f4l0a4PR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ukXvWoFTjvnuweEWwqjwjRHSL6p505SyI8F2lDlJaBc=; b=InQ9P/EAI1ujlh
	uV06WH6OJiNrB+WZ0cOncU9MButITHbzMHbtOEbgE6ycimDjqt6dK96hcPTlxG3WBuPq9tAtrR+CZ
	nLYTqmtGWjgzjRYfAnhmzVpPBzSVRKnJ3HZ/eEzk1bNeoKKrBzP8CuViIpMCis6ytIbk73A9TOZUX
	RoDQ0P9DyOFnf+38vgV9v99eUCrHqph1jNANivslt2sGQMlrqK59sXOmMCPSEjoOGYMj3loANNtEX
	gqzJ1EYHgFW+ncMlrcwlUKeVzVKQMaDhkAnZZpXtg/10smfp7lSxBjRe+bpm4cD7n73aDqfAYWwpP
	JH0IU/QAK21ltxPOm8kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYXX-00000007m4G-15TE;
	Wed, 18 Nov 2026 05:49:03 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTYX4-00000007liu-1o20
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 05:48:35 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so924948eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 21:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794980914; x=1795585714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ukXvWoFTjvnuweEWwqjwjRHSL6p505SyI8F2lDlJaBc=;
        b=f4l0a4PR9uQUp64nJf2QgK4xQy0Um/ESNDxzAYNeTfP0TIBC3QABotrN8mr/lEj0nP
         pXZs2aUyqYH3hxOFnja8204vrNGD0+C+Cz3yxvjxv5LipubMQYzDLS33qYL+R8N1AVjG
         I1ZUM2ql+e3HaUITmP6DUMVdSG85eancZYK/LE2kf/0eaokc9Jk9zOrPxrpegR87cApX
         PpO+9Mnk7y+YkmfnvYFVScUhYCstw+GjLk9KIZ2CJYGY+3EEwmG9E33uMqCt9ck2lylr
         6NphZYdUrlrSIr3QjpISi0Yq3psmE4ThgEiE5BlBRYaPBd7Tjf75zWWR6r0jd0oIKH6i
         9EBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794980914; x=1795585714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ukXvWoFTjvnuweEWwqjwjRHSL6p505SyI8F2lDlJaBc=;
        b=z2ynQjmZWdK6H5F0gOhUMSmkuvnvE824shVaQ80O+JfnR88UdjfUYb1NNnXErYE2ph
         8GbajdZhnkrJFZdS1xBUZi4bJKItWUce1IUUyqlXk8VrVguHoQS9ryEQVUUgc6XWtnyW
         dEr5nv0p/y66Eys2WPFgBiiTQyz2kViY+7cmyz8OwOkhZBO74negSIG5rtrgZeA+DB8X
         2zQFis6G54BrD4wlYjq+Ygjxt+4hoIEkdkXm95IH6CzaJz28vP0KxzlrZyoe+2QlkAct
         4BbY91vf9rnkDx1XiMrITFhbGQE+pGE2WSEtum9NS60QCUAmKNSUgFHIOxVin/ZBfMyu
         g4qw==
X-Forwarded-Encrypted: i=1; AL+hErGrXaivyvz9+CJrL3w9KfY/i3JvHFU2DUXe1mGxvzLudJhvz8mohXSp2XfGcXYXwiMzMjuobCW2pn2qqBjkrUS9@lists.infradead.org
X-Gm-Message-State: APuU4Z9C4g2StpEXyOMZCC/r5ef04U4gTh9xARFUUgmo6FTGUceJdqYL
	/INznT1xipgWXjfdp75H0XDadG9y4WDh/FcsxBrr2CGPzHnsneTMnn/v
X-Gm-Gg: AZFdTZex/NXSxD0WpK1oDfsxDATXflarfzZ6D1t17EEjTnytL+X3GofFeyhanrr+1x+
	OpAcp/nZ7iFrlf/bUN2yXI/V/rFAKIWWw+WC0C4xshOND6NyMXtoyMBa+tpsdplw/cUvsLLHHKc
	yWdNkqFzWmCSzv08WjQJL5jiWhoi/aR987y/DMFNJoQeW8p668qhQ3acy9Gq+2z2XZHjiSHj3xk
	XoOLTKocs3Vg0Js8+WB59N0N1oJ1SiAk/5rheQpfbl/Su9sh/2pVV+dF9O+27cXWXC0z9CkSQW1
	14iA94pwqTol62RwCFnGu8aRsGr+YteAYWBjxM2o7V/e1IZT/MjgP9EG4smeiXyNvM8jU5grziJ
	hfZpnR/WI5lDYXTBfuqp95vBIZaFdyBKBl52iD6Kudlsawjw9NVj4AJeWVRpKMMt3KFMeDDgZE7
	n2dHMDAVbfnypWr9/20W9PxkBbzl0qr9/9jzqzaT30b7F1TgcIkTCRrEglia8iJGJE2LFfSAIxK
	3tKHsOh1PEhO26/y3nE6TalM2JmhsyGf9Xp+xESgjcC/fVC+Lz2ekvscXIJKxAYJmTglZ7ff86J
	GK1s9dua7T4QvEzmMi0Pi2LOM4BWSGzxGUxlY7tHsy44zDXA11o0V+B7g9vRnNRRgwUAdNx6sm/
	ooUPS30iuPRPAOC6LVz6e0M1v87T/LBB5n23bO+tnBiO7Oa8ppDw0KQ432Bg1m5ngGYLd6dt45C
	JnQTEDQRbT7cNx9NQAPc4GmHs=
X-Received: by 2002:a05:693c:821b:b0:382:1eb3:4c43 with SMTP id 5a478bee46e88-38281020578mr1654436eec.11.1794980913820;
        Tue, 17 Nov 2026 21:48:33 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a680032dsm3408116eec.10.2026.11.17.21.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:48:33 -0800 (PST)
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
Subject: [PATCH 12/17] ARM: dts: BCM5301X: Luxul: use gmac2
Date: Tue, 17 Nov 2026 21:47:53 -0800
Message-ID: <20261118054758.132233-13-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118054758.132233-1-rosenp@gmail.com>
References: <20261118054758.132233-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_214834_495803_2D7E0A47 
X-CRM114-Status: GOOD (  10.87  )
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

Use switch port 8 as the CPU port instead of port 5 on all Luxul boards.
Port 8 is the switch's IMP port and connects to gmac2, which is present
on all Northstar SoCs. Move the nvram MAC address from gmac0 to gmac2 to
match.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts     | 6 +++---
 arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts     | 6 +++---
 arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts    | 6 +++---
 arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts    | 6 +++---
 arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts    | 6 +++---
 arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts    | 6 +++---
 arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts    | 6 +++---
 arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts    | 6 +++---
 arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts    | 6 +++---
 arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts | 6 +++---
 10 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
index 72e960c888ac..3375b234fc9b 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xap-1510.dts
@@ -61,7 +61,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
@@ -83,7 +83,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -91,7 +91,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
index 750e17482371..26ac2f2ed5a3 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-luxul-xwc-1000.dts
@@ -68,7 +68,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
@@ -86,7 +86,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -94,7 +94,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
index 0198b5f9e4a7..2b152115d03e 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xap-1410.dts
@@ -61,7 +61,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
@@ -79,7 +79,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -87,7 +87,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
index 73ff1694a4a0..b5664216dcef 100644
--- a/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47081-luxul-xwr-1200.dts
@@ -110,7 +110,7 @@ &usb2 {
 	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -146,7 +146,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -154,7 +154,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
index e374062eb5b7..00aa28a2e70e 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-abr-4500.dts
@@ -65,7 +65,7 @@ &usb3 {
 	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -105,7 +105,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -113,7 +113,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
index 3a33705c2969..04420ebf056a 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xap-1610.dts
@@ -59,7 +59,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
@@ -98,7 +98,7 @@ port@1 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -106,7 +106,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
index cf95af9db1e6..765b74919fcd 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xbr-4500.dts
@@ -65,7 +65,7 @@ &usb3 {
 	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -105,7 +105,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -113,7 +113,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
index 992c19e1cfa1..eb4bdf8c9c7e 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwc-2000.dts
@@ -55,7 +55,7 @@ &uart1 {
 	status = "okay";
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr>;
 	nvmem-cell-names = "mac-address";
 };
@@ -73,7 +73,7 @@ port@0 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -81,7 +81,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
index 4d0ba315a204..d5436d70ecbf 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3100.dts
@@ -105,7 +105,7 @@ &usb3 {
 	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -145,7 +145,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -153,7 +153,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
index 8e487f60a2cc..64d3634d130c 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-luxul-xwr-3150-v1.dts
@@ -76,7 +76,7 @@ button-restart {
 	};
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et0macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
@@ -136,7 +136,7 @@ port@4 {
 		};
 
 		port@5 {
-			label = "cpu";
+			status = "disabled";
 		};
 
 		port@7 {
@@ -144,7 +144,7 @@ port@7 {
 		};
 
 		port@8 {
-			status = "disabled";
+			label = "cpu";
 		};
 	};
 };
-- 
2.56.1


