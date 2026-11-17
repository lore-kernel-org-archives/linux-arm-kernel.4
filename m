Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B73606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dBquOGkM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VSKUpg0k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C0jscx5DDVxF6lxNWbtWfTXvaQUi2T5SH8k3EmxiaYE=; b=dBquOGkMa4uCcD
	G6es41XtpIq4zQFC0kPx2AkFGKkZ2/uMcCA6FYEV8TIfqu1OZU7QcpsuBRCJWcvvOYVOat9pg+UQC
	xJYTTVCem7LrTxstEwymU6TuE63OCqvOBYnQ0h+7pn+tugs2tJCPxFAeZ+gkxkzJ1jzTx8ChE5/mP
	baKLjFq9RpapnnQ405omZ0+OEbvdggfL546NKfjJXtZAWrUvlj5MeU2V203WiNIeLUSBy4xGTCs+3
	VM8Ry5ufZgpDrT9iSLA4qXY+eCSBfWu/Q238O+CLb5OfxCQI3fxy3Bv7/YnohoMAKcwTVbSMYQI4p
	PaN0VHkkyM+tXszerumA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIW1-00000005h9E-0Lb0;
	Tue, 17 Nov 2026 12:42:25 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIU2-00000005fEI-075S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:40:30 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so20457965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 04:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919220; x=1795524020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C0jscx5DDVxF6lxNWbtWfTXvaQUi2T5SH8k3EmxiaYE=;
        b=VSKUpg0k9MP7ss/6DdOaSFpatftFgLpqxuDkUbp12wg8MX+Patofq5iC0y6TPQ86I+
         t3895G9tsnxg/bBl1r10r/a85UeZ82EGRM8yre10X7QmBQEe46I6koQOYeGP9X4bMRtv
         bU7Rlgringo7hMe8qLwTAmHAYQHIO1CvUsQYmxtIKMqDUwxwnTPQe/3fDEOI5aNvuGS1
         vQS5LfNI+64Fxv56oSfTVOAghqw5oUEVctRM+QXU3yZES2uZ0E35B755gSUVVFYDzKJX
         84Yf7KeQkFaYNEwdNd5unlp5fG6V2aIMyaIDIJAR5ejWLAfSL/LWvl2QMeDJcMkQeUiK
         UjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919220; x=1795524020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=C0jscx5DDVxF6lxNWbtWfTXvaQUi2T5SH8k3EmxiaYE=;
        b=f75A4Z2E4raij2wKabN/mQl9qczGGgrKWoQK9JU24GGa9HPDPt1Kk609EGLNR11UJJ
         UxV7HMz4D6XH/5jNrYWleBGn215tUsItCACQrYYL2swNj9EnIgE+NPgKtMqr2Jo8ebqf
         BlTyUzw/N1OlN+T25ydb5xzzCexVPQnk1Yb2At/zoHxDeHGaQ7L4MCw5ogupDuaM6KIb
         bVaqbdjhZkjg0ISojitPlZJmLjVUScVJtKnSMoAGqkM2YQg/zOqjWZWjP0mtQhhqT7Qs
         Lc1Tc+06Gio0MA4VYesYI8DyKNISApWBWGPwcR7t2/9UP7fBH98WkIQn3pC1ZUEcAhRG
         y/1g==
X-Forwarded-Encrypted: i=1; AL+hErFuWzz1aCfNrW3UgaTtXeLaUzdu09rriPmFvJRmWwAe5h3Z5WIw8dszNk/Wagri77RfyE5o67IZYHZ/Q10cOlCh@lists.infradead.org
X-Gm-Message-State: APuU4Z/XRPwLx3Vp5NyfOGd8nr5XCOui36j5mkUJGG370DabXVrF4X1u
	b7euY7syA/UuBMzh2WlGgO+gahxnvBFySChasPvoy9b2OM4EsoCZ2XJ4
