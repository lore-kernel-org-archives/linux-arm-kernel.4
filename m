Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B16606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 19:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jLYyUqo8;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Cpf/cU+M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r7C9yHzbT8DIhAv52A8PzBhP7Xd4zcT9yST+bFKc0ms=; b=jLYyUqo8Q2KA8J
	JgPPzAqA6TyQSX8OZE5zCcEX4gjIiKGZIJSaQpB8weTUhqoAWw9iieiPzQNaVczswRx9jgyyw8deJ
	4mm1KZkZIufGPb1dzmmWFGeQmEek21gk45dK37nnzUtKG1GVh+CAC36sDmXJ2H6eIQs4SEmPrSp0O
	Au2e3WGh8BOdRpNFNGJh0+bWPAKzKtVL8924fQCITv3jsYx7qAh2rbmpBn3As9ADJUtt+EJz2e0Ix
	l2KHZaVwz//UrU0lD8B6gFgnZLqMNntoycFM50EtM5HUfC87kCF7Qq7lFf3BY3jboPycTry80NDR+
	tSoIcxMm9kh1X7gHHglA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX1bc-0000000HY8w-2fRp;
	Fri, 27 Nov 2026 19:27:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX1ba-0000000HY8a-3MM6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 19:27:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD30361422;
	Fri, 27 Nov 2026 19:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C4281F00893;
	Fri, 27 Nov 2026 19:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795807653;
	bh=r7C9yHzbT8DIhAv52A8PzBhP7Xd4zcT9yST+bFKc0ms=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Cpf/cU+Md3N+ksXOoD0S58TSb6bqmYYw5TW3+bEdw35AP4ecWwUYTU6EqjfUtq5Ni
	 Td0p5pygiWPiqjabPdJlqTKpOQabMNTdP2GBu+hMfMfDRoekzpozeuKFZbiUfVfd1I
	 Awu6YkX8E8tJKxNGoa3+vWNlgKH0fPTmSjo99ckt8KIUsb7vIqJo/nP5iyJRU+wphq
	 UHyqPOisRUrR1iz6kaCLLwddS0Tvo33NmCqeeT3PSGILlmUJS8QSfJvQ6+uJ+i4HUx
	 Yp15+ir08+cmEtQF8G9KDQjak+vfW5Kh5xenah2+bUDc0QFVqLzEPI+dXPmeyvYebx
	 EIpEqpcBLuFkQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	"Thomas Richard (TI)" <thomas.richard@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 09/10] clk: keystone: sci-clk: Check allocation failure before copying clock array
Date: Fri, 27 Nov 2026 19:25:33 +0000
Message-ID: <20261127192620.3443537-10-lee@kernel.org>
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

ti_sci_scan_clocks_from_fw() calls devm_kmalloc_objs() without checking
for NULL before passing tmp_clks into memcpy(), and invokes memcpy()
with a NULL source pointer on the initial iteration when max_clks is
zero.

Return -ENOMEM if devm_kmalloc_objs() fails, and only copy and free the
previous array when max_clks is non-zero.

Fixes: 3c13933c6033 ("clk: keystone: sci-clk: add support for dynamically probing clocks")
Closes: https://sashiko.dev/#/bug/linux-4e2ecf16-17f1-4188-880c-c714a1bf588c
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/clk/keystone/sci-clk.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 967f77900358..4cb1299cd49e 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -495,9 +495,13 @@ static int ti_sci_scan_clocks_from_fw(struct sci_clk_provider *provider)
 		if (num_clks == max_clks) {
 			tmp_clks = devm_kmalloc_objs(dev, sci_clk,
 						     max_clks + 64);
-			memcpy(tmp_clks, clks, max_clks * sizeof(sci_clk));
-			if (max_clks)
+			if (!tmp_clks)
+				return -ENOMEM;
+			if (max_clks) {
+				memcpy(tmp_clks, clks,
+				       max_clks * sizeof(sci_clk));
 				devm_kfree(dev, clks);
+			}
 			max_clks += 64;
 			clks = tmp_clks;
 		}
-- 
2.56.1.839.g22a8290db9-goog


