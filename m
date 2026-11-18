Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33384606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 20:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h9KHvL5w;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZJI04bdQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YixFM3AWmT7jYQ+cnCQNR8AFTxM/A/eG60HgEXpPHIc=; b=h9KHvL5wBwA0SC
	GLY1qs6T+E3Y6wmeB0MofqdA/vqzpNHBf/Wuth5apvWUbK/mGaFN5igpBqWEpNhsklnlNxekt9xXX
	DkCK5SkmehNdE6OMeMm+covvMnMhzgOCvKz5Dh16+Yf8FctAB3dyp7TMHXniRMNpksRe81T3x/uTi
	LKYt9AVpr9mPjuvlEwfs8i95j5CK4Lj83yhhYXryKTO7B+4fpZ+m5kR9kctGgRmJkff/abd62YRzw
	r4CpvxZQcgKqsLS4D+lBUCR+/EszXuOoAbkToTa9sHLEjSiXZW/W+7zgwX2LHe7QsIab/iggE+/4G
	jo7x13Q+N7firqPMjn5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmLw-0000000ADwU-3yw5;
	Wed, 18 Nov 2026 20:34:00 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTmLo-0000000ADrZ-3Gcn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 20:33:54 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3b0ac1900efso138201a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 12:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795034032; x=1795638832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YixFM3AWmT7jYQ+cnCQNR8AFTxM/A/eG60HgEXpPHIc=;
        b=ZJI04bdQ8yP0TY6p/Fxmw8RKBnO52Ik5EqOLRt06pwYspwNuTDp/VQbkmnBoLyyTPg
         DECXgSudzbYQ1Q9nKU1fyZG+Lp02+0dtKTGunsIG8GlnVV3y94YrhuBGMAhoN4wqjwTS
         dMa7RTWcFU4txZcdxbSFwatvcuc5OfO9ChJ4OBZ9EMsoPGPWl3UjuYZhohr9UdXnj5Ck
         74WptSOPnzUBUMAYm1ENWqc/SuB9Wl2bZNI3S95yIr/G+LRdfYowsSlC95+Twv3neeXE
         DnXSb+E/u3D5qWPr5dMScCjLK5d/AAGAUvf9MvPp5WUxA3hUBf6Kfn08GuPaKFMqvySB
         hT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034032; x=1795638832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YixFM3AWmT7jYQ+cnCQNR8AFTxM/A/eG60HgEXpPHIc=;
        b=i1/tQIt8Z8YrTzldffQovjqUYY2eCpjbVVjG+c0RQ0fRB828s/RJM/N1RMXRCzc4tC
         PFR8ARe2z+RDm0XYzAuGZpTmPOGEQy4KfS08sStBi2QYRoXowR3vSdApufZtvF5zAT9P
         9tROpMEHD97zgEiT8BS61asED5qgY0xmqz4wi4r7oWNrgne3JqC+oeoHmqHGudgOtBtt
         ulEPdGPkRjdeO6AuYjYqkUyXuUx79W2lN/Qvq/Rp1BSwi9Y/QPtYOinVia/jQYzQleUN
         uueb2AnsKoCU3zwxNZx2abZ1v+kh56qTq7j577n2hDVr8IoYcja7QR4JfraXXiL1Av7O
         ycRg==
X-Forwarded-Encrypted: i=1; AL+hErGd421LXZmmnGbA6HZ/gHliHQl+HwPiV3ntuH+p/tHPlGHkuV2E54mO653hw7eseaFCGUw+dRqGyToWCIKz/jzX@lists.infradead.org
X-Gm-Message-State: APuU4Z+JTszdCk43r49QKbmos4O57CbOmFcK/4w7X8Vovj3UqT/0lXJT
	WXxGY2aaB4/oEM6wssxiS28IVKpha0QWOYrjQpe6G4GWUpQFYwgcdqFw
