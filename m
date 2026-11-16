Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43398606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IXsAGrHm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=c1u9Lg32;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HuwN0ip+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=; b=IXsAGrHmJ4XhFn
	MmeDBkzbWCVv2TY5gI1r3Ciwcg1Tw7oZO4okdR6s5yAU5KOGxqwAzfaBeUnDZdA6r4W4V8xF/2p3k
	TqUkzgUIbuPH05nL7zg027GDdzp+cCK7jy70/j4gVTbSwzjTo9h+G1XsGE+bPALn99MKrd/wVBU1r
	kM+cefLUz3IvzNKcprwR3yVViUeIy5hDyOkkoCA6OyTQHzeTDbYcL5ULSoxw7Fixxz+uCzQBqSpNv
	w1Eb9qHpVNpsJJnBuOvJ/nAPtKB6jBW++otL5u5kf0SOoV/CWb3bQKHXggJTROHVHx/zLLzE7NAO7
	WD2nkonJQxAqgtc+Aowg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzfD-00000003FJ7-3hGk;
	Mon, 16 Nov 2026 16:34:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzf4-00000003F8p-1y0D
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Nov 2026 16:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=; b=c1u9Lg32skGtpvw5ELOa42TKOq
	EObYZteprC2YxWUALK9HGTyuwNPsWbnB1Rkxoaoj8ZRwcrWMy/5dsNgsZ9lOsm3hrYpi4Sngo4Dx7
	Y1AfVtBb4Xwc9/YtjpG7lBnOqrv4G0hXmDVlYSjEokCqanWf+N7jNFqwaNnuQBQNafEGSvJ6/cdQK
	b7Jo7ZoGQBUNvK8DSMnQfE/9SCJ1B9PupWQwhK5Zb+DxaD/FVj8hXgie76pLg3+enh5sbVBJ1cnqS
	2AUL/h0P42pICh5Wjn1L95QM6JdS/ZNIbcqXIl90UEHI36XTx/9SBaGnJ/K8s2E9i99bEvLsUhvuM
	ZLOlpoJQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzez-0000000E4C2-2kt9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:34:27 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-49a92144733so1463749f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 08:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846864; x=1795451664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=HuwN0ip+TGClsjhHAHXGtyI8p6Y+SJ5blHjNgC4lV5g+EyGpmky3/DYXqWnsjVrXLN
         xM4C/LSFnUeUOsvdWb5P4NuW5pUgfLTlpQoOwHywd3C/xzxMGTjUbzI0Oa+ilYtEfVsf
         TpZ6jOw+7NRI83hhGMa0ofn0GiVyyZ2Vspi2fcqOhRVcWIT1z9hUjwXnxRGKAFC9pGr+
         f/KYbgVHSGFlIu5w9JcOAkoae4FkR1EhZ06NxAZQ0Kgl2e24r7jtH3y+6hKUWhLGSEnN
         mYMQmHItz6u5L9q8V09GqLpgmvEXBw5QIkyDWOJexecQ2Tc3xGV6CvgwmVoQZ4GHfVe2
         s1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846864; x=1795451664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iqXUKOcy9qCieLizcJg3vkRsvwt8JgXWNmMSevngILY=;
        b=NOR7y/wAYXE/a/Zj9No/MglORvVzahpx2dc35dkfB2VbT2JqF8M8fSNmENYSyshUwK
         8zsuFvsBQtXsgrerWHtxLyMKZAGTgL0nq4hQrOr612ENPrvlL/9OzHEHzgI+QfE4op4n
         kOKdOOHi2bE1K7HXubG/TlhRiUJfCGEdN49C6bkeEbG7WOGlqNMi2L4BruMRvBqxpHd3
         QmJgiHroleEQe6Qv0Ch2HpaRV2aWy2p6gC7El+CFZSLIudAF5UQxobCn7inLyY2cRMt5
         TVyvFQ/PdFiWMNUNfwcVWcmMf5Qlfu+0meWzYefrW+E0RwVYaOo28GUwu+buAOopLtFi
         oTMg==
X-Forwarded-Encrypted: i=1; AL+hErFvEkvxziQFtLE5DdyCa9czqwMOOoPeaghi4V4LwcClCJNMUrz5bjA7/7gRdYUNTcXhmdXDfntl+FCCC0bzfSiI@lists.infradead.org
X-Gm-Message-State: APuU4Z8kmvhCKBwzE0DeeDR5twu0o1/0/oxHP4Vs+vSIRVO44me96Gmk
	wwgM9hgOhUbtjWF4y/rjOoO8oH1LyYOxcrVKx/d//NTFT+1q0xx2iGtE
