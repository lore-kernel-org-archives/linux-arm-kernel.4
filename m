Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480BB606A88B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f5G2nqcH;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DQwsuZd6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TeLAZiZGj+97MWa7ReJZxgbnws7A1jvXyF4Ap0n10zw=; b=f5G2nqcHU8lLGp
	K3HtvSyS9kNvCfIhR44fbNhST5eQV2mS2Rfq/VsVodbXb7nk/xFa1KnVB44HUMAosJsTiSNQOYt8K
	WBaRN4R15Jezp4uW5D3wd2/U/YqIZW2E8/tBbmbWDAHqtZtBl58pnbXvpJQlsxZp6wadmMVIrRzSn
	2fh4x8M6Fd1F2JbgRpy6QwP0pcWfP1gARZJn0oT7gJB8llU2K/rG+PnBDYnw3jcejtQ0JqdA2+pZL
	7sJfHthl87q+ShDTWM4pcPhup2LK76rAPRBwzeggEwxSkBjoX2ikHm36pCsFNqvt0rT3Gz3Yi1+vy
	F5xdQYh+abvNVH4Qq3vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfDY-0000000BJAe-0lOw;
	Fri, 13 Nov 2026 00:32:36 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfDS-0000000BJ6X-0Z61
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:32:31 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-49318428d98so121493f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529948; x=1795134748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TeLAZiZGj+97MWa7ReJZxgbnws7A1jvXyF4Ap0n10zw=;
        b=DQwsuZd6qveeEN+/fhffRXu7/A1gnnUoRMvs3fI2q6+rOQ0GqEl/T9xs4TBRtCFDc8
         XiN6UFjgGxyl+RRqE3JvoiYOIywPEm6LrWxaUm5KKEP2P35L5ALL8LiS/QNxaD2StoQO
         6php0Q9pw+xi8n8KQtQmUGU75mnZpBpzWhu1DCI8RRAAuAbPIqWE7Ez4/PB4bYfNn/XW
         yfvwlwaBmM6Dn+ZPksE1jT/Jo4vXY6AgMxfU+cIwdD5rnF82ZSsxR0vFxKaalis9KPTE
         /16Jq0ij4FT67QDtMVFewQgDx0Y5TV8Qzd7Uaxvl0wQRd+ZiYINchtBj2GimghiE+6BB
         ecwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529948; x=1795134748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TeLAZiZGj+97MWa7ReJZxgbnws7A1jvXyF4Ap0n10zw=;
        b=hPJaD6fNk/g51a/j8YbjiuldXktSC75+MTqLktSGEtHLrAa/ZAYJBK1HPPY3xA7n/d
         eXWJw1dma6nToriDeX8WjIzxJVAtLV9zCyfy/pxvY79GsbzJliTtk2APY68/SApfDCea
         YXAXCOyxk5qwibBshkshSYr9DLB9v1RqVfKWtVYrJcwMhco6unJqjjgpJzi3xmT8YmvD
         X0N5Z5+nkT9bu/dNT/HwThFOArCka+4h8nFYnLkLQKQPxyTznC+gHdjvE0D1z5/S7dPC
         3Wd8SuhbPkzHcfCoDqf9sIxcU34jzYjRPD3/ximUJtDxyCnez0hKOl5NPz6RqbK7b/0B
         Jw7Q==
X-Forwarded-Encrypted: i=1; AL+hErGqWu0lO1EHO7hFBMCsEZQ7SW81wQhxkz38LYa/qVKZbzURuZvIN3s3EAQD3Qpqe3FnUdTxmepk98/61ryxgXvD@lists.infradead.org
X-Gm-Message-State: APuU4Z+Pc7iXbw7pOlAJIxkztYhf8sCyS/YFs3LUBOFV08lpjennf7Q5
	DMm76+cmm8RdPXCvFpb5HE70ThAAnZe8I5UfXOviaVXQuViWhqJsN/4O
