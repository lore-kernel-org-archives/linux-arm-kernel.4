Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37554606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 05:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vbrQB2wY;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=aRLqFRwb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AJySOjGzIlcbdK59bRfjYBE+NFAtLvcqhJ4pRN09QKc=; b=vbrQB2wYZ5G/WmRJZU5Z19V9OO
	dZLGiYTOeli05lBHrrs8rs0ctpaPAPYMFOJEuEh4aYSNprCOYSm1lXjJYv8KGEIv++ubqDApWqMjI
	En/DTfT1NtkfQJQqk1wkKD+lXGB1SVh/w9qD0aNJwlesyJ0jEeNBZQzqC2P/suIfo4Rp6kT/gvWYZ
	WmTrByW7XYcNiqqZ66rReS7UQ6pT3CjRglajHfm0oiFT1ccTXQiL6Zgtxzs4hvgqiC96+Oxa+3DO0
	3jebEBWZfEgpGowCTtnkRz5MeifzA8epoYFnn0iPbNYCqwCBh0k7EO0nED+bL25Ks2O+zHUMQXbma
	403CQ2sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUH2U-0000000E3lf-0d0Q;
	Fri, 20 Nov 2026 05:19:58 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUH2K-0000000E3l6-1bFX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 05:19:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=AJ
	ySOjGzIlcbdK59bRfjYBE+NFAtLvcqhJ4pRN09QKc=; b=aRLqFRwbKcnPyFwpwt
	mGHI6rzpoYNiS7kvHdVrWuIIRY2E70xwE53blq6XlkpqaRhAuKiVkhBxiYdPdkzO
	qRahJeiIOa+BDPX7S+G42nthIE8QW5BCk9YMVYXV7TrVRN0ebJhGR2r+rxFXFXQJ
	g+i8O4ArZK3ogZYdtNFjeaJFs=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDHb09K2P9qcAZxHA--.44314S2;
	Fri, 20 Nov 2026 13:19:08 +0800 (CST)
From: Wanhui Fu <fuwh1120@163.com>
To: suzuki.poulose@arm.com,
	mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	alexander.shishkin@linux.intel.com,
	mathieu.poirier@linaro.org,
	robh@kernel.org
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Wanhui Fu <fuwh1120@163.com>
Subject: [PATCH] coresight: Drop the device node reference in of_get_coresight_platform_data
Date: Fri, 20 Nov 2026 13:19:04 +0800
Message-Id: <20261120051904.3719453-1-fuwh1120@163.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgDHb09K2P9qcAZxHA--.44314S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cry7tFWUGFWrtFW3Xry3CFg_yoW8XF4xpF
	4DKay3ArW5Grs7Cw48Zrn8ZrWUXr1IvFWjqFyrKa1Fkas0qFyDZF1UKr1Fyrn3GFW8Wa4I
	gr4Utr4jqFWUXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U7R6cUUUUU=
X-CM-SenderInfo: xixzxiqrsqqiywtou0bp/xtbC7Q3jg2r-2E1I3gAA3W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_211948_952307_E81A8DD3 
X-CRM114-Status: GOOD (  10.38  )
X-Spam-Score: -1.8 (-)
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
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

of_coresight_get_output_ports_node() acquires a device node reference,
but the reference is not dropped later. Use of_node_put() to do so.

Fixes: 5ecc7120194c ("coresight: Cleanup coresight DT bindings")
Signed-off-by: Wanhui Fu <fuwh1120@163.com>
---
 drivers/hwtracing/coresight/coresight-platform.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 6657a817719a..5d626b0f4e25 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -285,7 +285,7 @@ static int of_get_coresight_platform_data(struct device *dev,
 {
 	int ret = 0;
 	struct device_node *ep = NULL;
-	const struct device_node *parent = NULL;
+	struct device_node *parent = NULL;
 	bool legacy_binding = false;
 	struct device_node *node = dev->of_node;
 
@@ -303,7 +303,7 @@ static int of_get_coresight_platform_data(struct device *dev,
 		if (!of_graph_is_present(node))
 			return 0;
 		legacy_binding = true;
-		parent = node;
+		parent = of_node_get(node);
 		dev_warn_once(dev, "Uses obsolete Coresight DT bindings\n");
 	}
 
@@ -321,10 +321,12 @@ static int of_get_coresight_platform_data(struct device *dev,
 		ret = of_coresight_parse_endpoint(dev, ep, pdata);
 		if (ret) {
 			of_node_put(ep);
+			of_node_put(parent);
 			return ret;
 		}
 	}
 
+	of_node_put(parent);
 	return 0;
 }
 #else
-- 
2.25.1


