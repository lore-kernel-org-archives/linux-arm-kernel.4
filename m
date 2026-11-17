Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA23606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wkshIqD/;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CJbe6miV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=; b=wkshIqD/NqYo8j
	4iBGWB4FdY4tbnzjMY+uHEb/zk4bj47iI334gRfNf4C9FccYhoLh8ClE0MoO/hhDGEAFetYc+LlIr
	M3ZNYj0zbDmSBwHOAYnQ8wAFOcLOkqHkgKknNtvLpq1ZhsJ9IimRPeZzNL2YbyPPRtw+PqcHuDn5q
	pverhvg5cvZG/tyBKy+71sabp2Ks6tHfKQCI3cyU+yFwDj5NSO6td0O4NbBgaNkLHRB1FKNuzcdYz
	eyOWBC57Hu83ZPgV6Lv80NIz2P9S9+NXKUy7TRjxxPQJwv7byQ5zX/jSNzgUVGjuDr3rjjZ4CTYV8
	F52imJR3mfAwGDWxjhkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIUd-00000005g0X-2j5N;
	Tue, 17 Nov 2026 12:40:59 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIU0-00000005fBg-006P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:40:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so14940055e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 04:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919218; x=1795524018; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=CJbe6miV5Nsw53KRGYec9BtDsj5HecbYYh+96r+suzi+qNZpJ8tv0S9rMe1OAP6k9j
         cyIm7gIFhljKG2jraFie+DABzVGz0k6FW0DzEhvC50o6HssZhv9kzgvjdpYf/pHSqm1Q
         hXAXkogP+sol+UnT3SLnEubC4UrdCLA6N1tzGm143Bf7rpVnKuZbdfrcGHWVg13lzD6o
         ukNd+EljX7RToXhtwec7vjA4LPo5WvqzVuoadQbo9t18feckWcSsWAF9P7XM4BocCKV1
         o1PoP6ZnMJAjzQ9RU0gVih0ulNW392xhQi4eXcVdSaYAwvGMvnQeVZqLIgqayAAsTaxa
         GAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919218; x=1795524018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dAjpKPDMJcjUB/FWtU0ouqdhsMiA0bngh4+ryluV0wA=;
        b=ienp0ynCDD+Z8dkXIeOMerT6zU/kILnTwuXuUC5UNe347+rJ0c6iH5tklY5MgBxkub
         TszqZwbE+b9pTsIhJTMXkexf/oYFvV9K7JG5TepEzKQgFaKOdLVPeBr5Lph4RInDVyi3
         WZn/LXOOYbXM+p7yMpVr7SutTMi2vL4QroDTk1iGdg0TQ1rCizXs7CCmwEkhIgN8gUM9
         chDeEdb0fsBuWKAB2HpvEpfGpoOvRKQIMcAhUOKhWPyi+ZZX+ue9H96QBh2L2eXrQHNf
         DOadct93B5LcCoVl0JUNPOhO7SKkxM1ZDLozkg81tqcc6dQ+5iyqwb4cTBWdEzhjVo2Q
         e63A==
X-Forwarded-Encrypted: i=1; AL+hErHQoKfT1xyUGc7oQyw+gYvoJxfUvS9vhCpecgMssONoVCalQBfkJi1GPvWIRmtp9C/lzMFsXtlPV1NRoVccZj8Q@lists.infradead.org
X-Gm-Message-State: APuU4Z9qhN4Ld2VzXQFw0BDGwWwJolChEsSbd4TW33pYaA/jrba/GRZs
	HX24F9oUq70Xf6YLX7RIqrDF/eeQxZcWd0Ry6iuP3GV9LsLdqPIT2T8a
X-Gm-Gg: AYBFou2j7xB1nHUYJuVtC5luH/SX5p/ep/eXF813JBcJV2hUq/OIMTufhHpToiVi0tC
	27sEHpUgjZvM0YXx2JaLXQ0x1EyY0Jrlc6wrxlwbDaD44qkp4jo1cd2lkyf1aZQFygxlrO/zEWV
	vf6oxz5Sbn/z4cCLLKM3VCKRvw7E9pkRZNauzI4gYigwGC+8HYl/v+kwtvuYNQ0zmL5ct1qvIEj
	r40RM0XV1QmWcjUqn2u4rpnvzZpMo+htQewZUnn20drc/M0Ki0a2o1zLDLu5TsRuUTKzwm1nGTN
	e+Nv7wPj5uIG0r6gOUWOP3o9UI09LqjDcxXE77jrdnnD3ngyoJQAMGYSWeunEmgNbYLMdgQ9oJS
	RAxlgGkLF9/BCzHVMiFBAPpvPXdzRZpCRjimwiYr1mkfvMsvRezg24xKOKbQc0F4tNDEwN7fKqC
	0Fi1gI2BAEJQw6TOrGF8S7N3ZfQaXcKYQLsMGX5nfLVPMpKV5bw1BxsbZAXreprvHBpT6NSKaU5
	psi8FGPkgGsVnx3nRnxHYayCKgX9sqrCkw2ajK2ebG8VfR6iHnsh0OvIJ+Ko3aynXZxZ/wGL1Aw
	jAlFKid9uGeWqeevdyHVN1vL1qUP4Hwvydm1HXvrRPUfxhYT5ZwAOnpS70dIdMHPkH6qElThhiP
	0aUN2Xy3icy48S1UuxhifmIsCfSB4eYmgPZM=
X-Received: by 2002:a05:600c:8b81:b0:4bb:5f45:c97f with SMTP id 5b1f17b1804b1-4bb5f4f93f3mr220965765e9.27.1794919218079;
        Tue, 17 Nov 2026 04:40:18 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:17 -0800 (PST)
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
Subject: [PATCH net-next v22 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Tue, 17 Nov 2026 13:39:45 +0100
Message-ID: <20261117123956.11981-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_044020_071217_672657E1 
X-CRM114-Status: GOOD (  15.11  )
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


