Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C948606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kFjf/pc6;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X5EjDUf4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=au6wRe5V9xe+nBj4SXQtqBwfAHos0gKRmRourkWUPB0=; b=kFjf/pc6rHXcyJ
	1AB6yGQAEQB5OmCmdY/OTpjQzB7JAf88VkyHG7P8znbFat8kP9Y1912qnQpIpWmr46zuBYnl5usj4
	HKwom1p+DPXaCGuaFuqT0Azpn/LzURnvY7F1a1BHvlqO2KoZciMcdk8p7GwwlO6ky/g5FEHqrjrWZ
	tJn3ThTfOaTXHXf0i0VQoZI72YR9EQ8S9roGX6nrpPubkm3I0Fr5LnIH05zdkSiCj7kcid6RPaXo9
	WVP6pKY46DEfvDC8es8ZPc627c2Ufkow4dAwATzAF9bAjTWHZuNNDQhRWlKLlx4tac65DO2ET71Ss
	NlnEhHQkkfz3Ym2QL/4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfDs-0000000BJVp-488r;
	Fri, 13 Nov 2026 00:32:57 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfDj-0000000BJJb-3vbn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:32:49 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-49465892f7bso363729f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529966; x=1795134766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=au6wRe5V9xe+nBj4SXQtqBwfAHos0gKRmRourkWUPB0=;
        b=X5EjDUf4ygRLXfe+jhpPONYrCETvKue0ECEe8GhZhivXa5ACLxXpvUHnBHp2FVwJFa
         1XKiNLE2FMYzV6cdTjCGAD5bP0bI4HcZab/KqID3ra3yCFe4+kwAeaYXq1gcjtw2Jmtu
         UcXuIeUMQpm5IxfI1RzR5WQP/PutCBwLwLZB17IRs4/5O9XwThi8qo5pMIpHwn21kPVs
         mO2YfHxFzkRHqahIWU4lkRfQj5xrj4DP+DuDRVxRbLCfNZ1yXU0TGys1n4Ezx50As/aa
         awX6w9VT52FR9MlWPRxEUvj2UTxXhBwCaW1sf0Qf8esT86+tNIew76yLrUaSI2k7LE8G
         mFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529966; x=1795134766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=au6wRe5V9xe+nBj4SXQtqBwfAHos0gKRmRourkWUPB0=;
        b=TyzZnh2B9rXhUYkjfNkwDGNqWwjBep52LP1vVZxkTwQF+XMSdEGdE4aAyHMtQrJatZ
         ChZaGP5CT+C+O4Go7zNcUKxsmz7M1XFz3EGMtxdJ1koaKBth63ALxaPA+g5No8UmXCsi
         cQieHI8zXaRwvT2mR+O1tzehzPaYP3Z0Zf/R1ujCNo5v5hg3k6TzUCEQ9uc7WPp/dsa4
         I6wlVU1/WTVXL1XAnd58JnhWiFqpDto/HzJpyC7ORSXHTQCpY+sPqIvnsQMOaOFikC3X
         FK/lWo6RnYqMba9moCKB/8UFfvhwAnUZdfj1mXYLnTq93E/KW5aL23gFjqB0VD14uzMM
         2yjw==
X-Forwarded-Encrypted: i=1; AL+hErGW189Vk7LByNlmOId/7wHpQFXksFak+rgJBr9R3Lge+Y6bb7AoZiO9ODXCNxzpIpTCzFhazuZH6dYjzHuEa8jU@lists.infradead.org
X-Gm-Message-State: APuU4Z8XNKTCb3iWwsNBhU5aAmewjFydk4KG8b1/J7/9wIw7eHvJmbWL
	Tj7oDnjIbHFxzsp0fn/rU1u79ayoRw+jOhDM0Yl17wgm9Fw89ltZXLv7
X-Gm-Gg: AYBFou0HQQWQjkW5eeiyOeRrd/2g6R8UgyHJL6Brrtck2EJVx3VQprrzb+0bnp3OwdB
	mQ78ck3V54xPDV7EGzsxt8A1E9mOq/GbnGF/GhVQJWrNGHmb0rllzBSbRGnFImksZ5dLQgE5YbE
	KqkwyfTxGfaVSp2kgIGNTr3gAPxJ5Xn1jwNzpNoHE++rzQcWblt2KtE7Bycyse8MLwX31yYl3gP
	oIjQApRJ1TURQaVu6B7hIzAXql2XSXP6GpPnlukwVoE3r7Xsr4bAcKjC/skMMrMl6RLph/nUJm4
	gR0eLoL0L8ipVedPJDwqhhEWGGxdhPFwd9QTPmFlAWZjdR6xs7pePxnRtiMnf3NVnrW08ZTZDrC
	W10Vf1p+3pbs6k4sXlst9h5yHGCbHTQ85mYrfdE3qRFiqvrJaRkC7xiUJ4UlYMS9NihH8L2W+X3
	/cAF2XjVSpHQ69wZ+ryOCiHO7xB4P1f4B+hHmmsa8UCiC07A3u0GkW9T3kqBJ0b5ArkIufEzXPH
	bWMTjv2hgE+4HAjvd8/HtBko3a07xIWS8ioRNB9pT1o8VswkXgkUMx7f97TsyME8XW2Ai02TmfX
	YmkxGltJbZO0LN4T1IJcKUkuZ/7qP2et+dfPWi9kedtqJJ+RLM0x29KFXysXOESqhklFsMoAsAp
	mrOU4EbsX+RHiqji3dqzIWwCIxFQLqsyJBCSzuTH81Qmv15Rn2WCnZwA=