X-Gm-Gg: AYBFou2ayIo3SI9ZNnvPU6WVTh9fPq7rc+q5VpSILkxUYhPm3sONYNya91lkm8oNaUV
	S+gwMI719q/MdG6TGUqFWul7TNlVa424ZBdbJ4ceJfLhyx0RKez2Hyq2SrVitjc4k5VDa/cU8wV
	lDGZWWjEaEyDfBo+K+DBaqDJVidqNsL/8pN76h3HLj2tRF0NImNmeFGGFd6s4DwJgOH+Zyn1ZtN
	H5SwCcLH2UlPKgVohpKsGwCiORqz/trx4sUy4dDIz9WNuOx2FPVMzevaoKeU35XmsiKZ8+ZjXQc
	iP7NbARYFHnKzWdBv9SDFRDDcuoY4eE0vEDOoGstELIwIWSJGXv40rKIAlCu+bhDxYGleRGj3I2
	nrQkk96G5v8nLytQRdIbQIeeq1I4N9zkBGMrFcSDQgKQINmZOoS9XNt/HOFljG4lWFWC6B+Ydzm
	rlGDTBAXt1dVvNOTL0+daUhACv+TQXdtIagOfgtIe8PdilYotnApTeoiKxzRcDY5ackXqs2A7Mo
	NVwnRxlZkQ3sutLg9zpz1NfX7o7Svn9FcINI+b3h4lcaGzhnLV4OuXZtRPFkdiA76BYMCo9gqLx
	XWgnlDSm5Sg2UhANvuorck22Sx62z4QoKHsrYuCe32hNsqWj9rzVWr7WSm+LD7Y6JqDObAEjbq7
	bcBKgZtol0vVxjk/3YGzX9t03OiNaG9/SJQ==
X-Received: by 2002:a05:600c:3b98:b0:4b7:6a8b:9df2 with SMTP id 5b1f17b1804b1-4bb55a8c128mr293542685e9.25.1794919220027;
        Tue, 17 Nov 2026 04:40:20 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:19 -0800 (PST)
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
Subject: [PATCH net-next v22 06/15] net: phylink: make phylink_validate state locked
Date: Tue, 17 Nov 2026 13:39:46 +0100
Message-ID: <20261117123956.11981-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_044023_064866_9F9748FF 
X-CRM114-Status: GOOD (  24.29  )
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

In preparation for support for PCS release/late attach, rework the
phylink_validate functions to be locked under the state mutex.

With the introduction of a notifier that can be called concurrently while a
phylink_create is called or an interface mode validation is being run, on
recalculating the supported interface and capabilities, an inconsistency
can be introduced with 2 validation run at the same time.

To handle this, make the phylink_validate lock under the phylink state
mutex, add lockless variant for phylink_validate_mask and phylink_validate
and add lockdep check to make sure the mutex is held in the inner
validate functions.

Function that already run phylink_validate under state mutex, are updated
to use the lockless variant.

Special care was needed for phy_get_rate_matching that required a lockless
variant. This is introduced by adding an internal phy header.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phy-internal.h | 22 ++++++++++++
 drivers/net/phy/phy.c          | 11 +++---
 drivers/net/phy/phylink.c      | 62 ++++++++++++++++++++++++++++------
 3 files changed, 79 insertions(+), 16 deletions(-)
 create mode 100644 drivers/net/phy/phy-internal.h

diff --git a/drivers/net/phy/phy-internal.h b/drivers/net/phy/phy-internal.h
new file mode 100644
index 000000000000..56d87495e1f0
--- /dev/null
+++ b/drivers/net/phy/phy-internal.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef __PHY_INTERNAL_H
+#define __PHY_INTERNAL_H
+
+#include <linux/lockdep.h>
+#include <linux/phy.h>
+
+static inline int __phy_get_rate_matching(struct phy_device *phydev,
+					  phy_interface_t iface)
+{
+	int ret = RATE_MATCH_NONE;
+
+	lockdep_assert_held(&phydev->lock);
+
+	if (phydev->drv->get_rate_matching)
+		return phydev->drv->get_rate_matching(phydev, iface);
+
+	return ret;
+}
+
+#endif /* __PHY_INTERNAL_H */
diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index fce9bc7be330..e305bbff16ad 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -38,6 +38,7 @@
 
 #include "phylib-internal.h"
 #include "phy-caps.h"
+#include "phy-internal.h"
 
 #define PHY_STATE_TIME	HZ
 
@@ -146,13 +147,11 @@ EXPORT_SYMBOL(phy_print_status);
 int phy_get_rate_matching(struct phy_device *phydev,
 			  phy_interface_t iface)
 {
-	int ret = RATE_MATCH_NONE;
+	int ret;
 
-	if (phydev->drv->get_rate_matching) {
-		mutex_lock(&phydev->lock);
-		ret = phydev->drv->get_rate_matching(phydev, iface);
-		mutex_unlock(&phydev->lock);
-	}
+	mutex_lock(&phydev->lock);
+	ret = __phy_get_rate_matching(phydev, iface);
+	mutex_unlock(&phydev->lock);
 
 	return ret;
 }
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 091c3a79c120..88280866c19a 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -9,6 +9,7 @@
 #include <linux/ethtool.h>
 #include <linux/export.h>
 #include <linux/gpio/consumer.h>
