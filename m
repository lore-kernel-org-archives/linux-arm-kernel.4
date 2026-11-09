Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB086083621
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sYcZrkkl;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=p5BfFsc9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ypL2grVntT+7ecU5ZYny6pR+6RbN0Ef9pRnQMEBx9Ng=; b=sYcZrkklbNEf7X
	MSy9DuxeZunH5y3hR4KQY+W0tEfv4xCloYiUQFbkWKhfKVvS+SIL5mMhgEzTtoWBCclJS+txuJ8+j
	6teGf7Ni/mNHYVeVNcuBzYEXVR+gJoaMoQDT9EmPCvstSx7rA+2gNKuOoDoff8QTJxSyPT8RZrlzf
	T7oFWRuYi5yIrHxkYfZGy9VBQNJxQBnb9eKW9HDfO6BcvepesZxlPb792yzBv9khsmDBnI2tWRqxt
	oZZ6iVHrGmqU9z2WZ9cc9LOwHi7chTzbZviN10GwAs83iIm8tA6eAQclFM3aEZX7kKg6ebNFVkMiB
	+PNhBkVxxiaPqDEmFJBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOPp-00000000ev5-0aqG;
	Mon, 09 Nov 2026 12:24:01 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOPn-00000000euG-0eAG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:24:00 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so9585165e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 04:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794227037; x=1794831837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypL2grVntT+7ecU5ZYny6pR+6RbN0Ef9pRnQMEBx9Ng=;
        b=p5BfFsc9ZbO3V9D8O/PMPWwBIfFzl127CDM2Y30M1nVJQ8W1Hy25DY01AXIZEz4qoE
         mhGwZHGW/qFuCbNbObjYhoBqWLjfW9U9PGElGZ4lBsK18be+8oOikuTrRPTE7Rfkn4Ef
         tCgwAWzU8m+MYVpwxJ1TrjPuCm7zJZPbvIV+QmL+eclVT05HEV6rwZDkZxV4DWVv7PBn
         dEejWlotT2UbgTUnUSTpuSakDVcJxumwGLO1DrffP3Axe7N0nC4vKP6U/x7wr/Hk5VZ1
         e5SAw984UGWY7vUnu/aGPOVPSD/ebp5DM2uRgBDckTw2RUtuFwVS66k3YRwJ15HUpp9z
         +lFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227037; x=1794831837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ypL2grVntT+7ecU5ZYny6pR+6RbN0Ef9pRnQMEBx9Ng=;
        b=tXO6oGrSHLki7zFob60WYqT5tG9rMszqdmjlG6SxREcCm6cWYCfoEWypXSCtLaR6oj
         xjE0UF6M4KAOmoF2wn1QADPI7AUsSnFSqWjq4Dfyj+uUO1Ue169U8o597a7XIb81FMsQ
         Ezt+hM6NjfS056c4M++wfgmbBKLzPhLhDrgCZYw9PSIs/h1ouwxsvkGbP564wW7z0XUD
         uMlMqsdJTIayyEFaDvVoYK+f7GttSFPlyrQprlxsKEYmk6B0KwcPNUL63d80FZfdBgFH
         5jj/nDk4atmxO/vZOfkdZQhdM5NGwLN/BGI7cSlJyow69jJLj3EQtVmZwS5aDm2nOOfJ
         Fp+g==
X-Forwarded-Encrypted: i=1; AL+hErE3+q1IWD7f51Lrtg+gGJY3jpyHNDbKV+OVqSqEaRyHyf0TXvp9lzoj/H6LmVgSWAPK8BpJSc+Jw9MrDpIJmAXz@lists.infradead.org
X-Gm-Message-State: APuU4Z/KWKHcuPekT5Ykj5BCRuxfEDmFDfkmG9331SPPLW00956Mx9gb
	RczqtaqWzho/NRNFgWtZuEIA4nHhhD29q7d9cZj96i0mlI84B0PIK6W0YBHNvVpFMHw=
X-Gm-Gg: AYBFou0SFdPzuVNqrlNSyb21XOocqmWSt+QW1CDx5+u8jpcgEXOZPOeVOjUQOHInUBo
	dxiYEtDRKpx9s4QefS9wPRIOAlqiDWglfUBYexTGxsLPrdVfyic70+zb5K8UxbSMVaFTI48pZPD
	rUw5XSfy0DRAGLrKN3H8dg83THirO8PUrnucvNuPjhg7R/5F/f4dCCX6EAW678Mq1P8z7KN2083
	D6tJ2pGAzY0K4P4SEnkS0Yv2oPK4g3aZDQAKv1AppzNaOnnDypzIS4WffJ4OU39mSd4Rmb3muYF
	Kj3qq8MXWVDIzfUgX/L2ExeqA3K3Bei9fKQ+0fqj72UU5Wiu1ZXxOXpNgr5mW5B8xgvYJX2lWmp
	ZERHp52g6qqe/G67hYzZY2wbvH/NFdV6+/A+rMB1OrderLG6Xj3+TsI2B4HyY9GgyiqZJkQ+spt
	QRVYueLUBIyeJyVujob1+ftvyyeR2Vow/MjkcC/Q127dLnxO/6d0QRXF0cAgrIHr+pOyc8xGd/y
	SVmhlevbunjbvL2HcSItwVvnGwvhKtSRq8hjFUHPapsNd2WEh0yk9jPzbXyAaSmGsmIKuMEOkEZ
	32JzF2fh95uke/PcbQ4lSsea94CLcczQ4qH4Vwq316vnIL1Ao7lQKLbTgk4Do+Nr71EGptdzuoW
	XRpY7HXUUpQ==
X-Received: by 2002:a05:600c:3e0e:b0:4a1:cfa7:e968 with SMTP id 5b1f17b1804b1-4b963c75b42mr68468965e9.21.1794227037216;
        Mon, 09 Nov 2026 04:23:57 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm10500318f8f.39.2026.11.09.04.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:23:56 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH 1/5] dt-bindings: display: panel: ilitek,ili9806e: Add Youritech ILI9806E
Date: Mon,  9 Nov 2026 13:22:46 +0100
Message-ID: <20261109122250.720757-2-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
References: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_042359_228514_69849C89 
X-CRM114-Status: UNSURE (   9.22  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add youritech panel as a compatible

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml      | 1 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml          | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
index 2080d9e0ffac..6f29ddc1fd09 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -19,6 +19,7 @@ properties:
           - densitron,dmt028vghmcmi-1d
           - ortustech,com35h3p70ulc
           - rocktech,rk050hr345-ct106a
+          - youritech,ili9806e
       - const: ilitek,ili9806e
 
   reg:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5471a06f93f1..ac2f54adde73 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1979,6 +1979,8 @@ patternProperties:
     description: YSH & ATIL
   "^yones-toptech,.*":
     description: Yones Toptech Co., Ltd.
+  "^youritech,.*":
+    description: Shenzhen Youritech Co., Ltd.
   "^youyeetoo,.*":
     description: Hong Kong Cybodev Tech Limited (youyeetoo)
   "^ys,.*":
-- 
2.47.3


