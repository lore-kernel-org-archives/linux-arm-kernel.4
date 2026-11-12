Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2518606A89D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 20:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GJe5ivRo;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qDTAuxuo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RNeeQDnckMo2sALbJ1N7r4lh1eJheLFFD2HxmOutfIs=; b=GJe5ivRo00+NrZcyAXoERg+Zc/
	xhPBqhLlIvbq21/X2n1a0644VKfaFWhlTmeq7+jd665BvUnc6x3lneApaIr23jUvBsxjil5gotVLe
	yvxskNTPqzRaG9mWabnFbaj0xrV/ILO48R5Iwrr7mwlNiFoUXzimvK3JSmtOdagx2aG2TNwSx9QWA
	X4ih2uT9ou2B72UWIJifDmO+L5uZ5ix8fyhfdQ4QPc63GIeChW1AFUNOnMHMnMTzrVxrgNW9iO8+/
	2kwIEuN8zQNAjXU1rMHfptvfUbwhzLLT5otExWYONPDn9Y2YyXvl9UHFLaPpbnf+9NQvGJerNwnEm
	WpgR2fLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRbk1-0000000B27K-1wN1;
	Thu, 12 Nov 2026 20:49:53 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRbjz-0000000B270-2CS5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 20:49:53 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-91f0274f88cso138626d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 12:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794516590; x=1795121390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNeeQDnckMo2sALbJ1N7r4lh1eJheLFFD2HxmOutfIs=;
        b=qDTAuxuoAaQOcKGBYCa4061737RKpM7F76OfKTp8EgzTAdwrmTu3msyfQCmoonR1L3
         7G8pykoAlZlI9lqIjsrAGjXls8EVAERkBLBNi8pPMWNfurfeXnkk9up4G00+s1L6sH75
         kc3n+Ip5jf8N7n3xxTnmk3BWlXhpMvsCj4C0laiFOhI5PljFJgiR1qKbEp19ERWdgjt+
         MKLaKCKTq5hkiCLcie8sAMzIc21BVaGNoDcTQwvvaJ3O67ern+eMfwrylzyTMjF/dzF+
         6o1QQP//XJ1/z7HSI+HCPrtFm5CHrkksH3xhgmszXI+6COEgXjaLqdengkzjMzqqXFCh
         MsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794516590; x=1795121390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNeeQDnckMo2sALbJ1N7r4lh1eJheLFFD2HxmOutfIs=;
        b=Nehgh4F6f9A1FOwViEz/2lUe9TVUbnKTR2hNv1b1Hsvi2kDqN83B4uZDo7vayhoIY9
         hKMcPaat0qSlHd1F9gU1WHdpVeVqu1erdRE6V1mSGcDcUhTdQMbtfaOofTn/KEjuvTvO
         woyhTsFymBuKVc5/2acBgwDGZ8syPdOOm2h4m+76y4m01lpKvCRNjpUOlIRBkffxtoOp
         R+wq+pXkN3/ORYXOSDJu4wuwILmK8P+35mDbQ0ZCoWzy6I+Iwr2NFYQYKTsZ+szgrjxF
         At3qQvT+dFD/M1Q8C3YAhR3uLZlP4BxDwt4QHNR9E1vowXVZCu3Udrp0tno+LxklvoSp
         Ovpw==
X-Forwarded-Encrypted: i=1; AL+hErG85qbRj9ppIaN6ExV4HA7IMNjH7fs2oL1d/ApHnfNA8xiyVsgfWKtzU2BYoYU4ma9Y351dtw4N4dpXV88JtJkz@lists.infradead.org
X-Gm-Message-State: APuU4Z91EZWukUstoKrtrQkmPaQQXKO08rk2YB7Jazyq7xuO6epaiKAt
	XtpElfFn//bzpBWv18H3Cqt4jPNyrKcRFu7wg+fJrEt93VVv0Ts3Nn1M