+#include <linux/lockdep.h>
 #include <linux/netdevice.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
@@ -24,6 +25,7 @@
 #include <linux/workqueue.h>
 
 #include "phy-caps.h"
+#include "phy-internal.h"
 #include "sfp.h"
 #include "swphy.h"
 
@@ -550,6 +552,8 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 	unsigned long capabilities;
 	int ret;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	/* Get the PCS for this interface mode */
 	if (pl->mac_ops->mac_select_pcs) {
 		pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
@@ -628,13 +632,15 @@ static void phylink_validate_one(struct phylink *pl, struct phy_device *phy,
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(tmp_supported);
 	struct phylink_link_state tmp_state;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	linkmode_copy(tmp_supported, supported);
 
 	tmp_state = *state;
 	tmp_state.interface = interface;
 
 	if (phy)
-		tmp_state.rate_matching = phy_get_rate_matching(phy, interface);
+		tmp_state.rate_matching = __phy_get_rate_matching(phy, interface);
 
 	if (!phylink_validate_mac_and_pcs(pl, tmp_supported, &tmp_state)) {
 		phylink_dbg(pl, " interface %u (%s) rate match %s supports %*pbl\n",
@@ -648,15 +654,17 @@ static void phylink_validate_one(struct phylink *pl, struct phy_device *phy,
 	}
 }
 
-static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
-				 unsigned long *supported,
-				 struct phylink_link_state *state,
-				 const unsigned long *interfaces)
+static int __phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
+				   unsigned long *supported,
+				   struct phylink_link_state *state,
+				   const unsigned long *interfaces)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(all_adv) = { 0, };
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(all_s) = { 0, };
 	int interface;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	for_each_set_bit(interface, interfaces, PHY_INTERFACE_MODE_MAX)
 		phylink_validate_one(pl, phy, supported, state, interface,
 				     all_s, all_adv);
@@ -667,14 +675,36 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 	return phylink_is_empty_linkmode(supported) ? -EINVAL : 0;
 }
 
-static int phylink_validate(struct phylink *pl, unsigned long *supported,
-			    struct phylink_link_state *state)
+static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
+				 unsigned long *supported,
+				 struct phylink_link_state *state,
+				 const unsigned long *interfaces)
+{
+	int ret;
+
+	if (phy)
+		mutex_lock(&phy->lock);
+
+	mutex_lock(&pl->state_mutex);
+	ret = __phylink_validate_mask(pl, phy, supported, state, interfaces);
+	mutex_unlock(&pl->state_mutex);
+
+	if (phy)
+		mutex_unlock(&phy->lock);
+
+	return ret;
+}
+
+static int __phylink_validate(struct phylink *pl, unsigned long *supported,
+			      struct phylink_link_state *state)
 {
 	const unsigned long *interfaces = pl->supported_interfaces;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	if (state->interface == PHY_INTERFACE_MODE_NA)
-		return phylink_validate_mask(pl, NULL, supported, state,
-					     interfaces);
+		return __phylink_validate_mask(pl, NULL, supported, state,
+					       interfaces);
 
 	if (!test_bit(state->interface, interfaces))
 		return -EINVAL;
@@ -682,6 +712,18 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
 	return phylink_validate_mac_and_pcs(pl, supported, state);
 }
 
+static int phylink_validate(struct phylink *pl, unsigned long *supported,
+			    struct phylink_link_state *state)
+{
+	int ret;
+
+	mutex_lock(&pl->state_mutex);
+	ret = __phylink_validate(pl, supported, state);
+	mutex_unlock(&pl->state_mutex);
+
+	return ret;
+}
+
 static void phylink_fill_fixedlink_supported(unsigned long *supported)
 {
 	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, supported);
@@ -2117,7 +2159,7 @@ void phylink_update_mac_pause_capabilities(struct phylink *pl, unsigned long mac
 	else if (pl->sfp_bus)
 		linkmode_and(pl->supported, pl->supported, pl->sfp_support);
 
-	phylink_validate(pl, pl->supported, config);
+	__phylink_validate(pl, pl->supported, config);
 
 	pause_state = config->pause;
 
-- 
2.55.0


