Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72E8606A6E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 19:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qBQRkLtX;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n31drNSy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1Eid3doaSZf2ysVevRrYOd8czGEuX47H2CdZ0vI/gNI=; b=qBQRkLtXffjx9w
	KKPdwhXuApZNokcpoNfElGpAvotfQVcExw0wArOU2hNktP+T7VNdl+ic4v27rMyNfbKNHmbp30UTN
	GVEUmAqfq1u4U5QpBZsLgXQez2zvtZuFxHsWthYK/AS7m+0B8k7wXIvEZwdlKbYuaopKk4RCeVplo
	kihD+qsJD4FkB/l+iB30iPO0mZx5/YGzdpQi+VpCiD7Z0pon/gWbEj5nDsYtPg5F1f6u0AKGsIFbe
	9Ri2IcJRAwZuTTF8n9rMAVsC/GFGtbVpAARRxNRH7+RWTEzo3PfX8XU4NsxkFM0M8LpiiYyr+iWTr
	ntywB78MQ2uIVB1poHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUiN-0000000G9dS-2fjp;
	Fri, 20 Nov 2026 19:56:07 +0000
Received: from mail-oo2-x07.google.com ([2607:f8b0:4864:31::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUi4-0000000G9L2-11z2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 19:56:03 +0000
Received: by mail-oo2-x07.google.com with SMTP id 46e09a7af769-861ab2b429bso490029a34.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 11:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204547; x=1795809347; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Eid3doaSZf2ysVevRrYOd8czGEuX47H2CdZ0vI/gNI=;
        b=n31drNSyzTQZVNdHNDziYefcIQAlNBTNKSRdwb/57OypdrKYnDDLAk9a+ELg8DH635
         Z/CKXLu5rlpE2yDbkeFz3z/nK62xIsantGybMunUv75JGwcgsbfz9TF1g2w15TNZP4i5
         7obAfUNM2KTFG8fbIsUTR8ocGnHzMnhf7Jl5vCd9cUgyOJQMe0Wk455MW0VfK3pRELw1
         VxbJoOcH2syZ2GxkNnu7xez1lnLzxuIltt+/foJY2A1Fxq23/FS1Z9vt9cpicjYjCQit
         i2zCx7mDEGCUpBgyiXF82SYj/EeTb0xvUQa5MX+LhcC+adf3hO89KS3f48RMdEWLPDRW
         4iWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204547; x=1795809347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Eid3doaSZf2ysVevRrYOd8czGEuX47H2CdZ0vI/gNI=;
        b=b2gUwGh0zB1PiztrXDs/Oe1cF6Ogmp1F7i5/7ICen05F4s6AAvofBbIbNHAJ133OpT
         tMXbwfSKfkn44Q+j1SUcp5dFVQTHY2J/tqcYS1q5RlOjn9DApKLANlSzjV3QatFnyySb
         viiw0VdsfaPw+gCXHI24x81tQz+SaaQUuohE8SRuZ0IBgdoqyWTCFG8FjL3EsnQ2XHxg
         NkPpgXmohutrVN6GJC68R2YqHo8U8bYDq90XBQ3yrikK/GHV614HE8vH05tnUp4rq85V
         kEuOo3pLmRyqgv283DjjkwV8H5RQTQH188B9JILkBJ0hOmAbFe3rzm3gHhXx7lCAyYmR
         5akQ==
X-Forwarded-Encrypted: i=1; AL+hErEV7GnDRZgiRN8MZQ5iGkP7ZCG60RKLYXo9TSzHVCkwRlzvD4gKrbmfXSQ7L8Dnb+H0mPqEGty89yGlrpZ0VD1L@lists.infradead.org
X-Gm-Message-State: APuU4Z9iZApBYEFyimAPcEW3x5GgPF7+EwQjg8IlOxTTJzUqehj8YXq2
	UbxfGbebyQ3EVb1Jpxwg5D7HZL0mSmgN0HEB+6vPegtjTqq3VHJk11/l
X-Gm-Gg: AYBFou0C8neisLwKlnVYujpJDAd+kQaiooBhlbytiZy13yD6ztqVbgHDBf2FJ7lgjj+
	JVrt7tkdrrxO9KHSj7Das/XFq0YOS1574B73XAx9frDOyKxg+tYx8soJ2niBwNC1zJ7CdLKIZIU
	nNRD+M+h9DPhasdRht2V1Twg8z/4XuTd39U2rsqDJz0a9J/nFf16nGNSfHBtU6Fx5vtBq2QLOnu
	3qDNLqqqgLkWH6rxtOuZNoCFNz98CXQJ60eYShRCg6D0IJajlsCTtZiST3n5kuKskcq6baS1lpg
	1UAFKMc1ZfM1cwvlDQCLsZmjAkV0WIBZI3d74YwqRp3gCxIjP2I5XYYq26axLmug+mBSJfHxd/Q
	XImCF9TV+QPtDnNI7OvLhlJdE82ma6BTJ8WATu3FyGEgx3tSMCV2QZ4ifvE1jK7tYElo0jqZVv1
	5HYnufiniBNZQBKyHTxd39Zzu/DdTh27A1dcCpA3BTs32WQULUsu73o6Vg9aiiXZVOYuW62GZ5Q
	rxiSpcD4DB9JDIopzWaJoj+7W0MiBwULWW410Q4x5hrO3G+gV6DCCxtckFwrKBz+waWbRdfP4Yn
	Dz7sOVKRFa9rBxudao1WliCujwN2W3KndH+9ipPn5W3ex/CGCDUStfjtEiQpkX7u8yQSymgcfNl
	Y5stCTmI5XKZB6wZ/xKk=
X-Received: by 2002:a05:6830:907:b0:85f:49ec:c96b with SMTP id 46e09a7af769-863159a61bcmr6180062a34.16.1795204547018;
        Fri, 20 Nov 2026 11:55:47 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:46 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:39 -0600
Subject: [PATCH 5/8] media: mtk-mdp: Do not refuse a crop for the other
 side's size
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-5-877dea14c3d0@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=6597;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=FLQ/x8yveejr3QHeM2KGc0SR3iRQfxTwCwBKw4jNsu8=;
 b=lWVETie9gi1H5rYLmKowqt5yFgn8puCkapDQ59j09ERYM5var+60bwKt6pJRKxZ5SVdRdmZaD
 JOi1ZFDZQDsCYyu6vV6zo+Ln+30tECm9li/Ma8UXA+ZNjOxytLiLJin
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_115549_687435_EC93D333 
X-CRM114-Status: GOOD (  19.44  )
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

Setting the source crop checks the scaling ratio against the destination
as it stands: the 32x32 default that open() sets, or whatever a client
set while probing. GStreamer sets the source format and crop first, and
a 1280x720 crop was refused with -EINVAL against that 32x32 destination.
The same holds for the compose rectangle and the source, and for the
rotation control.

Check the ratio once both queues are streaming, when both sizes are
settled: at VIDIOC_STREAMON, and for a crop, compose or rotation change
made while streaming. VIDIOC_STREAMON is the first point where both
sizes are known: before it a client may still set either side in any
order, and checking there leaves the queues untouched on refusal. Log a
refusal at debug level, since any client can trigger it.

Fixes: 0d1e342a17f5 ("media: mtk-mdp: Remove states for format checks")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 121 +++++++++++++---------
 1 file changed, 73 insertions(+), 48 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index 34d02de4453d..a40bcf61b7ca 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -727,10 +727,40 @@ static int mtk_mdp_m2m_reqbufs(struct file *file, void *fh,
 	return v4l2_m2m_reqbufs(file, ctx->m2m_ctx, reqbufs);
 }
 
+static int mtk_mdp_check_scaler_ratio(struct mtk_mdp_variant *var, int src_w,
+				      int src_h, int dst_w, int dst_h, int rot)
+{
+	int tmp_w, tmp_h;
+
+	if (rot == 90 || rot == 270) {
+		tmp_w = dst_h;
+		tmp_h = dst_w;
+	} else {
+		tmp_w = dst_w;
+		tmp_h = dst_h;
+	}
+
+	if ((src_w / tmp_w) > var->h_scale_down_max ||
+	    (src_h / tmp_h) > var->v_scale_down_max ||
+	    (tmp_w / src_w) > var->h_scale_up_max ||
+	    (tmp_h / src_h) > var->v_scale_up_max)
+		return -EINVAL;
+
+	return 0;
+}
+
+/* Both sizes are settled once both queues are streaming */
+static bool mtk_mdp_ctx_streaming(struct mtk_mdp_ctx *ctx)
+{
+	return vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->m2m_ctx)) &&
+	       vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->m2m_ctx));
+}
+
 static int mtk_mdp_m2m_streamon(struct file *file, void *fh,
 				enum v4l2_buf_type type)
 {
 	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
+	struct vb2_queue *other;
 	int ret;
 
 	if (!mtk_mdp_ctx_state_is_set(ctx, MTK_MDP_VPU_INIT)) {
@@ -744,6 +774,21 @@ static int mtk_mdp_m2m_streamon(struct file *file, void *fh,
 		mtk_mdp_ctx_state_lock_set(ctx, MTK_MDP_VPU_INIT);
 	}
 
+	/* the queue that starts second checks the ratio */
+	other = v4l2_m2m_get_vq(ctx->m2m_ctx, V4L2_TYPE_IS_OUTPUT(type) ?
+				V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :
+				V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+	if (vb2_is_streaming(other) &&
+	    mtk_mdp_check_scaler_ratio(ctx->mdp_dev->variant,
+				       ctx->s_frame.crop.width,
+				       ctx->s_frame.crop.height,
+				       ctx->d_frame.crop.width,
+				       ctx->d_frame.crop.height,
+				       ctx->ctrls.rotate->val)) {
+		dev_dbg(&ctx->mdp_dev->pdev->dev, "Out of scaler range\n");
+		return -EINVAL;
+	}
+
 	return v4l2_m2m_streamon(file, ctx->m2m_ctx, type);
 }
 
@@ -810,35 +855,12 @@ static int mtk_mdp_m2m_g_selection(struct file *file, void *fh,
 	return -EINVAL;
 }
 
-static int mtk_mdp_check_scaler_ratio(struct mtk_mdp_variant *var, int src_w,
-				      int src_h, int dst_w, int dst_h, int rot)
-{
-	int tmp_w, tmp_h;
-
-	if (rot == 90 || rot == 270) {
-		tmp_w = dst_h;
-		tmp_h = dst_w;
-	} else {
-		tmp_w = dst_w;
-		tmp_h = dst_h;
-	}
-
-	if ((src_w / tmp_w) > var->h_scale_down_max ||
-	    (src_h / tmp_h) > var->v_scale_down_max ||
-	    (tmp_w / src_w) > var->h_scale_up_max ||
-	    (tmp_h / src_h) > var->v_scale_up_max)
-		return -EINVAL;
-
-	return 0;
-}
-
 static int mtk_mdp_m2m_s_selection(struct file *file, void *fh,
 				   struct v4l2_selection *s)
 {
 	struct mtk_mdp_ctx *ctx = file_to_ctx(file);
 	struct mtk_mdp_frame *frame;
 	struct v4l2_rect new_r;
-	struct mtk_mdp_variant *variant = ctx->mdp_dev->variant;
 	int ret;
 	bool valid = false;
 
@@ -865,22 +887,27 @@ static int mtk_mdp_m2m_s_selection(struct file *file, void *fh,
 	else
 		frame = &ctx->d_frame;
 
-	/* Check to see if scaling ratio is within supported range */
-	if (V4L2_TYPE_IS_OUTPUT(s->type))
-		ret = mtk_mdp_check_scaler_ratio(variant, new_r.width,
-			new_r.height, ctx->d_frame.crop.width,
-			ctx->d_frame.crop.height,
-			ctx->ctrls.rotate->val);
-	else
-		ret = mtk_mdp_check_scaler_ratio(variant,
-			ctx->s_frame.crop.width,
-			ctx->s_frame.crop.height, new_r.width,
-			new_r.height, ctx->ctrls.rotate->val);
-
-	if (ret) {
-		dev_info(&ctx->mdp_dev->pdev->dev,
-			"Out of scaler range");
-		return -EINVAL;
+	/*
+	 * Until both queues are streaming the other side's size may still
+	 * change, and VIDIOC_STREAMON checks the scaling ratio.
+	 */
+	if (mtk_mdp_ctx_streaming(ctx)) {
+		struct v4l2_rect *src = &ctx->s_frame.crop;
+		struct v4l2_rect *dst = &ctx->d_frame.crop;
+
+		if (V4L2_TYPE_IS_OUTPUT(s->type))
+			src = &new_r;
+		else
+			dst = &new_r;
+
+		if (mtk_mdp_check_scaler_ratio(ctx->mdp_dev->variant,
+					       src->width, src->height,
+					       dst->width, dst->height,
+					       ctx->ctrls.rotate->val)) {
+			dev_dbg(&ctx->mdp_dev->pdev->dev,
+				"Out of scaler range\n");
+			return -EINVAL;
+		}
 	}
 
 	s->r = new_r;
@@ -953,7 +980,6 @@ static int mtk_mdp_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct mtk_mdp_ctx *ctx = ctrl_to_ctx(ctrl);
 	struct mtk_mdp_dev *mdp = ctx->mdp_dev;
 	struct mtk_mdp_variant *variant = mdp->variant;
-	int ret = 0;
 
 	if (ctrl->flags & V4L2_CTRL_FLAG_INACTIVE)
 		return 0;
@@ -966,14 +992,13 @@ static int mtk_mdp_s_ctrl(struct v4l2_ctrl *ctrl)
 		ctx->vflip = ctrl->val;
 		break;
 	case V4L2_CID_ROTATE:
-		ret = mtk_mdp_check_scaler_ratio(variant,
-				ctx->s_frame.crop.width,
-				ctx->s_frame.crop.height,
-				ctx->d_frame.crop.width,
-				ctx->d_frame.crop.height,
-				ctx->ctrls.rotate->val);
-
-		if (ret)
+		if (mtk_mdp_ctx_streaming(ctx) &&
+		    mtk_mdp_check_scaler_ratio(variant,
+					       ctx->s_frame.crop.width,
+					       ctx->s_frame.crop.height,
+					       ctx->d_frame.crop.width,
+					       ctx->d_frame.crop.height,
+					       ctx->ctrls.rotate->val))
 			return -EINVAL;
 
 		ctx->rotation = ctrl->val;

-- 
2.56.0


