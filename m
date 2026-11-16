Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E1D606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pd6Bm6vD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=b+lY9ZCN;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hinhyG5S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hn7S5+QcCKJrPBJMt03O9LQ9GGpdeorHkycI7ucrGRk=; b=Pd6Bm6vDl2s8X1
	MvRAueXAIcc1jnJjNMNT2ctgNIawOOQwasvwfCQvrsYdQWY6qHX0Ae4xsEfV5HkGeIa1SNasBmdRw
	6NEsF87xhEGEKN89IAXkITW1eCxv2tMgwlHNOcjWyfFunxOh/B/sOc2KlKttWqeOuHWb1+ylE2yDp
	yHnHWk+63DHjNEuQo5Q76vvlU/jwQZ1KjhHHW/F6EMkqgBEwm8seyDs6sw4PCi/9ZoDIj1kP+58TK
	3oOs4fU+iyhKDtpLVaU1ScZiJPLQXjusFBAPOvNIjnMqd3p/7IHH+qUCq9wGAKyJTHjpOHWzA192h
	cPzfth/ch91NRwK3k/hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfJ-00000003FP8-1yxL;
	Mon, 16 Nov 2026 16:34:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzf7-00000003FBO-0HeP
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Nov 2026 16:34:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=hn7S5+QcCKJrPBJMt03O9LQ9GGpdeorHkycI7ucrGRk=; b=b+lY9ZCNNK+dYV1e7gWO213/64
	JVsQSSKfAQ0jAhldbp0zePXBMJ2CoKFhB7tmZHUcbNLwonStBVWQDpvAoBqVv9KiT/YvRrR35Uw8a
	QOdJNJrQ79tv718go3glAWbnYKdRr/Y7abEw9muR+wnDHky09X8WcnddiUnwEi81q2gL18xLiihwP
	l/VihbZSaFG7sf/b/M7hboBQ5r3KdKeXHivPIexMIojOsbpOYQoMPFKDnZZWVr/Un0GcP029V24tp
	d1JeRX4mHQtSKfxMrx7YnTo7DivmRN7LNqI6YoyV2RTiuv+7xOk3J7zM7+ybfSMb45YG7hg0C53Zt
	kkzpzzaw==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzf3-0000000E4D6-3Pe1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:34:31 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso38395745e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 08:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846868; x=1795451668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hn7S5+QcCKJrPBJMt03O9LQ9GGpdeorHkycI7ucrGRk=;
        b=hinhyG5SDM30YWOCsF4BgZLDxs68xmfrvJ42SsO7/n+q3bVBcZWZMfoZi8IdH4vJrK
         DlgWrEOMl3h0JpoZmdPRTDdVNxmSije9fRiV36Jvb/Uvr0kNsSoAj0jTzEoy/ScWdVhV
         BlQx1+wJoUd+yJg1EOyBRrsPFIwKvwV0KM9JF5iC7fYQJFySs52g+5fmT1EH0GlnmCNJ
         DkLWkIF6pv9eTOsDe0ECBm7r9ErtpM4xf6lFtVIIqeU0eG0zdjRTrFIhnSKqWzZGCZ+P
         RZXaHf0RPGQgIbT9ejVrtp04WEdu+7Nzmpev/gfG0a+QVprC5XbB5F/X+CxhsCnXUqwP
         SyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846868; x=1795451668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hn7S5+QcCKJrPBJMt03O9LQ9GGpdeorHkycI7ucrGRk=;
        b=gTp+IA+f3sSReuCBjzFuwtxsZ/OfoGJYTe7udU4AzbilO6nvN70o3sOIoDKUfaFZ2c
         EgvVqQsmqZ9Kq+sSu6kOcNXvGfJBtWMSEv5KZ8MK7Oqelqr98A0dOSoxTVYxBW0TYfzE
         nRTk5kGOObvwpkDXrmA1KNbMSh8Mk7fSKTOJ3LlwKKeWdS8qNTsWP4vEPO8loyzRFaTJ
         v5saumcSc5IWtvGehbqQ+WkwxWc8HbQhaSCO+Ftql0RsUDpr9H2e/j+rlWtK97+6GcxO
         C8ihDaidGAaTb3tCwID6RAqimW0gnv+FKTOUTHUMU/OKwR8+sYQzgsv2KL4yt1+cSfA0
         q7Ew==
