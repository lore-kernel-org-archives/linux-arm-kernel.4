Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53562606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sLprjkO0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7FprthV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gVwHkxM4LtXzfnAPFqqrm/G0O0osF+DEF3nBxNrzkzs=; b=sLprjkO0u+aoxx
	DP5zU1BkwzS67ZD9cXZv7AWdiKtwa9yutzfAAhUEPl3pc3bRG/IhoLuFpWIb/G4qu0c2mcCvlj825
	DSidXO1MMmf6WDTG93SfhpoGuMwGPoFpgWUbofQgvhW6FJrSut3GbQLHRI2yIjXQkjyxmeWJ3TFEL
	iAifuiADrFEsvj2xVYPc6ZfTxzQRQfI2ReBVyBBzbYiBJCJyVjk6b9zXvEk0YV0BcLVOxEMqliQxd
	/XFCj7CxnNBDUopm21E26ajgPoTuEDEhfgnDPdUCI0OmC4D+GEA0GKrpYes2ZanSfEo+4bXz1p8uU
	YsShfybJ/Aa+OzPhStWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvY-0000000BFgN-0iel;
	Thu, 19 Nov 2026 08:55:32 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvR-0000000BFbH-3cz3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:55:27 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-55d2f5f1e26so20222261cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078525; x=1795683325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gVwHkxM4LtXzfnAPFqqrm/G0O0osF+DEF3nBxNrzkzs=;
        b=E7FprthV0S2rweWWyFXAGTLAoTTjn+QJEcjRkNIwiUui37GefqGwL3eFGCUZ26JTN1
         SA9rTYCeimaS40tPjCxH0bZu3u8enA9qmxwt13rz4mxhAtlgdl9hvjwveDsE3c53V6M4
         hglYjuPin8gfslbHxPgWoLUumEbsxbkGwXwvELJAD9lhlFp0NEMeexNmr0ObIcr7mOgW
         p7Uyam11QCLdEIpAtdIwS28VyLLc/Ca/SWnxbtMKbYvgjGIe37YNiOXtSApmEmNykOp9
         6VTArA2UIR0UPfPwdeuqhBFlCW7XUBMaOBYanj3K5wXCf4mlE9+on4nMZpMoyZ4l7IgH
         oaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078525; x=1795683325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gVwHkxM4LtXzfnAPFqqrm/G0O0osF+DEF3nBxNrzkzs=;
        b=YofLrmUJmIyX+E3YtLW6SenJW67Oyn9Y5q/ZILZp5cbvXinyzU43Pu6bEJKinj1Q0z
         QU3Nd9WZsm3q0kAzRVwW9QssoCzFBguWJZDy+0r9i+4TVNVMEH4UhSSwylzkTKvyMpAR
         fSRXOMvD1NJHJch1WeF6uzX2AguD2sQoSH0ArMKReKUnLDeUqcWaxASG4oG35Hdi5vlB
         skz6Z+VGduvpAV9Jr3o5slh6ONKe2vvpT2VFeUjRbA2+stlSwjp8xRshLH6H4p/1ZLNK
         rosMh9Rzyu/BscS3K6zGvoyZpJG/CNOEZEjz3j+/q7gh6xJpQiv1P70nOuHv+OiZYaMb
         t8kg==
X-Forwarded-Encrypted: i=1; AL+hErGEu6V6HpBuiMkZAUGm1t8H8NW/e1H4k6dxy2lrB2A9ftUamIZJ4v2NtU7AyR44uRgRKN/QlGov7oF4zXcEqCBM@lists.infradead.org
X-Gm-Message-State: APuU4Z8YmjxuyK0hg9JSWkGltL6nmXTEvKXy/9kMWjHxzQWAqPxReisP
	ts3uQTc0dkWzIBjgUjOzEjzGxxtUlG5TWDqB21yFJv/bsZIXRzWOvcWZ
X-Gm-Gg: AYBFou1GChRsiFprwbYFeSwyG99B/erRAf0XZVWFLruDOh8oxoKLu0whIE86u0rDmEz
	5fmK+Ck8eAKcZAdCqko0Q4e6e5DXCxkduCkUySCxn73h3uRTOgKUPh95EH0/Un86IvrOgqkd2tZ
	jaXvlPZYB6sC8soMgdh9IWOVt05PWo+09vOiplThY81ysjrEY5KtoIwG4HLqdiJfmc0YVCtLupR
	7gcT906pqwi1k0Ug7O5mFUq0hKC0isgUm56Hr/blI25kxpl8IrCeXKGqk9PEeiZ5LTfNvJ5s89O
	v1CjKoDzMtVqQVvVJkQNGZa308CnAZhJoR+DcqyOswBnHNedxlqFHhv59GDRXnBEKbH7qbKHKKk
	YHKBadPRWMcEp+DdKhlXLHJUmdxdA5tyvPtC7JuUYs7v5lba5GiQz5ScX6gTGjVlE5/XTNSXQEH
	P4ZZHPFf6D28Le5wGM4oBQ0+UYVeTduT+qq8+vtcNaTG8WJ5+21+lMkRr9fAGF7H1/GK2lqWT3D
	cQqZFJR25KHxOi6Z7IwqicpPHUi545Qh8NEbLfHzeujxNlQMDRf6VfJs0SUWufU2dsvMy6zYJo0
	o4OOMwlPGAsG+EjoufeRKBtYjaOgCggEggyh8HFPC22toGionpOEqF/8qy411n/1xj/J8RRArMN
	P2S/9+QnCWj+ZQfqhz5swD82kM0P5mo3hWUopojEAwlLGmj7btITdjI5cMfYw7wwZxei382J19U
	Fs9w==
X-Received: by 2002:a05:622a:488a:b0:536:7e72:2084 with SMTP id d75a77b69052e-55d5a74cf49mr81289771cf.50.1795078524674;
        Thu, 19 Nov 2026 00:55:24 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:24 -0800 (PST)
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
Subject: [PATCH v2 07/22] ARM: dts: BCM5301X: phicomm-k3: add nvram node
Date: Thu, 19 Nov 2026 00:54:37 -0800
Message-ID: <20261119085452.75708-8-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_005525_910745_CE2B3256 
X-CRM114-Status: GOOD (  11.39  )
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

Add it and set the MAC address for gmac2, to avoid having to handle it in
userspace.

The nvram size was taken from a boot log posted online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
index bb1bc4e61bc2..5b9250976f13 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-phicomm-k3.dts
@@ -28,6 +28,15 @@ button-restart {
 			gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x100000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
 };
 
 &uart1 {
@@ -38,6 +47,11 @@ &usb3_phy {
 	status = "okay";
 };
 
+&gmac2 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
+
 &nandcs {
 	partitions {
 		compatible = "fixed-partitions";
-- 
2.56.1


