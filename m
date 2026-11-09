Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1311606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 17:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3gkjhbDu;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cJX3zL5y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aNMBR4KqypyM8nZC0Zd6F06XAJ3Q0+V3qNyKzqi9O44=; b=3gkjhbDuL3hKOI
	nyolpOoa7fY3k/zBXRix5fbxeFKgu3BeibDftRbni5EpgfiMusO911IDrQc0SwsDkkeAFYXonfF26
	8LgwcAEnIFFr3vNkgpuvKOXvc6euSdQoI5YnPJVaROZSU5SHyTqyRrJeta9kOG8tLBFlTvaiZcKvC
	7shD/K0OpCBUbEPAHZer2NoGCLlsNPD6WZoYyTD5IZXW/VnNwR2JMbbO12U8Spkq1RPZIlb4ZPoI8
	QhqInl+5rXLcjp98COwNQkuxchAtsToUg6J7dVDuYfhqP1ydoTD8KgaRt1uOImEIW5avqdX65QCzm
	DLpjiObkHV3PYnFea3Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWj-00000001OeS-3jPe;
	Mon, 09 Nov 2026 17:51:30 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQTWa-00000001OTU-3Jgu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 17:51:21 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso8166775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 09:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246679; x=1794851479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aNMBR4KqypyM8nZC0Zd6F06XAJ3Q0+V3qNyKzqi9O44=;
        b=cJX3zL5y4KXxINb8FHYzxJEoMrANaE4waqzujh5hjLEYNHRsuzBR1QNJVUxuxiBZUg
         1lL8eKUKLjqvwLTDpk9MxIwxlrsbu3LkxRjTI7VkgCs2Z8FehT4N0eHiqJx79Fo3oops
         MqlLaVrkbLIf6f4AcfnDLWd9iTXDd2nnjj2h8+IaQk6taVSYBzV3H+SeTHQCqq0taDlp
         OL9KtwHfm+LJFB6Jz6LNRRcicnTSJ5GQuy7RShJlyoUTmX6/AVsUNVbGx4nXz4uLw0dR
         +RbLFOrTZunf5qq1AAMpQWACbbB0RX++k3ERc/nEKmxyKz92mLxCGpT/1SWEwY2qUatB
         TvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246679; x=1794851479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aNMBR4KqypyM8nZC0Zd6F06XAJ3Q0+V3qNyKzqi9O44=;
        b=1g2IA1Py6yu2Kel/H4MLOC/pHFQCqwqXiSRa2pfs5ggqBcwlbUDSt7g/L9+kG5Id1P
         gXNVzSPURTI4n2bi8UpiqNFDLK7saSdIeE7CBqJ3cIuW1xC1TBOkF3TE5INsRHvOZzth
         wy3qLSbAAyDsUzs++sb5wDSNpxb/9OQweXP6d70HlKvmplieGjszhaJxVPdcTcfk3QES
         ZQRYkHujL1gY8aQxScdFKYNw+7FnpPge5V6HxcjgJOgdXBbPqNzUMKw5A3/YGCrVtGKu
         8VA78zGp/DjUYLR4lFMPR+mJ7VSoQmIDDBrZnH7SP7hzLh21Ox4v3vC/Do4zMisUWHd0
         gSiA==
X-Forwarded-Encrypted: i=1; AL+hErEnU52tm6061FiDPn2gmY5ReOnH5A8vta5WzUxx1OTBz9eOTd1IQz6NEVZT5z0GnxOIfXfGoM3OIVGkCS3/YcfX@lists.infradead.org
X-Gm-Message-State: APuU4Z/9l7RzK4I8j5G3sZamX9UG1FZAcEhqFa5GtJsR3qJa+Z549r1f
	Ec+QkDANlnMccTdAmQ6EbL5nAozbKpRtXwAa1w0qu9I5G19y8dWjXrAK
