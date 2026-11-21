Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75358606A6B3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UNsqip8b;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=btuYyI1f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EI4oW8pj7RcZs8NTrnTJQwYJ6BNsBnrroZ1HQMORju0=; b=UNsqip8b6KhpkK
	7ag/bQ3M1jwyeI7Z9OIjMXBDlWgoYa4JLEUbvnuYKlSCWjXeRBgdMZTkNzFEdnyVc+4rLeRy02ZoX
	kG0EBA3fX5dtKSXtNvWcM6Ec0VWkHdYFqwokIq39oaVJnNts6WB3hMu9Q9xCoNEIvDLaX4UPyeWvj
	i8JkMEJFU7EonmRhRBgiIWzS/A33H+LStwmYn4zt+elqF0Df+L39uqB5BJu9soAG+vX7uC9elN0Tl
	Pk7V1Bi6CE5PH4fIFy+XS5KCXWTr5qSe3iLzDzMe9Z1OlDXugY3yMOMhd+6LAbHuWw1oPNtVDRzzS
	Q2zQVZJtIjxbMkUG8sYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYxX-0000000GVqO-0qtx;
	Sat, 21 Nov 2026 00:28:03 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYwX-0000000GVEs-3KMx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:27:11 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8a070781f63so792075b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220821; x=1795825621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EI4oW8pj7RcZs8NTrnTJQwYJ6BNsBnrroZ1HQMORju0=;
        b=btuYyI1f4xfMPERJCQzmoUmbSEawsrWszucvGmmtwH0hDc1QMYe8q4NEJNmxNLkJSK
         8XLsgAVdCZdz5VgmmPul+MZbhmgD7G7EdIULmGr3oey7UQ4JTbwt5ArYR9RKS2rsC9vW
         G9SaqAG//ZV/FYNd8ZFA/M54B7xq/3riv3sV3eO+P9VrE21WjIASXD3qCYDF9NQtT0wA
         7Q0J2OIrOZIPOrioHmKJDSzLuNRfVjFQ8tG7GHpA3IOOOWj5fx5qHRC0BL9YCyQP6U0N
         o47vYlLfqbVddrShLGr5olz8+xgctMghjF/2Hpl+wgOnhQeFicCdsRiuZ96pG+zKCEsQ
         hJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220821; x=1795825621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EI4oW8pj7RcZs8NTrnTJQwYJ6BNsBnrroZ1HQMORju0=;
        b=iI9k1JFTNRT13pX1LpqCjrcg0fINDHskOPSgJCfjGMN39DHh+snSMaImxNT9xpSJ3D
         0rmtCaWCBoUS1Oms08qBf4HKVa+m11dd+Js3ASyb/dfaenU+8aABlOql9w/OGRq3DU1C
         1uG5OK7Mcqlf8I11MY8Ldb2y5VkCtr6rUYIcHYfIHGAa1ykeYBWumaRfYKT6+0YeEano
         zAyatYZICR5Ow2VunD9jVdBUYQF6QNDSW2aF2J+y2DnbIDPqIC1z2FLGKIJw4PiuMC9Q
         15/MXCfuah6rJ0JtscCkqCwD5nx1y87LdIDup1+AbW7yKwAcAwqRvK8tmY9GraN8h5w8
         KJXw==
X-Forwarded-Encrypted: i=1; AL+hErEu80BA9Jc7eetPHkuQSSs1myDElUylWirKWIv9YQR+wOoVFUqn8skPQVXbksGpm8MXate8ysayJ8eU5WjOct10@lists.infradead.org
X-Gm-Message-State: APuU4Z/MgE5Uq+BrBSRg1iy40KSJkEbing2jy71gypMA3jGZTYGhNq4e
	iMFpltmx6h+8+72mDz2/3nZjy1L9yO7My3dkwBicy3lij4kso4c6nEjb
X-Gm-Gg: AYBFou0J+pX0iPULSNK3p3HjjbY0V9PY2fntqD+7WJ1STHZGMyyTcbGfTry2QCaZlzY
	NuNjTStFpkNGLuFxF+ayNcDBh/6UZlxy26pFEOb3lNQFMHuqlG7glgs6OjXyi97qbzGrTah+uIt
	g6DcQkWA55HIKbamzBPaqPqWfkEVJiXdRE/yAbHVktenoCcQ/+uSRGnQ5tG4njMXUrX3t3Qdx63
	2aOwEL6J4W6iWnY0otJAyA70+OaFw3fOxtC0yw6upyVUCEbFUueSY16S1U3fqxyBp5kX+51ixLc
	naZ+xZy7QnbaZTiKVFugmUAgp+WA3OIqAhgdMWc43+OHFPkJkkBr39EY6MFuVmkqdFrUcj23AgT
	WdsidWzw/0QG2odeQUlWJQQJlK3/zb2AI8fa6B0LY4zapefc3jnML8egDn1XV6oc04/SrNaRkjc
	lz88x2QnwrT17yGSfJcG47ZBjxADlIgQ6JBCPqAYb3axdHyTpFUlmuzsCuKFhrP/ca+dQJPmxVi
	1ihauIAtgjIUMlaj1M1hcZnAdk9D2pliDDsbCMKW1zKZYZHOCFzynKQ7r9MA5lhL3qGj0xV9Ykc
	4Oo8q3Wf3T2DMckZUEtoBbWX/7iQtO7b5vU2crld/C8m/j971lDeFnFofRJhvivo1nR503UONgn
	ji+iP01m4vjUUh76CKbvwlL+RCz+jQvJ6+3WBD2LJPtKNFMA0Yx1XVpj94BAMSIOedpfCAa+IbA
	Pd4g==
X-Received: by 2002:a05:6a20:5491:b0:3e5:396d:1f89 with SMTP id adf61e73a8af0-40148fc2d8bmr4947552637.6.1795220820835;
        Fri, 20 Nov 2026 16:27:00 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfc8829sm1925230a12.8.2026.11.20.16.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:26:59 -0800 (PST)
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
Subject: [PATCH v3 20/22] ARM: dts: BCM5301X: DIR-885L: use gmac2
Date: Fri, 20 Nov 2026 16:26:00 -0800
Message-ID: <20261121002603.25254-21-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121002603.25254-1-rosenp@gmail.com>
References: <20261121002603.25254-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_162709_797300_83C0EF75 
X-CRM114-Status: GOOD (  11.23  )
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

Commit 473baeab9294 ("ARM: dts: BCM5301X: Explicitly disable unused
switch CPU ports") left port 8 as the only CPU port, and port 8 connects
to gmac2. The MAC address from nvram is still assigned to gmac0, which no
enabled CPU port uses. It is also the et2macaddr cell, which belongs to
gmac2 by name.

Assign it to gmac2 instead.

Fixes: 473baeab9294 ("ARM: dts: BCM5301X: Explicitly disable unused switch CPU ports")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
index c5099defe9f9..b64ba9afa736 100644
--- a/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
+++ b/arch/arm/boot/dts/broadcom/bcm47094-dlink-dir-885l.dts
@@ -121,7 +121,7 @@ &usb3 {
 	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
 };
 
-&gmac0 {
+&gmac2 {
 	nvmem-cells = <&et2macaddr 0>;
 	nvmem-cell-names = "mac-address";
 };
-- 
2.56.1


