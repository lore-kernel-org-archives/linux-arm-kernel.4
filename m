Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6FF606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vHDE1QEH;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aFUosOlt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=n51tRsSR1uv4ce5V1bvi8pKtqFtfK02ZhkRTz+VN5TU=; b=vHDE1QEH3juKpAi+wQpPPRAitQ
	0qznnbvmvYor1h25UILINKND2CjIk24ycu8XBEsd/DbEaJnCeZquVn/Hvz+8bFGlmlv4fcI+8e+CV
	PXyXHyTBeM5HuHxoOQv3XOsyE5urk6/wdbPOwA+P4mApAFOPLPiajuot3hUUTNagTtRsnZEXFAIWD
	XFgVbNof3MccDPOU41mp/EFXpCzbDP5wl2ClI4+GxE6jAwWyndmrCLj8J8IHvKxqjCkflo9jiTSpx
	Cyrsv5Uyg58PWPAU9ud/Sad2dSsrbxFiuTJ1axEMDUWOGQhGK0CSEJKqmkXhKb/2u0z7DD4Zx71Ft
	D1SZoxQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcqn-0000000E08n-0c10;
	Thu, 26 Nov 2026 17:01:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWcqF-0000000Dzr5-0tRn;
	Thu, 26 Nov 2026 17:01:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 90D2860CDD;
	Thu, 26 Nov 2026 17:01:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795712462;
	b=kQNR8UhkHKEhzRavm4oI6GSItwtkRSAFs9Rhz4eDSWRCxPR7Nb+kc0KlqosXi54s0S7e
	 Dz2SEEvbgz0gEsp+UQS5gnIp4iIbuAtUZPbGtASvxzxIZ5JxcbWRXmdXT3mfw06RuaGF0
	 xlFamz4LgHqC7NxDUhrs7OcShWPT9hiVTxzFfHI8SEGwHVG3v+lfRteFN9XslNoten1Ur
	 YwIsXQNfRagZWXgSnz9Yd9UugSQVrvgUVqlG+WKzhmHcud6NQwYQ9CmppFbe/YtX5Ja6d
	 pLOd1cJe1sx9OtxsM5yd1H9f+/m21iphTfSd/GGx+qma0kqIZZWx+fKQ0i5PFA4hpcg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795712462;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=n51tRsSR1uv4ce5V1bvi8pKtqFtfK02ZhkRTz+VN5TU=;
	b=wActME7RlSpROiTA9FvZYnf6udKq/O0JvV7KnvjzA3xrnIcogLdlkm9LI2u0xYXTRE/2
	 aUXuMsAG62kohSJk8ldHvk3RZwM8DL7n7limfXJ8V31xpQqsppw6RZqmkSPWVA9bnTiTK
	 xrutRYNtVfjqOdhFKsuiic0iwXvDYZ2q1MvUU978yuMQc5ISV2m6tilbtNC2+Skj4bmNR
	 3KUCbZQU9RlRYtejxScUTOu/vWnYfGJlxClOAHOYawz+cK8rLaelzvciRDR8D0txoscMd
	 taHTpjhGujvrw+79KTr65NFL37Ykfqx6fgVJ1DXIidffRJM96u+bytSFFx83xBv+wNQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C1A41F000D4;
	Thu, 26 Nov 2026 17:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795712462;
	bh=n51tRsSR1uv4ce5V1bvi8pKtqFtfK02ZhkRTz+VN5TU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aFUosOltN0N3sS9lbhVGvad2KurYAe6SrVlIH1C1LcdjUoob3pqD0FPkAx5uFzfZ4
	 D/FMn+kry3SlTe4WaxhYYHr6/ABMukj5lEjmsbmsSqUSa6y3nnAJFM9VPPan5+zcFU
	 2Phk4CAV+TFdoReRSq51oeqBGKo87+B3RtaQmmDHVvxnm1SyboXqAY63Y9W2Wd/TiV
	 8JM4css8n51UrDC/dvTTU/w6T/D25eXV02N9n7fteCu7sy5khdx/o77cwwT9u3d66z
	 lUgUz7t9VHom39NSwVLGzA04gVnAZN55iim1HqFtNxkqttOF+ejWYGvLxuePrW326d
	 8d7pvbaowmnOQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E1E534D75B;
	Thu, 26 Nov 2026 17:00:53 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 17:00:57 +0000
Subject: [PATCH v3 5/5] media: verisilicon: rockchip: Limit the JPEG
 encoder to 8176x8176
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-hantro-jpeg-enc-fixes-v3-5-07357d84a64b@gmail.com>
References: <20261126-hantro-jpeg-enc-fixes-v3-0-07357d84a64b@gmail.com>
In-Reply-To: <20261126-hantro-jpeg-enc-fixes-v3-0-07357d84a64b@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Sergei Khomenkov <shomenkow@gmail.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795712452; l=1336;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=Ov3GnRRy9PGD1C66aiFxQPkVwaFypntQvwUeWFjwO4M=;
 b=4zCWrSusBdi/YNvGLj4TcvK+ryXPUWYhee6coY44Tddp6uv3l9Pn7/UgsfTYaqYX7oIZMcVzY
 uUANa/519+nBeuhjtcGEb6b9NgxTHX5AAYByreDRTCoFaq2NEhPlcOd
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

The VEPU2 and H1 JPEG encoders take the picture size in 9-bit
macroblock counts: 8192 pixels is programmed as 0 on VEPU2 and runs
into the width field on H1. Limit both dimensions to 511 macroblocks.

Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 02673be9878e..d295e9571a8e 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -20,6 +20,9 @@
 
 #define ROCKCHIP_VPU981_MIN_SIZE 64
 
+/* 9-bit macroblock counts */
+#define ROCKCHIP_VPU_JPEG_ENC_MAX_SIZE (511 * MB_DIM)
+
 /*
  * Supported formats.
  */
@@ -52,10 +55,10 @@ static const struct hantro_fmt rockchip_vpu_enc_fmts[] = {
 		.header_size = JPEG_HEADER_SIZE,
 		.frmsize = {
 			.min_width = 96,
-			.max_width = 8192,
+			.max_width = ROCKCHIP_VPU_JPEG_ENC_MAX_SIZE,
 			.step_width = MB_DIM,
 			.min_height = 32,
-			.max_height = 8192,
+			.max_height = ROCKCHIP_VPU_JPEG_ENC_MAX_SIZE,
 			.step_height = MB_DIM,
 		},
 	},

-- 
2.55.0



