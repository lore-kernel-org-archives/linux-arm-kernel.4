Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2BD606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X2JiWOXp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=X77qFgRN;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KrH2j1fN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eklyttWk1u0PJELvwASOzqqyz2Z6Z/tZtmPAub2HSPM=; b=X2JiWOXpClHKNS
	DeLd51xiTAYY9FqZVgiCIfnslsOIY6qe53DKGuhMRqP+p4W8P6jo3J561ZFp5q+4B6piL5x11FOhv
	b8raeubZFPNil2Yuy7ZJmblk26DNzImGfOj1cnHnIhkqW5eyy2HV5LeC+oZsSVNWUygLFo/d8hVtb
	Ueden4mwVOoB0iKIk4MvFt/YX9GRAALXPXm47uIgFQj4PuO6x2kOgdGyRGTl9TT8gpp3YHfaf+/JW
	HsY4Gqhbj9ZbWA30C0epp7BLt6/ZSrFIckDSuq8jneTRW/bwTpLcmLLQhZ5fBOjle4lDnxYf0t+4d
	BS7X3wwIT33Jc5hjqeAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQJV-00000002hwg-0p87;
	Mon, 23 Nov 2026 09:26:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQHC-00000002ha9-1P82
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Nov 2026 09:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eklyttWk1u0PJELvwASOzqqyz2Z6Z/tZtmPAub2HSPM=; b=X77qFgRNwvoC8AE0N/GvlDuMJj
	2vLZFEaDq6x2vLo1wTw9iX1KE1hgKHShYIomTJZd69NXHNsRlO98bFtB6U0T1Vekba5hRK74HidPX
	fO1h26N6yZMJyDzZf0MfwmZ5Si7mM1oF30Z0oVLMzmrZ29hkcILFDH9bMFymLI4KKC8l8ryW4EQRX
	jkdIOvgjVTtettNkw5x9f9pGXMRWVC9VvrVy6rpCAFUcurVY5RL7RF4o/ycxFDzMEb7j7suIv6wmV
	tIGpDkPGgsosMX1SDUEWYZa+ALn06RmZhN6KRVibnsJYoy6gRQBl2oBNFT+pHjtSxRDsL45VHkzHW
	NPvsAEag==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQH7-00000002uuY-3K8I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:23:52 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so1606281f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 01:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425828; x=1796030628; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eklyttWk1u0PJELvwASOzqqyz2Z6Z/tZtmPAub2HSPM=;
        b=KrH2j1fNmoiTbHtQAg8tJt0NUaNAv8q1NtNERwukLIUNunFulH6w7lU5aJwgBdzktS
         LQYi7vvM87Su80iZEXCDXURrmfvvgRF51IEEcil527hBVYrl/eZrShLeqFKYb2BCs39/
         jiIUcHnWfDO9eEL3CWoS7hFswE78bD2QVrHwP7+05+/sYe2xZXfgC35ooKiyctggCZ5T
         txlIwXhRhTdX5nY7yQw2DacsTVGtfUxGPlNqinwqxeehQOC3t/9CGao0z1XZ4m7Gc48P
         XGlCRlFV0QcB0WdFGIRO1h+LJTvf3mAuIYGXSfSSEbseVhs7LAHzFA9sG017PKzxu0i/
         QCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425828; x=1796030628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eklyttWk1u0PJELvwASOzqqyz2Z6Z/tZtmPAub2HSPM=;
        b=jfDTGrKhUmeOC1jwgBUDWxZlvETt66qqMq5T+mfgAWYmOSJJeqsn/e40prQLVdN0DB
         Jei/it8AeIfxZIi9lS0HKI9hd+7rWs5R9un4Y7U7qwkt1Wb+smjUVUVZwzyxhcfxDgbL
         rP8tljIT/PxWPZk5IJI/exHABgMfAs3NMqJyi4VmbS3CJ0z2YIc3BXTKiBULcP+DZ5wT
         nyBFpgp/WvEZbAQn+0nDbFOjb0XNT1KFaFydoLYfFAP3dBf0dv1hGRKWr7kwc8yh7vtg
         NiB/N0oasss+Rs7K1c9moxdBoCEoHtxPfWPs/xnNtjqZXPxCgVpwC9mBrfuiPBZt+AYf
         qPrw==
