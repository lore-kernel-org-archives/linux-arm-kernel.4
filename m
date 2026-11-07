Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCB8606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 08:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QB4IosuT;
	dkim=pass (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=O5kEdMP3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x6OX6qz/WRgS6n3RRGF+EeBHclWuHgdA/NrgibX9lXI=; b=QB4IosuT6p3zC+
	SM4Pw2BvQ4NyWHhqqhcZDr/LIXfKEY3ZEjqygymYowcjYGBHlK34/oMo3wGvcQSIRj0kW1PvBjIRs
	gsP9jebpVAzsLCnjkb3jg5bsJX6QmSOC56RCPEJXF82ARKkqdi0w/sB16CIOsQr3CyayVh/+Ykkm5
	c2d7/mRr2M3nO0McQI175GDfK3ukw9wv8QuyACa5sM5WSjxcKu1zTGaWqgu7eFgWSDpU8bP6U5DWZ
	fOROjYgMq77GULvyVkyedlvnBuUZURV/U8a3gObbhngqBgZRJE5OmiOiqFNfi/NI/FQXTHW0VhXCr
	6sKTUVvUOsR0bB+N+GHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPbSW-0000000ELw0-0FxS;
	Sat, 07 Nov 2026 08:07:32 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPbSG-0000000ELoD-0IOc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 08:07:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so14679105e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 00:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794038834; x=1794643634; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6OX6qz/WRgS6n3RRGF+EeBHclWuHgdA/NrgibX9lXI=;
        b=O5kEdMP3yj36zn2nKsG+uW3/U/LkeMs4UQTSvQKBygIyGMj3yMY4eYMFRuJJlI2lF/
         PwNsmWx1/8XDZXL57cSYrUXSWGHIE/zg/uwDDvq28c8NXBPZ88nNj6QxG8OT9L5ez55y
         8kXVwJrUmR0Q7C3UW54/08amqDXroX1gqAvPm55O+uRI6o/R9wKeq6A3sQakF5wcALS/
         kVXNlh8kSkRf5GoStHyyNXVTYWPNvbchKMwUGHH5yXiN46su+FJPdZmdTTVt2uqCTFMc
         JUviGeYzQhaVxZsG+EuOFCVD9G1l2DJDP0wPuqTqms4ACnnv7YSVrYUYZiapUomPt86D
         lhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794038834; x=1794643634;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6OX6qz/WRgS6n3RRGF+EeBHclWuHgdA/NrgibX9lXI=;
        b=XFWKoPLKUZuYolHCr7aquX/gSAkxZ3sUrrUhch4/sVHKYziNSBUjlMKnl9mlpy53hc
         wi7Flgt303/9/RrOFD3rUg2IdwWJlDHp8EIFg7fUWg//Vo2FbCzrUsuqa04ZZak/ILsh
         2nUGWcZ7dSfqwBANwOik/x947a7Xi08q6et0rB+3x0/fUvNQ3C2jaDY3TcKR1aTSZyrY
         nL0Bw0GBogNOBcPhzmHmpC1sewwGOwLLDz7JDwIShVtBgsLjtvmC7WoKgZEB69DXYG1t
         SDfO31pHPc7mbTZlJyWbLx4jcNqG4VAxCaUeNGA7VFOWubIafIqW7DOQJPuWMCSC9rgh
         X1Xw==
X-Forwarded-Encrypted: i=1; AKwUvBxhL64SpHg4G7ja2hKBy7yrQmp8JFjklir+a/pOyui5sJHvvrVl2qAQSKrldA2zbmX2DV3za8znSHYcCural7mK@lists.infradead.org
X-Gm-Message-State: APuU4Z9lYzzLCbdjTY+o9LqWybf5rTY5EGOJnw0FQxlwur+MMrFf9UBD
	aEePvBEM5+ILTMxWMvPSIabv4Nqybv0v1j0hbwDJ8L+BS37rFWz2y6nZ48Yo1VKeFbaI
X-Gm-Gg: AYBFou2Ct9idC+e4p2OwjoG5avtITWpLT7deM1hrgpHfob30UCkqBqnR0cwf05DMy4r
	acIJIDVv9PuaKNxnJx/twxyusBCo0jf7U3ybsD0+f4oVAmKGPyVoFq+P5FlF8xBjLMbMPGr2wp0
	RIDrblSp9vGiszkV393jaNOp2MeyThMFis0VQymQBg8CRZnAXV3bWeEmZ+IfIhyy/qQJVLa9Shz
	sqGiBvRMlT7VwqAtQeS9Q1weUsgtzEVCphr6CB7ywMlHfI6gYL+kfS6EHVALRW+sFFuaa0YQBkh
	JWzm/JVaYH17xKSuXesYvkf2OqkCcv6KqLRqB8spR7DJRFXqawTt4SKXDRPT5alTjk2234Gtwyz
	6CXr1RwIS/kni8oL8zgMGyBL8rOkjrhHa70pIUQDzdAgB7sS5/qrS6Z4avDGXCJickkgsctw6pt
	HRcLQA7yNO1L8L4LXfRqyMRlSNcsiwbcUfiEJTr0omv7EMxKn15OneZazo/b1AxVGgt8I12jMeO
	kVmqvjAqWKuDDH4qivvVB9zFwqtaqOGiNX/9EltCL1jdjf8TgyZV2CVjT5FTruk09ZPbaqv+2Nv
	Krnn0Ubg27TjNETbhwbq3iZp1pi11ih7qOYGajeStLln3vgN6zVU
X-Received: by 2002:a05:600c:3f0e:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4b6db0d060fmr83181085e9.2.1794038834255;
        Sat, 07 Nov 2026 00:07:14 -0800 (PST)
Received: from jp-linux.tailbfef0e.ts.net ([2001:8a0:f59c:a900:ea06:fa16:f0a0:9d64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e327a652sm43927455e9.7.2026.11.07.00.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 00:07:13 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@oss.qualcomm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 3/3] MAINTAINERS: add Bao hypervisor entry
Date: Sat,  7 Nov 2026 08:06:52 +0000
Message-ID: <418eb111fc016706fb64ec91cbfb077ce31e4577.1794038390.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794038390.git.jpeixoto@osyx.tech>
References: <cover.1794038390.git.jpeixoto@osyx.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_000716_237492_74CFEDA2 
X-CRM114-Status: UNSURE (   9.86  )
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

Add a MAINTAINERS entry covering the Bao hypervisor drivers and their
UAPI header.

Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v5:
- No change.
v4:
- Drop the arch/*/include/asm/bao.h and include/linux/bao.h entries (the
  files are gone); use the directory form for drivers/virt/bao/.

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..dbea081447e2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4712,6 +4712,14 @@ F:	drivers/video/backlight/
 F:	include/linux/backlight.h
 F:	include/linux/pwm_backlight.h
 
+BAO HYPERVISOR
+M:	José Martins <jose@osyx.tech>
+M:	David Cerdeira <davidmcerdeira@osyx.tech>
+M:	João Peixoto <jpeixoto@osyx.tech>
+S:	Maintained
+F:	drivers/virt/bao/
+F:	include/uapi/linux/bao.h
+
 BARCO P50 GPIO DRIVER
 M:	Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
 M:	Peter Korsgaard <peter.korsgaard@barco.com>
-- 
2.53.0


