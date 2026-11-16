Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC4360A2601
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4S68hCPu;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TkJszxdX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=; b=4S68hCPu3d08to
	bRbRU1qlvZZtj3jv4w8/DBR7Y5CGz5kdAj76TnR8bc+JzUp+LV399maEhfx4yVxYeKAaM3qrJ5TV7
	3ZO+aCcZdd9by19u6DHPkNKGYIg+UXLUCsy1ums0Y6KYnbAAyr8UDjkTsTpl1fWDhEJapuMFEh+S3
	ZA0Dk2a+Oc4/1vn/dzHajbvEf2Zod468ZvVwPxxALZMNNC+Cdpb7vfn8sxq4t3r/Whhy04vHyktCw
	l7SRbbanoEvY2cGqV8z8D7SUKJv/uohqr/eV/sKnVe30huTERpXarEKEG2g2ufu//DMGsDcTGW/F5
	MPp3lq7eHZRgAf93JcZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzf7-00000003FCX-2EH0;
	Mon, 16 Nov 2026 16:34:33 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzf1-00000003F5T-3CTq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:34:29 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-48fd2e38825so2367646f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 08:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846866; x=1795451666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
        b=TkJszxdX+7+QR+mBmWvYIxHHdTQryID7YTMqtWGIe9j4X9Pabwgdq2NajSFy448Ogk
         kbl+oAoYCTs7vWS7XpiqLayVt0FoHudyOxmgMh+b8GXXD21PaF8jvWR4wMp6qad/ZK3M
         yfK0nr0TaYXptYokVLd0He8f4Wd3Uhi7rl8Ozsb1NUZ3jVzm6SxRk99vA79zKrN9Uhib
         79i67yjUQ7/FVnBdKUM0P+r7Gu3Y/Yd9W+1YaPyfr2CuaGhSyXhzySNbaxF5Js9AgsJ2
         SjuRrkLeyoP/lurx3ACZ0KydfJKdhI/CROcx5S24UZEzYE8bxTU+yv+IpDIqoTaNyl1+
         bFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846866; x=1795451666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
        b=fQXc5kZBXLDDZZ8VXa5D0t29FqdemQl40SYd+FW9zrMWCICumsRw4VrOd2sFBjmwsf
         9xVtmWIgtKgcYJlCht1zpntm9Usmxur5raX4kC+grJfqGMVuxvbFX9BZsJX61IH5mAdk
         hepAQ8rpHvu7+NHvqhkS7vd1oVKoyynhb3t8z0RUyfCksD4HYwvqIHit1yg/k+tpNTLf
         azlzjHvfDlsZn4A2yAtfQqFy3+07yBh+RRGDNGthG6CqmgitZNpDLpvLZ5O8Fq3K7bDO
         pU7fAI4SrkFQEIUPFp+OKHxalt7btjpx/eMOBHcm3gQPCMesAwJIpfqCjbyzAYvwU4Jm
         Huaw==
X-Forwarded-Encrypted: i=1; AL+hErHg8OVayEInvCedG452kyOip4/PR+JpM9LWia23NIhBpY6c7SdVaAo7bE4bE1HM1LbrkgV7pn+FJIH4CI5EIQew@lists.infradead.org
X-Gm-Message-State: APuU4Z98KNkt92Y1+s0OUjtnmCGm0lE7epyDhHb0VOTKWRu5GL7ga32z
	Y24mPyOHEnzODz0dR7YM1lPs+iFi2niiVrCfUOtZEk3sSa8cbcYYyi20
X-Gm-Gg: AZFdTZeHYJlJO6pp9kqz10YEWMtp2H0A0qfIgdc0Pn3jav2/SfZbnB+CLhN5+Wh/cWO
	2Brh2HA3uJsp9Hd/P+Oiq3JDGMJUxxu1tTrdZsGIhpHCVXT+D8hqecBCesY4vIyE18EjjgK6oGq
	acXv8excZtMs6f5eQpyQ/x62gMn3TLzO696X+Qfs4jbpvHdUHogT5K2mZpoe3qczCwn1SsXRxjO
	7MW3kQpMb5XEN5S6ysCg6O1zbUs/xugOJxqY89okszXU81aVwQeF4KjrNLXZi30vQXIaw6XrB2p
	tN7hc9QyjVGqgs9gN4qtJx68Z6IdV0J/D91Jl6PdtwBlCOBmsBzARJdlzxDNITwKyloDIFksvRV
	9MbK5I7R968RC3oc6/u3mvDQhkR/mLN+hySjCCTggxRkC08LnYLjV07JgoYYvtfx2xGkGNoeIik
	yz62kXWhqL0Ic55Rl9uH7GNEQVmqAe/lXjNs/s7A32ekiCim7G+L/Vi4xDFtOQwyQ2ZCTKvl805
	i9GhuY2gZ99R1GKjP/Ja6AuQMAa+/kePa+LRaDC4IZeJn9xI/H/aXf/Qoo3REqT9eM5n8O/CWt5
	pNZ9R7OFr7/N3MVEqn2Mv24k31K2n0EB4lvDLit61TYaOSThFxGpGzjutxjyc1hCpjWrGNRm70p
	VlOMOykwykSw/7069BNgLLE4MqCV7nbI10w==
X-Received: by 2002:a05:6000:46db:b0:492:9630:6a7f with SMTP id ffacd0b85a97d-49c73350ba7mr14457094f8f.55.1794846865873;
        Mon, 16 Nov 2026 08:34:25 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:24 -0800 (PST)
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
Subject: [PATCH net-next v21 02/15] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Mon, 16 Nov 2026 17:33:45 +0100
Message-ID: <20261116163412.551438-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_083427_830212_86081353 
X-CRM114-Status: GOOD (  18.37  )
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
 drivers/net/phy/phylink.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index d9d0ace2042e..f482dc608810 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -63,6 +63,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -633,7 +638,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -1788,7 +1793,7 @@ static int phylink_create_sfp_cage_port(struct phylink *pl)
 	port->is_mii = true;
 	port->active = true;
 
-	phy_interface_and(port->interfaces, pl->config->supported_interfaces,
+	phy_interface_and(port->interfaces, pl->supported_interfaces,
 			  phylink_sfp_interfaces);
 	phy_port_update_supported(port);
 
@@ -2091,6 +2096,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2218,7 +2226,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -3037,12 +3045,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3921,14 +3929,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -4166,7 +4174,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	phy_set_upstream_port(phy, pl->sfp_cage_port);
 
-- 
2.55.0


