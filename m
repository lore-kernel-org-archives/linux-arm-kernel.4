Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE674606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 21:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0kbfC8LP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GhDBxcV5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tuf8c1dlqjfS6dbHyCUO3x+DWJUmuzX7o0coWObKxGQ=; b=0kbfC8LPEfTMKG
	aEHW5P/CJOibGFC7uLZ+Jh8j21sbfXAv1ub6VJe0q5AyAYCB92uIxOZrg6njczUAiZz3Ugq+ymXiU
	rL1DYSUOUff4V/U5/x5ldGcRl5zKt24NKa1esF5B72DXb00qGnDKsrTxjDB3NkUVSlOdmo5vcxooh
	vpFlHVJnRKXikzCoSKG1ampQGKYUSYNUG3izMK8968uiA2Oj9Yo3XHmH16kgHmZrgxBlfA7/gUPES
	9b19knJ89elVCuFQzSzcJKB5VVnAa8HDbASgAGGe1ha1gkvoFkRgi+9cy88sYEKykB9rjdhSDcBDi
	DIhx2T8DjACHOnSDKhdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGGc-00000007rWN-07I9;
	Wed, 11 Nov 2026 21:54:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGGZ-00000007rVI-3hvv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 21:54:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A2F7842D8C;
	Wed, 11 Nov 2026 21:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D2B1F00A06;
	Wed, 11 Nov 2026 21:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794434043;
	bh=tuf8c1dlqjfS6dbHyCUO3x+DWJUmuzX7o0coWObKxGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GhDBxcV54Kva1Fq+NJm+2XQQubAC/+TC/eESoUhg68uhbvb599SE9NubrZ1l6ZPCj
	 ILR7HbuWX3ep560jXWlyfTGlIIfE3WCMhKujFeqvzIEarxxMswXuTGjqJoXSQG7uVy
	 e1j+hJl1lDpzWNe/WM1SXcUKD6S+mFbZHeDBVjBeHkFouySnjStY3QBi41Tq0RdVxj
	 Ew5gYAcS72WQ50q/WkRIPmMU0mtZroTt4W1wZOIUXxVtJ61VI/O6XRxwm+Ppmg4bJJ
	 XuPQ0gAypiXPvYPvYncq84vNmikJjuYFWaAPKgTDRbl7fNRk16n5AGoGnT+ZepTAsL
	 KmEh7LA81HONg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 08/10] pinctrl: single: Free pinconf settings array in pcs_dt_free_map()
Date: Wed, 11 Nov 2026 21:51:53 +0000
Message-ID: <20261111215256.1982044-9-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261111215256.1982044-1-lee@kernel.org>
References: <20261111215256.1982044-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pcs_parse_pinconf() allocates a settings array via devm_kcalloc() on the
pin controller device and attaches it to map[1].data.configs.configs.
When the pinctrl core copies the map entries into its internal tables or
tears down a consumer device mapping, it invokes pcs_dt_free_map(),
which only frees the outer map array and leaves the per-map configs
array allocated on pcs->dev until the pin controller itself is unbound.

Free map[i].data.configs.configs for PIN_MAP_TYPE_CONFIGS_GROUP entries
in pcs_dt_free_map().

Fixes: 9dddb4df90d1 ("pinctrl: single: support generic pinconf")
Closes: https://sashiko.dev/#/bug/linux-fcedec46-4487-4392-a882-3d3bef07e56f
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/pinctrl/pinctrl-single.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 13e0ae8bb389..fcd86dbf6869 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -311,9 +311,13 @@ static void pcs_pin_dbg_show(struct pinctrl_dev *pctldev,
 static void pcs_dt_free_map(struct pinctrl_dev *pctldev,
 				struct pinctrl_map *map, unsigned num_maps)
 {
-	struct pcs_device *pcs;
+	struct pcs_device *pcs = pinctrl_dev_get_drvdata(pctldev);
+
+	for (unsigned int i = 0; i < num_maps; i++) {
+		if (map[i].type == PIN_MAP_TYPE_CONFIGS_GROUP)
+			devm_kfree(pcs->dev, map[i].data.configs.configs);
+	}
 
-	pcs = pinctrl_dev_get_drvdata(pctldev);
 	devm_kfree(pcs->dev, map);
 }
 
-- 
2.56.0.567.gdb80ae8cd5-goog


