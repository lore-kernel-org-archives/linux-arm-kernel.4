Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A851A606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 22:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U2jDXeHD;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TWTfng39
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0tzFeKCwOoFb6bvhWfk3Oe+1P7rt3PYjl4BuN72k99w=; b=U2jDXeHD0xROsjGKoNyxsam9a2
	lpo+1w+ZKQ9wBdEWxV9OsqVfnf8tNOvbobsgHZMnh8gkTiaelpPOFX6NNFarMR4ZYI9O0WlVxsk9L
	urdAU/m+Sjk68rVWfE1X6TTPTZYSHV8f+FhGyyzBlxwLH1uzWV3TJNALgj4JHCske5rNagcZbV7CX
	bsCHP0r0Hge67O1sE1i5vfVV7KljdZbTriVDTWtIn7HnmV1ILdvMlqtSg1xPHnYzILG0HhRRpt7XM
	0sb/u6GJbkYF0M0Rp2T4xO7vqzSeNa3hKJ70gzs3xemIXroieTsYZY8OePCo07/eDpn9WwtCyZDV/
	MT399Tvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLWe-0000000BTsL-2UpH;
	Wed, 25 Nov 2026 22:31:40 +0000
Received: from mail-dy1-x1347.google.com ([2607:f8b0:4864:20::1347])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWLSM-0000000BTTC-2FKU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 22:27:24 +0000
Received: by mail-dy1-x1347.google.com with SMTP id 5a478bee46e88-3846d5f54c1so7337164eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 14:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645633; x=1796250433; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0tzFeKCwOoFb6bvhWfk3Oe+1P7rt3PYjl4BuN72k99w=;
        b=TWTfng396XSOuh80B0itf9sJZJUdK2q5zxZu3dXtIMv4xAegfqEwYaP7OcM4vGjW35
         ZEgdW8HSD4RnWFO5C9YO341NAhXtINlyOw+S460S+lufh80e94i8MvaJ4+dRWix7oJMW
         fgAVRNUmOzBHlmwtQmqQN8mmQSdE/hikf1DweIHYk6I4Z5dBKMZW0a3ELrpGx3K5WIbE
         E4f83bw32lb4e3WTEi9M098s3KHZIbVV0WsfA5ixv3Kr6FBQJbxPRiKCuG+opRHqZA9E
         QaGtne34IINrwLLAidKeXYHYMIjDjf/wKIQbKpYVUP5ch/ZtMuwUJdSd7toV3+AVLzRe
         g1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645633; x=1796250433;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0tzFeKCwOoFb6bvhWfk3Oe+1P7rt3PYjl4BuN72k99w=;
        b=DE2tatWk/vHV01g53dy+PkiJkcmmLK0qRlj2MZWndvxSR/II/yVjFwYx1US5i5lA+5
         AaZw54s4HdU0SpYnzw7CBUbdl/nvf/4MbD/EmKXXT3pMhYbMa04udXaPlTBcFExwKUiY
         3/VmgR5vHI8sGCFHXamkM78su4FdPenctZVWhiK3nJSdm3UrmTKNWXKhX16z3TTAy77Y
         XXkDg/UiWuxCLa7Qi3Dypj9SO9mTxOfMQ3pft+Eken1quILwaoGcYCZGoG/m9+cew5GP
         IgJLSsPwRcyRa0fLZB0U8GQBQ6dwcBVEJjWnqsKM0taP36Ehu3uR0oX8p/cOD5/VQsSf
         5IyQ==
X-Gm-Message-State: APuU4Z/QWXT0qW09LCsrvQhSZKw0OaqvUaIhmaYoNzzg9KYIlW5NQ4eK
	N6vd7PQ09Se72IazdjNik6NaXPW452rTmYWYz2ZCFRyoQDypNrteJsfPgn5IdbKungZtmbyadKQ
	hbg==
X-Received: from dycnb22.prod.google.com ([2002:a05:7301:b16:b0:386:af9c:96b6])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:d81c:b0:386:b7d2:a279
 with SMTP id 5a478bee46e88-386b7d2aba6mr8835631eec.34.1795645633028; Wed, 25
 Nov 2026 14:27:13 -0800 (PST)
Date: Wed, 25 Nov 2026 22:26:06 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222606.1448637-1-elkin@google.com>
Subject: [PATCH] pinctrl: nomadik: validate DT pin config property read and range
From: Elkin Cruz <elkin@google.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_142715_352640_67C6D2D4 
X-CRM114-Status: GOOD (  17.00  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In nmk_pinctrl_dt_get_config(), of_property_read_u32() is only checked
for (ret != -EINVAL), passing an uninitialized val to
nmk_dt_pin_config() on other error returns. In addition, val is signed
and nmk_dt_pin_config() returns 0 even when val is out of bounds for
nmk_cfg_params[index].choice.

Check (!ret) after of_property_read_u32(), make val unsigned (u32), and
return -EINVAL when val >= nmk_cfg_params[index].size.

Fixes: e32af8894588 ("pinctrl/nomadik: add device tree support")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/pinctrl/nomadik/pinctrl-nomadik.c | 24 +++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index 617ad259f62c..400009929dbd 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -693,18 +693,21 @@ static const struct nmk_cfg_param nmk_cfg_params[] = {
 	NMK_CONFIG_PIN_ARRAY("ste,sleep-pull-disable",	nmk_pin_sleep_pdis_modes),
 };
 
-static int nmk_dt_pin_config(int index, int val, unsigned long *config)
+static int nmk_dt_pin_config(int index, u32 val, unsigned long *config)
 {
 	if (!nmk_cfg_params[index].choice) {
 		*config = nmk_cfg_params[index].config;
-	} else {
-		/* test if out of range */
-		if  (val < nmk_cfg_params[index].size) {
-			*config = nmk_cfg_params[index].config |
-				nmk_cfg_params[index].choice[val];
-		}
+		return 0;
 	}
-	return 0;
+
+	/* test if out of range */
+	if (val < nmk_cfg_params[index].size) {
+		*config = nmk_cfg_params[index].config |
+			nmk_cfg_params[index].choice[val];
+		return 0;
+	}
+
+	return -EINVAL;
 }
 
 static const char *nmk_find_pin_name(struct pinctrl_dev *pctldev, const char *pin_name)
@@ -724,11 +727,12 @@ static bool nmk_pinctrl_dt_get_config(struct device_node *np,
 {
 	bool has_config = 0;
 	unsigned long cfg = 0;
-	int i, val, ret;
+	int i, ret;
+	u32 val;
 
 	for (i = 0; i < ARRAY_SIZE(nmk_cfg_params); i++) {
 		ret = of_property_read_u32(np, nmk_cfg_params[i].property, &val);
-		if (ret != -EINVAL) {
+		if (!ret) {
 			if (nmk_dt_pin_config(i, val, &cfg) == 0) {
 				*configs |= cfg;
 				has_config = 1;
-- 
2.56.1.839.g22a8290db9-goog


