Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07A0606A322
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 15:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uwToG6ha;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=huDZ8nUu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BbD1zRVt830j/6FEa37AOCaw0v+voPN0QhLYn1eKXlw=; b=uwToG6ha20dixy
	Lo0/MODv3LFoa9sGWBoXerAQDSforHArjO1FCvCuldl/erTQJGpodX8usPmWDBUh4KKHMCeNKuAHe
	8tbkybriccAsQwj7OKfTDl1pw2annxgmrfazt/7FGv/9spocGYARzWLk6oz/MwdDbT9C52URfIOSz
	vJ1kLrAtuF9jlQRSzShAxpnJ9RSPFyVuoJLib9UPs1ZMgMlkNf1LbhmAoP4RMsvkCMw5hH5dra4um
	Pqy4itjnJGAW0Ec3VMEG2ckj/hDbvE2uhycRCAED8JLnUEvry1ysEzaZ4zn0hzlfXaW5ewtvRVA8y
	Qgn8UsjZGpuVe5W/+Wsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ53p-0000000GKCb-3vFT;
	Sun, 08 Nov 2026 15:44:01 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ53n-0000000GKB9-0ajT;
	Sun, 08 Nov 2026 15:44:00 +0000
Received: by chaosmail.tech (Postfix) id C78E41C9690;
	Sun, 08 Nov 2026 15:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1794152636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BbD1zRVt830j/6FEa37AOCaw0v+voPN0QhLYn1eKXlw=;
	b=huDZ8nUuPuZlPb6rGLkG1O4TRZLhCNdhU3ucOKG6n0lWUUx2S5JsWS5CJngKz9jYDsQKNI
	RTBqGyiSCAm/z+ocJdazN8jIFEQ5VF/sql5oCbWyBWbCPU+zTq8EHnRJOQbzVTF8LPG+sg
	ajjFyLbumfQ+fc622LVdi19Pj2amQks=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sun, 08 Nov 2026 16:43:41 +0100
Subject: [PATCH 2/4] soc: apple: tunable: Allow passing NULL to
 tunable_apply
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-t8122-phy-v1-2-c2783b2a53a8@chaosmail.tech>
References: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
In-Reply-To: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794152633; l=646;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=tJNNb61/4tJlpWC0322q+2yhiEktKqEr06Kk4Nb8njs=;
 b=Q8GuumKxSRJxH3/hIEU8kY4tFaiOjpFlNYj/mZ2ub8pRKuOc3ltoadcpa/bQmxdShKxgw3ZBX
 /LrSZ2tyatlDpIPr0JELHxr0HnoY+DCdWyp7P+Phi1JlHndc2XMp4nG
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_074359_642986_41011B95 
X-CRM114-Status: UNSURE (   8.25  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Make it easier to have optional tunables by tolerating NULL entries and
doing nothing when one is passed

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/soc/apple/tunable.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/apple/tunable.c b/drivers/soc/apple/tunable.c
index 659323839171..e89e8f9bb455 100644
--- a/drivers/soc/apple/tunable.c
+++ b/drivers/soc/apple/tunable.c
@@ -63,6 +63,8 @@ void apple_tunable_apply(void __iomem *regs, struct apple_tunable *tunable)
 {
 	size_t i;
 
+	if (!tunable)
+		return;
 	for (i = 0; i < tunable->sz; ++i) {
 		u32 val, old_val;
 

-- 
2.56.0


