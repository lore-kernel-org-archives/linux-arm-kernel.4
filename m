Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5AC606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 06:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mTL9nNW0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=HC0LJEW9;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=CHVVM57v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qT4jukooijkn9oVFANgSEWWyX/Wb2Pv/yUrB34irBsY=; b=mTL9nNW0Fld+lKxIkZdgId2sMv
	dhneIGVa1VK/zfn016Dn+0WxfBOo1Uml18T9dRRgu9NIlD9diAjx3MVqxChqTZf28Wwpy5KLLmBO7
	Q99Ey/guGYeNmYordHzIqf2efDD+7W6cBgFwkUltczNiIyixj02DDJzFuMtbz5pYlyGmxP9OC3a2+
	HhuOF6mrVG8zm96rHPxoJ7Tew0eHqQRPYwojZUIrXkX6C/84crmERLgRFSQaCXVGDlwNalHvc4hUB
	WcgkMJxTEXVN+gfWy0X/1nHTqXditmmzOfOJpoBhSV2JjevR2NdX2aay7esEPPP6tdwVCI2ex5h+B
	t5/KCwRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Kz-00000008bxe-0Ujd;
	Wed, 25 Nov 2026 06:18:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6JI-00000008ZCy-0mB4;
	Wed, 25 Nov 2026 06:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=qT4jukooijkn9oVFANgSEWWyX/Wb2Pv/yUrB34irBsY=; b=HC0LJEW94irCxURsq7A5cP8l58
	VcDxnMY+ODJT7mkVIngquPlz5vfPrzWQCFfuHHl0ApsYWqqvCizihY+IUTxJQNZTfkqCDgX7mznmJ
	W0x12vQfw+aKtQ+f1vmVt8nGmbl/wZfOh1rk0qNX9JKt+/a1Qmt6Oa47N/kEzxrk87wAxExo4vrTN
	8E7l3LglDx5joVWnFkqYKzukD2m05SASXoUlo1dfAb03PqjL8ODidS5Zk25DsyKUxyPBm57QNKZ1k
	J23BmAeHTDi129kzGTSZfeBXLSsPWOtCLid+3rmbJusMYHGgQybVjWReLcgqd0m5CwqkhYKi8ZqOA
	QAkLfoog==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6JE-00000005q35-0yIz;
	Wed, 25 Nov 2026 06:16:50 +0000
X-UUID: c1cb6e7ce89711f1acbe4559397dec65-20261124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qT4jukooijkn9oVFANgSEWWyX/Wb2Pv/yUrB34irBsY=;
	b=CHVVM57vdo1uIpXg9KK5Mte37CObBGESTgeZfMjBCsw1c5ZOwBQzIJy+7rjCntXPAwMxbrYORI3vMTDOJ4auzgwmOEEhlUqkhGK8IRo0Cjf1YNkks8RHh4gJ6ghqYMmtHV39+9sOJJJePzG3l/TEFxiK4QSVrw09dPrN//h4Bpw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:cfd19cd2-bf47-491b-b4d7-5ce05bf1a7c9,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:3c35c266-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c1cb6e7ce89711f1acbe4559397dec65-20261124
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1481515801; Tue, 24 Nov 2026 23:16:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:16:29 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:16:28 +0800
From: Kyrie Wu <kyrie.wu@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, Hans Verkuil
	<hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Kyrie Wu <kyrie.wu@mediatek.com>
Subject: [PATCH v20 08/15] media: mediatek: jpeg: fix remove buffer removal timing for multi-core
Date: Wed, 25 Nov 2026 14:16:11 +0800
Message-ID: <20261125061618.2544386-9-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125061618.2544386-1-kyrie.wu@mediatek.com>
References: <20261125061618.2544386-1-kyrie.wu@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_061648_724450_5D54DF95 
X-CRM114-Status: GOOD (  10.20  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Remove prepared source and destination buffers from the M2M ready
queues in the multi-core decoder after destination preparation succeeds
and before arming the timeout or starting hardware, matching the encoder
flow. Completion can then return buffers without leaving them linked
in a ready queue. Preparation failures keep the existing cleanup path.

Fixes: 86379bd9d399 ("media: mtk-jpeg: Fixes jpeg enc&dec worker sw flow")
Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 199d15828..7e4fd36dd 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1768,9 +1768,6 @@ retry_select:
 		goto dec_end;
 	}
 
-	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
-	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
-
 	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
 	if (mtk_jpeg_set_dec_dst(ctx,
 				 &jpeg_src_buf->dec_param,
@@ -1785,6 +1782,9 @@ retry_select:
 	jpeg_dst_buf->frame_num = ctx->total_frame_num;
 	ctx->total_frame_num++;
 
+	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+
 	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
 			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
 
-- 
2.51.0.windows.2


