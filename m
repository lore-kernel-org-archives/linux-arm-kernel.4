Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4366F60A261D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 23:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t8QpzuP6;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=QVQsCspC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Zqe81CUvl0CetbkbGMnAV9O0XTNAJxsTRcckQyPgzXA=; b=t8QpzuP6r+x5H0
	GKLKevP1JMR+4aqx7CBDkenriiEsHrWAo/qWuA7O4LOYJ+AIMDyBG/Rs6zPELj+PVnHZH91NZgvka
	KmvOu3zN7JlDS7pscRQ0uwHpo5UVT5+kgGmZdU/f0VnPlbd9jKQ59oBoyZqr4FC/VbvTXBlMEDwiG
	+SfWsFFfDrrX/7XOVpNpl7DwNTkscdoKb3lhloLqJ2Bbe3KoFRDwqGQA84TYA2tvI9V0S0qoTR4Kk
	xYQt6TzxwEDfhdQvS+VsBl5UATqr+zyo4zF/YrkYSRsWKceBzuUX6CCKbafvPnkIEmwdmqLQ68Yob
	D4he50n4R1r3/wI0YCKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBYA-0000000DeuA-0npY;
	Thu, 19 Nov 2026 23:28:18 +0000
Received: from mta-64-226.siemens.flowmailer.net ([185.136.64.226])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBY7-0000000Desc-0KBk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 23:28:17 +0000
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202611192328104b070bad0f00020782
        for <linux-arm-kernel@lists.infradead.org>;
        Fri, 20 Nov 2026 00:28:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Zqe81CUvl0CetbkbGMnAV9O0XTNAJxsTRcckQyPgzXA=;
 b=QVQsCspCFZfh3pzaqigWEG1tCg6xZUDZBU23sFlStAwf7/eOetWJdBl27yBAzWk/XchqyW
 TPCr0bftwmNuwxDJ9bSp6JxhU/PwhgLODtSmZHysHsbbnF8TTNvPxl9IPQs02/+92zFe70pp
 oFlvLQnfcz1BKI20HSDGnvmh/bNZa272exjUis+N7Esb+b4RTfRCqrlGap0AJuAdvGmCCToM
 jIpG8gED4OwVqlh7mLDsOwRd8hqaf5g2NXeEVKPkccOlRLdEerWqd7mccWlkx4Ln7+gTJqRG
 oZkuYM4dUVYnQu3IqN7s3TkEcFAwmiCK12GsuzAPK0oIsaU5FpUjbVnw==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-gpio@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] pinctrl: single: Also free the pinconf table of a duplicate function
Date: Fri, 20 Nov 2026 00:28:03 +0100
Message-ID: <20261119232806.4093754-2-alexander.sverdlin@siemens.com>
In-Reply-To: <20261119232806.4093754-1-alexander.sverdlin@siemens.com>
References: <20261119232806.4093754-1-alexander.sverdlin@siemens.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_152815_626067_78D0EA03 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

pcs_parse_pinconf() attaches a devm-allocated pcs_conf_vals array to the
function pcs_add_function() has just allocated. When a node is mapped
again, e.g. on consumer re-probe, that function is a duplicate of the one
the core keeps and is freed since commit ad2093840ca3 ("pinctrl: single:
don't leak group/function tables on consumer re-probe"), but its conf
array stays on the controller's devres list. It accumulates with every
re-probe of a consumer whose pin group has pinconf properties, until the
controller is unbound.

Free it together with the function.

Fixes: 9dddb4df90d1 ("pinctrl: single: support generic pinconf")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 drivers/pinctrl/pinctrl-single.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index d72ebb186b894..64472465800c4 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1107,6 +1107,7 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 	if (pinmux_generic_get_function(pcs->pctl, fsel)->data != function) {
 		devm_kfree(pcs->dev, pins);
 		devm_kfree(pcs->dev, vals);
+		devm_kfree(pcs->dev, function->conf);
 		devm_kfree(pcs->dev, function);
 		devm_kfree(pcs->dev, pgnames);
 	}
-- 
2.56.1


