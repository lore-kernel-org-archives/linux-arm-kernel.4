Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67968606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A/sjo8/1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wmIByTpK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=; b=A/sjo8/1x7vJTA
	GLqjL1tg/fFI8ABAdf9YQAwRQqvIHPYvYvxnTSGMhpKm1jq8KEey3/ytcZL7pzo3BAorzzDyYBEhj
	TyXFmX46h0T1pKRlZpLuUmXo7oBxbgofYcbMP6zASdxlJ78gLtEdmn2V4lH1wWyfdYSRo0f6S5Ybc
	agl4bTO2RKfyIIDSeUs22FTcn0oDnC01J1Rwv/smQa0yKTkIYh/NuOVltY+8VRVEmYSFFyAuL23CF
	G3IO59FO6p60CalRIbgBXSmTI7o8GMnN0yPD1dO2vpf32KT5R1JYelLD/r49qeQfqWN0WTNJmy99q
	1iuykyhWNN5Rdjm+lB+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfj-00000003FrZ-11iw;
	Mon, 16 Nov 2026 16:35:11 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfL-00000003FQY-1vnF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:34:48 +0000
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4919a880834so1864602f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 08:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846885; x=1795451685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=wmIByTpKgqaF9HQlweSgnr/U5eEcNVVDj9lHcz3bREPrMrpo1TDaH36IAYhA9/9Ykk
         FSpHw88KcQ7dPp6DexkaX0A+lllSzcFullBkpwrqIr7UpdzNO/m1mQtH80F5IjjrHtXM
         Ugtz7doO9EGdKrYMw4JB51COvLH8N0sQ15zjkUE4kVf7H6UscirhTY/Vd8EU1o0H7TNj
         gNHSXcZZ4eMx7hWJt/40YEWDGX9I3XYMPKC9IetUmemTu+5H/Aeq/exg/rVyOw27CZb4
         9Icgn7dea7U8W/p5Me3bLSaD/kwZMRdGF5QiVKqqryLEMtZKly61ng+QSemXgc2Y/Vcz
         eXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846885; x=1795451685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=geHgxObFWVvRZemosAYU/Jzp3fHhQwXYyeBLmeYyX4s=;
        b=ThRXSMb4mIVL31Hvzd5TVKWU6jLHN8XtXlW8gVcHjEuUlAtE/UwWHxKpa1gZakJZzx
         RDhQnAwuwyo8bSaGpzJGW5wZJkE0sE973KpX5nCqo11ATIbKnWLIGBn9lm9mSl+ltvTK
         h3d3Gn2sL+p6lzDNvXUiS1l5biGKsMisAZ4J0MF2wpY7YjLCffwQZFEf69S5/JVonGJj
         /u6EptGH/+4g/c38KFhv5Tos/1xc29xTHABNmMLZKyoyJw7NBL/j7V/draDDcV9XmcDy
         +RI4Zutr6ZHy7rN/HSJru6NL/aKr3RP914viZ6Y6OKTogA8BE0dQQQKMbqfpioevrLqz
         a5jw==
X-Forwarded-Encrypted: i=1; AL+hErEtw8BULUuk+pUEf3nnDNgiOeWDF8/L2HbA01m12DJurXBEOd+QdFAYay555ZLVd4kG89o89tcFCvMRaM4q8NlQ@lists.infradead.org
X-Gm-Message-State: APuU4Z9LlJS5A3dLYCs1+6xykqJyIGen3eK793hzTvrVE81fvB9fNTx6
	H4OM86nCuL1d3V9AfblZ0PfpKuGTVhP32JkjnENBEKNJFGjUE+mixzgl
X-Gm-Gg: AZFdTZc69dLZPW0qL2jeAqV25bipeweQCdAEmtYT5dLE72Cy7sbIfCofGhPDNVb1xl/
	cDYoMTerd+sNMtbviJB7U/zqa0Oc3qUX27yAkWhcl1492Amjb5mGNgfhRg6szKHFh1EYPPFAqpv
	u5Zj4K0TfxmGjQcujwQCyhmOZMo0R4x2W9J4asQAD4J59oa1MrLgbyaHk9h78vb5trKUdwCb76L
	gcVRnnEG/HZhO7V9uZwhwhnb7atiF1liCzuQsahcMEFkvqFf8k4fUtpgYIliOvtFspJK5PnVS+m
	2mF52zVUR4PDchaj8BYCjxxUxnronP9xgqY3mxsUfY4lTIJnbiMO7Du3tp2meqbo6y7AWJybvLV
	YPl/ZpnUGZUCLx0hGzIWL1Htyp+gmxt9qC4TMhANsviNLajDTWHs0rPKWy6C/VMQqNjBAvu29S9
	rL4r9DyCMqMZO5mb/6xNWvw2MH9fjk4kbkPGKJIPgplrSAOcSfsf2zyv/olbV9Si04MrRlOPCxU
	si+bkdVisSExhVBHqdfxv8kpdBdgbHeMxlkyWXB2QusSDqvy4KN5QN4wvmubD6imq8BLbM838ks
	PRYkBBea0+/Yni0DjNwEZZX4ahJivGVaRz0APl0eyEsVsQg7rpwWvQPdfDvhGoh9MSP5q8kCGFx
	HhzCVBlZiKGSCag00xwNlmeb9nzVXctoIzg==
X-Received: by 2002:a5d:5f05:0:b0:48e:720a:ccaf with SMTP id ffacd0b85a97d-49c6e4a344emr23224419f8f.5.1794846885071;
        Mon, 16 Nov 2026 08:34:45 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:44 -0800 (PST)
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v21 11/15] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Mon, 16 Nov 2026 17:33:55 +0100
Message-ID: <20261116163412.551438-13-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_083447_528736_7121B240 
X-CRM114-Status: GOOD (  10.34  )
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


