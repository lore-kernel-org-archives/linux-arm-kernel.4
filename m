Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B471606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DHd8r0Ik;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4y9BiHr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=T78nEvmP8RTyHYN9q4ooPSC+f+0+Xl/WE0BGeWSTHkM=; b=DHd8r0IkuxKf0y
	2S7L+2sGfs8wgqCekCZIYnfMwUYe8Q5PI7ODE9JAHDZ3Wcqef3mia8iTQ+g4n+7gShCC5sykGArw2
	QNalqi5q883O3boSl2hchrllfPTZY4fzWjTcHh78TcJeZgG35edC6ezkHF0cg/gsRYqVnGsWgnSX8
	/q+VeHWa2d1I3y+DF+lDgg3MRFkyVor4lUH2vhSvRAdFMmON2Y/1Ig9i+ohABNEiTCfpfzR8sv71q
	9tSadCGb1wHeBl4oM9u9YxPEgPL0BW/j3x2mk6UWaU0Rgrp/oWqh86Snhy2tAham+/mjOGXeW9zXF
	f+Q2AVBhkD2U89yy4Ehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIW1-00000005hAM-49Qe;
	Tue, 17 Nov 2026 12:42:25 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIUC-00000005fPz-17xj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:40:39 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so45580705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 04:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919231; x=1795524031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T78nEvmP8RTyHYN9q4ooPSC+f+0+Xl/WE0BGeWSTHkM=;
        b=n4y9BiHrq+a9xz/wZurQl3HKknOoOaDnYnWCGNXye8GtdQGQd33v7wkaxLnRUz6pTd
         7wJ12RORupePyRO4LOoM/cur7Vp84cNvB7CXjfrDsnXV8FmMWBu9/Gx3QRZ8/F+o/ZWV
         6mp9HfraEGvzv03bP5i0ZAQgesRlPvgk8oATDIf3PUJ1RB8hoKl+Wl7E6S33AEz87qXq
         DEJ6HNctNU2cM7CsXh+CVWmJG5ggPRCSswLxUKZcEeURGnJIxWcqAV5e6tntLdG3jR3I
         wFn/RCrp9Wje74d0jO44Da+7nndbi13kbyWEsD/xuFBdO+wvsDchIUmtYX0OOabhCcwG
         EAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919231; x=1795524031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T78nEvmP8RTyHYN9q4ooPSC+f+0+Xl/WE0BGeWSTHkM=;
        b=EGymbae4QuD2rGVk8Fv6h9WLf0fe/KsQ7j694TAmrKHDQ3ojLMxzgW3Z/jZSbgouwP
         obfXABN4vWUcSZtpBtNHHKFFgfOBiWkGMo6KSZdu575ugdVnRSzORwV6rD28WPQPhKwO
         D12bVLzvemLkM1fArHd9Cx59J7zEv7je87hNiv+umNM62MgR/ctC09HYPtWGGEGZIlaU
         w34D4G6rIXYFCky+/Fqpkmlkiic26qpjbnRl4BOT8abqp+z2JrHqCP37Izba9rCtQRTn
         QltwjJaQWrBg4NNTEh7ondr4sHz6N50QlW0HLCDTuIMRfTFihSPEAh9mlwuo3b4ombbM
         d+Dw==
X-Forwarded-Encrypted: i=1; AL+hErHEtoxWay/KAzpCKNlEgxahc0b0203LMjq1WTGZXYPQFAS9DE8vlf553K6U1fZZ7s5SPXuSNapquLe7qoLb111S@lists.infradead.org
X-Gm-Message-State: APuU4Z/VQidtMk0tclMf6ipPOW4co4RuVKoSouWLR2RYqAzXsJh97FKX
	xBfWS0kM817CWwnb1gc8Dvsd5lCgW3iKW7Y9KVgSt+FxaWaqLhflTTMK
X-Gm-Gg: AYBFou0HfQfEcNdSmcjdPowd701kklwq2incsYsZmEcsjs4rlItZ2Pr4Y271O1QHJ3n
	WQJLJfldls4aIkKAWC+A0Wt8QV65Jv/verttz7VWNmc+vwT15LRC5PORO5anYt6bpgnBCuDPOqS
	+HHMResgNh6tX4VNRONaVn+d8TFy7ekUNrSuc7vQhNQjVZnDOz3KycZ1+zugSJ75Z8TtVKrBDqx
	L29P7serbBKZMtzYPXyvORAdgS9AOoHnR9DuhLsXZSnEl1CC4G8afEOrhy6F7NDWKBfDHis0HdX
	3qMrU5omcZsFxjXYDKx+Lwf0/5vdjSCyaiiT3lrmXI0tQueBzKH9q86eVyWSzYIut6p5+TYMaqg
	wxUI58fJkEXRSxiygev+QBPDaRkk6z7t1wm0w5gQgE4wcmC6RgF9S0RzpwwtNe2jZPZ14dWB0Ww
	dY1QNfGHD9RxGU3+QbWZAaymVilLHB8As59Wbr2z4yhdnvK/2Vrn61/DKqoAzOhc7ZH1W4ePB0e
	g463Gw630mOGigLRSi4s0djjfE/lCdF6r07+83BcxODwavSCYjn5FVD4/V4e9E7pIDEmmqE5qoV
	zf0ZTeGHXuwwhAd2QmjL1OsUPImjQOhQizoem8IxRzo9bOE2/6nwy6KEmD10dhdKUo7hXnlVho/
	45rSYFBClrIk6r0KyqOu1Qn5i4G0FdneMaA==
X-Received: by 2002:a05:600c:c4a2:b0:4bb:7581:2bb9 with SMTP id 5b1f17b1804b1-4bb75812c05mr102919215e9.22.1794919230626;
        Tue, 17 Nov 2026 04:40:30 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:30 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v22 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Tue, 17 Nov 2026 13:39:51 +0100
Message-ID: <20261117123956.11981-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_044034_110404_EDFFF56B 
X-CRM114-Status: GOOD (  10.78  )
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
index 32e218c0fe68..ccd2d04c5a07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10034,6 +10034,15 @@ F:	include/uapi/linux/if_bridge.h
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