X-Forwarded-Encrypted: i=1; AL+hErF1rdYb0QY2QJ5xQIf7ZypP+9s65nSknJWa16ccJDXnoXbAIfuEUU+rthfP75uIY6nHgLAROZYCISmeAXxdZDmz@lists.infradead.org
X-Gm-Message-State: APuU4Z+7XOHIQAnd2f2CWv/+gr4ZcZOSx0BSsU3DIbWVvbZlMvJvVyh3
	+KsumYUWgXBS+nM2jJBEegDLtqYlAJHPEvEyvVmPASfKt+oV3vJtJBTs
X-Gm-Gg: AYBFou1sYUOAYZ/tsNraPnBikUHNpAEhhMcEfW4ORhdUiTEnv9Tt0u53W3A6m0O0xWB
	k9dqoTNAzUmJ8YpGkHcnqW6VD3pKvQSjCv5n8BK0mOfmOIYsU5sKpo8Y2kAtgZX3QKfCSq3TUKe
	lQih8s4ixFQCnKwQUHFYYUjwTullPpomcRdrOtMYOPsxw4bG28hVUHHXFn0N/x5WL0k5EZVHj9n
	TEAk3SppAnQbFrYm6B9BhupFY93diSZod2obkKRv/BYGZObM24bDzIEDGy+fryTF0VqB8nCJSRC
	vBiW3QSAG/mv/a93WJYpG4jFMqN65es0u13DzIDIhlBdGFJWTfbQ9OrmrY/0M4Xd78WQkZFHzIM
	IRs77UDQv72oD8StgKc8Pkq05tHRQPCu1bXHZvZ4CuSReCVKUeir2OLGIVd6ijBMZEemxdG/hRN
	Pd3ty3qZzw94zb3T6lTeq4cprNkcpSGRcqSgC/ISRynj5eoB5nXRgu+XEEocAl2VNHWItvWyBvY
	W77s+H3y/m/B7fgcu03HD4rJ7djbxStuNqCNaoRMIUiKbwYQO9mU03wzqwuu9OrLxQsGI6eqCc5
	sICnY65AmatPJ91mE96k7gYL5+lObnxrRteCb6hLAcmXzfkuYH7LX62otn0u9kUFArJVmupCm9s
	OS0pQrGGDPP9/v98GdNLuAzfBwf3AupbYig==
X-Received: by 2002:a05:600c:3111:b0:4bb:6118:4c9a with SMTP id 5b1f17b1804b1-4bb61184db8mr199081205e9.30.1794846867775;
        Mon, 16 Nov 2026 08:34:27 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:27 -0800 (PST)
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
Subject: [PATCH net-next v21 03/15] net: phylink: introduce internal phylink PCS handling
Date: Mon, 16 Nov 2026 17:33:46 +0100
Message-ID: <20261116163412.551438-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_163429_929125_7F8A200F 
X-CRM114-Status: GOOD (  38.99  )
X-Spam-Score: -0.2 (/)
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

Introduce internal handling of PCS for phylink. This is an alternative
way to .mac_select_pcs that moves the selection logic of the PCS entirely
to phylink with the usage of the supported_interface value in the PCS
struct.

MAC should now provide a callback to fill the available PCS in
phylink_config in .fill_available_pcs and fill the .num_possible_pcs with
the number of elements in the array. MAC should also define a new bitmap,
pcs_interfaces, in phylink_config to define for what interface mode a
dedicated PCS is required.

On phylink_create(), an array of PCS pointer is allocated of size
.num_possible_pcs from phylink_config and .fill_available_pcs from
phylink_config is called passing as args the just allocated array and
the number of possible element in it.

MAC will fill this passed array with all the available PCS.

This array is then parsed and a linked list of PCS is created based on
the allocated PCS array filled by MAC via .fill_available_pcs().

Every PCS in phylink PCS list gets then linked to the phylink instance
by setting the phylink value in phylink_pcs struct to the phylink instance.
Also the supported_interface value in phylink struct is updated with
the new supported_interface from the provided PCS.

On phylink_destroy(), every PCS in phylink PCS list is unlinked from the
phylink instance by setting the phylink value in phylink_pcs struct to NULL
and removed from the PCS list.

phylink_validate_mac_and_pcs(), phylink_major_config() and
phylink_inband_caps() are updated to support this new implementation
with the PCS list stored in phylink.

They will make use of phylink_validate_pcs_interface() that will loop
for every PCS in the phylink PCS available list and find one that supports
the passed interface.

phylink_validate_pcs_interface() applies the same logic of .mac_select_pcs
where if a supported_interface value is not set for the PCS struct, then
it's assumed every interface is supported.

A MAC is required to implement either a .mac_select_pcs or make use of
the PCS list implementation. Implementing both will result in a fail
on phylink_create().

A MAC defining .num_possible_pcs in phylink_config MUST also define a
.fill_available_pcs or phylink_create() will fail with an negative error.