X-Gm-Gg: AYBFou2cJEXtrWlHdwI39CBxJ3EV0/JCsmIvFYNRAVb1wwlkONOB5mDNxfLx2E/7hsz
	2DanmuhglCn0RSXlZDvkGXqiJiaPEmein4oDkBooKr3uz/ahWv0FI3ecBtG3ofU6wXu2R/hnINI
	sdystK0mIlPxQ10wxnYrANP+wzOjLOIG0cp9L3FNTXDUMl8iAbZ5mvLkrV8B8HJpaSqaj3OyjAN
	9/zYh6rUt1gNHfKzBtOvo4vaR5W1nC2sM1xuYsyE6vdRuuWfhBTbVcQV4ZWenjGo+9n+5uFOQrI
	Uxq3JQxLILurzWSa26MLkg8wnnBss30njx6KSxRsfuY/R5V5BTI1zvjVfxzgGwLw1qh1zQmTn+u
	SQjUAdhqkHabKlrLS6riEfPV1vlzz8puxRzvGKL6hZLD13atRpX1knSmra/2VYQvjhOghsXR+bN
	3qHXT/lMeMdVCekkaBJrita7xvnXFZkEo6O+jf0ZIDfoFoLT+NGHWiZ8aVee5S6cZqM5OpZhO/f
	3Afzx/NutqxhlFv0qDKrLhdCs/uWmnxAVntZ3ZQBq33QEKcdV0QshU1Ua66IUcCTyYHLA8nYAAG
	rpWj+edRx1imDn3sA9xnmkdZtpHfQbaW+Sht9e1RL7j5g6AoXzs0SpStF0SlXXNhkwGDXij+sgm
	WpH5EH11xohU0decLGdj4LQfBlEBCyvCt5pLQ2vwh7bE0GEq3/U7m2b7vusv0F2BkFUyJmlUfCL
	p99UZvJ/lPwu030cJPfY0VNtn7Eo9/mNIFPWukh/A4Xh51ZNlFyeliM18pYms2ok390I000vKMF
	Fr4oy44p3cM87+8Er6hq44tnQzFTKPCog1J63fzl9iST4GZhdL2euBOvw4R8LeCtRWoelnT
X-Received: by 2002:a05:600c:1c02:b0:4a7:d9b1:b684 with SMTP id 5b1f17b1804b1-4ba0230cc8emr216685e9.2.1794246678645;
        Mon, 09 Nov 2026 09:51:18 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a4238sm200717f8f.54.2026.11.09.09.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:51:18 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 10/11] staging: media: cedrus: h264: clear the DRAM buffer sizes on start
Date: Mon,  9 Nov 2026 18:50:15 +0100
Message-ID: <20261109175016.42061-11-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109175016.42061-1-jernej.skrabec@gmail.com>
References: <20261109175016.42061-1-jernej.skrabec@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_095120_864368_E85F0980 
X-CRM114-Status: GOOD (  14.36  )
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

Above 2048 pixels, the H.264 decoder puts its deblocking and intra
prediction buffers into DRAM, and stop() frees them when their sizes
are not zero. start() only sets the sizes for wide pictures and nothing
clears them, so a narrow stream after a wide one on the same file
handle frees the buffers of the wide one again. The codec data is also
shared with the other codecs, whose data can end up in the sizes.

Clear the sizes at the start of start().

Fixes: 03e612e701a6 ("media: cedrus: Fix H264 4k support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
index 97958ceee8d1..e7a3bfbc3531 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
@@ -573,6 +573,14 @@ static int cedrus_h264_start(struct cedrus_ctx *ctx)
 	unsigned int pic_info_size;
 	int ret;
 
+	/*
+	 * The sizes tell stop() whether the DRAM buffers below were
+	 * allocated. Clear them, as they are only set for wide pictures and
+	 * the codec data is shared with the other codecs.
+	 */
+	ctx->codec.h264.deblk_buf_size = 0;
+	ctx->codec.h264.intra_pred_buf_size = 0;
+
 	/*
 	 * NOTE: All buffers allocated here are only used by HW, so we
 	 * can add DMA_ATTR_NO_KERNEL_MAPPING flag when allocating them.
-- 
2.43.0


