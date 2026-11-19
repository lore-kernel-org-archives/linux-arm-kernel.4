Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861A3606A911
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 20:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YfpLbcJ8;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CgWgPwRF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NAbaLn8TdjdIV7Xo1u11Mt4D9oXgJ+jd79pxsi7Y87k=; b=YfpLbcJ8JfMJuF
	2M/CCOwcfLfaRA99aCCTrHlBAZ8aTIASckrvwN7RbrtNk7x25uyVbBYC+55hxRap0kD7NqSjphFJK
	xZJuX6SAUgmvF5t3MOAlbAd7ooiMXVGjMZ2FaCE8Y8zlESHb2BXTEyXBG1uNy0Z/Lrg+07nJmwQo6
	/Y97XGz7V7DU567es89PEvkP2CeU+sE6CtqR4GlpPU0WddU7BeBz69p8x7k+/vTY83I9caiv6HPa9
	c61cSGGzqT7xkXYWRovBUeVjnhWpTH7uv44pudqcYabNv62wqWSpBjZEA3tGzJCI53Potd24GobUv
	ds6xyyisZUjoQcnL+STQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU95u-0000000DQTA-2fBb;
	Thu, 19 Nov 2026 20:50:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU95o-0000000DQPC-1J7B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 20:50:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BE8CC62857;
	Thu, 19 Nov 2026 20:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E9D1F000CA;
	Thu, 19 Nov 2026 20:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795121451;
	bh=NAbaLn8TdjdIV7Xo1u11Mt4D9oXgJ+jd79pxsi7Y87k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CgWgPwRFr2ako7TveUhLXhNrzitfBeCb2Y+IMK8imEzw8ylJXdOOrq5eK26ZYSeEX
	 pZjCZSRLCgKgexHyFivzzejiaBRoR6uuxdEy5/DvrIOwtLvrFm3Nl+bvFVpxjTd68c
	 Fr3WlTdRm3M4JGY65SQsGoqsa4q77Ts+U7y+bsVOLyLHbXk8ssM2kadikIWfBUwHyc
	 fb/mVrFk2pEaP/C49Y43ukSrdoMj+Y3/aMX8hdunexdNrBmO5HJB3zIsMlkFw2B/n7
	 7RB9Va/YG6u0SZkPNVRKH4rjvKieKZ64Zja2DDxA4a96QFtFpWaHzm/qwUxqui4foh
	 o6iwI3d+QpGyQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Linus Walleij <linusw@kernel.org>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 05/12] pinctrl: nuvoton: ma35: Avoid leaking map when parent node is missing
Date: Thu, 19 Nov 2026 20:49:01 +0000
Message-ID: <20261119205013.2563811-6-lee@kernel.org>
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

Commit 3fd976afe974 ("pinctrl: nuvoton: fix a double free in
ma35_pinctrl_dt_node_to_map_func()") switched new_map from
devm_kcalloc() to unmanaged kcalloc() without freeing new_map on the
!parent error path.  Because pinctrl_dt_to_map() does not invoke
dt_free_map() when dt_node_to_map() returns an error, new_map is leaked
if of_get_parent() returns NULL.

Look up the parent node before allocating new_map, and release the
parent node reference if the allocation fails.

Fixes: 3fd976afe974 ("pinctrl: nuvoton: fix a double free in ma35_pinctrl_dt_node_to_map_func()")
Closes: https://sashiko.dev/#/bug/linux-ae0c2737-0408-4808-9bae-f7389beb51d0
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---

v1 => v2:
 - Correct description of commit 3fd976afe974 in commit message
   (Sashiko)

 drivers/pinctrl/nuvoton/pinctrl-ma35.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index a92945b7821f..92c1c40339f1 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -202,17 +202,19 @@ static int ma35_pinctrl_dt_node_to_map_func(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 	}
 
+	parent = of_get_parent(np);
+	if (!parent)
+		return -EINVAL;
+
 	map_num += grp->grp.npins;
 	new_map = kzalloc_objs(*new_map, map_num);
-	if (!new_map)
+	if (!new_map) {
+		of_node_put(parent);
 		return -ENOMEM;
+	}
 
 	*map = new_map;
 	*num_maps = map_num;
-	/* create mux map */
-	parent = of_get_parent(np);
-	if (!parent)
-		return -EINVAL;
 
 	setting = grp->data;
 
-- 
2.56.1.750.gf70dc682cf-goog


