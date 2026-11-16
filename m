Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14491606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JInNKI63;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FhqxO0Yg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=; b=JInNKI63ySR+rr
	BQ/KzWvvcvLgCaWg0Rh77/qNNHABxFBeJmDfXGVdNFI8GGSDc4JdMEXMVrusfQBBnKKluq8U3Q6w5
	48WFS1Art/1iN/BzXiIXlGkH2lKPZC4M2T3aDUsem0UYmUxnyb3d8chZC3II7X0nkI1WpDm7KhUbo
	QyyaXdwsrJP1IlbnjExPnAZTiPQplBKO5CmCoXRu2plO7mbDPxfbMKZTLAM4W2xNtoBnBfxBbtoCh
	yoFmtq1TqECf9tK611UQbAx5vsvJ91KYSD6CzPdMe8nwPUHUcgGVGP9gf+rIBLe9WN3HUJp0NT3NG
	RM05pD6MiSNux58V2rZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfJ-00000003FPT-2doD;
	Mon, 16 Nov 2026 16:34:45 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzf7-00000003FBK-19iQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:34:34 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so38917315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 08:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846872; x=1795451672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=FhqxO0Yg09H8CnpHh7zJjKLXSiSoz4R8gYxvkoITji8XHENoBhGxmztvjmJ/i6l/ry
         YDLuwQY9c1gUgjsmmCi6DRA70VeLJlrNCj+yn8SVPPy6thJcLC+A20P4yHH8agIOip/u
         yS+yoh5GW6AgT38na2ShB0M8KlkflVhBPB94jFw+v7wm18CuRtkH3dq4d5WDoQz50rjR
         FaFnJO0vgRIqX6a3NwJmeP7WWggkpvhs7Z65JGY2vjJeLCTrKabdItxa1JMFJ8EyC/CX
         08On8lVoEhw5XHLiKI+jDVUxeq5h1WEhI1GAJzZs4NlDoXDEgPNnEanKmekLMBd0YiDS
         8Qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846872; x=1795451672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=2FI02fyoRJdEOHQtYx7Z1jMUfNobL5pZTV/YAtrldr5LGYXIqh5LGvFAU7hWzRuqFd
         N0GFzrpIunXjKZwbBzI6grMxMED5yFkFMRd94bmGBM94V5vSdmb+GYO3XU0/mfYWFCt7
         hSINbJGrCe9/Km+OAjAE4OFxuSUPxQBf+ZZ1yRRWLHc5qwHA88HrOhrMVoNhOuog3hQx
         7DLg9HOT8ZaOTiitdPpCCocJhXRbuj1/eQ2poidXSS1XS74AQqsl8Lw5oUqL5pgpOavx
         EZ+35b3rE5hlZiRUOVCSlOqY84BG1Otco2acrnicJ0MaPNa6yz4+zj0OSeRSZxy3AuPZ
         B4PA==
X-Forwarded-Encrypted: i=1; AL+hErGFJmEXd9qZBILRuFtOXtUwAa6esJnDz7MZs4Xlu0CJQI8FpQuanvheYF8AB4mAZFyCBuElXmD80vO24KIxPDKY@lists.infradead.org
X-Gm-Message-State: APuU4Z84m/fcFmWN0L/ZZVlEfaidZVLAq+7n08U/vG8BrnE1UZDfbwZb
	e0AyBOEzXHpHOvRpY6KvNUrpDfI00phEWyi9ppm+GjV30ND9SImnvQGO
X-Gm-Gg: AYBFou11qjtPviYNn4jc0tkGXM/VVst2+XNlRQu4R+15Vuh7GBkbzpmVGLX0FT2dOly
	kKhEBvEL9ZJcb48spZBDqLZfnevfthU3tM3NOib+Y/ctWQUnQ78hQu3WYgghAqzcBDYUY8rh0DI
	UOwP3HzrUru0SD36Ke8E5PAwp0vQU/hBvVcjKKt48v+9oHEug8seP2qF2BmX4g7wwo4K/UOPixX
	aI0hY9LqzYz4tSFcxwkSU3xC65unt8cN4gmx2zCc6v2PHGKLgCfXqqjfi5rpUMn0TlsY69nZjTD
	LYoP7AI8iVtEmjCnqTfRkp7U5P/0PU+L36vB07H5hj4GOfCd01Osr7EK8Fqa1Q0v98Bc7oz+MW6
	US2qD6bVFY6jqelk/q3FsS2dI3/V9efOvOEbvD6m4kZQ2bmMvElxusojt+/3gRFq9b+3kSNSVOo
	CevM6wXPHiVQOkrxD6cQbYFB2alNRPh79oKqeEn7OuYESWVa2605BspvQ/r9S2QIl/UE+Kn9ePi
	l0b3c29l8VRy+CSYCge6GrlmRR0ezcuwMQjLk4BQahRW4R5Yrn6qeahuLWTPn0Yr8vpTVOwLMrT
	ANVgyBT3bpJWccT+mwXF2psz50DrFGo0uriSyaQV+dByWCZaTYPZcndn5/z8rszi2K5NjGTXzjm
	6y3KHfcM74KLCtRXFFg6FJT0CDnOBYq3aUzbux1OPOSYXCSthQu4zBLY=
X-Received: by 2002:a05:600c:1913:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4bb55ab021bmr249777075e9.30.1794846871585;
        Mon, 16 Nov 2026 08:34:31 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:31 -0800 (PST)
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
Subject: [PATCH net-next v21 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Mon, 16 Nov 2026 17:33:48 +0100
Message-ID: <20261116163412.551438-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_083433_341465_6B5782B6 
X-CRM114-Status: GOOD (  14.65  )
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

The firmware node associated with the phylink instance might differ from
the device firmware node passed in phylink_config as such device can
reference the parent switch or other platform peripherals.

Some function might need to reference this firmware node after
phylink_create so add a dedicated fwnode entry in phylink internal struct
and save it on phylink_create().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e8ba906cfba6..091c3a79c120 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -47,6 +47,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -2185,6 +2186,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2272,6 +2274,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2311,6 +2314,8 @@ void phylink_destroy(struct phylink *pl)
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.55.0


