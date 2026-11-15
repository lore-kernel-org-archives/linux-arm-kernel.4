Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE979606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 09:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BNoPFzuL;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=khyx1GX1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=w8G8ifHYAKfhALD5ae+dZe67OgXfj22iPEwtf7Dbt0k=; b=BNoPFzuLGwsf03
	cm/94nXkKRfWP3IoQSzJtwwWY7YkJEOrjnuc/s9WqI9XPqe0gcp3i1Uihg/wIM/50vbtf6zv3Lnu0
	2EElJ9eJBPbnmjy+HyqX41dDY4+VV69Zwa9xFj4q0m3jyzBu3gwzO1CIplb9kKoLB6U/4oKIM05fY
	1qjP9csjZYKutwTlIp2eMZW+QDUx5nlQgtKTgSwKQ3ObFRMMsDjfB5YpcxdWciGOVF+Obmmlfad09
	xOvq5YK5s9jNVDaZ3NIkYp3fh6MVY5M0M6J7eHsQJGvn4Wk7z6sYwrlRDjcgT/a6OmvLhe4aIbprV
	Yjb3Xn2RffuEF/pCXduQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWc0-0000000HK2V-0rOP;
	Sun, 15 Nov 2026 09:33:24 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWbs-0000000HJy6-1PZ7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 09:33:18 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-70b875f6f1fso2980226eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 01:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735195; x=1795339995; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w8G8ifHYAKfhALD5ae+dZe67OgXfj22iPEwtf7Dbt0k=;
        b=khyx1GX1+PwIXVGAUYZY13zP72gxn0iHQ7VFUjm6A8WDVq8jLbKN5HNl5pavGkygp6
         Ac8dNtY5ndLYVMbJNsx1kTt0NCYzTULx90VcjTGybFg+XPpL3ZNeE0F7qZLc5jilEGls
         UabmLLeZ4kD5dmm60XJwmPQo7f7Va549qbTiY3+sgiA7CpcpI+AaYvk8shs3gX9vfogs
         qUYPD0OCUxY6Jm9eMao/jaTBvB9wsSvrZp0lqMpJdIQMwMyUBgOxT2Q147JlwjQvzEz6
         ls9ONhxYTEz0+aWf4o2bS+0L/pBDRfOEYDj+cWUSRgeblUd//O9fd6MR+2+4220rHHat
         k+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735195; x=1795339995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8G8ifHYAKfhALD5ae+dZe67OgXfj22iPEwtf7Dbt0k=;
        b=tJq/pPdq5U0sMru10jRl3DqBErKL0QNhaw8gYwJHqYuCL6djgSp3KfBeTqB+B4Os5Z
         QUZJ81oNNtbagbn8mJNB9BU1K0N1vetqoTBM6NsGIvStvuwhGEvJg/UyPhoTrqueuxZI
         4IeWmELXacH0zU6FuRPYurwpB20EVg6qBTeAoj0RzLkKkd16vsjDmC4NXlamc+y3mhTB
         +KR91lryQisALkqQ89mCtYRPsWcO5+5N/mXQpRxY//co/sWTq5ZeLp+7y4/tIYF74Z3/
         pQS0G3XRU5bvgCATcVxCJc5EkdpPHjhVSJBCguwCQDt53rbYpITo+3S+SwXT+2RMUD1f
         wBMA==
X-Forwarded-Encrypted: i=1; AL+hErGqx/AjLNgobjZ3B1FfE25Fxbjh2Euqma7kiyx9iKfiu1caBZv1XoD++tkNh0xHmUM/phjbpRZkBmJ6T0Bn+MpO@lists.infradead.org
X-Gm-Message-State: APuU4Z/ktBcip98QiTTAPMiAoeLatH+Jtyv1PEkpM2KNosm9KVvSm8+K
	A3sIylZYrm5Eo2ditV+bJELz/zNE12ksfg40BRKzIEWXaVtsL2PftKqT