X-Gm-Gg: AYBFou04LX/LtS9PA5gNpAxOyO+8e00VvK4egxikZ2QtBKbzNCBQrCZK5EzkcwKcYH6
	6hqA9Jjwu1baMfgdAqo6O/oKSWjZk4ICL1j1+nKBQrHXoJoAG3a7FIFkTVmRSHEl9Co0+p3Q+uC
	6usnU/EAqJzOvWYdwbDAlL/FqidQkpqrfbr4aigq0ECPHoxrgI78QQWbApdGjSTRJ7YLLEADf/H
	qH9+vS2CDGhUUfVznm5tlUeFA4KlbEorjjQDUfNH4RYl/lENHy1p8pzz8eDmOh5hF+/pvxYYEuf
	XjdvvPJlfDarf2LPJGoi9OY7YK3GllNG0CAT0EYvrdtECfG1G6IOnZ6mCM5SFhLYrhHX91lmJNu
	zP2ik0kO4cqwV3IFkHfpiuilsVaUUr08rQAPVuE0s/G1764bHDTiymecq5nEni/OQu6sWjFrOeY
	6q3uAoEqNQHOJvgKoOle03QZJ+ObNQrumcfDINDa5Q9vXmXrv50yC3cwW45bGqpO2mIuKzwyGlO
	OKWUGA72imob8zajsxtg87QAhXcJJH2ThjS6143PS4AmPrXv4UO+hlfmA3X4RiJTSC8EqXXdjj7
	ADyAlNkYTrO67QYNj80HABe+zxWw0KfCUIS/jmjA1js3MbbibOrL
X-Received: by 2002:a05:6214:4801:b0:91e:8baa:f132 with SMTP id 6a1803df08f44-91f241504a6mr8465936d6.14.1794516589727;
        Thu, 12 Nov 2026 12:49:49 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d9f3cesm4439086d6.35.2026.11.12.12.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 12:49:49 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v3] irqchip/gic-v3-its: Drop ITS node reference on its_of_probe() errors
Date: Thu, 12 Nov 2026 15:49:37 -0500
Message-ID: <20261112204944.1427733-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_124951_650426_0AA2D7F4 
X-CRM114-Status: GOOD (  14.42  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

its_of_probe() walks the ITS nodes with of_find_matching_node(), which
drops the reference on the previous node and returns the next one with
its reference count raised. The loops are balanced when they run to the
end, but the three error returns (a failed its_reset_one(), a failed
its_node_init() and a failed its_probe_one()) leave with the current
node still referenced.

Declare the iterator in each loop with __free(device_node), so that the
reference is dropped whichever way the loop is left.

Fixes: c733ebb7cb67 ("irqchip/gic-v3-its: Reset each ITS's BASERn register before probe")
Fixes: 9585a495ac93 ("irqchip/gic-v3-its: Split allocation from initialisation of its_node")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
Acked-by: Marc Zyngier <maz@kernel.org>
---
v3:
- Keep each loop's __free(device_node) declaration on one line (Marc).
- Add Marc's Acked-by.

v2: https://lore.kernel.org/r/20261103201817.1259660-2-oss.patchbox@gmail.com
- Use __free(device_node) on the loop iterators instead of adding
  of_node_put() to each error return (Marc).
- Rebased on v7.4-rc1.

v1: https://lore.kernel.org/r/20260923165447.619477-1-oss.patchbox@gmail.com

Compile-tested only (arm64 defconfig, W=1).

 drivers/irqchip/irq-gic-v3-its.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 282e4bafb084..ddc07cda5539 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5572,7 +5572,6 @@ static void its_node_destroy(struct its_node *its)
 
 static int __init its_of_probe(struct device_node *node)
 {
-	struct device_node *np;
 	struct resource res;
 	int err;
 
@@ -5582,7 +5581,7 @@ static int __init its_of_probe(struct device_node *node)
 	 * reset, don't even try to go any further, as this could
 	 * result in something even worse.
 	 */
-	for (np = of_find_matching_node(node, its_device_id); np;
+	for (struct device_node *np __free(device_node) = of_find_matching_node(node, its_device_id); np;
 	     np = of_find_matching_node(np, its_device_id)) {
 		if (!of_device_is_available(np) ||
 		    !of_property_read_bool(np, "msi-controller") ||
@@ -5594,7 +5593,7 @@ static int __init its_of_probe(struct device_node *node)
 			return err;
 	}
 
-	for (np = of_find_matching_node(node, its_device_id); np;
+	for (struct device_node *np __free(device_node) = of_find_matching_node(node, its_device_id); np;
 	     np = of_find_matching_node(np, its_device_id)) {
 		struct its_node *its;
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