phylink value in phylink_pcs struct with this implementation is used to
track from PCS side when it's attached to a phylink instance. PCS driver
will make use of this information to correctly detach from a phylink
instance if needed.

phylink_pcs_change() is also changed to verify that the PCS that triggered
a link change is the one that is currently used by the phylink instance.

The .mac_select_pcs implementation is not changed but it's expected that
every MAC driver migrates to the new implementation to later deprecate
and remove .mac_select_pcs.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 201 ++++++++++++++++++++++++++++++++++----
 include/linux/phylink.h   |  16 +++
 2 files changed, 196 insertions(+), 21 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index f482dc608810..e8ba906cfba6 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -63,6 +63,9 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* List of available PCS */
+	struct list_head pcs_list;
+
 	/* What interface are supported by the current link.
 	 * Can change on removal or addition of new PCS.
 	 */
@@ -522,6 +525,22 @@ static void phylink_validate_mask_caps(unsigned long *supported,
 	linkmode_and(state->advertising, state->advertising, mask);
 }
 
+static int phylink_validate_pcs_interface(struct phylink_pcs *pcs,
+					  phy_interface_t interface)
+{
+	/* If PCS define an empty supported_interfaces value, assume
+	 * all interface are supported.
+	 */
+	if (phy_interface_empty(pcs->supported_interfaces))
+		return 0;
+
+	/* Ensure that this PCS supports the interface mode */
+	if (!test_bit(interface, pcs->supported_interfaces))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int phylink_validate_mac_and_pcs(struct phylink *pl,
 					unsigned long *supported,
 					struct phylink_link_state *state)
@@ -535,6 +554,21 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 		pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
 		if (IS_ERR(pcs))
 			return PTR_ERR(pcs);
+	/*
+	 * Find a PCS in available PCS list for the requested interface.
+	 *
+	 * Skip searching if the MAC doesn't require a dedicated PCS for
+	 * the requested interface.
+	 */
+	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {
+		struct phylink_pcs *tmp;
+
+		list_for_each_entry(tmp, &pl->pcs_list, list) {
+			if (!phylink_validate_pcs_interface(tmp, state->interface)) {
+				pcs = tmp;
+				break;
+			}
+		}
 	}
 
 	if (pcs) {
@@ -549,13 +583,10 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 			return -EINVAL;
 		}
 
-		/* Ensure that this PCS supports the interface which the MAC
-		 * returned it for. It is an error for the MAC to return a PCS
-		 * that does not support the interface mode.
-		 */
-		if (!phy_interface_empty(pcs->supported_interfaces) &&
-		    !test_bit(state->interface, pcs->supported_interfaces)) {
-			phylink_err(pl, "MAC returned PCS which does not support %s\n",
+		/* Recheck PCS to handle legacy way for .mac_select_pcs */
+		ret = phylink_validate_pcs_interface(pcs, state->interface);
+		if (ret) {
+			phylink_err(pl, "selected PCS does not support %s\n",
 				    phy_modes(state->interface));
 			return -EINVAL;
 		}
@@ -968,12 +999,22 @@ static void phylink_pcs_enable_eee(struct phylink_pcs *pcs)
 static unsigned int phylink_inband_caps(struct phylink *pl,
 					 phy_interface_t interface)
 {
-	struct phylink_pcs *pcs;
+	struct phylink_pcs *pcs = NULL;
 
-	if (!pl->mac_ops->mac_select_pcs)
-		return 0;
+	if (pl->mac_ops->mac_select_pcs) {
+		pcs = pl->mac_ops->mac_select_pcs(pl->config,
+						  interface);
+	} else if (test_bit(interface, pl->config->pcs_interfaces)) {
+		struct phylink_pcs *tmp;
+
+		list_for_each_entry(tmp, &pl->pcs_list, list) {
+			if (!phylink_validate_pcs_interface(tmp, interface)) {
+				pcs = tmp;
+				break;
+			}
+		}
+	}
 
-	pcs = pl->mac_ops->mac_select_pcs(pl->config, interface);
 	if (IS_ERR_OR_NULL(pcs))
 		return 0;
 
@@ -1270,10 +1311,36 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 			pl->major_config_failed = true;
 			return;
 		}
+	/* Find a PCS in available PCS list for the requested interface.
+	 * This doesn't overwrite the previous .mac_select_pcs as either
+	 * .mac_select_pcs or PCS list implementation are permitted.
+	 *
+	 * Skip searching if the MAC doesn't require a dedicated PCS for
+	 * the requested interface.
+	 */
+	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {
+		struct phylink_pcs *tmp;
+
+		list_for_each_entry(tmp, &pl->pcs_list, list) {
+			if (!phylink_validate_pcs_interface(tmp,
+							    state->interface)) {
+				pcs = tmp;
+				break;
+			}
+		}
+
+		if (!pcs) {
+			phylink_err(pl,
+				    "couldn't find a PCS for %s\n",
+				    phy_modes(state->interface));
 
-		pcs_changed = pl->pcs != pcs;
+			pl->major_config_failed = true;
+			return;
+		}
 	}
 
+	pcs_changed = pl->pcs != pcs;
+
 	phylink_pcs_neg_mode(pl, pcs, state->interface, state->advertising);
 
 	phylink_dbg(pl, "major config, active %s/%s/%s\n",
@@ -1300,13 +1367,15 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 	if (pcs_changed) {
 		phylink_pcs_disable(pl->pcs);
 
-		if (pl->pcs)
-			rcu_assign_pointer(pl->pcs->phylink, NULL);
+		if (pl->mac_ops->mac_select_pcs) {
+			if (pl->pcs)
+				rcu_assign_pointer(pl->pcs->phylink, NULL);
 
-		if (pcs)
-			rcu_assign_pointer(pcs->phylink, pl);
+			if (pcs)
+				rcu_assign_pointer(pcs->phylink, pl);
+		}
 
-		pl->pcs = pcs;
+		WRITE_ONCE(pl->pcs, pcs);
 	}
 
 	if (pl->pcs)
@@ -1901,6 +1970,49 @@ int phylink_set_fixed_link(struct phylink *pl,
 }
 EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
 
+static int phylink_fill_available_pcs(struct phylink *pl,
+				      struct phylink_config *config)
+{
+	struct phylink_pcs **pcss;
+	int i, ret;
+
+	if (!config->num_possible_pcs)
+		return 0;
+
+	if (!config->fill_available_pcs) {
+		dev_err(config->dev,
+			"phylink: error: num_possible_pcs defined but no fill_available_pcs\n");
+		return -EINVAL;
+	}
+
+	pcss = kzalloc_objs(*pcss, config->num_possible_pcs);
+	if (!pcss)
+		return -ENOMEM;
+
+	ret = config->fill_available_pcs(config, pcss, config->num_possible_pcs);
+	if (ret < 0)
+		goto out;
+
+	for (i = 0; i < config->num_possible_pcs; i++) {
+		struct phylink_pcs *pcs = pcss[i];
+
+		if (!pcs)
+			continue;
+
+		if (WARN(rcu_access_pointer(pcs->phylink),
+			 "%s: PCS already attached to a phylink instance\n",
+			 __func__))
+			continue;
+
+		list_add_tail(&pcs->list, &pl->pcs_list);
+	}
+
+out:
+	kfree(pcss);
+
+	return ret;
+}
+
 /**
  * phylink_update_pause_state() - Update the phylink pause frame configuration
  * @pl: a pointer to a &struct phylink instance
@@ -2042,9 +2154,20 @@ struct phylink *phylink_create(struct phylink_config *config,
 			       phy_interface_t iface,
 			       const struct phylink_mac_ops *mac_ops)
 {
+	struct phylink_pcs *tmp, *pcs;
 	struct phylink *pl;
 	int ret;
 
+	/*
+	 * Make sure either PCS internal validation or .mac_select_pcs
+	 * is used. Return error if both are defined.
+	 */
+	if (config->num_possible_pcs && mac_ops->mac_select_pcs) {
+		dev_err(config->dev,
+			"phylink: error: either phylink_config .num_possible_pcs or .mac_select_pcs must be used\n");
+		return ERR_PTR(-EINVAL);
+	}
+
 	/* Validate the supplied configuration */
 	if (phy_interface_empty(config->supported_interfaces)) {
 		dev_err(config->dev,
@@ -2059,6 +2182,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	mutex_init(&pl->phydev_mutex);
 	mutex_init(&pl->state_mutex);
 	INIT_WORK(&pl->resolve, phylink_resolve);
+	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
 	if (config->type == PHYLINK_NETDEV) {
@@ -2096,16 +2220,31 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	/* Fill the PCS list with available PCS from phylink config */
+	ret = phylink_fill_available_pcs(pl, config);
+	if (ret < 0)
+		goto free_pl;
+
+	/* Link available PCS to phylink */
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		rcu_assign_pointer(pcs->phylink, pl);
+
 	phy_interface_copy(pl->supported_interfaces,
 			   pl->config->supported_interfaces);
 
+	/* Update supported interfaces */
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
 
 	ret = phylink_parse_mode(pl, fwnode);
 	if (ret < 0)
-		goto free_pl;
+		goto unlink_pcs_list;
 
 	if (pl->cfg_link_an_mode == MLO_AN_FIXED) {
 		ret = phylink_parse_fixedlink(pl, fwnode);
@@ -2124,6 +2263,14 @@ struct phylink *phylink_create(struct phylink_config *config,
 release_link_gpio:
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
+unlink_pcs_list:
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		rcu_assign_pointer(pcs->phylink, NULL);
+
+	synchronize_rcu();
+
+	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
+		list_del(&pcs->list);
 free_pl:
 	kfree(pl);
 	return ERR_PTR(ret);
@@ -2141,17 +2288,29 @@ EXPORT_SYMBOL_GPL(phylink_create);
  */
 void phylink_destroy(struct phylink *pl)
 {
+	struct phylink_pcs *pcs, *tmp;
+
 	sfp_bus_del_upstream(pl->sfp_bus);
 	phylink_destroy_sfp_cage_port(pl);
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
-	if (pl->pcs) {
+	/* Remove phylink instance from every PCS */
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		rcu_assign_pointer(pcs->phylink, NULL);
+
+	if (pl->pcs)
 		rcu_assign_pointer(pl->pcs->phylink, NULL);
+
+	if (pl->pcs || !list_empty(&pl->pcs_list))
 		synchronize_rcu();
-	}
 
 	cancel_work_sync(&pl->resolve);
+
+	/* Remove every PCS from phylink PCS list */
+	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
+		list_del(&pcs->list);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
@@ -2620,7 +2779,7 @@ void phylink_pcs_change(struct phylink_pcs *pcs, bool up)
 	rcu_read_lock();
 
 	pl = rcu_dereference(pcs->phylink);
-	if (pl)
+	if (pl && READ_ONCE(pl->pcs) == pcs)
 		phylink_link_changed(pl, up, "pcs");
 
 	rcu_read_unlock();
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 4a0dc6fa8010..418e8bec311d 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -12,6 +12,7 @@ struct ethtool_cmd;
 struct fwnode_handle;
 struct net_device;
 struct phylink;
+struct phylink_pcs;
 
 enum {
 	MLO_PAUSE_NONE,
@@ -151,6 +152,8 @@ enum phylink_op_type {
  *		     if MAC link is at %MLO_AN_FIXED mode.
  * @supported_interfaces: bitmap describing which PHY_INTERFACE_MODE_xxx
  *                        are supported by the MAC/PCS.
+ * @pcs_interfaces: bitmap describing for which PHY_INTERFACE_MODE_xxx a
+ *		    dedicated PCS is required.
  * @lpi_interfaces: bitmap describing which PHY interface modes can support
  *		    LPI signalling.
  * @mac_capabilities: MAC pause/speed/duplex capabilities.
@@ -160,6 +163,10 @@ enum phylink_op_type {
  * @wol_phy_legacy: Use Wake-on-Lan with PHY even if phy_can_wakeup() is false
  * @wol_phy_speed_ctrl: Use phy speed control on suspend/resume
  * @wol_mac_support: Bitmask of MAC supported %WAKE_* options
+ * @num_possible_pcs: num of possible phylink_pcs PCS
+ * @fill_available_pcs: callback to fill the available PCS in the passed
+ *			array struct of phylink_pcs PCS available_pcs up to
+ *			num_possible_pcs.
  */
 struct phylink_config {
 	struct device *dev;
@@ -172,6 +179,7 @@ struct phylink_config {
 	void (*get_fixed_state)(struct phylink_config *config,
 				struct phylink_link_state *state);
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+	DECLARE_PHY_INTERFACE_MASK(pcs_interfaces);
 	DECLARE_PHY_INTERFACE_MASK(lpi_interfaces);
 	unsigned long mac_capabilities;
 	unsigned long lpi_capabilities;
@@ -182,6 +190,11 @@ struct phylink_config {
 	bool wol_phy_legacy;
 	bool wol_phy_speed_ctrl;
 	u32 wol_mac_support;
+
+	unsigned int num_possible_pcs;
+	int (*fill_available_pcs)(struct phylink_config *config,
+				  struct phylink_pcs **available_pcs,
+				  unsigned int num_possible_pcs);
 };
 
 void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed);
@@ -497,6 +510,9 @@ struct phylink_pcs {
 	struct phylink __rcu *phylink;
 	bool poll;
 	bool rxc_always_on;
+
+	/* private: */
+	struct list_head list;
 };
 
 /**
-- 
2.55.0


