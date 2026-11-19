Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B20F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 08:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BTp/H8I0;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NIzJ+FgP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qC04sYESKIvNrNBC6lt71Dnq5FvwTYiC8PJsJBqyNvw=; b=BTp/H8I0/YCzoc
	ZrwRvOifGvDYiAViz+rc79blD3MfYdDTpUGY8yo9KRNE+2vwu4FIHgZ/2KHLqQdEWA+wfUIQaPwGU
	43jR/1OAhPiMqH2IgOMBtRqCnazIGcH6SXxGfRCKdGhEjZ2DLKjP0QYDY0rPT9sHTcalkP6pk0SJR
	44zyZg1AHvxMzeOYZ1tjN9EFAccqwS/76D62Pn/X8mdE+2VeH5MHRXHBbJGLWa2Po6otHt/KhlI+B
	u4FpAzVvh76xnu8AAoregnESr/ZSWuMZjMvFeznubnY4lq+Upn8VmaATqS8MVYKZcBEb9YSYtP87R
	/tOMY/juEyu9hZCfeyPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxxv-0000000BHss-2XWV;
	Thu, 19 Nov 2026 08:57:59 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTxvm-0000000BFu5-14kv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 08:55:48 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-5430f70c827so28610131cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 00:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795078545; x=1795683345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qC04sYESKIvNrNBC6lt71Dnq5FvwTYiC8PJsJBqyNvw=;
        b=NIzJ+FgP3M3yjqdMHnUVECb/eBLufFFw/2/9eD2gIVrO/+qsmKSIoSPl3+9T+5klPE
         AkFT+Tok/GyTVsWWaRWGNnY9q0h2dslXvUcPve3YMZRoOCwrQGn4mE26LoUnvr8FPKn5
         OT7+E7qgGVtkyTCHZuFlTNrggOTNCnUGPgsuqSU2LtUasbT2lUmci8Di0LN/AO1yyGVW
         SmAoXH4KnoNcAHNGg58F6FbxBzQ3hfqkoSWpDshoxVlaXqcbBh2/JpK/zx54a4aSk4KZ
         yAIxIPEBdZOdxw8kvyAvkYMUKiMcNlwCTtyQaXaLw/gJv6J56M1SzLDKsW/LGAG1eG4Y
         Shmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078545; x=1795683345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qC04sYESKIvNrNBC6lt71Dnq5FvwTYiC8PJsJBqyNvw=;
        b=0/hPASr04YbLU1Je39BYqZ1iqddPWrSeZazjxYeLPrA2czEamDFV/R7rR+WzfGjGw6
         3JYLIeXRgMf0BtPVhmCfqptCae1JWCaX3qfJ7Pp5fDVM5wEie9llyJdjCfVq9EPgr6F/
         Muvi7qL70WOSDlDQQNvxDsyuqbA5S9UdiG5mlb/55QpUnCdK+kceTu+7axA0FhFoYll4
         BcNZpyuWvaOds0mgQT6FIvXyn2eW/evkzXRJwJM2pXJVJEkKi+R6qYqj0I+t11ZCdT9y
         o3UPSxVQOx4FITLcWSe09xiBMkyo45Dwg5/ImPEE4K5fe8AVv+C+ljuDWU2naUaP8t99
         KlGA==
X-Forwarded-Encrypted: i=1; AL+hErEiHxJ1PG8ch65gXrthciLe08oeHqde9/iZs1UXCQ/tw9qiafdL51ndkHelI3rzKyJ+qqjFKyCLb1ln83mfoooj@lists.infradead.org
X-Gm-Message-State: APuU4Z/TGI8lMxQGzZdAX/q/OUup7/EVcqhCFu2JFWrrcC9B0LGBiLvS
	YIOKKA7vLxl7jUG2/MlM00ng3Y89Npk9IQOKBvP8bYj9fLgAq/G+dX8/
X-Gm-Gg: AYBFou0NkzwSUxL3Oy1nmY9NjHHNxbpM0gm+JJ9nvUouUh0DPKQCOzcItGfzxJJsjyy
	KcIEeTFcp4QrJoKDqscpcGxF+nskDgcb21gC4FMI809pwKfQaFS4Qf9+gsHY6qiaJPR5xdZUuKd
	W22JFv47ZJRMoRKmYmm45GPBrIGqNygDQZO5GkBU2qmXt2QQnBdHYIT96WzjFUjnMtBGCwtdhAK
	MtleE+glnMdqGnnTKshgbMa+n2b7C38cAECw9cPWwZLtePxnNh+btShNe2N2XzHtBNC6NE10Fit
	Ba2DY5VvkR3oXm5y8U3Ma02TdAQBJIRXbJyXz86UCJjL0vmOCFAts0MRv5ZeSNQee5bb0I7Q99M
	i48gqZLgl54/FhCNYff9HzXeYMjQh3cNb1Tw4AR9xw5n0DCVj8bhNCSE8zbGVE32w/IM+fY4iqK
	/UwhE6YzFU+gmsgLIUvk9rbmk5h6VhwEo6AhAtcbVjsI76ZbzF8jUXrlTqhMENuCjUGLu0PtSen
	5ZZPUHkckOZK1BwY5iEsoeU2liO4V0Z2Gov1ctZqVZiVk2BrrDKAni7n5myBtnCKgdqJc0r2mUC
	ou95oMLbjS6Z9jrhOO18eKcWfiVsSw92RzHjeQhTEseKdJTvjg+GXaqg83MYE57xZY8eOTRy0er
	m2laKsKXncS36djeBDmKZd0XanVh49mepKx8nrOYoT2ojegq6jt3Fdb/qLCH53vyNjGd8BQKFno
	Z5nLkzMv/jl+K3YMxj9Z8u0i4=
X-Received: by 2002:a05:622a:307:b0:55d:3764:8793 with SMTP id d75a77b69052e-55d5a5b773emr85562801cf.47.1795078544893;
        Thu, 19 Nov 2026 00:55:44 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bcbeabsm19578151cf.18.2026.11.19.00.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:55:43 -0800 (PST)
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
Subject: [PATCH v2 16/22] ARM: dts: BCM5301X: WZR-1750DHP: specify switch
Date: Thu, 19 Nov 2026 00:54:46 -0800
Message-ID: <20261119085452.75708-17-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119085452.75708-1-rosenp@gmail.com>
References: <20261119085452.75708-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_005546_309675_9E861D3B 
X-CRM114-Status: GOOD (  11.17  )
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

Use port 5 (gmac0) as the CPU port. No MAC address is described for the
board, so gmac2 would get the SPROM fallback et2macaddr, which these
boards do not set, while gmac0 gets et0macaddr.

The port mapping is taken from OpenWrt.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../broadcom/bcm4708-buffalo-wzr-1750dhp.dts  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
index 95ef6ca7210b..459ed246030b 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-buffalo-wzr-1750dhp.dts
@@ -149,3 +149,41 @@ &spi_nor {
 &usb3_phy {
 	status = "okay";
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
+		};
+
+		port@5 {
+			label = "cpu";
+		};
+
+		port@7 {
+			status = "disabled";
+		};
+
+		port@8 {
+			status = "disabled";
+		};
+	};
+};
-- 
2.56.1


