Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A021606A684
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 10:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tY2MB79f;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=L+57kGiV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Fzl0oyVY8HdO2f2gopQnUusCPK5GOiAXm0J/YDDEE/k=; b=tY2MB79fD7VhGJ
	rQloTUIKcQLA9nCo9SJPw6dBXoZ+A5zVALWMaDn4BTUJSO6OXDokaB2RuXL5gVCoXWUvHWlq+T314
	wkLSYCB+lsWpXBot10+d6G3LD5G+Ojn+CIhWqg0nZMD5MhS3x2mOKWvH7ZlFFFWyx52NdeJlcYJJ7
	6rpQ90a4u/Ut5pq/9Nikwi3feec7hSwEmYmYZHvvp948V/Tr3Aaq1vHO39phjRxR93E2uF/PJ7Orm
	X6IkuiR9XDfAlW38cFk2cngCBqiv5dLyDSlM8u20McgYf32yzIoCx4QBfid2dbGsLfHkz8MPTH9GE
	MIpmRqaCRDJ8oY/wf+oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtYh-0000000FgZp-0MRQ;
	Fri, 27 Nov 2026 10:52:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtYU-0000000FgQd-1cIi;
	Fri, 27 Nov 2026 10:51:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795776708;
	bh=DemZHg+T3C3B9LDCwU8us8KoLCgLerwBeIzBCB3sr48=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=L+57kGiVGjUYOqknPXFiLDp8898pVpV/usJ6L0trWxp1tnEMBrhYrYFVcWJh+nOKm
	 NZcAMwN7vsUD/cwWm1cvwwN0reuuWEc4tpbfNB2eDB41+B8Kzj5Q7PMFuD3CJznWAe
	 21VP+M4wAjIMjdDxoaRKhMcogaovgWMnBGKPG0WKWmIPF5rfvjHB4TA385ntknEccu
	 8TH/NGNl5aYb7lnEeCpk8e2mRM2RGoTBSIXWA5rYnvKZmI4Mrsv6FE/OzucZdQXzKU
	 WeOJn6zJwc6T6TSujhFN1wHOq7jtKZ5VdJqIJ6qOVq+RWHjptojdRUB43n2yw56taP
	 ZC8mc+DcMKWgw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 464ED17E052D;
	Fri, 27 Nov 2026 11:51:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0728948002B; Fri, 27 Nov 2026 11:51:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 27 Nov 2026 11:51:38 +0100
Subject: [PATCH v2 01/11] arm64: dts: rockchip: Fix USB-C DP AltMode vdo
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-rockchip-usb-c-dp-altmode-v2-1-77ee78869307@collabora.com>
References: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
In-Reply-To: <20261127-rockchip-usb-c-dp-altmode-v2-0-77ee78869307@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Cunhao Lu <1579567540@qq.com>, Chris Morgan <macromorgan@hotmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4858;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=DemZHg+T3C3B9LDCwU8us8KoLCgLerwBeIzBCB3sr48=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsJYMNdzdp9QDLmYmSBjuMaZ6ZQn1ZA4Xdh9
 a5LPwEpwi7H9okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCWDDAAoJENju1/PI
 O/qa6rUP/06esQ8rTCYb4n/CAi9yVO10JSrP01T0iZ5MLpoAgLZA7XRmZzEHeH2JVERyUn+z07E
 R0ta4VhIUaUvXyGVUuXU2jRzLLGWzGlWjR9B/YWlAFPsl8jOVc4j1bmxW5j4ER0viqjAGn+ujsw
 mVycVIKoslQTxm0cfcVfz4oU2eKQjOEonYg7Z/5mewhKnwzXoPly/5EdSUaY4MkXmS4GaaQQvLR
 F0D01SDh7zCmuo+rJNWSUNAmGjlND4lzHaYVOFnUOlNOL9dk0/T3UfmRXlrrqC4j5lIMr6V6yYl
 zf4+gTpeOyr+WaDIOYMQRx+GQKCsHOSRly0xg/26TQcOEuqaCIous4yf7/PW79YNOkd1DqdsWDg
 tGb6BQGqINsYKCMQ7mf1ko1rjEVdJnCKBwGe4ixil9qrITrClL869Gp5akJEB29hH6CqPXwaZPL
 pWzIBdg32npqC7ngcpGGSbCScD6Ugc0ebNKmPj41NfZpqSI5jgvtJInaLhTiH+4sNYT/+ThJLXe
 mo2IsGTik3hQmKBOM/VNNHUNx94u6ISgeXr8F0yHODOC8fPFTIOXzAevwJUjqH5uxOR6fJM98y7
 E4+Cn98+Ale96ggDIEaZlct/9cVbXlB67mTV+0sQ9FzEgYrcLvyoA8j8g9+CnBRFs9iNtStvYuR
 gVoAH05eHgQz8jFv1R6MsVw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_025150_590163_E03D499D 
