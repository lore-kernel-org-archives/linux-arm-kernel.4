Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15F3606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 15:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hTyCPtPS;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=fPCfQDtr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cX67gbdL4NBsD5wtRJWX6tn9AKHnP0oEs6J7fK8AyQY=; b=hTyCPtPSWHRQkXzNGm742jpvtL
	oneWVv4QPUNvW1oaPcv/fq+Wo7XgONY9fhOtWo6Lln8/QuGf5W5WT+Xu+/Esasf9gqqS4PvuGn0IJ
	aDfiTvWUOkwww7GKjNtnfvi+CAvaXJT4bnwOPHMISq9wahAAq3IE1dDa8DEmWcAWD7/ZyCJU1WUPs
	FU3PJPHoE1dYqd7/lFzdENXjYBQcE0EMdwuDV8D2NYaY3AGSgy9yPtiOdXDS6zoQUsG9h5IoEtVjv
	Yo4cWyRU47iyeqgVf30YNEI9iQ+APvDqIey26YjR5jOUNsg/cYVr6lyKOTgroWzdhd9cZb5qLq8KF
	dz/RiF1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLEp-00000006Jf5-1tph;
	Tue, 17 Nov 2026 15:36:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTLER-00000006JNy-3Ckj;
	Tue, 17 Nov 2026 15:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794929785;
	bh=61Fo0ozwlH84CtqoAxbyruxX47URe4+YsJnin3PAG9s=;
	h=From:Subject:Date:To:Cc:From;
	b=fPCfQDtrdB0agfCwUmJjDdNKwT6/CzxzeWm5M4lNj2y3Am6Q8+aNyw1aHAwIKReBl
	 cZnp34wZ/zrGkAyJT1l7zc6ej9MXAkkXj+M1tsOu1mDZ3mBE1FCFIBkY9fNumyvhyy
	 8KMluYRd6sMSZXqLgpm+ZJ3LXf/Xb4PWM3PFRP8D62xc2733AWY7YzKe2IBa2q9JBx
	 vQB9N+hRmhlkDZw3KFsxi3pEtsmq72CFeArVQePiGaEAPpm0wO3/ud6INAKh6PltvD
	 kISltPFyqY5Hr7vQdXegq/d+2Fnz+zBlwNijntipoGrChyzrak6Xxvo0IZ0BBL6/0M
	 XsMUUUDNA+GPw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DD19A17E07EC;
	Tue, 17 Nov 2026 16:36:24 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 9A05448002C; Tue, 17 Nov 2026 16:36:24 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v3 0/9] PM / devfreq: rockchip-dfi: cleanups and RK3576
 support
Date: Tue, 17 Nov 2026 16:35:36 +0100
Message-Id: <20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-v3-0-32ff1546b0e4@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ7CIBCF4as0s3YSoRWqVzEuEKZ2rKGEKcak6
 d3Fuvze4v0rCGUmgUuzQqY3C8+xoj004EcXH4QcqkEftVFKWcyzn/zICcPAmKf21PfoX+RiSYI
 uhn2zBqWkNOcFbWe1DaYLVp+hvqZMA3/24vX2t5T7k/zyy8C2fQGcNpj/kwAAAA==
X-Change-ID: 20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-74727d64d729
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=61Fo0ozwlH84CtqoAxbyruxX47URe4+YsJnin3PAG9s=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr8dHi5SGuV2oIuG76xxKpt6UfqWP0ROY/dQ
 VkYP71vRcLB04kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/HR4AAoJENju1/PI
 O/qaufwP/0tzRaTjLhD4IJszDA+0rNgtCdQ9ZeWCdXjOFF8ITsYQYTRbHBo55RdYbGkIweo9aKR
 a47NVem1y8jQ149xBZha4ayOXvC8i3yAguaPm1Bp0HaY4w1453Pd99Puz2OJ60ycb3VlU4hKUOf
 msyL6Hgc9pBraqlVX3OwpN31jmVUVreN4MUXe0EUlikZBQ1Q4ZRn//ww6wFce3jAGLcL4nmPzA6
 mkqRLlp3Cv6ZY6CCCUJ68H45s+6OtjzzvvIw4CJWG00ibpVab3ZsXReEnYQA4WyJS6KsQ+Z23Rl
 v1GAN0XDdVV8wQlb/GAvit6Yd/8QEwXVCmETkPOQFg5Mlm1kscFUx5ZzGa5F/AWM/X8gHrNPmal
 5u8jx371Sr7s8RFDuATUrjTpnNc/E6YiDnao3RVJ3+TaBgQV9GyI0nPefszqgybPgQif9UF+ZlF
 zAvPZQ1mutbCIm7BRehX8NgdVxWvCKgXZ3t8nXfvTytFCuca6xdWj43LQF74g5OhgQZHxk4G5jd
 16uPLoQuUoyeIZNSLYO/YhFDMGBp/gpy1DwQ5wLvgTyRq+Jbev4qXNFvSglKNjAJzQKLoVa+p9T
 TMesJcev0QgekVV1v+6zqtDhPSa2BTbB1RdqBdCVcyat4URxRMRkXOhz3cnhFs8GBhJXlCLLQPR
 4KXsriFuNlK1nQJ/3AX8uDQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_073628_033836_C1F8839D 
X-CRM114-Status: GOOD (  11.54  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is a combination of the DFI driver patches from the following two
series to ease applying to devfreq tree. It is based on devfreq-next
and there are no other dependencies.

 * https://lore.kernel.org/linux-rockchip/20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com/
 * https://lore.kernel.org/linux-rockchip/20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com/

Changes since PATCHv2:
 * split out DFI driver patches from both series and merge them into a
   new one; clock controller and DT patches will be send separately.
 * rebase to devfreq-next
 * collecting Reviewed-by / Acked-by

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Nicolas Frattaroli (6):
      dt-bindings: devfreq: event: rockchip,dfi: add clocks to rk3588
      dt-bindings: devfreq: event: rockchip,dfi: add rk3576
      PM / devfreq: rockchip-dfi: move to per-variant const structs
      PM / devfreq: rockchip-dfi: add NO_INTERRUPT perf capability
      PM / devfreq: rockchip-dfi: use bulk clock APIs
      PM / devfreq: rockchip-dfi: make RK3588 use its clocks

Sebastian Reichel (3):
      PM / devfreq: rockchip-dfi: move register offsets to variant struct
      PM / devfreq: rockchip-dfi: prepare support for v4 DDRMON
      PM / devfreq: rockchip-dfi: add RK3576 support

 .../bindings/devfreq/event/rockchip,dfi.yaml       | 107 +++++++-
 drivers/devfreq/event/rockchip-dfi.c               | 289 +++++++++++++++------
 2 files changed, 304 insertions(+), 92 deletions(-)
---
base-commit: f9316c13d6f621af4f6f4a6089d3c989ffe899e6
change-id: 20261117-rockchip-dfi-rk3588-cleanups-and-rk3576-support-74727d64d729

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


