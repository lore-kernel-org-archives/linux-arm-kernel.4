Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F72A606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RYr6Kmws;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qp/Lp2+W
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/d7omdutyT7Cb8KlDK3VPfYliFLIORx3uPcaE4jX3us=; b=RYr6KmwsuafjGb
	zUQfWSOlDyddxuajdDKNI45t0K9DGqggWpncT0q5FpTGigmMmGXfDh5PdEcBeEhh4Pi0v+YDyH5EL
	WeYVmE/kLg3rz6hKviVPc766fEKoK6gh018KMbiEhUd1ypTNdvUPjhcw0uhJBWKkR2AqaxyYDtOtO
	F48Jq9X6sR9NJi2xxCV7cG31cvquozrufea3Y/eEhhTSS874cbbFEFIPidqNDOy16R+KEqX+pEcz0
	Nv3bn3i1QsmAVG9V2Z7656IJaabZclhUlpPz12wv0e8ZYpocvD8UHAOrY1sg18l22Jc5ZwDdTWx1q
	/7T3ta7k8+gtl5JxZAjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8DF-000000092El-2cYt;
	Wed, 25 Nov 2026 08:18:45 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8D9-000000092Cr-3pQX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:18:43 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-48e94879f02so1769044fac.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 00:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594718; x=1796199518; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/d7omdutyT7Cb8KlDK3VPfYliFLIORx3uPcaE4jX3us=;
        b=Qp/Lp2+W8U3JHCa0QAmyc4YBtPuUkfZjca4GhMCx3XChv3VefJG/iudG0BaSudSohj
         WQvbAKG/6IoZxDVKjd9Zp3QRHLv7aMnzaEX0svgJBcYehFVmbbAYcnCMSwb6X6oUAkxF
         bA1EG19z4UYZ3BWhyxiHdaHih+Q948CwVD/a0uualht/qF8dtbJ53rWISuZwspLuqQbz
         DnglLoP5uNM6/3SpV6jiJQ0lRMawxZ51ue7Varc6S41SxuIXP3LXKAHNsg9HtGIlc7wj
         gcUDKaV0atX/0JNuD0uEZ059kj3G1KFvLsr6N1aFCzX6MMiHxMkMnxq/QkA0/wKDsN+s
         nC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594718; x=1796199518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/d7omdutyT7Cb8KlDK3VPfYliFLIORx3uPcaE4jX3us=;
        b=FFOFekgPCtopMoBQ4thHF1MO3CTGd9q9Se178w5q1wexgeop8nY3nwMRCo24PJrUQC
         XnCVwVQE64a4Fvv06oVP4lGSST+kA6c4dfvDQ6wBn0zBJwWWmbhUhFPlM5tnHf4V/XjA
         acTdQZbFZds6low+Duf0tMQ++XejW3uYuf8xgSDTTvI78gn5rV8BHzgs1vZTeNnHYy9/
         jJzCWXxKaAn0V5G17PHb30QcgtU83I9sYrNZ+/QRGzeEgql/tLrjCh7wA72K5Gd9cciI
         T7tyls3rubU/jg3hjU5f5Eg65khiFvJ25HIgt5N72LWMjn2nIo8MRO6xsSljydJZ/ZQt
         Az7g==
X-Forwarded-Encrypted: i=1; AL+hErFFaQ+zaMOJ2lFPtmkUoPUNjr6kSN0pbA+CunW7FjmuuG8achsWrG+32Q0NcKqCZhwgnWGN/q+ef/sSrFZ1GRmo@lists.infradead.org
X-Gm-Message-State: APuU4Z9GHOwLjq0/8gFivigS9jNxkfTA809WtXoLFrBiElXmZthBWUIg
	MyBA5hRHkon6XHa91eDLRqrBnV2Pc5DQFHuvM5+6AG9U55RxsEaW5XIQ
X-Gm-Gg: AZFdTZdiEEG4R5xq+PUZckuerLzDM5+ddi8n/37evDUFemO4dmbTcKQ8wci9cVZZI7V
	JBIWEYoNiSZwoJOZo/Fr+berSaUH/0BfD3p7jhTYzUaI+4Y0RXOqyINUVuDSYW7x4NwQYWn0mEC
	u0Nx2+Yrj+zo92D+RheMfLYemw7ksw3LLFQu5tw+hepf0mdRJzO1gmE6iaFC/fXbLwgZs8Rfrqy
	Pk0N6xqSgbGJu2HKoDml7bDODXNBRbORlxtlrev9AVn/igIF+XBOTC8qOWSSRS0DIzwJYaTleh+
	Dv5scAy0v8spJmfkW4yu/slWiaDbjZd6Ktb4Nj+dKJ+9o36c0JKZkPcpoT7Uqj+Jg/lccO0kX9O
	0vLCGky5bLTuQgw/tl6bTHdUa40WjSQ9wmXmTMK1IJSiA8hGb6J+VODopfaDPgTNAcc//vkVGkb
	z6RCXC/nDXyJ8rAc5cpgbxUk7EIwS/J2PB3RUmyeWmqY8A+Di3Pa+xbrJBEkiAMg0TqKHtO2qBA
	cb5tyCxyBntB8OVKhK2yQmkOFCFtjBKMdhCujvJKt//zUGKJEc+W8B8fmygLnR9ZkjTHfKt/l9S
	+GPHFb+u1VCNyl5A2RbPEU84Ulgeai7lHtwhYXCDCMI6e/G6AMki+Wdk2QuXRLWWvRKiMRSv6Vx
	wb41y32WwwCwwgKqn1XZCLZxp6QlSsW64PKZrVAyWlWR0p4XNLEEjKxKg5BA2a3q7VwPc9gdXRw
	1W9Ge1R3MGsrCa8LEu2d94GWlMC0QjLCdEzB9vriNGrZK5n6uKSM4=
X-Received: by 2002:a05:6871:7a5:b0:46a:c0ff:feab with SMTP id 586e51a60fabf-4bc7d94f9ffmr14000992fac.6.1795594718208;
        Wed, 25 Nov 2026 00:18:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc55895b9csm14884815fac.0.2026.11.25.00.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:18:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 25 Nov 2026 01:18:30 -0700
Subject: [PATCH net-next v2 1/3] net: stmmac: dwmac-sun8i: align EMAC_RX_MD
 with tabs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-submit-sun8i-rxall-v1-v2-1-4de03fbde087@gmail.com>
References: <20261125-submit-sun8i-rxall-v1-v2-0-4de03fbde087@gmail.com>
In-Reply-To: <20261125-submit-sun8i-rxall-v1-v2-0-4de03fbde087@gmail.com>
To: netdev@vger.kernel.org, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Jakub Kicinski <kuba@kernel.org>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_001842_492985_EBC3D4E8 
X-CRM114-Status: GOOD (  12.78  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use tabs to align the receive mode bit with the receive error and
threshold definitions in the same register.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 0ad2203f76c3..379108e3da32 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -197,7 +197,7 @@ static const struct emac_variant emac_variant_h616_emac1 = {
 #define EMAC_FRM_FLT_MULTICAST          BIT(16)
 
 /* Used in RX_CTL1*/
-#define EMAC_RX_MD              BIT(1)
+#define EMAC_RX_MD		BIT(1)
 #define EMAC_RX_ERR_FRM		BIT(3)
 #define EMAC_RX_TH_MASK		GENMASK(5, 4)
 #define EMAC_RX_TH_32		0

-- 
2.53.0