X-Forwarded-Encrypted: i=1; AL+hErGkBSZNIVleER0AMMGGBKvFgo1uXBapS8/WgQ0aPxtMCCgi0Sm9o2+QVmxhiNY23cC1TGoHixUfjignypW1UnPn@lists.infradead.org
X-Gm-Message-State: APuU4Z8V1tKYvcmxyDqC+fTBxJ7DBniEsdBG8XGtve1sSg6q5O7YvGPr
	VfnVCbq2B/AXSotGqZzaFsMbAL8Ao+JZcEHUy316TrHLbYvLA3jmZBaj
X-Gm-Gg: AZFdTZfF1UoqP1acsZSN5nAIoq0sGYzahj3O6hz6eFWrv5ytuEOJ6EmClbIeuQgNbq1
	MbQTuLNNVyy+QQu3QiOzwMqkjePgrMn/8iDyyVGqNsD6SgsSveKBEIzhuHXYTNWu3WXJNHPeKxC
	F6Ip3ah+9I+sl8eE/twFPUeqLtBbLKD95XjOfJaSkl9WSqZEBvhieZrzholF7R++zktattNd+1b
	FrMrpxdUBfJMD1WXzwLdPMXIwNbeUkQFgDbnCMzPO9oIG7JGcL7kKge45l7LtBS9cDJTq/EkGTC
	zt1kAoMyQ8HULOOiaoWPzkEltHPvVU3nWCZByvqlipQs+znnu84AzG1fXlOXCN+U7QsU93MwDfn
	44xASH+YdVuSWrP4GQ/lrPWarHGqQPrOc1Yf8sSbwWjNAJQdAgfbHrWMeEJDcnSV8abI8YSGJ0Y
	eWXOVrtnkSYgrz2xaXqTpNwWCv7fRg6nWIgn454ZASWn/rO9RmVvMsmBekJehlFWMwdTcA8OixW
	qhsj6zhs6EuhRf4ymKbdga2Jw7eapag2RHd+TnwFHcj+8Ex0umpozvMRyQoNvHYUXPef6ZyfvC3
	b0h02SHi6GpQdZJuVFYe2KiaoOQTb/NpxwSrlBb1LwOsgLmsx9subtnZNGxlv6PzD5E8Fhv2qMK
	7K0CkSW8dDndcUkRNves+qJAQ9/TaQMlPQA==
X-Received: by 2002:a5d:5f41:0:b0:4b4:510c:519e with SMTP id ffacd0b85a97d-4b4510c5231mr2688118f8f.27.1795425827893;
        Mon, 23 Nov 2026 01:23:47 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:47 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 2/5] dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
Date: Mon, 23 Nov 2026 10:22:39 +0100
Message-ID: <20261123092244.1792040-3-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123092244.1792040-1-virag.david003@gmail.com>
References: <20261123092244.1792040-1-virag.david003@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_092349_887416_695634ED 
X-CRM114-Status: GOOD (  12.41  )
X-Spam-Score: 0.1 (/)
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

Exynos7885 SoC has a DWC3 compatible USB controller, so it can reuse the
existing Exynos glue layer. It is also compatible with the Exynos850
variant. Document Exynos7885 compatible.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
 - Use samsung,exynos850-dwusb3 fallback compatible

 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 8af0143c3e47..f62e3ed82257 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -24,6 +24,9 @@ properties:
       - items:
           - const: samsung,exynos8890-dwusb3
           - const: samsung,exynos7-dwusb3
+      - items:
+          - const: samsung,exynos7885-dwusb3
+          - const: samsung,exynos850-dwusb3
       - items:
           - const: samsung,exynos990-dwusb3
           - const: samsung,exynos850-dwusb3
-- 
2.56.1


