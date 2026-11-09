Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1018606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gDsaNd+9;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=SPI1mJKc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=d64Eeo6OXmswUP7TGcLfAo+FgU+WY3FNmOxdthXmfRc=; b=gDsaNd+9mFR15M
	kzMuIdR7OagXKQNl6jSjcqdDlCXCGSxWuOHdNSmhBBYnRD1ScBgBqdfB1n1IUta2DMfxjh9LmUsJY
	9/qtAQQt0H/V2hxOfu5jYgLIwKGyifp3IUA/Fs9jfjd3nDC+T2YtFJ/BYJnOQ9XgaPI+RDBpufbfm
	iiqNX+u7ObsoCtHaHGnbN3E0fT2FOOLFT4LiqbBy9c1E8bbLQtMBY7+M+1tbW1/R9ZK05GkgTRRaU
	Q0cSXbcPWnDFM6uKQxF61+hkUq0sYbwSXICAcCPDGOiOYfCatI+HXEjohuBNyW22aQ6dcRhaIi7wd
	1tMQPsFpcusvx87BWhHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOPy-00000000f3o-36X3;
	Mon, 09 Nov 2026 12:24:10 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOPu-00000000eyU-3i9O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:24:08 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48e4831c028so875463f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 04:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794227045; x=1794831845; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d64Eeo6OXmswUP7TGcLfAo+FgU+WY3FNmOxdthXmfRc=;
        b=SPI1mJKc+RNMcslBwsgOrwCuxBIRBAZYPxSdSLzESnizmOM3sTnsVMc2hessGvF2IG
         6ZMKf+AS+IbwCGBhQOdGKbNsNK8Sk7mYMVf4qQDZj9N+BpPadImVbaO7/W710QONVlGC
         J9Yy4w9cDk7U1DxilawVCv33h6s89OH8bR+ZZgmD6mKpiu/PxNnfFIcJXBElLdMToBqR
         fR1czVREthYBZLp1AdrBQyiMoIHGQ602o8HMaBCxJRviPLeLIG0dvSbFipe/EY5r7KYG
         Sav84bZOoS4rl4dAMz/HjVWE8/oq+skTZXJo45UMQMOhslZt9asxfod8dwc7PjqVDQjm
         ypFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227045; x=1794831845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d64Eeo6OXmswUP7TGcLfAo+FgU+WY3FNmOxdthXmfRc=;
        b=ethRZ33kjL1kkpfOGWZXAT8cd2I8X9aax2Z/xfDIrwYHtnNf3aV+vhyzOJI+fjS//D
         86A95Xum+1fQFqlB0wDroYZt1nvnEFFXQ7PWhp9TUa9oSaWYAmLlw8BBlsFWUR0H9PPb
         dMmP6N1LoWWrt+b4CWg9W8edop1AZTNrpof4+38KyG8gP+gIbFmwsiCpWk6F8XUOtPd2
         sNtro2H3f9RsLPn1Iupbm9flz96SVq+pQAyL5jLDTW+uo/AoyXmJeXFnlSfUt/zivbf0
         H0u+AC04v7pcBfXEMUzCO/FYZwDQsMR918+mY9ONZV6J/7X6AToc70ZioU6QAesdzZXj
         vwLw==
X-Forwarded-Encrypted: i=1; AL+hErH+ybblTEQn/Y7+dZ/oxJW8CVoQoqpccTiZqfb+i/YDwx3z+TFyOkMMP368tDbTRbI1HeXsgi/5DPcjqSVujUY8@lists.infradead.org
X-Gm-Message-State: APuU4Z8lnC8Cvu+XLOBHbDdwTqvWyX0GVojMnx8EDbcQeXod1TBWN/Q7
	qLJNvID1qpLNAPA6SHQqcNl5bLKgzND5KwTsSEcldtdpSZLWB7Tg6U/L4sMrnYcxQug=
X-Gm-Gg: AYBFou1DzdbY32PDwHmF0pkNCX9EXCG8apGsbrmtNcKDNWaFh2/ErDSIlYBfv3e+GDw
	mg22qwD17U5nfiJaWdEbCN0Ovw//nrGz1HhR2WXugj0HSvcajiE33LXCpADmvYWTfLDei7JVx27
	Ol+aDsu/iDbznthfVLgILJH1ZscSuqIHYVcfXvOFlefZMcEilEtGK8m7KScMVJFNqul4QrtgBgF
	ulMF5HAM7x0iZ7zOctq57qpzOgcpOcP4Mp5RhCLiXJZ8gser8DBgWCKF/6CKkUUGJ9RDBdNYZ80
	EYtML9SWtSWLpK3yT9OWjdzMgBsSVOXhsNyy2uYL1Ui+pNfBjgQKTcXcHeO84wLRdQsU6mKKPHB
	zPj7b28Dd+/odfUon2UioKNLIOK3dBSIjtXB5sOAFA4LlPb/e3tWm1LMO6oCOxHL3SBGC7LYCtc
	RGrkXhSTz5i5w1lugkC2Grkqq4AJUl+cpx98Lhp5/B8SH0ztiyGiASWvTUG8yXWpDMPwjsabBf3
	y2J54iBe1PNNTQFA2QZdyiQJHgwUKyQrO0f6/ADqmq57a83N5eQOt0vYHps1RC3yK0hteQKuhyd
	t+uVEi68k8wyw7+AMMdhhb+qoZbrLCrQls6vZptS6iDnyPaZNhycHG3b0cLFhwvoYOJoaV0Plwl
	7ZfTyi0Vr9aY=
X-Received: by 2002:a05:6000:2488:b0:48f:db47:6ebf with SMTP id ffacd0b85a97d-495852178b9mr6692780f8f.38.1794227044813;
        Mon, 09 Nov 2026 04:24:04 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm10500318f8f.39.2026.11.09.04.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:24:04 -0800 (PST)
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
Subject: [PATCH 4/5] dt-bindings: arm: fsl: Add byteENGINE i.MX93 platforms
Date: Mon,  9 Nov 2026 13:22:49 +0100
Message-ID: <20261109122250.720757-5-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
References: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_042406_952919_0342E0AF 
X-CRM114-Status: UNSURE (   9.78  )
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

Document the compatible strings for the bytesatwork byteENGINE i.MX93
System on Module (SoM) and the byteENGINE carrier board.

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 Documentation/devicetree/bindings/arm/fsl.yaml       | 12 ++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml         |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..d342930981d2 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1555,6 +1555,18 @@ properties:
               - fsl,imx93-wireless-frdm   # i.MX93 and IW610G WLCSP (Wi-Fi + BLE + 802.15.4) SiP FRDM Board
           - const: fsl,imx93
 
+      - description: i.MX93 boards with bytesatwork byteENGINE and bytedevkit
+        items:
+          - enum:
+              - bytesatwork,bytedevkit-imx93
+          - const: bytesatwork,byteengine-imx93
+          - const: fsl,imx93
+
+      - description: i.MX93 boards with bytesatwork byteENGINE OSM Modules
+        items:
+          - const: bytesatwork,byteengine-imx93
+          - const: fsl,imx93
+
       - description: i.MX93 boards with Toradex Lino Modules and Verdin Adapter
         items:
           - enum:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ac2f54adde73..95f386db1d01 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -285,6 +285,8 @@ patternProperties:
     description: B&R Industrial Automation GmbH
   "^bytedance,.*":
     description: ByteDance Ltd.
+  "^bytesatwork,.*":
+    description: bytesatwork AG
   "^calamp,.*":
     description: CalAmp Corp.
   "^calao,.*":
-- 
2.47.3


