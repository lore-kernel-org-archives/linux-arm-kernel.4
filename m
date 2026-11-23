Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0613D606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xsyartGl;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IokFHjSE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=W1F5qjrP9rUJxl8cI1giD3DqF8jJKuOTOWSAgx1WpZI=; b=xsyartGlSUdpFg
	SL0/cjyEiKQUNhc+/SFtSV1K5lk7G23NKDJP69ZmtYCLvf6uyv9kOPZ5oluHjhF+ouNwh8OnQnWYm
	/Ai3E5DVHxv5knOG+mO2rCEcJfYUCQqmpd2zuM5lsEm14C6DvZeaYLy9ve3JKrEmfADw/N3AUpWXL
	uibt9IJGQhqyHryzrxJjgN1mj0TNjuJPwdwhwFkmikShqidfXLHx0HqBclduvIfpBOv95pai5r27N
	IWIlOqJLQP3vGh2yKJhZ66H3GNvi2DNPjgozrN55CSBQ9rOwwsb+PnP4WUpUfAeh89oz1RPdMcOri
	SmfmBatfgh7j7ihp/Y8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVY49-00000004P1p-2y5E;
	Mon, 23 Nov 2026 17:42:57 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVY3h-00000004OtR-0Jp3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:42:30 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-571c36e48d4so760562b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 09:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455748; x=1796060548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W1F5qjrP9rUJxl8cI1giD3DqF8jJKuOTOWSAgx1WpZI=;
        b=IokFHjSENnSouvMX5i1gj8f8J5hbDrGkFleJi6N2pVLN/+ldQT9JQahba+uQ5v1zOJ
         XQojF737GYibMyTOfb7ZNyq4tsW6YsC1UtKm3j3ygxU+rRD84havShsIeWNCimBxuXM1
         DU8dbSrwxV8TwP3W6vLaJB38xYsR0qDAcyvsd+BABc72wGRc+SaXC7BXDyqd5BPw7cwM
         Y5vOwD9WYIh8i30lqz66ikCBe2COvNA1Gd8OY24SDK/vDP2yycu8v8Dd+qpNvEwS9bHZ
         k4L76iQINbu1x3PC1wbnBtpDDd3C9gaAXlXOE9JI+xkHUp+QTKU8oEjxrYfHlaBDrphi
         rYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455748; x=1796060548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W1F5qjrP9rUJxl8cI1giD3DqF8jJKuOTOWSAgx1WpZI=;
        b=IIs0+Jxl3RzNvO2KXzLjXIPDGWrY+NVw88Go9IvQdUBNozaV9xopweqad+TLCACUVj
         G6y7XCysgJ3DkxD7KfJHRY92RW1Y1Bh19C3siV3aVc23cfQxWSogp1/j3jZqAA1nRtwq
         9l1rUe1oP1Hp3Ley9z2o+lm6LhewwAt4WMBDMrAKoxj5/P2sYiLOIo7CbvalIe0DNREZ
         GUs5hbEOj1gjjciemMyEzm+ievqfINbAzaUhVnQ/DFdOiAZPCCSvN9ZuHVTvevOG5SJ0
         CibqPEW2Lsabsuqn3uYZ1m4+uGrPHR3rYI2DW3XTHNETmcAqSMw/NTJpcigEzYZP50AQ
         p8hA==
X-Forwarded-Encrypted: i=1; AL+hErG0ZIpyG2mSO86TE6SqAnc/sr1sLK+EwPbqOHoTG+d8y9RDpmARH4ooy2p3uBP0WMerRDA9YdvuKU43z5fMl2Yx@lists.infradead.org
X-Gm-Message-State: APuU4Z+YL+mp+tjuQ/3/4SKX+ujPGMkB0DT9Mj1enqOQnMmWXQ6lgCKK
	TOq7X3/WqRDnyTPcNecu9WTRPqJHPcn3Xc6tqQ6s1xvqFGPxJQrQusSh
X-Gm-Gg: AZFdTZc2T1yf/sfkMl169dYVS2lcBo/VQXHm1OW0V5mSKB3SzfGJlRcA1iUhKZAfCyo
	BNWpIEz+N/1qxDdY6YM7GlAd5pxbjhBb5l/LPouUE86f42oWEUXwiQYTGrs4bJvwdXIqJEXZrxh
	cFsR6wqc6EYt6e0YmIuTyGQqmF8pCIx9ITYN77pCeWb1C6djS3NWc0ia3opfuYNMSK+VvIbO6Of
	XtZkyem1Hn3PgsU5oCLVvIMmXNfnjjwUH8zZ3j53oKN7bB1HbTg2Ex2iv6VUhzGaIcHlMiLXsZ5
	WTnvEC5E+jqDpKrxt5th/NT/CsbnAyNInEDGWT7aYKm+qkcbRCQegNL1/kIWZNebVcSHWNpKjGx
	touUMnSm8BvHFMnetGO8hFexsFzga1BTM+1KvwEOvb5MmHU3gXdOQOMDoJRHRICZo64CA2FS8w2
	e0jeA97hK76fenJBR3PqrTBVv+7Ythc61uXCi3Xulz22SLSd1s2ZH5UFNz5lqrcSPMo6dKV/o0r
	9lomHQU5a2PpxrQABpRjp1M0y3UYgzmDyxS30W2BubArTW9XAwt2j8wWIUfJL7F08EN8p1FkIQj
	FVcIXz2PCgEpxTqBogpLGWcS5xxor4p7nLDs4foRnHVOQyqm8lFnqFTw7hf0QR1iSy4gVYYD73a
	j/4F0
X-Received: by 2002:a05:6808:6f97:b0:574:34da:2992 with SMTP id 5614622812f47-57a0a93033amr13407130b6e.27.1795455747731;
        Mon, 23 Nov 2026 09:42:27 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a35e5ab03sm9481238b6e.16.2026.11.23.09.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:42:26 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7A and A7S
Date: Mon, 23 Nov 2026 12:42:25 -0500
Message-ID: <20261121-a733-cubie-a7s-dt-v5-1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_094229_142037_8473F218 
X-CRM114-Status: UNSURE (   9.35  )
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Document the Radxa Cubie A7S and A7A with their Allwinner A733 SoC
compatible. The accompanying A7S DTS uses the binding, and the A7A
entry gives Andre Przywara's upcoming DTS the same SoC fallback.
Radxa's Linux 5.15 A7A DTS already uses both compatible strings.

Link: https://github.com/radxa/allwinner-device/blob/6d911d1582dcccdb5a4c38be8d3c1ee851019795/configs/cubie_a7a/linux-5.15/board.dts#L5-L9
Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---

v4 -> v5: The only change is the added Cubie A7A entry, requested by
Andre Przywara. No Cubie A7A boot test.

 Documentation/devicetree/bindings/arm/sunxi.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7da84e2de748..c2ac34cd32b9 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -857,6 +857,16 @@ properties:
           - const: radxa,cubie-a5e
           - const: allwinner,sun55i-a527
 
+      - description: Radxa Cubie A7A
+        items:
+          - const: radxa,cubie-a7a
+          - const: allwinner,sun60i-a733
+
+      - description: Radxa Cubie A7S
+        items:
+          - const: radxa,cubie-a7s
+          - const: allwinner,sun60i-a733
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc
-- 
2.53.0


