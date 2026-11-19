Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD2C606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nsGziEfw;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VPYsZhJx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OTgHFbj2wY5TghLiWIYijNXspkdDjNg1qUeCJ/ElGvc=; b=nsGziEfwopylrr
	jle47bgXcY9m+AxCVhtgb5FSRjn/MXSjU0g3hu6jquXjv2tHraKk/FjLtStK+66pDxOUlsbuAA5tC
	WN7R/JmYDsZKKVOFhPhiydHNSMgCP6e9zUgHxuehXN7JplQ1yJrlqznTriOKBqOfBs+U7YgPgtudP
	CRREAIMRuTou85KS8ycz7hgo8p//4Z6oWpW/j+zgDM+N8+N50z4+1pQtXQL5wausNkHEHItS+jgfv
	ULzB45RYW3cP19/Op81L4X3MijTfaSt34LvHICZ8hhf9zv8SUQT6wjyFiMs7o3bxlqn0bDzJGl1yH
	yq6xm45OZZLgaMjYgbDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxwK-0000000BGLD-3pgZ;
	Thu, 19 Nov 2026 08:56:20 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvh-0000000BFqR-3OMj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:55:43 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-5430f70c827so28609101cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078541; x=1795683341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTgHFbj2wY5TghLiWIYijNXspkdDjNg1qUeCJ/ElGvc=;
        b=VPYsZhJxB0vJ4UV7eJgs/W41my5KVbNLOtM45ER5mB9pfPOzBC8Key4LsKNVFbPl2s
         TW+3zj72cSS2cLxst0Yks+EVmy88uBDlcUmkVCuIcmRAzXMvopi9FDKPENEVsU/JuRs7
         mxUqZ4W2J5VKhX9nDiO1/eqp2qsK2Yd4n8WklrwtDp5piOP1/NDnzLVxg8LlMqVI8a33
         swssNqF4jQR8n/2Ve7jO98lBsLcDzspsDx4vMma+l1vrU6oHUdSx9igYMhAhlSWRHZ70
         4Xl7DzAHU+TimyKh9sD8eoCrbsbEBHXgw09/QWsgXBOHYS4wifLDuS94s/Z9ZPLx0rG/
         ohpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078541; x=1795683341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTgHFbj2wY5TghLiWIYijNXspkdDjNg1qUeCJ/ElGvc=;
        b=M/YG9JKtq8HZSKz4rfIhj7q4QCyTDQ0YyeHYZbccT2C54YWUoo7e1xfHf6AWt8+uAZ
         Y03vzFhbX4u0nwEV1N6jQSTaNb6Jn/KoIEqfcldotVa1yy9lf1hjydf6SXSj+nwB9nDW
         98GwndwUSMLAQiz2bW+8PcbNQ3tnxLRLiVg5VyaQVgsni7z7B04yb5GoAI61nXWS2RnL
         DXJZQg42YVI7J4vahb3lP9xmMICX+J35v7FuChjSximerSCZL247dRka3bGU82Gtl5l7
         AgO5teYIcirqy08ng0qI+JkJVNQo5NOM22p0tjWCMCBZW6XkJz+FeB7AxGKKSRfkqieP
         QlkA==
X-Forwarded-Encrypted: i=1; AL+hErGp8jU2ozR2F37Yj13XE3jCNiNPZ0Agr7B4IlP6dc7FP4xbyVGpCh0RGBHdugkzwyPptRU8+qPLZdxz+2FAnRTG@lists.infradead.org
X-Gm-Message-State: APuU4Z9U20gLc+8s0zufqCbn4YQX6HAS0yjj6qXJrhufA/IiegTxPSND
	rGR+2ATrnSgm08ByOwBLp2LnajHlsni0MNDZU40nhGf0FUWFzkAvr1Ez
X-Gm-Gg: AYBFou36LsQ6NyLp3xFWq3Yqm6hZI3hv+G1LLLmhLJo/FUfaYBP8lGBihoYgmIVLNQj
	BiX2lLoqqDYRro7GZ28MYNjq6U3GffvqCC1dE0WOIbaG0verzVTVnJ3ojsocpo0uG4xrzgRNcZk
	60OfffSPkzS+SYILoEQUc3hdFouY1OUhHqoH6RW49CGhkXh2eV0IpdI1a9IRQK6Y6y+zrRnrT1f
	xFPy9SmAuOM2HBL28Rr7/iaddQc1vSJmhGdDgPeozSDOdDVRBiSju6qirpPU6jooVjqC/qhs/TU
	c5MAYEq+v9hLUHbrA4tvRQQlgAn55EryI4sWgY4hLQHuZ44eOLuZBgazUSJUz+DSSwzUcdoFDaP
	/tKtJhtek7PYLpbsuK/OPeoA0AD2+9+cqf/yxeb5GfrGsH3te8zodndI8c52bQqctAIEfnSkB0+
	b6HXBSL4ZTe+ircSaMN5D6Z8m4s9CAH8mEYLDvmIwicRAxbUovI1qrM31dZ4nFQaNI1oSUPeInv
	mClcaLX2LtlOxRig8wwq757RndIkWf9w8U2gfDNW8kxydFMevs60l6xUqZeK6TqrkQD6IrOZtnQ
	iQanSU2FuG6iOzezivJ7NTEhaiYUEsBpE5C7esgQrBAaxeCvSNGrHHa1UZjHEXLIOXTowYMhHzX
	/3UHxApG5npuQZNOyS0gk4LnufdBo1Iwoe/TszG01rOW67axTigOOYR5Jw3pTQp7EtBS3U6wXlp
	PIhg==
X-Received: by 2002:ac8:5dce:0:b0:537:a19d:41e5 with SMTP id d75a77b69052e-55d5a5b7f5cmr85412511cf.50.1795078540475;
        Thu, 19 Nov 2026 00:55:40 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:39 -0800 (PST)
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
Subject: [PATCH v2 14/22] ARM: dts: BCM5301X: R8500: specify switch
Date: Thu, 19 Nov 2026 00:54:44 -0800
Message-ID: <20261119085452.75708-15-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_005541_862611_F0FA78A3 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add labels to clarify which port is what.

Also set the WAN MAC address from nvram, which is offset by 1.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm47094-netgear-r8500.dts   | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts b/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
index d312afdb750f..2518f25b0eaa 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-netgear-r8500.dts
@@ -108,3 +108,40 @@ &gmac2 {
 	nvmem-cells = <&et2macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
+
+&srab {
+	status = "okay";
+
+	ports {
+		port@0 {
+			label = "wan";
+
+			nvmem-cells = <&et2macaddr 1>;
+			nvmem-cell-names = "mac-address";
+		};
+
+		port@1 {
+			label = "lan1";
+		};
+
+		port@2 {
+			label = "lan2";
+		};
+
+		port@3 {
+			label = "lan3";
+		};
+
+		port@4 {
+			label = "lan4";
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


