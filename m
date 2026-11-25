Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0791E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 20:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H36bGRQD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b4TJyviE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O3cn42cRp9ta80RYl78FVY9fV9o47ecym0lO2qR+MbY=; b=H36bGRQDXalx1K
	t/MMLPcbAtVeRW9gANlzWMjjRK/P1JYyKnqyEm2buuW0+BC7BmLKjkVhfoHTX2+XHk/RE0pzaFhYI
	kCq4+hVf4uv4cEa667jewAJr9njpnbdbZysfjlChWVHND9xOF2hUQrE9X/FfmSs/dNY4tZtLp8HbH
	cTqLys76Aa7wKaP4201OMXtCwb7hg+It9Qm2R5QkQWOJyPn+86LNrZdt2fvl2x+9sjM+/1/kl0gYI
	3oO8J9+4HRg6mNIFVkllOmv5AzMQs8CsxssU9FVnCZJi3zJgUW3CFS2IHQzbeaJlfdsj33cyvPopr
	P99/CB72KHmMgR/YAaVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJQy-0000000BFbp-1gSF;
	Wed, 25 Nov 2026 20:17:40 +0000
Received: from mail-oo2-x02.google.com ([2607:f8b0:4864:31::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJPh-0000000BEs4-2rko
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 20:16:24 +0000
Received: by mail-oo2-x02.google.com with SMTP id 46e09a7af769-849c2965b9eso1101191a34.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 12:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637780; x=1796242580; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3cn42cRp9ta80RYl78FVY9fV9o47ecym0lO2qR+MbY=;
        b=b4TJyviEnMDVx5LKl9g6xCW7uxvcgvkYV8ytV0kzrywaJp+fkhwF8pRSzjcKggo5PC
         fcWrj7pc5b4z2ZzbcDaVZ6E+mg/VIsQQmjdovv+kmBZb59xteD7jjLy3tb4hU6hHk/9x
         onXZqALbyRqm6OCafMKjIs20AFPHnZVoJ5MxEFOI+7svK7kB7b6Njh+wrpHgDXjGNMV3
         +ItZTcuq8OuHVh6uMPb7YA+intg+YckBlPvyl31XVCMM7XDDFwCqySJehlOTGWSClgWD
         /i2NY8CkWaRUxWyLDKOk1IL7F7Zg4RZH3k1DCqjtxtH5RdPE2UoZSttGANFQKwpC1pOT
         pF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637780; x=1796242580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O3cn42cRp9ta80RYl78FVY9fV9o47ecym0lO2qR+MbY=;
        b=e2c2MwIWt18pixjmKEFR4gl0LPOuuBWgKdCYkR72MUHP9gGvWPvE4bMeiZX/pbwcVN
         eC4mxuScmG35z3W6MnBskiXzzJNzZWRUTUmV41dksqLBgfuG1qlKTlef32vtaNGNK7GI
         X5oJDzXbkUIPTohaL1dctgBsqsXKAh7VlVbEJjSYTXy/D4NM2Fix6Q2BGVEXDivFHh18
         bN0rnIohFNlyyldj3lUwXXxnsOD5sxqsZBqPb6Tao1y2YI6grtXAnRV5DFjhp9qRKSPC
         //QRON2R1+acNDyePLW70Gos4QgeRmqO+Ate7cJzPM5PCIUUl08co0QB+8RrM/6ZVKeH
         gN6A==
X-Forwarded-Encrypted: i=1; AL+hErEz0BKkgoDzN+jJUEjwdBkWNdIW5qWcBE5JTgAp9QkGmJL/UizXScHaGxxnPOqTUCIgoWGDY8fWMrXhwZaM+Iow@lists.infradead.org
X-Gm-Message-State: APuU4Z8eDYpbdHqV3pJ4HlJDLpDBtaZjD9yW1wV9uFpke+R+fRqK/2Q7
	DYlybRI6rzU8nWKzXCXIsE8e4vNtJlSrTXCaZR2G8VDnsXD6VKWYvxCa
X-Gm-Gg: AZFdTZfN1E78pLhslwoK+sMjQMvAmFEFQ1rXJ4ZMrwyt7g5hGkhBnJdpvleLCVvjvxj
	0g1AfaejJNnedvLgawQ9MJ1u2wNKFEuAtROQHVFAwup8vexmrhNY3DO2Bk0avT5NTYN77CGInnu
	luMKoyoxOyHc0ZMxgkyLHuQM9V9WCMRSdOFO24wQH3ubsm183waJjGVjei1jLkUYo94fTqhyv2H
	oiqi3gHYIbdQ3mHUooeNjJR4WSMvwTOeTrERT1aSqs2wfDhF4opFf1KdsZ29/oPpvd8PvWVpXl3
	xrjcKrFFpf89TabqBSQl0+jD9hLOYabmOtiEpdpzhceUailkJdsO9DoLcaFPDYOlvK5MbhRG5C6
	mTQFhJ7MFjtWgOI2ZXlRVKicXbqDtrJV9McG2qMAMUjkXDF7Lnzxi9faorvjL97JLflRSF3WwrN
	OyAI3eCwn7PNt3mY1rikPoi8KRLOGy9M/LzEsyikxixQZbYz7eJfle5wq0jdFzOfx1Wm8v8vCup
	pL7V8E6HJCC6nFL2KsUNmtPn18jsEHtBiqOqkBaeXQ8LpI899Bce3F+p7MJYRGYRuLUx+ZiI1un
	MGOOJ2z63cmLB65I/1bbfkn7zmfklD3hdms=
X-Received: by 2002:a05:6820:829:b0:71b:845a:3340 with SMTP id 006d021491bc7-71b845a3cacmr1304758eaf.67.1795637780542;
        Wed, 25 Nov 2026 12:16:20 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:20 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:16:09 -0600
Subject: [PATCH v2 6/9] media: mtk-mdp: Check buffer plane sizes against
 the format
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-6-fdc047cf75a5@gmail.com>
References: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
In-Reply-To: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
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
 Ryan Brue <ryanbrue.dev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=1943;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=cuEbWTB4pH0BRk1X8WiZhDbNCpoA3GtHpeZU0Znpd0c=;
 b=Fk4k0A+X9pfrp5/bZ/6fIHGtDbMlWMdQhCZTNBXGLqrrhv8Zz0b1rhsC2ajbotj6wJD+CmQrL
 vLFuz3wryijAdlRCk9T/dEZW1Z9zxE7eokb6NXV/ZzUIE3EVelyj1qk
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_121621_754361_EC44E294 
X-CRM114-Status: GOOD (  14.03  )
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

queue_setup() ignores the number of planes and their sizes that come with
VIDIOC_CREATE_BUFS and always answers with the current format, so a
client can allocate buffers too small for it, which v4l2-compliance
reports:

  fail: v4l2-test-buffers.cpp(872): q.create_bufs(node, 1, &fmt) != EINVAL

Refuse a request with a different number of planes or a plane smaller
than the format needs, as vb2 expects of queue_setup(), and check each
buffer's planes in buf_prepare() as well.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index a40bcf61b7ca..e0627127430b 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -546,6 +546,15 @@ static int mtk_mdp_m2m_queue_setup(struct vb2_queue *vq,
 	int i;
 
 	frame = mtk_mdp_ctx_get_frame(ctx, vq->type);
+	if (*num_planes) {
+		if (*num_planes != frame->fmt->num_planes)
+			return -EINVAL;
+		for (i = 0; i < frame->fmt->num_planes; i++)
+			if (sizes[i] < frame->payload[i])
+				return -EINVAL;
+		return 0;
+	}
+
 	*num_planes = frame->fmt->num_planes;
 	for (i = 0; i < frame->fmt->num_planes; i++)
 		sizes[i] = frame->payload[i];
@@ -563,6 +572,10 @@ static int mtk_mdp_m2m_buf_prepare(struct vb2_buffer *vb)
 
 	frame = mtk_mdp_ctx_get_frame(ctx, vb->vb2_queue->type);
 
+	for (i = 0; i < frame->fmt->num_planes; i++)
+		if (vb2_plane_size(vb, i) < frame->payload[i])
+			return -EINVAL;
+
 	if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
 		for (i = 0; i < frame->fmt->num_planes; i++)
 			vb2_set_plane_payload(vb, i, frame->payload[i]);

-- 
2.56.1


