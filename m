Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFD3606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 10:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ymknuEYE;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fP5uagtU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lWUJ9pDK5lziRyipoDWPq3ij9eCtCYwKAQqvMpmsF7Q=; b=ymknuEYEaVbNa9
	l3pnZq7+ezlWo107tXq9EhzTBUOPzzf33eaW1u8jKjeb7YR1oT5lEUDn+m2vNvVWLYMOwrt+rlfEZ
	0emEkPtLXnal3NFPZIB0juhU/q3ZS0fWWmYosu17DJs81wtmo9zeA+0CEqXq31JSPW97af8BTTJvw
	SbXvhZw9mfZ1LNmy5jOlGLRxrdpaetpgDnJ9dKhzPI/6MQiqCXM0g8yAL3wn/zeKihmLNoGwLod9Z
	aZV03rX3nCwbvQJXP1NBt7N/t3yXQ2eGSRGP8rUgfKGJB5HwEtZxwjSvlIM++y/7HRBqjXMg2N4vG
	mJyOnUsl2Fy6wy1jpflA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBFk-0000000Fn6Z-3zQQ;
	Sat, 14 Nov 2026 10:45:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBFW-0000000FmoY-2Kl0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 10:44:47 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a210470b49so14781525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 02:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653085; x=1795257885; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lWUJ9pDK5lziRyipoDWPq3ij9eCtCYwKAQqvMpmsF7Q=;
        b=fP5uagtUCignTPLNbACOWRq+DaXAeaJdVY0niHGdATtfGV1B+LZh7nCGLwWWUcVSxS
         SffiBLTFDcaoBAIuUz34rrjzQy9CepUb+lT8Tl2YaRX6TQHkQDfETtTvBj4NE6OqNrkM
         w51FqPvpoLH9l8niTqrtVdnOO4i9eLQd/5OgLgpvacKI5QcBd7nW1mXWMXR9D+u1is4h
         4mKCxXsPybh5ySE5tKHojXjeClpTm542XCYvbXv7kyOeKnEYG2y7Zzjf/iCvYd/hAKGN
         Om0E7psJ88yccvi5r+1SSzqGnrZHVR1s8XHvzp1annCHAYijasjboE3maFNNbpyiRRsv
         ktBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653085; x=1795257885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lWUJ9pDK5lziRyipoDWPq3ij9eCtCYwKAQqvMpmsF7Q=;
        b=NNtfsm0Jt+zYOPFeGYK9+cp3cUFIzQ422FMrQ03sf+xhbBSdUyOG/KtMquAZ6TMtCu
         27YIuYidY4+eOAV3M6kjuK2ZCskHtQMP+hEFZUXWTXLzT2c+ekNlHnhLgvqzD2+3bcL1
         VdyCq3TRXbuwzHo5KIl89SAqXvb986KX/PTUYJYlbyQr5liBeD52ZUoAlK54jozUIxxw
         5RsbOhPNnmCoBw76xMQ5KjfUXQhabwHG535bTteBf5q+FNkOwK/6oyrkNQnhtjta9dWM
         iX5bhc0cYAuXE6Icpm1XRAN6xEg+70MSl83TrEbKZ2xrUoRI/UqQ2G5hnx3k3jQjs0Sd
         1wMA==
X-Forwarded-Encrypted: i=1; AL+hErGHGaWYwJQmmaj3bSwDukTCGr4JGdUoXGuMvtcvPU5LilBqrlnk1n/fs/K0nDBxDfYMxDb5EOlxzjITtafVVFM+@lists.infradead.org
X-Gm-Message-State: APuU4Z8qTsYYmG9gXhXU455QS9vUW7JN3K8T+/kKdOLpfPaLvgzgLe+b
	Kmksm8AZ9zLf1bYRHqXvdyvX1sqJpKFs36PUoYRJ/xp5Xk2M8+l7vow2
X-Gm-Gg: AYBFou2KJsQ1UQTQtqT2zKXqNeoA72Ki9KujfigCyHnryUoxu2rgP4inupZ+Rj8VIdP
	EOv201ndWc1lCOsbwwC97Ux1VFDtduztq+orxOuqfPSLHA0grMeh1SHLbgNECEr6MrLbta0xlTB
	um3tI6c2LoxojhOtwC7WULXjiQcAGyn9CqKLXubUgJpmtdqPgrMWA324TBN0gmarHKlmnUfgTPI
	cZisk13B82nBYI7V4PAN8TWPagRc5WEwumzQVE9krFVhtNwyUKeV6d66pq4MKRU5KEWCtK1p8bh
	fwqykDe3ca8zAMxpmqlDtJPJ0qZrIXyeUCtpGF+DF4+nnDOGEmQwJ2oGVZXnS72FTh/bo6qSyws
	6mL1YQYRipG97qdQ0jydG3PIowRTYyw+KPaNNF+QJ7dkvhhBawmzwsqhATM+i26QAqYGKfB6/IQ
	i8o346yp+K8blB5FWh+sGozJBzzkfJMxkJ41EcW4ZRIdfnT28EnHJIZK074lOU/Ac9b+ASHVhOJ
	4RWTv8LOB5simfcX8rCJanzOMLWO9tIWMbFYdIV00tc/Zmr/KoxeN8eObQrJgQj5WkIkjH+tqFw
	FSq0ax4bWb7wrsyRAydQxwborhxDZQQL7N8WnlirOx3WDI8orUDNRbL4Z/bwRWXoswpSiiodqRd
	u2k7Cjob3lMDkjNT/zn4KoKdPPed1IzZExQ==
X-Received: by 2002:a05:600c:544:b0:4ba:2bfc:c8b5 with SMTP id 5b1f17b1804b1-4bb55a662f9mr75106665e9.10.1794653084661;
        Sat, 14 Nov 2026 02:44:44 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:44 -0800 (PST)
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
Subject: [PATCH net-next v20 06/15] net: phylink: make phylink_validate state locked
Date: Sat, 14 Nov 2026 11:43:45 +0100
Message-ID: <20261114104426.235620-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_024446_618148_3FC46094 
X-CRM114-Status: GOOD (  19.34  )
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 53 ++++++++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e2e0b313fd61..a7ec4feb950a 100644
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
@@ -550,6 +551,8 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 	unsigned long capabilities;
 	int ret;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	/* Get the PCS for this interface mode */
 	if (pl->mac_ops->mac_select_pcs) {
 		pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
@@ -628,6 +631,8 @@ static void phylink_validate_one(struct phylink *pl, struct phy_device *phy,
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(tmp_supported);
 	struct phylink_link_state tmp_state;
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	linkmode_copy(tmp_supported, supported);
 
 	tmp_state = *state;
@@ -648,15 +653,17 @@ static void phylink_validate_one(struct phylink *pl, struct phy_device *phy,
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
@@ -667,14 +674,30 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
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
+	mutex_lock(&pl->state_mutex);
+	ret = __phylink_validate_mask(pl, phy, supported, state, interfaces);
+	mutex_unlock(&pl->state_mutex);
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
@@ -682,6 +705,18 @@ static int phylink_validate(struct phylink *pl, unsigned long *supported,
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
@@ -2117,7 +2152,7 @@ void phylink_update_mac_pause_capabilities(struct phylink *pl, unsigned long mac
 	else if (pl->sfp_bus)
 		linkmode_and(pl->supported, pl->supported, pl->sfp_support);
 
-	phylink_validate(pl, pl->supported, config);
+	__phylink_validate(pl, pl->supported, config);
 
 	pause_state = config->pause;
 
-- 
2.55.0