X-CRM114-Status: GOOD (  13.29  )
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

Set sensible VDO for DP AltMode. The new value is commonly used by other
boards and dissects into the following:

  0x0002 DP_CAP_DFP_D
+ 0x0004 DP_CAP_SIGNALLING_HBR3
+ 0x0040 DP_CAP_RECEPTACLE
+ 0x1c00 DP_CAP_PIN_ASSIGN_DFP_D(DP_PIN_ASSIGN_C |
				 DP_PIN_ASSIGN_D |
				 DP_PIN_ASSIGN_E)
  ------
  0x1c46

DP_CAP_DFP_D: the RK3588 and RK3576 only have a DisplayPort transmitter,
but no receiver

DP_CAP_SIGNALLING_HBR3: HBR3 is the limit of the DisplayPort controller
in RK3588 and RK3576

DP_CAP_RECEPTACLE: The DisplayPort interface is presented on a
receptacle (disabled bit means plug)

DP_CAP_USB: This is not set, which means USB2 "may be required". My
understanding is, that unsetting this means USB2 is not available
at all.

DP_CAP_PIN_ASSIGN_DFP_D(DP_PIN_ASSIGN_C | DP_PIN_ASSIGN_D |
DP_PIN_ASSIGN_E): The USBDP PHY can handle muxing any of these

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts | 2 +-
 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts        | 2 +-
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts         | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts         | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi      | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts     | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts          | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
index 4ac849329ea1..85576a437f7b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
@@ -922,7 +922,7 @@ connector {
 			altmodes {
 				displayport {
 					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					vdo = <0x00001c46>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
index 72ca49ec3026..f6ab189a0578 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
@@ -205,7 +205,7 @@ PDO_FIXED(9000, 3000, PDO_FIXED_USB_COMM)
 			altmodes {
 				displayport {
 					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					vdo = <0x00001c46>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 45a4489863bf..48e5ad169722 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -712,7 +712,7 @@ connector {
 			altmodes {
 				displayport {
 					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					vdo = <0x00001c46>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts b/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts
index eb5d27bf2004..b0f262599cc8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts
@@ -515,7 +515,7 @@ connector {
 			altmodes {
 				displayport {
 					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					vdo = <0x00001c46>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index e8a3eb33e402..0cf6da8d8f1c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -348,7 +348,7 @@ usb_con: connector {
 			altmodes {
 				displayport {
 					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					vdo = <0x00001c46>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
index f212453686a1..c775f82c0624 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
@@ -394,7 +394,7 @@ usb_con: connector {
 			altmodes {
 				displayport {
 					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					vdo = <0x00001c46>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
index 73f8e3f1750e..b0b2d6fa73ec 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts
@@ -325,7 +325,7 @@ usb_con: connector {
 			altmodes {
 				displayport {
 					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					vdo = <0x00001c46>;
 				};
 			};
 

-- 
2.53.0


