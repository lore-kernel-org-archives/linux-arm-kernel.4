Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7C7606A902
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 20:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pBvrsZGb;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gVPz6Nda
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=soxlIylootx2LrMLsFxRQH6OReb/MBAokdhIglKABwc=; b=pBvrsZGb2EN37E
	B+aaiPrXp/xWP2PA8gE2LBajqgDtWa2UJgekpovMk9MClBal4BBzWUatgr0qA5instQMHtfw+2PWv
	tyfI2yn2yITBMKawN56MpqxJqU9XLAE5hQFxgbA0cNZXMsHCuVgyqQE/3FLD/fyzXSOQUGJJZc7cY
	U76p90NImezWcTK1SxCNLXWHqptl4bkHs+dkX0HGMNG5pFNqifi6Zdi8uzslHGQkonGMxdLvwUNzH
	VJTIGJJWTrsCA9PX9bhWIUbpreHvEr6h9n28vstXjStU/gSfkCWUJ6XKQaFNDqW9fPkjrfDPLqL9h
	GnJndTl1tqZLFP+QlKGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU96c-0000000DQny-1Bhc;
	Thu, 19 Nov 2026 20:51:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU96Y-0000000DQm6-03UN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 20:51:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C1C794750D;
	Thu, 19 Nov 2026 20:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232531F000C6;
	Thu, 19 Nov 2026 20:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795121497;
	bh=soxlIylootx2LrMLsFxRQH6OReb/MBAokdhIglKABwc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gVPz6Nda8QVPEGVZtsccO9VQz4HXPaaqzUIMe96Jh0thezpdIRWNMmfTQ0aFwi6ZP
	 DBdKYu3D8TIM0cT9EmkyQ1Yi7K7LmXh3JQAekax7L0P67NQ9pMfS93Qq6pAtpokhRk
	 a/O/c7oyyLG+sfTWkouBMU3UpHq6np9D6xHZKyUwtHzmIhVfZVZqro8v541G2mU2jE
	 rBabblxnDzKbunSYWc6Qi5DqTmMJa1meyBvU+Q50t7j9VgP5yLUK8U3VjDMN0JX519
	 YAbLxFFw4agyhMTISp30UVmpm//ZVbTGxaHXEop7krRupVF68CsweK6V3pNS4IfaaZ
	 J45zh583exBkw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Dvorkin Dmitry <dvorkin@tibbo.com>,
	Wells Lu <wellslutw@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v2 11/12] pinctrl: sunplus: Validate pin_func index in sppctl_dt_node_to_map()
Date: Thu, 19 Nov 2026 20:49:07 +0000
Message-ID: <20261119205013.2563811-12-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
In-Reply-To: <20261119205013.2563811-1-lee@kernel.org>
References: <20261119205013.2563811-1-lee@kernel.org>
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

v1 => v2: Collect Andrew's Reviewed-by and Tested-by

 drivers/pinctrl/sunplus/sppctl.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sunplus/sppctl.c b/drivers/pinctrl/sunplus/sppctl.c
index 8a3fb9b56597..843641528e4e 100644
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
2.56.1.750.gf70dc682cf-goog


