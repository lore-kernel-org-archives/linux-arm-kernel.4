Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD51606A883
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u6VieELe;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sZCPMjUf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AKfFG/NGdMCuBI9qMp8fQoSx5ZUklEOkyEjVFWQM7P4=; b=u6VieELeOP73HI
	ipmZOS4xrx+6oWxyjvUqwDRTv1HRhvdAkg9Qmt6NzzJdG+rmXoQLs13bwggaPN8YGGPbkmtT3FqpB
	B/Z89/NPJOwrGWi4JlaT4K0VXNI2YCVlxio+wu/zHNZLpLFACOQySE/EWFuxWW5Xo5uF4hLfCut1C
	J5gRqPS6Ck2XMrYQQ6ZHIQnMQ1V5LQDzRmN34XPUjVogHHFsDZKV0ZTwn/KuNtswSNywkbub2Co39
	o+xDCyzqVs0CEhQgposFlj8mI+jW+eO/HYrziqqdCxR78OXkQQZ+uE6udMZTRysX0BKtDZNekIUKs
	QjqSdxDkoS+Rg7wFJhfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIVI-00000005gdj-2uK0;
	Tue, 17 Nov 2026 12:41:40 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIU8-00000005fJR-3bdr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:40:38 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso27879255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 04:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919227; x=1795524027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AKfFG/NGdMCuBI9qMp8fQoSx5ZUklEOkyEjVFWQM7P4=;
        b=sZCPMjUfwSmQcgcStk3sY2GetAOga4TlfSscQh9moN3JV9tt2vbUMArJ8JQK31shTh
         +8Xt73oYyUntyja2QfCe1YjkZdOy1vnQX7ht0m3b3wO47ys5q3TnBDb3BO3HuKfhresg
         C0OZCNbGRSR9SZ4XI4e+5QujmL0wssvZJWHJRnOsctFj/+nts5z6q8Ai+T9vmNhmWjFU
         lOMuSEx37kyun0hgWLG4QekiFV9WsfW0nxw0x1D1Kr/QIrNRGeAKE8qdpnN7o9MEuaF2
         KxUAzUU7td+7aKPrFa8tpFX7PqdsEHGaUm6buARUvhzdR4XuGK2JFB9nFPcyLVFD7wrO
         fzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919227; x=1795524027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AKfFG/NGdMCuBI9qMp8fQoSx5ZUklEOkyEjVFWQM7P4=;
        b=VkCklLu4JCXuiK4cwGPZY9/upL/qEZgiGafEPeVlaFQv5FkouSGnVgnuTf4qtF2jNJ
         FXRw3aL1Fqjx1CnhQLNKumjdRKGccCw8mFD61GC3RWBnZlMDCnhGZIwbBSdZLCjtS84v
         aN2A02AFMWUq/3bHgWG8uYvKkbgV1cWeZ34xSUHSEHBX3/rdH8HUzvcLL5J/MFOKt3SS
         ThvCIDQ2apdxKrktuoVRpKFF/c7v14vvXicShm4w3mW65KX2TGgv8iBReN2Ht7Vfexzy
         yEaNGYZMevC0odfM+poisIn4l0op2D3neeIzsOTCnhrSWZoBE2U5Jrpse6xZJmrdz3w7
         gfGQ==
X-Forwarded-Encrypted: i=1; AL+hErF+6a4KCcTV0vll4AJq1xjroRpCSMEMZplsAEf/nEq43PFtbKIccQyYNRvHtyWcxhznYUKaXNYqeeMWIOzjtaoH@lists.infradead.org
X-Gm-Message-State: APuU4Z/KVkpWuhfvgB6FFiTejh6Vy9AMKqmalDMPbZdct3WhnT5LBIf0
	ieM4GeYMnEV/sSwx8LNmwvmBVzShp111tl5ApDRY+pvQ1RBJqDd4gKpP