X-Gm-Gg: AYBFou23VB9T8mVxCkjFRa6Wr7IQWkRqc7/0SxW61WuVmGWocy65KSHEuK3jdMUV8VF
	aqbtYaJPrZt7oy6/ENTiklrCZjeGkY/tOaRNwzyvYVz7O0oONFSnZRdowAJ4QOPH4ZdrUx9p5En
	0Kgd7eW/i3LJBW5P+eVeunKTzWok0j38x8vxWAbS/qG4XIud09H5IuVPU1IwitLGWFmQqY5DB6/
	1UPAHQlGDUpK7YwbfrmqzekAdHhS2yTThGOw+HpFGqBr6XqAxh2zT2YXbXc+B6PSGLKD6sGj+AU
	qA5GafdnOYkJoe2qV5HBG3lXPxX+A8PFwdrnTtfTXd+9WD57kLmzxzWoM0NG7KYgYEtjcEagAWf
	PZ2Rd4BlKvlpdTuW9T7ZpSEQM+f9UvB+10yrcgP1DrsBtdiTg4Cpy2R2bLI7fgCEGB3hwREr6su
	XPQ5BZZzARbcuPBjEs1Bi6wqtQxNhzBMVX5hpfWE4so+5zwHjGMTWN/FP0S42v+24Inet/wrQam
	SM4C+UsfVy3Dj/eKFmA61QzD8hOaXfbwn/HsctvElgQKTgcXhHb4MBCadWBYv09LznDAFOQPuSt
	ctkbHM04+trIq9XMNvyP1rvVXDLgOU9iKX/bibL1C8e4NFu6bjst6ZHXL35pIum28xGdj8KKAne
	n2qApEAoqvGT1FWL2pPGNaAoFC/E77vYOC/2j+sWQahxgr+yfMDdaz/s+/ZTIFTVoaW/waKqKAV
	OFcppN+JviMS4yi1rEiZXwJtRedVMm+5pRylsh2gkJlvESuwBoS48=
X-Received: by 2002:a05:6820:4a8e:b0:71a:ecfc:4434 with SMTP id 006d021491bc7-71aecfc5888mr297943eaf.61.1794735195084;
        Sun, 15 Nov 2026 01:33:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:50 -0700
Subject: [PATCH v4 2/9] dmaengine: sun6i: handle the last partial interrupt
 bank
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-2-043cd476a45f@gmail.com>
References: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
In-Reply-To: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-0-043cd476a45f@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Sashiko <sashiko-bot@kernel.org>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_013317_143717_EC22B767 
X-CRM114-Status: GOOD (  14.13  )
X-Spam-Score: -1.9 (-)
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

The number of physical channels need not be a multiple of the number
covered by an interrupt-status register. H3 has twelve channels and
eight channels per bank. Rounding down the number of banks leaves its
channels 8 through 11 without completion handling.

Round up the number of banks to visit, and stop processing the last bank
at num_pchans so unused status bits cannot index past the physical-channel
array. Use the controller's configured bank size for both limits and
the physical-channel index.

Fixes: f008db8c00c1 ("dmaengine: sun6i: Add support for Allwinner H3 (sun8i) variant")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260706065650.34B131F00A3A@smtp.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/sun6i-dma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 885cb237b2b9..9533f3bdb949 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -589,12 +589,13 @@ static void sun6i_dma_tasklet(struct tasklet_struct *t)
 static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 {
 	struct sun6i_dma_dev *sdev = dev_id;
+	u32 channels_per_reg = sdev->cfg->num_channels_per_reg;
 	struct sun6i_vchan *vchan;
 	struct sun6i_pchan *pchan;
 	int i, j, ret = IRQ_NONE;
 	u32 status;
 
-	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
+	for (i = 0; i < DIV_ROUND_UP(sdev->num_pchans, channels_per_reg); i++) {
 		status = sun6i_read_irq_stat(sdev, i);
 		if (!status)
 			continue;
@@ -604,8 +605,9 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 
 		sun6i_write_irq_stat(sdev, i, status);
 
-		for (j = 0; (j < sdev->cfg->num_channels_per_reg) && status; j++) {
-			pchan = sdev->pchans + i * sdev->cfg->num_channels_per_reg + j;
+		for (j = 0; status && j < channels_per_reg &&
+		     i * channels_per_reg + j < sdev->num_pchans; j++) {
+			pchan = sdev->pchans + i * channels_per_reg + j;
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				if (vchan->cyclic) {

-- 
2.53.0


