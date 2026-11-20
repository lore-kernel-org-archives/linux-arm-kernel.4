Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F078606A6DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hIYlQvU4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EGL0EanX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UsF4enTkpz+cKFEUMfo1tkSb8SS+Yf2yjxyk1f8Cx00=; b=hIYlQvU4ndCjPE
	+tF4tNiOKWBqSR9LyhiAuuvvfjeOmQqzMNhefKtivLtmmLs+KPswV/4H7jjVwj3xkZYo61I4qaUDn
	hAut3y2rrxvK1QE0RKhUwCG6MInaL3XH2mv6/61hqPVWqL8irOfG12HDEnstrA8EXSvav5PoJCBWA
	TXMJl9MAp98X6h/U6QAs9aK5J7JhutxzDK1tWqT4UvqDRRrRTGUzAJOxYI+T4dW+2Zq9URaqfsHz5
	xl4PlQQ8flZ9W0SIZpoCqs+KI3PpzG697JL6q/mLM5/Hg5pgpFISF8c3cmuGu4h+UmFI0sPfmuj6Z
	VdDHohl4z65tuda3bA5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUiv-0000000GA46-46Bd;
	Fri, 20 Nov 2026 19:56:48 +0000
Received: from mail-oo2-x05.google.com ([2607:f8b0:4864:31::5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUi9-0000000G9Py-0vUM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:56:14 +0000
Received: by mail-oo2-x05.google.com with SMTP id 46e09a7af769-86203d56413so202083a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204552; x=1795809352; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UsF4enTkpz+cKFEUMfo1tkSb8SS+Yf2yjxyk1f8Cx00=;
        b=EGL0EanXZfA2bewqmhmPD0XckVs80Coh3B979OOuTt5//mlj0XvNcV0P6dSFOQ/ecE
         hguM9XatTdqsht/wbKogZ1UBLtJ7YWMtFcD9dEHRiuLOz/WJ+PIRjuWPAVRiYNqEtMEL
         3ZqW7ojjQtZoCXkRuVDFx7w4Z35L2fTgVDvBlUqJ8PktYz/idLnIL2Tp0rOl8jKqqazx
         QsVPUg83OlWs+GqxpMwA12m1xYBo9MB3Vm1MDMyWIu2Tc63zZ/zD8jWwgNMT12U83LKw
         Z+McwhJGexQRQz0/QMbZNJcoRvAIA/4xxX6b3W5myWHbZYxH5EGZ9crtYTLVXuXv9I8y
         73/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204552; x=1795809352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UsF4enTkpz+cKFEUMfo1tkSb8SS+Yf2yjxyk1f8Cx00=;
        b=D5IuCzGMnBGIvgajt4WGkHbbRKVo229cfLz7uPapst9N9FQEr52g/BT+wG9MNu35SY
         AX0+rqn1HDRlDWcQQMEOlbUh8OJBsywYts/Dv0F0l8U2OWc+zyb07OQMXfoCC+9Y60M0
         WIav8BK4YLKM+KjoSpb4OAwgcoqSOjL3jbTRr37l5SyFGYpQ7EPbh7G59tpEEwtzswJx
         MA4d6+tCB0J8DhvPF8ywxdeBMFaTz79CXM1i3W1+KVjzNbmkYGeq/UkjOvabAeML8hKE
         N/lwQa5k9kdGqPyGLMqd5WoZvW6FjBF1HwmdRsCoxSOp+nf8uG5P570iVU7x8ZCmpL/F
         dvPA==
X-Forwarded-Encrypted: i=1; AL+hErHxQjnP2IpBnwLokJtfYLetXEbNqu4Dihlt4llubvWfkmlvIQlulpLW2ZrzWEtCh91eWVWwl380nNHJTAftcdFy@lists.infradead.org
X-Gm-Message-State: APuU4Z+qFMC6jdPXmk64GfrEtsYqnlXJ/Xm5tSiJpWlDDYyCtlI8kmgK
	IOxBNPIlpQKMC0WDaNimZLxLkgcRo3gK0MgIp8ertknVEBi6XqrvArVp
X-Gm-Gg: AYBFou3DP0pDM7RyLU8TVJZkBDvdxM2xWXEhuedA14gQ4xVLJ/Bc/U0q5S38Nus768J
	2q1uRKYfXizLj105vXCFWhrCmqRwoPSeBpOpWAut+PGn8XKLEgwDVLlypu6fF6pshNkfrJ34154
	xd4WZJ3PrpVsqPFCwyEZXmjWDjtAhAotD6xR577NDhMlbfzSVfBZnXV0641Pp90vjsffYXvPl2x
	p8xbPsPpnalvD1T7BcBh1h0TuCFLKvQuNTCw5AfLm+q0fjGxZ8DQptGVRd078DQ/udqP+mF8uo/
	03w7Sm8FMBk0eKo/jYc1pEZuWQJ1iwrTrDV41hUHkvDVA8eN3krrCRzBQpMtjQqJ+DxsiGXnK4b
	kRXqOjrVA7i9PKyYfSKuWRXpIg3fGg989K8KpRK5H+IpUdxtn6ZWHowDvIpL6J/x6g4DRyDDyw8
	gHjAJDA2b03OT9E1VYyXB3MchlGdyCr75Qv4VB/5g7iM6BWvrA/xrpe//ELF80IIZydWWQAoYI9
	yx8BPEkOvqVUqFQLQxqEggGO//OG2O4WUuVNm/hsoqHFjpAIIBjskwEtXjb6mEThFryo9CA2j6M
	F7cxYhJ14dmCCnI+GRZGGSlaCLl7HHAEPnsbJKCExS8AMZStGWBKjzVzE1G6HmXbdJik4jbbCTp
	nws/uSOmPGM7Tf+BG62c=
X-Received: by 2002:a05:6830:2303:b0:862:a48e:24d7 with SMTP id 46e09a7af769-8631595152bmr4939139a34.23.1795204552390;
        Fri, 20 Nov 2026 11:55:52 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:51 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:41 -0600
Subject: [PATCH 7/8] media: mtk-mdp: Refuse a format change once buffers
 are allocated
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-7-877dea14c3d0@gmail.com>
References: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
In-Reply-To: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Eizan Miyamoto <eizan@chromium.org>, 
 Francois Buergisser <fbuergisser@chromium.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Youngjoon Lee <getfeus@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=1946;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=kJaFb9TDiCBW9wH5WEhVxXJkX3lfruWKRoGStsnFGKg=;
 b=PCPt45813EoOYNHjxRgmlOVKVszumvKZjt/ednF2qJK8wPlqgWFtSes8GV7N82tDxXhjIVjXf
 8Y/vKnhc0YNCkSxZuIIevgZmBuoRH+twcsRDuNmFFFjAm9j2qLjIYA0
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_115553_338971_49B22B77 
X-CRM114-Status: GOOD (  14.28  )
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VIDIOC_S_FMT stores the new format in the frame before it checks whether
the queue is streaming, so a refused change still takes effect: a client
switching a streaming CAPTURE queue from NV12M to YUV420M gets -EBUSY,
and the next frame is set up for three planes in buffers that have two.
And the check is for streaming only, so a format set after
VIDIOC_REQBUFS can need more than the buffers already allocated.

Check first, and refuse once the queue has buffers, as vb2_is_busy()
does for other drivers, logging it at debug level since any client can
trigger it.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index e0627127430b..1be0f44fe1b2 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -698,6 +698,12 @@ static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 
 	mtk_mdp_dbg(2, "[%d] type:%d", ctx->id, f->type);
 
+	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
+	if (vb2_is_busy(vq)) {
+		dev_dbg(&ctx->mdp_dev->pdev->dev, "queue %d busy\n", f->type);
+		return -EBUSY;
+	}
+
 	frame = mtk_mdp_ctx_get_frame(ctx, f->type);
 	fmt = mtk_mdp_try_fmt_mplane(ctx, f);
 	if (!fmt) {
@@ -706,12 +712,6 @@ static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 	}
 	frame->fmt = fmt;
 
-	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
-	if (vb2_is_streaming(vq)) {
-		dev_info(&ctx->mdp_dev->pdev->dev, "queue %d busy", f->type);
-		return -EBUSY;
-	}
-
 	pix_mp = &f->fmt.pix_mp;
 	for (i = 0; i < frame->fmt->num_planes; i++) {
 		frame->payload[i] = pix_mp->plane_fmt[i].sizeimage;

-- 
2.56.0