X-Gm-Gg: AYBFou3pGyITwyPWmvnO4270gFXPkX+x8cALlE+8BIJr1xHTJO/6gTPk6dpiODkmx52
	mds7frIcu1Ko/C6U8HNqrnDdtfSEeHzeds1vzUSvUGajBVE4j3ClKeiMI9nufCOn/LbMpma6y/k
	Fzj+CQ0/pmg/wumD16GeTGbOb3f60RUq4eudFR0z3ridaNNSbZWdX02Q2BPLWJiKmdYEtdYqbtM
	IlUnavJpZ7DgZexOZvytiFc5KTZ3b7rT1i0KiaiyFlVmd79F5CqC7gKRIflTInr2RhtZfTrm3mZ
	YDLZsbUyZBTERHwdWElyc9Dcag8weFnYdFQDIKBnNFrsrrnugmF3JQcDSpFkCZ5lwM/sXcN0H2B
	oCh5v3uEfMn8nUfv3bV9aP2IIt/QpkW5wkm4a2TdYVdsi0zzKm0oX0byvdBZVtv3ZooWdUovlbp
	4gRD7qqBkr/xT15ENntyanPL/ppaGGgs2crUk7dEOapE7RH/uxmAPyJBH0MfJ1vnm8SdK8f6zxg
	5El1Z1zVYTNb9eNxp4id0EnQNiRjkLWqJkq0pPBxK69EokAtyzD8QpWViNAbhv+2hLeaG7S0AQS
	rwbaPbLOtQc2rMSG2sT/VFCPnpK903aFruiR1KyU5zOHCBV5Bj7qI3c5VkCx8YrfMOawd64XXYi
	UqiuAqBL8hECX4YhI04ls59CkvRSC3lODuA==
X-Received: by 2002:a05:600c:c172:b0:4bb:5f3b:25a9 with SMTP id 5b1f17b1804b1-4bb5f3b27f9mr231172735e9.30.1794919226611;
        Tue, 17 Nov 2026 04:40:26 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:25 -0800 (PST)
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
Subject: [PATCH net-next v22 09/15] net: phylink: support late PCS provider attach
Date: Tue, 17 Nov 2026 13:39:49 +0100
Message-ID: <20261117123956.11981-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_044028_984839_2338A640 
X-CRM114-Status: GOOD (  32.07  )
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

Add support for late PCS provider attachment to a phylink instance.
Similar to FWNODE_PCS_PROVIDER_DEL, FWNODE_PCS_PROVIDER_ADD is added to
address the case where a PCS provider is added after a phylink instance is
created and started.

The PCS notifier will emit the event FWNODE_PCS_PROVIDER_ADD every time
a new PCS provider is added.

If a related PCS is found, then such PCS is added to the phylink
instance PCS list.

Such PCS is then linked to the phylink instance and the supported
interfaces of the phylink instance get refreshed.

If we are in a major_config_failed scenario an interface reconfiguration
is triggered in the next phylink resolve with a new phylink resolve right
after with the new AN mode reevaluated if a new PCS is selected.

In the example scenario where the link was previously torn down due to
removal of PCS, the link will be established again as the PCS came back
and is now available to phylink.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/pcs.c     |  22 ++++++++
 drivers/net/phy/phylink.c | 110 ++++++++++++++++++++++++++++++--------
 include/linux/pcs/pcs.h   |  31 +++++++++++
 3 files changed, 141 insertions(+), 22 deletions(-)

diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
index f234a4635417..0a4853b756fb 100644
--- a/drivers/net/pcs/pcs.c
+++ b/drivers/net/pcs/pcs.c
@@ -69,6 +69,10 @@ fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
 
 	mutex_unlock(&fwnode_pcs_mutex);
 
+	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
+				     FWNODE_PCS_PROVIDER_ADD,
+				     pp);
+
 	pr_debug("Added pcs provider from %pfwf\n", fwnode);
 
 	return pp;
@@ -201,6 +205,24 @@ struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode, unsigned
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_get);
 