X-Gm-Gg: AZFdTZeEfG04SjrTwj3ViywYwUtV5Xa3b61ThEDiKsRThLb3PS+gvKn4XPoGNhTOre+
	fRCETUD6S9LdiH3p7AHFuROgANOTvwZ1tmggC3TKIW7hvxro2Q8+fKF5mNdaGJZMJiWlveVJIiL
	IJ56XGDCKp5YsipZChoJrvcNGmsaq21oVBBw/j4FMKE9c3fsVdaCvbSHq6KBHVtdn2ZourZU6E6
	Mq2bpxPBUeZyTx2zzjOPOfrfRveL7EIYk8LwU4hYAKNsLhcNch+K/bO4vcCtOEK0lAoG3D+Oykv
	cpffGQV4fRaMDwc65XLvuoSu0mFpqru/zXPmDm525jFlT13HdCceq4ZkWyN1Uu1FvrbCuR42cW0
	F0c0+YFUdGSOQy0G/ZMoT/oiWU3MhFYGffMw6ygR2GJyOLD5gDLisLw0J5XvKUw/6iVdZNnN+Gj
	V//PJ65qu5BqpKlDdRUBFtdGwtFGNju1fB0aMUR79mPiQxo//zDyoS7sfoAm4NTQDJ+qI123PBY
	fSYaQjZE38eq6VTMAkXwg9sIogG5+nMyx6Y6g3KZuKxW2JWShisn1f5D+3Ac25CJI8+fa5BNmJn
	gRPlI02hcUWvkC+4LvZXynZ0yMUa85azZsCO7ILzx1lR1MRubJbOIpfSBTZnKg==
X-Received: by 2002:a17:902:e888:b0:2ed:29a5:782d with SMTP id d9443c01a7336-2eff72e15f0mr59296815ad.2.1795034031819;
        Wed, 18 Nov 2026 12:33:51 -0800 (PST)
Received: from FAIZEL-KB.. ([2001:569:52f5:4b00:cfaf:4885:b023:6316])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2eff6116331sm19166825ad.22.2026.11.18.12.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:33:51 -0800 (PST)
From: Faizel K B <faizel.kb@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Michael Riesch <michael.riesch@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	libcamera-devel@lists.libcamera.org,
	Robert Mader <robert.mader@collabora.com>,
	Faizel K B <faizel.kb@gmail.com>
Subject: [PATCH v2 1/2] media: rockchip: rkcif: Filter enumerated formats by media bus code
Date: Wed, 18 Nov 2026 13:31:33 -0700
Message-ID: <20261118203134.315591-2-faizel.kb@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118203134.315591-1-faizel.kb@gmail.com>
References: <20261118203134.315591-1-faizel.kb@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_123352_843759_8A56510B 
X-CRM114-Status: GOOD (  16.59  )
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

VIDIOC_ENUM_FMT ignores the mbus_code field and returns all formats,
although the video devices set V4L2_CAP_IO_MC. Return only the formats
that match the requested media bus code. The DVP output formats have no
media bus code, so they are still all returned.

Otherwise userspace can pick a pixel format that doesn't match the
media bus format, and then interprets the captured data in the wrong
format.

Signed-off-by: Faizel K B <faizel.kb@gmail.com>
---
 .../platform/rockchip/rkcif/rkcif-stream.c     | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
index 3130d420ad55..b117ba57bc75 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
@@ -395,13 +395,23 @@ static int rkcif_stream_enum_formats(struct file *file, void *priv,
 				     struct v4l2_fmtdesc *f)
 {
 	struct rkcif_stream *stream = video_drvdata(file);
+	const struct rkcif_output_fmt *fmt;
+	unsigned int i, n = 0;
 
-	if (f->index >= stream->out_fmts_num)
-		return -EINVAL;
+	for (i = 0; i < stream->out_fmts_num; i++) {
+		fmt = &stream->out_fmts[i];
 
-	f->pixelformat = stream->out_fmts[f->index].fourcc;
+		if (f->mbus_code && fmt->mbus_code &&
+		    fmt->mbus_code != f->mbus_code)
+			continue;
 
-	return 0;
+		if (n++ == f->index) {
+			f->pixelformat = fmt->fourcc;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
 }
 
 static int rkcif_stream_enum_framesizes(struct file *file, void *fh,
-- 
2.43.0


