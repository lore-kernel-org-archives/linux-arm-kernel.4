Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE797606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m0et9ZX6;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=SE7nzdeu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PwFIKKz2y8o67G3ho/5uV17TqwfSzdRIlKLB5lCSaiU=; b=m0et9ZX6xqWle2
	PsINeyk1txpqfiaIh9LB7q0ICcRJx7Y2ZG0+ugTQri841K+ouv0K0HV7wg7l91MeCs6njPiLtnVsZ
	awVWAP+SH+wCqdIQD6ZDOot24rjv8XJvsAVdBX5Hvk0XGRLIjP5xp8XR01EQawxDk1HuoRgwzMDVm
	2QhKx8jLluqS6FUS+psIpUv/lVTbukgLK0fea6bgDfwMlRkR76wufY/Q4w1I7NaEzZLrTF+0vnOeK
	6QBHWxotL1sqkZHlr3zEkyI48hLXBWR2hG9z9KW/m+YBGglfnABREDN86rCu1ld3kvgm+Ss+LxjII
	ICYAo7pMOSIEAcbbB3Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbfd-0000000Dmt2-0yCi;
	Thu, 26 Nov 2026 15:46:01 +0000
Received: from mta-64-226.siemens.flowmailer.net ([185.136.64.226])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbfI-0000000DmkX-0vkv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:45:49 +0000
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026112615453550144a6c36000207cf
        for <linux-arm-kernel@lists.infradead.org>;
        Thu, 26 Nov 2026 16:45:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=PwFIKKz2y8o67G3ho/5uV17TqwfSzdRIlKLB5lCSaiU=;
 b=SE7nzdeuQnGTNL7AVbj8uWe8INuBujuA0BQdmMPl3FMwxkybIlsNdHvBvIQAfnLT11eUun
 I25RoOyN9dhZRpvzBJ6jPJxuGAh7LibcphY6FS94ojXNe9+qLg+32oocjKZ43grS4W/vBgcN
 QYRBnv77tTQQSD8xDNmHpdzAqOyqniPKweTxRaHk3m7X00YW7Vhuqxe+jO5XgarFJH0GA89i
 gHFgIU24WOnCJQTyFIsOYRCxctLZyXm/7WNThL0nAfXKDj/hgWWrXL8aDX1d1xbPOt5nLbB0
 RVbCJZlCl0H1T4Re/P4X8IUzxcOLMLhnGxiP+SwFH5bl5ueopfHL24jQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-gpio@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 2/4] pinctrl: single: Don't remove deduplicated groups and functions on error
Date: Thu, 26 Nov 2026 16:45:23 +0100
Message-ID: <20261126154529.1599568-3-alexander.sverdlin@siemens.com>
In-Reply-To: <20261126154529.1599568-1-alexander.sverdlin@siemens.com>
References: <20261126154529.1599568-1-alexander.sverdlin@siemens.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_074540_829115_094849F0 
X-CRM114-Status: GOOD (  15.50  )
X-Spam-Score: -2.0 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

pinctrl_generic_add_group() and pinmux_generic_add_function() return the
selector of an existing entry with the same name instead of adding a new
one. This is the normal case when a node is mapped again, e.g. on
consumer re-probe. If parsing then fails, the error paths of
pcs_parse_one_pinctrl_entry() and pcs_parse_bits_in_pinctrl_entry()
remove the group and function by that selector anyway, i.e. the entries
an earlier mapping is still using.

Besides breaking that mapping, this corrupts the selector space: the
selectors are allocated from num_groups/num_functions, which the removal
decrements, so the last entry is no longer found by name and the next new
entry collides with it in the radix tree (-EEXIST).

Only remove them if this call actually added them, i.e. if the core's
function refers to our pcs_function. As in the success path, testing the
function is enough: the group has the same name and is always added and
removed together with it.

Fixes: a4ab10860723 ("pinctrl: single: Fix group and function selector use")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/pinctrl/pinctrl-single.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 64472465800c4..f5f0b95dc4282 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1116,10 +1116,16 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 	return 0;
 
 free_pingroups:
-	pinctrl_generic_remove_group(pcs->pctl, gsel);
+	/*
+	 * Only remove what we added, not an in-use deduplicated instance. The
+	 * group is deduplicated together with the function.
+	 */
+	if (pinmux_generic_get_function(pcs->pctl, fsel)->data == function)
+		pinctrl_generic_remove_group(pcs->pctl, gsel);
 	*num_maps = 1;
 free_function:
-	pinmux_generic_remove_function(pcs->pctl, fsel);
+	if (pinmux_generic_get_function(pcs->pctl, fsel)->data == function)
+		pinmux_generic_remove_function(pcs->pctl, fsel);
 free_pins:
 	mutex_unlock(&pcs->mutex);
 	devm_kfree(pcs->dev, pins);
@@ -1262,7 +1268,9 @@ static int pcs_parse_bits_in_pinctrl_entry(struct pcs_device *pcs,
 	return 0;
 
 free_function:
-	pinmux_generic_remove_function(pcs->pctl, fsel);
+	/* See pcs_parse_one_pinctrl_entry() */
+	if (pinmux_generic_get_function(pcs->pctl, fsel)->data == function)
+		pinmux_generic_remove_function(pcs->pctl, fsel);
 free_pins:
 	mutex_unlock(&pcs->mutex);
 	devm_kfree(pcs->dev, pins);
-- 
2.56.1


