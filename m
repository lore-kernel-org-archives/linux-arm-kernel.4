Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3019606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 06:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pqOzRoSp;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FsRJrQtz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=; b=pqOzRoSpo5Tkcu
	x0hD3WFZtJm+viekdNhvBVN+i4uaZMCzSygDkN0P60RV3lTmwygA69p+55koLfRB0zc7Y1tKZrASP
	hycTiHsGMbzTlvHGzX8BbhGnELU5jY4oJ3EupUbUgojXk5xtvqUQo8iwkOi1ED4HDDtklAyayWTBD
	oG0706KVo2HBdsbiuJcUlZJTU3X0H3I8o5044Ce70+v1DRFiAPfDwvdU6CVhByi9CP1hL3B91WB1g
	owqFMYhq5TdaXAkB6ZoobI5by9rtCLrwFT0jJsvIY04oup525Y+iboUDvCpRBF3jgVhqj+OnLfQeh
	sV560IRAhEqyfLrA+Jug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJIv-0000000HX7V-2lKY;
	Mon, 09 Nov 2026 06:56:33 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJIp-0000000HX3x-3Kxg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 06:56:28 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1a8cc11ac42so340812c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 22:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794207387; x=1794812187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
        b=FsRJrQtzb6IgDdS51pi0hJG6lQdCG4A3c8ETVvCOEkB+RF+5cho1A4y6oXll2KBeJE
         fw4EBGXpzcXeC0PZXnKh21nTy5M6o8zhy+ssb9h6591TYpB02DZiwytd9zHNSWOW09cc
         vTjj1JwgXy9y7KaFgawAFAcz9NMsaOIsUFloM8XFlrxx0etF+ydksulxJhR3LM96sg+j
         vFnrJPR+v5IeYYul0xxbbgY89iScokGGYCJt5uR7WJcBawBDqPf+B53xkZROPAPaCQcH
         2k3F1Ss5mMA6YXXI2SufBD1b1Gtv/LHhaRBJj77wI1QlbGBBNZXLE9gdrn5Sz6wTFznv
         5BOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794207387; x=1794812187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
        b=JOLsKUFS4WfIQ03ymuxi1JK5rYpnIcTSoFgrbxyUxsqtjNGFaUfpnuQsOjdnfWJqo+
         Z8V+fnPY3clnxSGvE/mzztaC5117oewEOyjmgm75aCF+gyTwEdEkWbPWqvCWtJF95UlE
         wX4hHyTXkaV521PAKwbx8qh0vYEyZ2zV8evuMxJQE5Yh9goZF/FfBTV/3LiN3ZoW+l7h
         sdfc2MIbxIux81Vloczv2Uav8x6YMgihYcIfJpRGINSq1e+eook0rv0dHh5ZRFxq+ujI
         eYO+b57nWP8rXrnGGZMXlwbj/2XWQseyva2kbhfsrXbmVFcFCaF2OTj957pE5TnlXpWk
         tvNg==
X-Forwarded-Encrypted: i=1; AL+hErHPKIUnFkWy7YN2c/0CWzs9iqS2IPn2uW6LksqT/N/RnyENwQT/06gF8hU8yvHG38WNirnVP6tqv23oFRRi1A4v@lists.infradead.org
X-Gm-Message-State: APuU4Z80h8mvePOmtBA47Zj+Kn+KhIOTjims2z2AtHQH3BO6fZJzEDSN
	YJoHVVHkAGU+Ow1/dR8ipq4HiO81iBhDFsREHhlML6zal32+vApcS4vi
X-Gm-Gg: AYBFou2rDUP9DrwPDpJgcUsTn0Qpq3Q3k+iMW2qYUdygAhu3bgSL5WooVPoeFnENtMn
	IdpNL4FkCMo8IeSZnzBCGTVuLik3Xso8rheblOI0PUKsc2gUzGbUfKoqV4qYwK4N0iIhFl2uqOZ
	cFG6XPT0CQ5JWCI7bvHAm302KM/khJAm+W3B3+kANjgNj0sAOi/VEtu+EQwUJ1SkGh0SJmaXIzq
	rtrU4zwLrP6YT44aQXz/KDj5RCMaL/FzQJ48AfCuRKIH5/UnFQ+BJ3NM5vb0A16tHMQB0DC0Mjx
	qEuV9s+AVERtIwVy7ZSRHYV9OrXqwo6IU6vyuMyonX9ofQtwmWilANcJPPXQkzP7dVYFkkkEEUG
	dB/PTBrqHeItu0DECT6AG2KwJImKQSXaRdkpEDOAWduVAYeayxnJeGfZzpqEOHemotL96MW6qqs
	PxTJ/DG/obod2QG1gkzcJvAHOzldsp/amSNUwMbcYB3ZDxDxovY/udpnwqhZ3yRYx+RLL19b7xC
	953V5bKegmysPwL5JyAOBc4wVxVX/mel56bQIHcdS6Y5dKcUV6ZNghdunuwdI9KoUo3d+f53Xni
	R9Mc8xhGvQaKqVxQG8Vp+CVfjqpFgLvxtsJa/mzXrNiJQ/e8uWW30uI+kxFcMT7z8PLSH297rzt
	qOFDkjWBHzePJLEjF+Q==
X-Received: by 2002:a05:7022:ec07:b0:1b2:557a:aa12 with SMTP id a92af1059eb24-1b39fe8762emr6494368c88.15.1794207387028;
        Sun, 08 Nov 2026 22:56:27 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3757214cbsm10120176c88.13.2026.11.08.22.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:56:26 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v8 3/4] phy: nuvoton: phy-ma35d1-usb2: remove unused linux/io.h include
Date: Mon,  9 Nov 2026 14:56:05 +0800
Message-ID: <20261109065606.62641-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109065606.62641-1-a0987203069@gmail.com>
References: <20261109065606.62641-1-a0987203069@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_225627_847948_7813A7A7 
X-CRM114-Status: GOOD (  11.19  )
X-Spam-Score: -1.8 (-)
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
	FREEMAIL_FROM,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This driver never performs direct MMIO access (no readl()/writel()/
ioremap()/__iomem); all register access goes through regmap via
syscon_regmap_lookup_by_phandle(). linux/io.h has therefore been
unused since the driver was first added.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/phy/nuvoton/phy-ma35d1-usb2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
index 9a459b700ed4..0b9976fb15c1 100644
--- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
+++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
@@ -5,7 +5,6 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-- 
2.43.0


