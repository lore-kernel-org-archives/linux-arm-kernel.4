Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D15606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 05:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hRYsj6fn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1+dNKzClzbvHLPMUhTvsZ4k+mtZkDXxX8lvsXl4r+xA=; b=hRYsj6fnw9BFjl
	oCMfll4GcJa2x7bq+AT5YUAQUgYo3xVm9gd8nPRNWSjKw6t7QOsCUYCExDhwLPI/9vmfJ8JIpun8h
	IyGm1zrKy5d3n3NByEjO3sBRsju69cx8JEup05zJ1WloK7tSw0QiQ47BC/fSzxESggXzVmsZNNpH4
	zJSA14oZll8A3z7kT4b1HIFx5ffrhVM5Si6tgeYvpOKsOUYNlDwJRPCDdY4jfCatkLez/r4TX3aN+
	K9xdNbLj2W8DMVesp6NrIJKZjkgfQq23RwSHjCowCUqaayWt5B2HQ0JgdooAHYkG2tZHKO8YObitJ
	E2C2868t9MbEMlhJmOMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRju4-0000000Bh4j-3omR;
	Fri, 13 Nov 2026 05:32:48 +0000
Received: from out28-53.mail.aliyun.com ([115.124.28.53])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRjtr-0000000Bgxx-3p6x;
	Fri, 13 Nov 2026 05:32:37 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.3319117|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0156776-0.00224241-0.98208;FP=17113666552651007620|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037006180;MF=wangxiaolei01@kaihong.com;NM=1;PH=DS;RN=16;RT=16;SR=0;TI=SMTPD_---.k13i.Rk_1794547950;
Received: from nj-vm-261.pxvirt.local(mailfrom:wangxiaolei01@kaihong.com fp:SMTPD_---.k13i.Rk_1794547950 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 13 Nov 2026 13:32:31 +0800
From: Xiaolei Wang <wangxiaolei01@kaihong.com>
To: linusw@kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com,
	wangxiaolei01@kaihong.com,
	iivanov@suse.de,
	andrea.porta@suse.com,
	phil@raspberrypi.com
Cc: linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 3/4] pinctrl: bcm: Use pinconf_generic_dt_free_map in brcmstb
Date: Fri, 13 Nov 2026 05:32:20 +0000
Message-Id: <20261113053221.3131068-4-wangxiaolei01@kaihong.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113053221.3131068-1-wangxiaolei01@kaihong.com>
References: <20261113053221.3131068-1-wangxiaolei01@kaihong.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_213236_362230_DEEC18F8 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

Replace the hand-written dt_free_map callback with the generic
pinconf_generic_dt_free_map() helper, which wraps
pinctrl_utils_free_map(). This drops the duplicated free loop and
pairs the callback with the pinconf_generic_dt_node_to_map_all()
already used for dt_node_to_map.

The driver already selects GENERIC_PINCONF, so no Kconfig change is
needed.

Fixes: 657cbf9b24ba ("pinctrl: bcm: Add STB family pin controller driver")
Cc: Jonathan Bell <jonathan@raspberrypi.com>
Cc: Phil Elwell <phil@raspberrypi.com>
Cc: stable@vger.kernel.org
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Xiaolei Wang <wangxiaolei01@kaihong.com>
---
 drivers/pinctrl/bcm/pinctrl-brcmstb.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-brcmstb.c b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
index 2b942ca7196b..e81c5b295a05 100644
--- a/drivers/pinctrl/bcm/pinctrl-brcmstb.c
+++ b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
@@ -180,26 +180,13 @@ static void brcmstb_pctl_pin_dbg_show(struct pinctrl_dev *pctldev,
 	seq_printf(s, "function %s", fname);
 }
 
-static void brcmstb_pctl_dt_free_map(struct pinctrl_dev *pctldev,
-				     struct pinctrl_map *maps,
-				     unsigned int num_maps)
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
 static const struct pinctrl_ops brcmstb_pctl_ops = {
 	.get_groups_count = brcmstb_pctl_get_groups_count,
 	.get_group_name = brcmstb_pctl_get_group_name,
 	.get_group_pins = brcmstb_pctl_get_group_pins,
 	.pin_dbg_show = brcmstb_pctl_pin_dbg_show,
 	.dt_node_to_map = pinconf_generic_dt_node_to_map_all,
-	.dt_free_map = brcmstb_pctl_dt_free_map,
+	.dt_free_map = pinconf_generic_dt_free_map,
 };
 
 static int brcmstb_pmx_free(struct pinctrl_dev *pctldev, unsigned int offset)
-- 
2.34.1