+struct phylink_pcs *fwnode_pcs_get_from_provider(struct fwnode_pcs_provider *provider,
+						 const struct fwnode_handle *fwnode,
+						 int index)
+{
+	struct fwnode_reference_args pcsspec;
+	struct phylink_pcs *pcs;
+	int ret;
+
+	ret = fwnode_parse_pcsspec(fwnode, index, NULL, &pcsspec);
+	if (ret)
+		return ERR_PTR(ret);
+
+	pcs = __fwnode_pcs_get_from_pcsspec_provider(&pcsspec, provider);
+	fwnode_handle_put(pcsspec.fwnode);
+	return pcs;
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_get_from_provider);
+
 bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
 				 const struct fwnode_handle *fwnode,
 				 struct phylink_pcs *pl_pcs)
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 094a15f3dbcd..8768d8220a13 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -112,6 +112,7 @@ struct phylink {
 
 	struct sfp_bus *sfp_bus;
 	bool sfp_may_have_phy;
+	DECLARE_PHY_INTERFACE_MASK(sfp_module_interfaces);
 	DECLARE_PHY_INTERFACE_MASK(sfp_interfaces);
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
 	u8 sfp_port;
@@ -2140,6 +2141,35 @@ int phylink_set_fixed_link(struct phylink *pl,
 }
 EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
 
+static bool phylink_add_pcs(struct phylink *pl, struct phylink_pcs *pcs)
+{
+	struct phylink_pcs *tmp;
+
+	/*
+	 * Make sure state mutex is locked to protect concurrent
+	 * access to phylink instance PCS list from
+	 * initial fill_available_pcs and late PCS attach
+	 */
+	lockdep_assert_held(&pl->state_mutex);
+
+	/* Make sure PCS is not already in the list */
+	list_for_each_entry(tmp, &pl->pcs_list, list)
+		if (tmp == pcs)
+			return false;
+
+	if (WARN(rcu_access_pointer(pcs->phylink),
+		 "%s: PCS already attached to a phylink instance\n",
+		 __func__))
+		return false;
+
+	list_add_tail(&pcs->list, &pl->pcs_list);
+
+	/* Link PCS to phylink */
+	rcu_assign_pointer(pcs->phylink, pl);
+
+	return true;
+}
+
 static int phylink_fill_available_pcs(struct phylink *pl,
 				      struct phylink_config *config)
 {
@@ -2172,12 +2202,7 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 		if (!pcs)
 			continue;
 
-		if (WARN(rcu_access_pointer(pcs->phylink),
-			 "%s: PCS already attached to a phylink instance\n",
-			 __func__))
-			continue;
-
-		list_add_tail(&pcs->list, &pl->pcs_list);
+		phylink_add_pcs(pl, pcs);
 	}
 
 out:
@@ -2358,11 +2383,24 @@ static void phylink_update_capabilities(struct phylink *pl,
 		goto exit;
 	}
 
-	/* Revalidate the SFP module modes against every available interface. */
+	/* Revalidate SFP modes against interfaces currently supported by the
+	 * MAC and PCS. Keep the module's interface list intact so a later PCS
+	 * addition can make an interface usable again.
+	 */
 	if (pl->sfp_bus && !pl->phydev && config->interface &&
-	    !phy_interface_empty(pl->sfp_interfaces)) {
+	    !phy_interface_empty(pl->sfp_module_interfaces)) {
 		__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
 
+		phy_interface_and(pl->sfp_interfaces,
+				  pl->sfp_module_interfaces,
+				  pl->supported_interfaces);
+		if (phy_interface_empty(pl->sfp_interfaces)) {
+			linkmode_zero(pl->supported);
+			linkmode_zero(pl->advertising);
+			linkmode_zero(config->advertising);
+			goto exit;
+		}
+
 		linkmode_copy(supported, pl->sfp_support);
 		linkmode_copy(config->advertising, pl->sfp_support);
 		if (!__phylink_validate_mask(pl, NULL, supported, config,
@@ -2494,6 +2532,7 @@ static int pcs_provider_notify(struct notifier_block *self,
 	struct phylink_pcs *pcs, *tmp;
 	struct phy_device *phydev;
 	bool resolve = false;
+	int count, i;
 
 	rtnl_lock();
 	mutex_lock(&pl->phydev_mutex);
@@ -2506,16 +2545,44 @@ static int pcs_provider_notify(struct notifier_block *self,
 	if (pl->pcs_state == PCS_STATE_DETACHING)
 		goto exit;
 
-	/*
-	 * Loop all the PCS for phylink instance and check if
-	 * this notification is relevant for some of them.
-	 */
-	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
-		if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
-			continue;
+	switch (val) {
+	case FWNODE_PCS_PROVIDER_ADD:
+		count = fwnode_phylink_pcs_count(pl->fwnode);
+		for (i = 0; i < count; i++) {
+			pcs = fwnode_pcs_get_from_provider(pp, pl->fwnode, i);
+			if (IS_ERR_OR_NULL(pcs))
+				continue;
+
+			/* Trigger a resolve only if a PCS is actually added */
+			if (phylink_add_pcs(pl, pcs))
+				resolve = true;
+		}
+
+		/*
+		 * Force an interface reconfig if major config failed.
+		 * Configure link_failed to retrigger a resolve a
+		 * second time to reevaluate AN mode with the new
+		 * PCS if selected.
+		 */
+		if (resolve && pl->major_config_failed) {
+			pl->force_major_config = true;
+			pl->link_failed = true;
+		}
+
+		break;
+	case FWNODE_PCS_PROVIDER_DEL:
+		/*
+		 * Loop all the PCS for phylink instance and check if
+		 * this notification is relevant for some of them.
+		 */
+		list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
+			if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
+				continue;
 
-		phylink_del_pcs(pl, pcs);
-		resolve = true;
+			phylink_del_pcs(pl, pcs);
+			resolve = true;
+		}
+		break;
 	}
 
 	/* Exit early if nothing has changed */
@@ -2681,10 +2748,6 @@ struct phylink *phylink_create(struct phylink_config *config,
 
 	mutex_lock(&pl->state_mutex);
 
-	/* Link available PCS to phylink */
-	list_for_each_entry(pcs, &pl->pcs_list, list)
-		rcu_assign_pointer(pcs->phylink, pl);
-
 	phy_interface_copy(pl->supported_interfaces,
 			   pl->config->supported_interfaces);
 
@@ -4424,6 +4487,7 @@ static int phylink_sfp_config_phy(struct phylink *pl, struct phy_device *phy)
 
 	/* We're not using pl->sfp_interfaces, so clear it. */
 	phy_interface_zero(pl->sfp_interfaces);
+	phy_interface_zero(pl->sfp_module_interfaces);
 	linkmode_copy(support, phy->supported);
 
 	memset(&config, 0, sizeof(config));
@@ -4485,7 +4549,7 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 	 * the SFP module.
 	 */
 	phy_interface_and(pl->sfp_interfaces, pl->supported_interfaces,
-			  pl->sfp_interfaces);
+			  pl->sfp_module_interfaces);
 	if (phy_interface_empty(pl->sfp_interfaces)) {
 		phylink_err(pl, "unsupported SFP module: no common interface modes\n");
 		return -EINVAL;
@@ -4556,6 +4620,7 @@ static int phylink_sfp_module_insert(void *upstream,
 	ASSERT_RTNL();
 
 	caps = sfp_get_module_caps(pl->sfp_bus);
+	phy_interface_copy(pl->sfp_module_interfaces, caps->interfaces);
 	phy_interface_copy(pl->sfp_interfaces, caps->interfaces);
 	linkmode_copy(pl->sfp_support, caps->link_modes);
 	pl->sfp_may_have_phy = caps->may_have_phy;
@@ -4573,6 +4638,7 @@ static void phylink_sfp_module_remove(void *upstream)
 	struct phylink *pl = upstream;
 
 	phy_interface_zero(pl->sfp_interfaces);
+	phy_interface_zero(pl->sfp_module_interfaces);
 }
 
 static int phylink_add_sfp_mod_port(struct phylink *pl)
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
index 83e0a2ad4b09..a6fe9f71174a 100644
--- a/include/linux/pcs/pcs.h
+++ b/include/linux/pcs/pcs.h
@@ -5,6 +5,7 @@
 #include <linux/phylink.h>
 
 enum fwnode_pcs_notify_event {
+	FWNODE_PCS_PROVIDER_ADD,
 	FWNODE_PCS_PROVIDER_DEL,
 };
 
@@ -50,6 +51,28 @@ int unregister_fwnode_pcs_notifier(struct notifier_block *nb);
 struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode,
 				   unsigned int index);
 
+/**
+ * fwnode_pcs_get_from_provider() - Retrieve a PCS from a specific provider
+ * @provider: PCS provider to use
+ * @fwnode: firmware node
+ * @index: index fwnode PCS handle in firmware node
+ *
+ * Get a PCS from the firmware node at index specifically provided by
+ * passed PCS provider.
+ *
+ * Unlike fwnode_pcs_get(), this function does not search the global list of
+ * PCS providers. The caller must provide the provider responsible for the
+ * referenced PCS.
+ *
+ * Returns: a pointer to the phylink_pcs, NULL or a negative error pointer. Can
+ * return -EINVAL if the PCS provider firmware node doesn't match the referenced
+ * firmware node or a negative error pointer (or NULL) from the PCS provider
+ * xlate function for the relevant firmware node and PCS handle index.
+ */
+struct phylink_pcs *fwnode_pcs_get_from_provider(struct fwnode_pcs_provider *provider,
+						 const struct fwnode_handle *fwnode,
+						 int index);
+
 /**
  * fwnode_pcs_matches_provider() - Check whether a PCS belongs to a provider
  * @provider: PCS provider to check
@@ -120,6 +143,14 @@ static inline struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwn
 	return ERR_PTR(-ENOENT);
 }
 
+static inline struct phylink_pcs *
+fwnode_pcs_get_from_provider(struct fwnode_pcs_provider *provider,
+			     const struct fwnode_handle *fwnode,
+			     int index)
+{
+	return ERR_PTR(-ENOENT);
+}
+
 static inline bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
 					       const struct fwnode_handle *fwnode,
 					       struct phylink_pcs *pl_pcs)
-- 
2.55.0