X-Received: by 2002:a05:6000:4917:b0:48e:2114:8ab9 with SMTP id ffacd0b85a97d-49c71d47601mr2274012f8f.31.1794529965915;
        Thu, 12 Nov 2026 16:32:45 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:45 -0800 (PST)
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
Subject: [PATCH net-next v19 07/15] net: phylink: add capabilities helper and track modified advertising
Date: Fri, 13 Nov 2026 01:31:57 +0100
Message-ID: <20261113003217.197757-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163247_999343_1E2A8DD8 
X-CRM114-Status: GOOD (  17.69  )
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

In preparation for PCS release/late attach, it's needed to introduce an
helper to calculate the capabilities after a PCS is removed/added and it's
needed to track the advertising in link_config changed by the user compared
to the originally one calculated in phylink_create().

To archieve this, introduce a dedicated advertising in phylink struct and
update it when the new phylink_calculate_capabilities() is called.

phylink_calculate_capabilities() will then compare the advertising saved in
phylink instance with the one in link_config (that can be modified by the
user to disable modes), compose the modes that are user-disabled, calculate
the new supported modes and the new capabilities, update the full
advertising in phylink and restore the user-disabled modes.

phylink_create() is also updated to init the phylink advertising and
link_config advertising.

linkmode_xor() is added in addition to other logic operation to parse the
user-disabled advertised modes.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 28 +++++++++++++++++++++++++---
 include/linux/linkmode.h  |  6 ++++++
 2 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 918aa95e5a64..9f9715403215 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -61,6 +61,7 @@ struct phylink {
 	u8 link_port;			/* The current non-phy ethtool port */
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported_lpi);
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising);
 
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
@@ -715,6 +716,27 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
 	return ret;
 }
 
+static void phylink_calculate_capabilities(struct phylink *pl)
+{
+	__ETHTOOL_DECLARE_LINK_MODE_MASK(disabled_advertising);
+
+	/* Get user-disabled advertising modes */
+	linkmode_xor(disabled_advertising, pl->advertising,
+		     pl->link_config.advertising);
+
+	/* Calculate the full supported advertisement */
+	linkmode_fill(pl->supported);
+	linkmode_copy(pl->link_config.advertising, pl->supported);
+	phylink_validate(pl, pl->supported, &pl->link_config);
+
+	/* Save the newly calculated full advertisement */
+	linkmode_copy(pl->advertising, pl->link_config.advertising);
+
+	/* Keep user-disabled modes out of the active advertisement. */
+	linkmode_andnot(pl->link_config.advertising,
+			pl->link_config.advertising, disabled_advertising);
+}
+
 static void phylink_fill_fixedlink_supported(unsigned long *supported)
 {
 	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, supported);
@@ -2250,6 +2272,8 @@ struct phylink *phylink_create(struct phylink_config *config,
 	pl->link_config.pause = MLO_PAUSE_AN;
 	pl->link_config.speed = SPEED_UNKNOWN;
 	pl->link_config.duplex = DUPLEX_UNKNOWN;
+	linkmode_fill(pl->advertising);
+	linkmode_fill(pl->link_config.advertising);
 	pl->pcs_state = PCS_STATE_DOWN;
 	pl->mac_ops = mac_ops;
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
@@ -2273,9 +2297,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 				 pl->supported_interfaces,
 				 pcs->supported_interfaces);
 
-	linkmode_fill(pl->supported);
-	linkmode_copy(pl->link_config.advertising, pl->supported);
-	phylink_validate(pl, pl->supported, &pl->link_config);
+	phylink_calculate_capabilities(pl);
 
 	ret = phylink_parse_mode(pl, fwnode);
 	if (ret < 0)
diff --git a/include/linux/linkmode.h b/include/linux/linkmode.h
index 3b9de09871f6..a8290d021994 100644
--- a/include/linux/linkmode.h
+++ b/include/linux/linkmode.h
@@ -32,6 +32,12 @@ static inline void linkmode_or(unsigned long *dst, const unsigned long *a,
 	bitmap_or(dst, a, b, __ETHTOOL_LINK_MODE_MASK_NBITS);
 }
 
+static inline void linkmode_xor(unsigned long *dst, const unsigned long *a,
+				const unsigned long *b)
+{
+	bitmap_xor(dst, a, b, __ETHTOOL_LINK_MODE_MASK_NBITS);
+}
+
 static inline bool linkmode_empty(const unsigned long *src)
 {
 	return bitmap_empty(src, __ETHTOOL_LINK_MODE_MASK_NBITS);
-- 
2.55.0


