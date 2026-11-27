Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD080606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 19:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WcIGNA4D;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUR5gNyt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+vwIeLDnsOZBbYz2tZ2xYe4yvc/dkMjEB3SP/vBfTJ8=; b=WcIGNA4D9fMuzM
	RXypUZgD5Y01pgqnNlkUV+e8lfcyuEwnGAtovyO5vSTBog7/rgJlln28fU36xSi/timILiDgpGIIX
	bhjiN/rJuBBRLsU/WtzUCjvR4dlBeMJPqA1KzPORgSyc2zSbA86mz5KF14W2wvfSDR0KKu3Yite9N
	bewCjed6Dp/ZxkaZzDBt3cTlCFN4h2tfzNwCu+tom0jlnefp9n4rqhcKSgMDGz7gvC0DbJmW8tXqO
	SOM6sjIbQjaiZ7e2IQvNJPG4HRG/N8qsFVAeaa/FBcZqXhdGiw4/T/hjceFA2rLfRX+lh4gCGxXUa
	zl8dcpJ/UW2vj++xxPfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX1bn-0000000HYCL-4AFm;
	Fri, 27 Nov 2026 19:27:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX1bg-0000000HYAd-1g2I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 19:27:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B4E340387;
	Fri, 27 Nov 2026 19:27:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547251F0092B;
	Fri, 27 Nov 2026 19:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795807659;
	bh=+vwIeLDnsOZBbYz2tZ2xYe4yvc/dkMjEB3SP/vBfTJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fUR5gNytspVLtdWl/WZW7qxJsoEGAW+2ovp903EpbmDg6PrFfMhcp8Z3ur/d0hKX/
	 V6d0lExTf7jJk9c+R/CDH9ClNOWocw0bqPIwFMDRB2F4aMr6pgLItBFOiO8EPdbHk3
	 9TcuLNWmbnszMkUnojMOxmUYltXygkGk4TNv0XQwy7qIza/v8n/uOGdamgcAUGziF9
	 7n8cI2uihfawDPQ+89qfTxqlKTRY7olZd/yYxQsjJDMXzpZsJI3VQQIkkvtNLWTMDb
	 Ze8Co75nWeskqj8TnMPUb2TZb2iMYjF3KnT9tj1ZWy5okvODThDYbwzcK+t+AqU1zr
	 QAuf+nhXZKE1A==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 10/10] clk: versatile: icst: Check kasprintf() and put parent node on error
Date: Fri, 27 Nov 2026 19:25:34 +0000
Message-ID: <20261127192620.3443537-11-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261127192620.3443537-1-lee@kernel.org>
References: <20261127192620.3443537-1-lee@kernel.org>
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

of_syscon_icst_setup() does not check the return value of kasprintf()
before passing name into icst_clk_setup(), causing registration to fail
with -ENOMEM after redundant allocations and logging a NULL name while
leaking the parent device node reference.  The IS_ERR(regclk) error path
also omits of_node_put().

Release the parent node and return early when kasprintf() fails, and
release the parent node when icst_clk_setup() returns an error.

Fixes: 1b2189f3aa50 ("clk: versatile: clk-icst: Ensure clock names are unique")
Fixes: d430819d69a5 ("clk: versatile-icst: add device tree support")
Closes: https://sashiko.dev/#/bug/linux-e1f9fcba-856e-41f5-ba69-bf159007e2af
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/clk/versatile/clk-icst.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
index e9c7353aa5d5..10cb34a3e8ea 100644
--- a/drivers/clk/versatile/clk-icst.c
+++ b/drivers/clk/versatile/clk-icst.c
@@ -566,11 +566,16 @@ static void __init of_syscon_icst_setup(struct device_node *np)
 	/* Parent clock name is not the same as node parent */
 	parent_name = of_clk_get_parent_name(np, 0);
 	name = kasprintf(GFP_KERNEL, "%pOFP", np);
+	if (!name) {
+		of_node_put(parent);
+		return;
+	}
 
 	regclk = icst_clk_setup(NULL, &icst_desc, name, parent_name, map, ctype);
 	if (IS_ERR(regclk)) {
 		pr_err("error setting up syscon ICST clock %s\n", name);
 		kfree(name);
+		of_node_put(parent);
 		return;
 	}
 	of_clk_add_provider(np, of_clk_src_simple_get, regclk);
-- 
2.56.1.839.g22a8290db9-goog


