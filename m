Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD34606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 10:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UJtqRAt+;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k149wZqs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=; b=UJtqRAt+Mc8Y7Q
	ifKAFkuv64GvZ+c6rFtbIemKv78QEWt4jFL8/MibQCMt4rOmcNnAEU3wGawSQyjrDyayMmGyJT2+j
	tWpfyWGuryEeiFOq/uRYmTKVGftfbIpozSwqCHvwZ8CjWRWTvVY60LsPjG78GnUfADS8qR3PKDANC
	sRXKglDGuxjJTRC59UagZl9fkBd8SSHYgBETwJmvwFCjRXsNX8rVMT+H3VyDzwS1e6dNPcAOfqMbz
	EuTnOE8msmGSXoWKAQBwWpZmDkSgXRQOfnKFYBqLGzqFjvzofUCCKTHxyq7IM+GyGczCu0EWwu3zT
	z/KXPRXWYPNKyH6lHKDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBFk-0000000Fn4G-0STj;
	Sat, 14 Nov 2026 10:45:00 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSBFU-0000000FmmQ-2bIs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 10:44:45 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4bb6754bf2dso904595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 02:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653083; x=1795257883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=k149wZqsTR198366J4A8uIENLK0tC6gk0D7Ergun2o7pSUukLzA0X/dWN3eLgaeAK9
         +foH2miuUaleAfOoXz+/pFJtq0OC0r1STD7yrzYdjZWtT+WVsn9PEVrvul7eO4b1JFxB
         CuvCIxZoPPAtVEur98DBa8cLNptwA0ka42jyYBf1P4TqrD2qEGLUyZPQSKkha6vYzPV+
         5M1ZY1yZOFHb7Spj18lartsqLnHkvJEeDGO9r6WOlbN3PPJkNznFMHt5AqeknPFuG7EX
         pqLka/UZ+9eiSAuD0YZXCD55esq8jp+8VFEenKRABJli60ujyRiWnUG83nWUT14EB7vu
         wM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653083; x=1795257883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=di0YXOvt1TX8fBMVPqb7dX4e39H6bFtaLw/ptG6JcXE=;
        b=1xMj47nvoXrA+1fDmgBe/sQiBy19yUk974NK3/JD+znY6W9VzOyRlpl5agucPuFAmm
         xLQzlkSqSlMJF4zOryUiRgssfv5zwL/hvyrycULSmosebch7R2Dy1rvlO4RVvQ1GjY4s
         q495EYpmIFQij4EfDByYp0sIMqEMRsGxlPC7GaVWyI6BsjgG0EYRZo5S58mIHevdr53T
         tVQnmu8tXy5U8wPioNF4qv9ar8EawDLesMKecuPJFxc5rQfpxw4ZF5aXCtRGj98sV4vK
         BRFK038/29h7sq5gGQWyUTxALH6XPa6N/Z3u9I3wWI/OCQhRKzqjgFFWZ10YMn+nKqp+
         2+Sg==
X-Forwarded-Encrypted: i=1; AL+hErGa6UgP/uIlp7MpExRIuLeY/Z/OkvEt0aCZpmUaX2BAyVotqAlKdhd6n9tNYJOGRociYvX6M1uhH0PsSVMhzr19@lists.infradead.org
X-Gm-Message-State: APuU4Z+1Uaz8rnUZ0DVxrGqhUOceiY8+1USYHtzmGLKdqNtQqm6NL8Vb
	qrLn3poBkmpue796AO6j/ASWcc57y1N7Lm5dfsIpOZ4634ZitTm/aKCg
X-Gm-Gg: AYBFou0jluINj9LzNOzNw+F4aPtbgW91fv9venatDOZuUvOaoYUxqTA6he+cCN6/WBQ
	uoOTajM53f0LuOR9qniU6lQ3URhGIXjn0Aa8QoBFiEq33t2I41zeTNF56/wLIS529YaLZ2ytc4I
	0sA3QRNOkg8KX20yixs1PAvYv6dLNI16yoCYrELiDoi886E4h5K+5IoK4x6mVVTgXAP3tRwRwgZ
	N6uvQV8hUlEPNMbWZCqnkjeARkMS/axyATmIjn+9SjFrasgk3EEzkF9ecvFdR0tAX50IeWGhOGb
	bveVV4X4ODim7eHDyBQM/WV+M4j5J+SbhCY6uYIzxERKJp3f3ZjjUGjAi5wCAfng+rEc81hiqVF
	C8qHjccYqVKNRxHEEJCqu8elAQuCPM3ysxm7NyrwGD6OLDjX4SSKYITInd7Uf+9arLPQaO28ZVF
	1eLT9gE5qC4YChSWObjXkFU8tgkqgw6xk/uYj3PMMlTlhfArQLuxnsEQmSEVQLtXXHldOwEdLzS
	DcsethvW3iGxCrL96GUfrG1e6YavaJ+Ppb13bDVbBOX91quRsYBP5ybciXESU0q0Xo+wzrI75vC
	qADmiQs//UmI7KyAUzQCD5AUxXddH8agk5jYlq4JTxoHoDJTDZH5Fr0ur9mdIa/SQuyltS5DBvb
	F2QeDJfYIXMHs2z4ADv8hJEAn3M63hoJ38g==
X-Received: by 2002:a05:600c:6089:b0:4b9:ff94:6b7a with SMTP id 5b1f17b1804b1-4bb55a7ed16mr107792215e9.20.1794653082907;
        Sat, 14 Nov 2026 02:44:42 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:42 -0800 (PST)
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
Subject: [PATCH net-next v20 05/15] net: phylink: save phylink instance fwnode on phylink_create
Date: Sat, 14 Nov 2026 11:43:44 +0100
Message-ID: <20261114104426.235620-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_024444_730226_0A775642 
X-CRM114-Status: GOOD (  14.32  )
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
index 64b00d324988..e2e0b313fd61 100644
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


