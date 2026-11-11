Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C65060A2634
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 21:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O4B8Mqws;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GtHaOoS9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=X4BlzCeHQzorY7dg3XAAg690sqe0fbcnZHsVN+U+YqI=; b=O4B8MqwsDFLixa
	hTc0mi7VA2pwaQO4D36iT3b1HouHK3BiGJxSYU4IgEz16XrkB41xzixADA2jEObbygBFFNjpUexnb
	0wqJcqpNUV3KJeKNgfH560jKgnIfgoL4uWER5K6yeMfYBapkoBxD2uXPr1IX1AWgNse2zNVnIaOfT
	5o7xEDv14dpwwa1M2cOgdGFJyjPwUh12nLzryqEXBNQF5FbHNcxs6+p4w6qNzJ4TR+aSMxxLOPfnG
	38uXk+Eyy1BoHQuU1A8b2o58SDIJCEbe5PnbIKsBbSWG8hNsCYFghsBjidmRqqY0RVd+CYBW88/gP
	xeMG2tobT+ZbqFDxI31g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGGk-00000007rcY-15VO;
	Wed, 11 Nov 2026 21:54:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGGi-00000007rap-0Ywy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 21:54:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 931AD63548;
	Wed, 11 Nov 2026 21:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3361F00A0A;
	Wed, 11 Nov 2026 21:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794434051;
	bh=X4BlzCeHQzorY7dg3XAAg690sqe0fbcnZHsVN+U+YqI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GtHaOoS9vESStZIXTI4ppzXxIJQXp0OiTgIVfzRrnb7tWGGcGUN1gT+aW7AFJ2V7n
	 sdsoZXNJoGLwr3U573wxWPV5gE1El7jWOCxTMvNsCCDLZwxOd4q3qbo/Y4hc7nV+rL
	 V89lsTlupWpmgSBU/03OgML4NrIVYFYd1v69oVnK6OElvfnySmOlXwY691AOKbkByQ
	 RgH/ELSKDx2m3Y0Y8BNziUTp1xoQe1AvzNv9bx7ucVxEz7l/kIlqiZ5JKWBh4x2Qeg
	 rT+fSoISTQAPc+hG71Kqr/UQuKeIGo76FTnuZrZiYKBmdiX8IItAuBO8kZIBSpj9mk
	 kulFkB/y4a16w==
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
Subject: [PATCH 09/10] pinctrl: sunplus: Validate pin_func index in sppctl_dt_node_to_map()
Date: Wed, 11 Nov 2026 21:51:54 +0000
Message-ID: <20261111215256.1982044-10-lee@kernel.org>
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

In sppctl_dt_node_to_map(), the validation loop checks that pin_num is
within sppctl_pins_all_sz, but does not validate pin_func (bits 15:8)
before indexing sppctl_list_funcs[pin_func] for fully-pinmuxed pins.
Check that pin_func is less than sppctl_list_funcs_sz when pin_type
selects a mux function.

Fixes: aa74c44be19c ("pinctrl: Add driver for Sunplus SP7021")
Closes: https://sashiko.dev/#/bug/linux-977252d6-b0cc-4d3a-ae2d-59d1e2f8a649
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
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
2.56.0.567.gdb80ae8cd5-goog


