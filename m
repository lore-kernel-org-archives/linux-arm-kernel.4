Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998FD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 03:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XScNOL0a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UYnHuD95jjTU7bUbz610BGDINyKJ2tUuvBJYRsnN3iQ=; b=XScNOL0apaE6r5
	nLCNswHv35gELYnb7xqzWor3Hl1i7JeTPWjE7dcIJdDi4O189hSkm14AytninFvnenDyYkbr3u1kp
	u3S+lb0o/5b9agUtZ2z1idE1j4U4PJOtIf75pxJRymvcXTPOlNIOinXrvz00P6xCQEyF8v1GsItEx
	mluzqc9lMjtBZN5mJjhSuL99Pb1xMeo873HEwzZ4T7PToZ6EKzvKmyNN7qW+zngkgEkSy+u/sxYZt
	5HyGlkE64an2zxBf5ZFyVP734MRGK5NzT4Z7SJsUU6TAt2HYlaKtElryPGe9uWWAlEhEJe5dQiFUM
	9el5E90YHEaPoliJ5ogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWQZS-0000000C2A8-1Ba4;
	Thu, 26 Nov 2026 03:54:54 +0000
Received: from out28-170.mail.aliyun.com ([115.124.28.170])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWQZ8-0000000C23U-3RZ1;
	Thu, 26 Nov 2026 03:54:36 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1369101|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00221578-0.000296395-0.997488;FP=14794307250485396133|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033025068124;MF=wangxiaolei01@kaihong.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.kASpfSd_1795665269;
Received: from nj-vm-261.pxvirt.local(mailfrom:wangxiaolei01@kaihong.com fp:SMTPD_---.kASpfSd_1795665269 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 26 Nov 2026 11:54:31 +0800
From: Xiaolei Wang <wangxiaolei01@kaihong.com>
To: linusw@kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com,
	wangxiaolei01@kaihong.com,
	iivanov@suse.de,
	andrea.porta@suse.com,
	phil@raspberrypi.com
Cc: linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: rp1: use pinctrl_utils_free_map() for map cleanup
Date: Thu, 26 Nov 2026 03:54:20 +0000
Message-Id: <20261126035420.1836760-3-wangxiaolei01@kaihong.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126035420.1836760-1-wangxiaolei01@kaihong.com>
References: <20261126035420.1836760-1-wangxiaolei01@kaihong.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_195435_175590_F25198A5 
X-CRM114-Status: GOOD (  11.18  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The rp1 driver open-codes a dt_free_map callback that frees the config
arrays of pinctrl maps and the map array itself.  This duplicates
pinctrl_utils_free_map(), which the pinctrl core already provides for
exactly this purpose.

The local copy only handles CONFIGS_PIN maps.  Because the driver can
delegate map creation to the generic pinconf DT parser, CONFIGS_GROUP
maps may also be produced, and their config arrays would be leaked by
the open-coded version.  The core helper handles both types, so using
it removes the duplicate code and closes that leak at the same time.

Signed-off-by: Xiaolei Wang <wangxiaolei01@kaihong.com>
---
 drivers/pinctrl/pinctrl-rp1.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
index 99566a25ecb4..bf2c300eef29 100644
--- a/drivers/pinctrl/pinctrl-rp1.c
+++ b/drivers/pinctrl/pinctrl-rp1.c
@@ -1089,18 +1089,6 @@ static void rp1_pctl_pin_dbg_show(struct pinctrl_dev *pctldev,
 		   irq, irq_type_names[pin->irq_type]);
 }
 
-static void rp1_pctl_dt_free_map(struct pinctrl_dev *pctldev,
-				 struct pinctrl_map *maps, unsigned int num_maps)
-{
-	int i;
-
-	for (i = 0; i < num_maps; i++)
-		if (maps[i].type == PIN_MAP_TYPE_CONFIGS_PIN)
-			kfree(maps[i].data.configs.configs);
-
-	kfree(maps);
-}
-
 static int rp1_pctl_legacy_map_func(struct rp1_pinctrl *pc,
 				    struct device_node *np, u32 pin, u32 fnum,
 				    struct pinctrl_map *maps,
@@ -1286,7 +1274,7 @@ static int rp1_pctl_dt_node_to_map(struct pinctrl_dev *pctldev,
 	return 0;
 
 out:
-	rp1_pctl_dt_free_map(pctldev, maps, reserved_maps);
+	pinctrl_utils_free_map(pctldev, maps, reserved_maps);
 	return err;
 }
 
@@ -1296,7 +1284,7 @@ static const struct pinctrl_ops rp1_pctl_ops = {
 	.get_group_pins = rp1_pctl_get_group_pins,
 	.pin_dbg_show = rp1_pctl_pin_dbg_show,
 	.dt_node_to_map = rp1_pctl_dt_node_to_map,
-	.dt_free_map = rp1_pctl_dt_free_map,
+	.dt_free_map = pinctrl_utils_free_map,
 };
 
 static int rp1_pmx_free(struct pinctrl_dev *pctldev, unsigned int offset)
-- 
2.34.1


