Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F0C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2+UNmr8C;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F2mAoHdf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bK/XsYMUPQ8SxDCiyg661SpI+UmAnvDiubWVw3wX2Y0=; b=2+UNmr8C6JNj+7
	XThY9Kk6o7038coMQLW5on1UwnC4gdgsvy9zpjP4jQP5hh9MS5KDqAPj2yZWYLzwQPivgdvLcAFZG
	E+sh9T2t3j1kkxZcdievdLvu37oN7w7l1+ndYV//ei0kZ1qOJeq9OewX2/sP+IvgsyWoeOjimIxs0
	WZp5p7+h8MAUpwRRjBNon9yAP52PsgcLc/+2IgPR8gE4oEI0JS9xgLAWRnIGySFfusO9ZhAqoqqlt
	tl1cqIYC+N9aFGg1Z6ebtFQ/LwjmVI/eW3Ldn1DuVc5r2ju4/aoMTgmVjEbpr+xxfqoCHz6Sylb7F
	SLCp6Ci7OLbjLy5tEthg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwbr-0000000GL52-3UB8;
	Fri, 27 Nov 2026 14:07:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwbo-0000000GL1o-1Zw7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:07:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 27351447D7;
	Fri, 27 Nov 2026 14:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C5F1F00898;
	Fri, 27 Nov 2026 14:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795788448;
	bh=bK/XsYMUPQ8SxDCiyg661SpI+UmAnvDiubWVw3wX2Y0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F2mAoHdfCj/D3495JJuezXFoFjme1SXD3pYBFMzhk42DTpbvp8+YoyTtjSK+1KDxM
	 Tx+MkHZvAvJHc06NmJ/VOBRDaMkVOXOYKudvzonv4Hveahf48FiUnk1dmFzvKOzcVe
	 6rc9f1LSyWzHuc5laAHZDDTsRYneNdiKymtV8msquYaXohz6uE4D0Ax2LdJASjZjUz
	 qDtwe2P5oh7v83nSJZLTA2o5zN5eTSXuJhzNZHEW8UxmutfLShQph89Se3qzggCo6X
	 y7PQz4YxK/cw9U7tggspJh6Z6rbp6eWXCOax/FXihcfVqwZsF9JRYhMZ4vx+eKdBYe
	 +g/5/s218CJ3Q==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Dvorkin Dmitry <dvorkin@tibbo.com>,
	Wells Lu <wellslutw@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Andrew Gaylard <ag@ffroot.co.za>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v3 11/12] pinctrl: sunplus: Validate pin_func index in sppctl_dt_node_to_map()
Date: Fri, 27 Nov 2026 14:04:59 +0000
Message-ID: <20261127140602.2790001-12-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261127140602.2790001-1-lee@kernel.org>
References: <20261127140602.2790001-1-lee@kernel.org>
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

In sppctl_dt_node_to_map(), the validation loop checks that pin_num is
within sppctl_pins_all_sz, but does not validate pin_func (bits 15:8)
before indexing sppctl_list_funcs[pin_func] for fully-pinmuxed pins.
Check that pin_func is less than sppctl_list_funcs_sz when pin_type
selects a mux function.

Fixes: aa74c44be19c ("pinctrl: Add driver for Sunplus SP7021")
Closes: https://sashiko.dev/#/bug/linux-977252d6-b0cc-4d3a-ae2d-59d1e2f8a649
Cc: stable@vger.kernel.org
Reviewed-by: Andrew Gaylard <ag@ffroot.co.za>
Tested-by: Andrew Gaylard <ag@ffroot.co.za>
Signed-off-by: Lee Jones <lee@kernel.org>
---
v2 => v3:
 - Rebase onto pinctrl/for-next; no functional changes.

 drivers/pinctrl/sunplus/sppctl.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunplus/sppctl.c b/drivers/pinctrl/sunplus/sppctl.c
index 68ff6d8451bb..cadaf16ab358 100644
--- a/drivers/pinctrl/sunplus/sppctl.c
+++ b/drivers/pinctrl/sunplus/sppctl.c
@@ -867,8 +867,13 @@ static int sppctl_dt_node_to_map(struct pinctrl_dev *pctldev, struct device_node
 	for (i = 0; i < (*num_maps); i++) {
 		dt_pin = be32_to_cpu(list[i]);
 		pin_num = FIELD_GET(GENMASK(31, 24), dt_pin);
+		pin_type = FIELD_GET(GENMASK(23, 16), dt_pin);
+		pin_func = FIELD_GET(GENMASK(15, 8), dt_pin);
 
-		if (pin_num >= sppctl_pins_all_sz) {
+		if (pin_num >= sppctl_pins_all_sz ||
+		    (pin_type != SPPCTL_PCTL_G_GPIO &&
+		     pin_type != SPPCTL_PCTL_G_IOPP &&
+		     pin_func >= sppctl_list_funcs_sz)) {
 			dev_err(pctldev->dev, "Invalid pin property at index %d (0x%08x)\n",
 				i, dt_pin);
 			return -EINVAL;
-- 
2.56.1.839.g22a8290db9-goog


