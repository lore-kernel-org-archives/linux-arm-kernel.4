Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23227606A338
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 09:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZB0+71wv;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ULuty+q3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ULmfgjA8hHN0IGqRl2n23MUGsl2Syf0XQisPuEg7n6M=; b=ZB0+71wvOBLJF9
	QgYKGgrDa5s5IHLmR9WQvBU8acudEt+AINlhtpx793SHvc7NEnjyg7v6LaKVwGiI4g/IQboHXwME/
	bMV75TsigPfaXiIO/3fma0wN5cUOE49lYbDBndMSm1KPpbXnF7vQq+3L8vuJ55BltX7I3ispm95Q/
	WpnfFUjSE0WYVgsmcaUAnzS28mNyVB3HmUMt0wzbH3NYOSeBYQetYFCafavyNt6s36X7GfWraWe6k
	TQ5+VxDapouRuz5Jo7GRQikTOQO1mDs85IIgXIFBJOoC5X/vwaC32fCLdmBo/h3w6bqVNiKR1wYei
	1iDqxKfvVi8zu9vGDsoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWc0-0000000HK2p-1MGa;
	Sun, 15 Nov 2026 09:33:24 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWbt-0000000HJyH-3Wps
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 09:33:19 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6b1afdf5196so872165eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 01:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794735196; x=1795339996; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ULmfgjA8hHN0IGqRl2n23MUGsl2Syf0XQisPuEg7n6M=;
        b=ULuty+q3Q7kofrykbo/H6P3l8k4tfpC24dnhgXzIlBHdbSIbrqOzRQJfUuyFHZNcW0
         x6I8vVba2lu4tHNCvLxNB/bQQ3GQlP0ZkBrdQjvLi34VZGUxaEIBDnSsdVt/EXckvRNA
         xOczpPVXfWuxivoujMTjGsnPEZi96bfsOTQ9YHz354vawxwkiAMN8qNsqRpxia+wxUSP
         P2YJacMP47RG+tgYRvSbuDh/W86lV2uVwJqePR8r8CIUZbBVKXz1SU/HyYhpFS2rnflH
         qplwG+QaMk/sNZE5UgdFj7PVNFs4c2rP6OHPB5x0mMkGvbvNWu96QLox4V2zbi5sMU4E
         TmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794735196; x=1795339996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULmfgjA8hHN0IGqRl2n23MUGsl2Syf0XQisPuEg7n6M=;
        b=edhtCLYzZQL6i11fJCj5NGwpYReRBpa3JGBRGQGi7m2vua0MkU0xFbYEHDjIa25nAw
         F5h6NY92U7i5iF0LARh5c644tc/EP9im+h1j1iint3cJ4V4nGiBeTmgwlioEdeznQP92
         cA44Qbxg2zfjyCy6nqumLsMnd4w4ZNowmqVE+1hI2TNilgEk2bJCG68oL5J0TO/c4y+x
         EXv8DOmrBHK5TjqL5mbFEMYDsMtSVbjJT8BxKETAxfBwLy8suwuqMyzYYt7RMMV/U7L7
         Xyp18kaV8bgimfNBEagtqB8F7lXd7a3F5Cf1hwNufJU/H1j8CWBgS4XZBPx73SnhePM1
         okeQ==
X-Forwarded-Encrypted: i=1; AL+hErH1ei1wHVSB/CjtQOIHA8740yholVQmFLQTv5L9ei3PkaFjJcUEg3/gh3KMC/dg5/srz06IW6faBau2fcYiL/EH@lists.infradead.org
X-Gm-Message-State: APuU4Z/jBhp+hKwzRnXNSJSG9YQyUiqYdjxJWiHSZ1/XYEibwqFuunas
	EZbgfpL6f9KOjMoRY8zNR8Nlfybru37dVybE7CFrdXQb3R9XPCxCKjcz