X-Gm-Gg: AZFdTZeDmBogIcaXNRl8uy5G9yvdRiUqIAro0RWz4XvIhMbMt55hFTiacVXPOZujJA6
	MUZ+piLtXSrmHmAC6QONInlsKoektHBV1aYvubo7KkQXDExjUKuNyurKTi2S77aB2aS/ru5Yagt
	/vFdUxphgYa25NTSqncZVJkacZVZGcDDftzYtO0R6Ffp9WShK3/R5V5r38JaHvzteV+QX8c5uzR
	3atLEQR6hEUEzwStplXwcRqLEWLElqQbadPedk5NQzY7TQAEzKPr7ZbLZsGDeBH7JE5HcP76i2a
	T4IYJSkgr0zSv7wNLqxYTJYuDwXHZQnQyi1VYD4MHuhkYGz1DRvIEzR+OZSAvHZohcYNP0TFLsC
	iRdxXU5jCaBL0V1AIHAw0asfg3D+b5zLkdnefu6j/ZoOQKdMXDzqtTO6ukXoRDIKaOnix4wcpQg
	Byj8pP740PWozGRpXvKVlcbML4nQwUu0nld2N1AwHqaYGO/GWn4OIOaYTA4LKmhRlCBVTpKzsV+
	vRej7q6dLZoQLNcxGY+TnsP0mMSon4tANIS+RjX4tQ1jl/OwILtEDNGSaQ9xbPZn5aVo5+/Nc4h
	ZlU/h5uYemMu/WXR08i1Z762KaVtjlkhR61sxIw6Iefk0I55Nae1O/B03Ujf+sEVSOSi1ecwODL
	pdmQBgVFU7nmUkHUyNR/ZpnDS/cj3vaCKhFgbsonruujKOtMmk4hY95I=
X-Received: by 2002:a5d:59ca:0:b0:487:13f:f612 with SMTP id ffacd0b85a97d-49c723fb77dmr22962598f8f.37.1794846863544;
        Mon, 16 Nov 2026 08:34:23 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm23840506f8f.8.2026.11.16.08.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:34:22 -0800 (PST)
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
Subject: [PATCH net-next v21 01/15] net: phylink: make PCS phylink instance access RCU protected
Date: Mon, 16 Nov 2026 17:33:44 +0100
Message-ID: <20261116163412.551438-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116163412.551438-1-ansuelsmth@gmail.com>
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_163425_678944_2EA03678 
X-CRM114-Status: GOOD (  17.66  )
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

In the context of phylink_pcs_change(), phylink instance is dereferenced
from the pcs pointer present in the phylink_pcs struct.

There is currently a fragility where this pcs pointer is never set NULL in
phylink_destroy() and would reference invalid memory after phylink instance
is freed.

In this scenario, if a PCS driver calls phylink_pcs_change(), invalid
memory can be dereferenced and phylink_link_changed() is called on freed
memory.

To address this, make the phylink instance saved in phylink_pcs struct RCU
protected and access it under RCU lock.

Also correctly reset the phylink instance pointer on phylink_destroy() and
syncronyze RCU to catch an execution of phylink_pcs_change().

Fixes: 24699cc1ff3e ("net: phylink: add support for PCS link change notifications")
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 17 ++++++++++++++---
 include/linux/phylink.h   |  2 +-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e7734e45376c..d9d0ace2042e 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -17,6 +17,7 @@
 #include <linux/phy_link_topology.h>
 #include <linux/phy_port.h>
 #include <linux/phylink.h>
+#include <linux/rcupdate.h>
 #include <linux/rtnetlink.h>
 #include <linux/spinlock.h>
 #include <linux/timer.h>
@@ -1295,10 +1296,10 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 		phylink_pcs_disable(pl->pcs);
 
 		if (pl->pcs)
-			pl->pcs->phylink = NULL;
+			rcu_assign_pointer(pl->pcs->phylink, NULL);
 
 		if (pcs)
-			pcs->phylink = pl;
+			rcu_assign_pointer(pcs->phylink, pl);
 
 		pl->pcs = pcs;
 	}
@@ -2137,6 +2138,11 @@ void phylink_destroy(struct phylink *pl)
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
+	if (pl->pcs) {
+		rcu_assign_pointer(pl->pcs->phylink, NULL);
+		synchronize_rcu();
+	}
+
 	cancel_work_sync(&pl->resolve);
 	kfree(pl);
 }
@@ -2601,10 +2607,15 @@ EXPORT_SYMBOL_GPL(phylink_mac_change);
  */
 void phylink_pcs_change(struct phylink_pcs *pcs, bool up)
 {
-	struct phylink *pl = pcs->phylink;
+	struct phylink *pl;
+
+	rcu_read_lock();
 
+	pl = rcu_dereference(pcs->phylink);
 	if (pl)
 		phylink_link_changed(pl, up, "pcs");
+
+	rcu_read_unlock();
 }
 EXPORT_SYMBOL_GPL(phylink_pcs_change);
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 3a88a69882a6..4a0dc6fa8010 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -494,7 +494,7 @@ struct phylink_pcs_ops;
 struct phylink_pcs {
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
 	const struct phylink_pcs_ops *ops;
-	struct phylink *phylink;
+	struct phylink __rcu *phylink;
 	bool poll;
 	bool rxc_always_on;
 };
-- 
2.55.0