X-Gm-Gg: AYBFou2iJZ/wmqywtbq2WMvLsYpTdnCCAkCQB3+J0NTmgKiGJJAHw7EVjupqGLSUGhQ
	8p0ksm7uUyBStms33lwSZQloJPdD/oCzjZbkYTdBs+kMlIaIFmx4Ij4Ew4NheublHOPTXFbLQDb
	NDBZ3OrI5vi8sp7vGFOAJtfCD9cpoYQAaIQ4xN6EHutQFoqrpZiF++DgvcCyBmJlWQ+0iiKN3Vk
	fMcw0Zy9SFUTC+gjgrzEC8h/ELqS59TFF0NiGT+suw99x6vrzL0ZH+XawYnsfPIiWiqahnUD3Sw
	r8W4IBKUklce6CIp2aCeQCeEkEvhY82R+YVeacuuo7ymullP+7Xgvh1oNJDpLuAm1r624h5sf3t
	rVGPzZX54eT9K+DCyc5524sOol4FQP9alHyjbfsRkv0P2kZ3uslqKB2I0e6yFMF+icn63qGteoN
	bfi3K1PsGlgsbe8+9SjaAA0MwLPVy3Y9zX7G/+GDUvuLBSzaG8DIe8FTwgVwRcI6DV14vgQwa6v
	rOr5jybaxn6E2onBsHJ5mwaYdgHTlzsA8lBW88CUeaRcaPlDrASMYwul78CGLk86yykYepvWCjB
	DbmqrL4Z8rILotMYlVwsJAaIBNL/PcmRwShVP/IA35BbKLj9weVQy2kSlIm28lh4eB3TK8aESI+
	I/XqB9sS5KVTLUNELCvFBl8+agNsMBREx8FYf7qMWzaEYhH+vHPOMYw==
X-Received: by 2002:a05:6000:46ca:b0:493:bd29:a6e3 with SMTP id ffacd0b85a97d-49c70ed913cmr1444486f8f.15.1794529948033;
        Thu, 12 Nov 2026 16:32:28 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:27 -0800 (PST)
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
Subject: [PATCH net-next v19 01/15] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Fri, 13 Nov 2026 01:31:51 +0100
Message-ID: <20261113003217.197757-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163230_201739_5C9F3697 
X-CRM114-Status: GOOD (  18.48  )
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

Add in phylink struct a copy of supported_interfaces from phylink_config
and make use of that instead of relying on phylink_config value.

This in preparation for support of PCS handling internally to phylink
where a PCS can be removed or added after the phylink is created and we
need both a reference of the supported_interfaces value from
phylink_config and an internal value that can be updated with the new
PCS info.

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e7734e45376c..5d649903be9e 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -62,6 +62,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -632,7 +637,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -2090,6 +2095,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2212,7 +2220,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -3026,12 +3034,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
 		return interface;
 	}
 
-	if (!test_bit(interface, pl->config->supported_interfaces)) {
+	if (!test_bit(interface, pl->supported_interfaces)) {
 		phylink_err(pl,
 			    "selection of interface failed, SFP selected %s (%u) but MAC supports %*pbl\n",
 			    phy_modes(interface), interface,
 			    (int)PHY_INTERFACE_MODE_MAX,
-			    pl->config->supported_interfaces);
+			    pl->supported_interfaces);
 		return PHY_INTERFACE_MODE_NA;
 	}
 
@@ -3910,14 +3918,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
 	phylink_dbg(pl, "optical SFP: interfaces=[mac=%*pbl, sfp=%*pbl]\n",
 		    (int)PHY_INTERFACE_MODE_MAX,
-		    pl->config->supported_interfaces,
+		    pl->supported_interfaces,
 		    (int)PHY_INTERFACE_MODE_MAX,
 		    pl->sfp_interfaces);
 
 	/* Find the union of the supported interfaces by the PCS/MAC and
 	 * the SFP module.
 	 */
-	phy_interface_and(pl->sfp_interfaces, pl->config->supported_interfaces,
+	phy_interface_and(pl->sfp_interfaces, pl->supported_interfaces,
 			  pl->sfp_interfaces);
 	if (phy_interface_empty(pl->sfp_interfaces)) {
 		phylink_err(pl, "unsupported SFP module: no common interface modes\n");
@@ -4155,7 +4163,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	phy_set_upstream_port(phy, pl->sfp_cage_port);
 
-- 
2.55.0