X-Gm-Gg: AYBFou1ReBAShmrDUnoRqyuyGKHhAr9CkHvxnA3qOvHeFWBAcMNpHdrAGOKTe7hMhuL
	cS0L6VR1mA8jHy+WoqblMeiRdRdE36G796TddaSOnm30J85jjhDKDglgVTiwQqy2+VDfyy/6M4+
	Y0elToPp9EfY1dMooeQ92L0twI0tE0T/plD4svcW52MLkESKs27pTThaWHRQ//E4+B97vjP8Che
	LBnqDvJ3XMFLBLxsI/U45n3qIcY1hSIMzENu4xqEgueS6ZGXC7H9ma3zVgsIn42zU2MQO5vvAQx
	kuCbDt3TvXsD+SebjHL8qpuHHo/SXTuF1QBUdKrZmjOiBIrCeMk4QREy0sEm0zQKseOtsvk3IFu
	wyEVr1NuOn+yCPOEefHS5j8ziMg1Q3qFcN8gmKwCKkRAvsyxf1pnoYDF0UQOYq4ognRWw7hcpAy
	W2axldeyInfenGbVcsOYG/RAbgy3Ry2vSFqiisP32O/wrZdwwfrtz9oc+uZ0O6tHSqdfc+VRzkY
	YRcl5tUtTO07TGL/nZNmY1KbaVR20KdzC4KPCfnvbqqAAALiEZs1ss1CxLaf4vR0VnVSKCfxgpp
	A8jRfnRzRrMmDw9uUFG2A9sqJ6gDa71E9xFewI+8HjcHYdAEKXfGys0uTe4XWgdedYcqJq4g0sX
	jD7MrDqlJGw7oREW4h0YkAqRGFGQYEjMo1gCshylybbhefhlb9xpdqIKyXpQriiETyrWyICVUGm
	I+q1LBoXB5d0QuCVcBEtReRT0aM7xnQ0d+H4JQnOE1pfbNAEuAWus=
X-Received: by 2002:a05:6820:5201:b0:71a:ed36:e3e2 with SMTP id 006d021491bc7-71aed36e554mr241349eaf.27.1794735196516;
        Sun, 15 Nov 2026 01:33:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab43347b9sm5933617eaf.12.2026.11.15.01.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:33:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:32:51 -0700
Subject: [PATCH v4 3/9] dmaengine: sun6i: take the device lock before the
 virtual channel lock
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-sun6i-dma-lifetime-next-v1-v4-3-043cd476a45f@gmail.com>
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
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_013317_892172_811A4580 
X-CRM114-Status: GOOD (  12.93  )
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

The pending queue is protected by sdev->lock, while virt-dma uses vc.lock
for descriptor lists and cookies. issue_pending() and resume() currently
take the device lock inside the virtual-channel lock when queueing work.

Take sdev->lock first in both paths, and inspect the physical-channel
assignment after acquiring the locks. This establishes the nesting order
needed to keep allocation and descriptor startup in one critical section.
virt-dma preparation, submission and callback processing continue to use
vc.lock independently.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/sun6i-dma.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 9533f3bdb949..0b8e5deb2252 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -954,23 +954,24 @@ static int sun6i_dma_resume(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	unsigned long flags;
 
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: resume\n", &vchan->vc);
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
+	pchan = vchan->phy;
 
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_RESUME,
 		       pchan->base + DMA_CHAN_PAUSE);
 	} else if (!list_empty(&vchan->vc.desc_issued)) {
-		spin_lock(&sdev->lock);
 		list_add_tail(&vchan->node, &sdev->pending);
-		spin_unlock(&sdev->lock);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return 0;
 }
@@ -1058,25 +1059,23 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	unsigned long flags;
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		spin_lock(&sdev->lock);
-
 		if (!vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",
 				&vchan->vc);
 		}
-
-		spin_unlock(&sdev->lock);
 	} else {
 		dev_dbg(dmaengine_chan_dev(chan), "vchan %p: nothing to issue\n",
 			&vchan->vc);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 }
 
 static void sun6i_dma_free_chan_resources(struct dma_chan *chan)

-- 
2.53.0


