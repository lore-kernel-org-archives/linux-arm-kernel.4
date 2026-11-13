Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90921606A8AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sQ7ylekc;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XtD9VEup
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=; b=sQ7ylekcB88tvN
	tGKdH8EY2jH4xVUQJHkXnAoGQj58zJrBa5tKkfXBr188R/5aCpqfgK/pSxh+xKVsUjW+vN2iyeNHJ
	DugIhLeMe7iBd3CuBcvWCJyJOq1wVjmF7hwmE7jvKiWy/8gw5hzQV84aiOevhij3JEfJWzjf+/asY
	G1dA8zEFBF8jxqCWsjOKubFPd+vAwmV7qvB57WD2U0sw1qnc5oGCsu30P8lwv1JSUuWRcbl1AgCbd
	4J9B/KspuVeei083sz9icyjQPdCQVTkOFa5qa60vKZAJqt8d20uHsV81Euztam3dDA79KsGekZli5
	5WBY2Eft7y/UUCC3Yvkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfE0-0000000BJj0-12B5;
	Fri, 13 Nov 2026 00:33:04 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfDu-0000000BJWw-2vVL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:33:00 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-49a92144733so120792f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529977; x=1795134777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=XtD9VEupLL7Q6NRec05o0Xn3z9JRZ9ajE5HKwzQLtFDGRiC8LyZkHHyuoPNKUcqDUI
         TULU3EX9rwiQFmA4yNK4yRci0oXsKfnrlJfaxS8b/etvaViy26SSW9CMqEhDpUrxqFQp
         18oHRNh/D6sEO+NyevcqWjflczkDWamx15RV7Ii9lkuwFQ/0bU9CwWvQrPpDAmazA9cW
         Q+O9jXNAlBty0VkMVegvAiaQAOTUsrIuWJyc99lYwxY4QarMZUwo2iDIX3GgfxYXBEEw
         /qFEFemd+8cwWdH7JGC0i6ZjEVNFRXNptjXTTPWnDySpZ1b7aJPpjN0uYV55ww+O2wsu
         WMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529977; x=1795134777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=kOnLTZ2HOCvfHgggG8/XGbIeVTTstFpoablrpZUFrD+Od+1MMNSPsknDxx9t5YgLbV
         j175fZjAJsMOKSLOQbEvVIQB+nZqHhfmeaPug8QyNc+iVG9CLramEd+rAZHUSm+qPMir
         opSO6rInYEMTlt9c/xjC4jco1sO5QZT100Ym9IACL+6C3ZbF2dqOgvg3TGSDD2RbrQQG
         D9oHp+9KzkS1RR84YMBnRpoTOtddGsqYQqY25vSupCms1uIHDGNgE2LD0/rDHNHHFB7M
         2PssgDSa/JPfYZcN+xHjiZ3hBypmFLnmzig0VyUA0tJUNHROxIzNW2mzmYLDiAGxfJu2
         KjYg==
X-Forwarded-Encrypted: i=1; AL+hErG3FWfgsDE5xdlfwuZNGThwEfL0Uvppv1HktqyT0gYB8FePvxeDYL0/zZYo1d6/NNWwWpit3dy0K6/1bspgh97b@lists.infradead.org
X-Gm-Message-State: APuU4Z/T5I5jpD8hvWfPwr0AkzM8k3PM+9LqNd56xblm9jmGfDR7tR5e
	/mJUYZzNVEiXZmZ1tmazCXynkfSj4Mxe+qnYXRuew+rVz3fJ/8yccCAP
X-Gm-Gg: AYBFou0MW1BPLgcS/fhWhz05PYDupTo34Gbfy+oAichIBYijiEr/R0+cGr/kJWv/Xdy
	DfI9Ibduzz+AC5FH3AVXvwEZJFDE+2zbr/8zcUV4+DvXTtQ+huqO/OXxiXOFJWlD/7ijSxq9/Lf
	tdMVQ8XnKYDdItLalUOUM4R2ka4TW2L50Hg/b/8ltXUIlQQX6Hrth2A23D/F7X8JgcA44IewA3s
	mcuFvGg+YBXqaDtkGQVKv+jbHEq2+DnWVhpt/MS2D88hzkodI5JlKTQ7IMrd/a4hPgK2Jzocuay
	H1+UG8EADrcSzlqRalRGlAXJSyv/0TfIZTa7+OEidbKLwXHZyaX8gcwtvHjZf7hNV5Ng19ghQ3J
	E9GWXDz6XeTmjpEbL5nMeERsqgT6aS5h372Rh5BfDKckkeu4EQgDGUfC42bH1sMWUTzs8fcwKyf
	po4kyH52GDyup+0wCQWTUKXhbOmrSlDH5E9lnly14Je35Rujtd7krCvvAb+1HXJLbmpHE0ziKwf
	K9vSD857MdEt0V7fRSea8DblZQi5OfPqH4SOeQHyYPCGpvgZZv2SNlm75g/Jm6wUSsfOUfcpSBO
	aBtMEnfVEUjqHtIdC/sMmkRj/Id9Suyy222YglzsD926z+u3Ln3FGgRxVJrHzdv0sfRvOWsEWh+
	I+Jn23z1EvHWGyHr/1Hyf1hlVmRoEp5U3dgtRqsJRLoyjHRw5HNj4Ww==
X-Received: by 2002:a05:6000:490a:b0:487:1662:cf4c with SMTP id ffacd0b85a97d-49c6dc01394mr2183917f8f.7.1794529976835;
        Thu, 12 Nov 2026 16:32:56 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:56 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v19 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri, 13 Nov 2026 01:32:01 +0100
Message-ID: <20261113003217.197757-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163259_116256_DEE91A90 
X-CRM114-Status: GOOD (  10.47  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 893b0670a7b6..44c116f6cfd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10033,6 +10033,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.55.0


