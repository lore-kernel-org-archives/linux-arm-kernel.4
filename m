Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDB760A2604
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 15:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dQ8IjsVV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r2Qll2Ic
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Vwg0PMEd8sJ4yJtQjtLbWSELD2pw9lJLZFEOJ73Wi1s=; b=dQ8IjsVV77NPka
	bcgzvwK9vCfgnuoFq7ZmN+nhSt5dfPo74+9ysaZy638EsBQuZOi9rManwgo9cO04xQ7nwv1C3fJhA
	DPBN/DGFLnjv6vOKjbdbzZaXwIxUPRbcnw58yICFz6/Yr5i5ZkTL8KhzNQaifySbi1wBZExu1tIXE
	ZBNGgFOp+WH/tmyEjfKjJyXEriidGxk+yJmQaRy265WxRsFimbhMHOoWkVV40nlBUt/nA0NHMvkSF
	p2fNJO0WBkxNbL3ka+b2SWaZxJ+jdmrJ833bXAT6RXCQUaSRFnrXIR0gagw38aZEcY+aCDQMMitGg
	jyxX4ZJp3iGX9/yENFMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTham-00000009IPL-0xRx;
	Wed, 18 Nov 2026 15:29:00 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThaj-00000009IOq-2Jgm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 15:28:58 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso700457a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 07:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795015736; x=1795620536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vwg0PMEd8sJ4yJtQjtLbWSELD2pw9lJLZFEOJ73Wi1s=;
        b=r2Qll2IcAIDQpETpwyiwz91WC5RPlE3JoXtjG2jZVPlTPKcWAI1P87jz8oObrUPXeo
         8zX6qq8wf2TTnRLL+OsHgP9j4xl1z+BCxUYtS2Xt/XJaKgPI/06zCtv42TbB0bJmY693
         /30RoMBY9CySbwBMYSoErW6QAt13VgDaqGSfzLW+pYsCq4Dmfqixl2ZYkRcVBYZTi6uw
         VHA1N/mgafzfWk9enZo2MtLHeoArHOgT9Byav+//KUzRjoboKswZNtlYGdf4wvHAumXO
         oM7Sfs7IPS1EETvp2HlSAUo0pbWFf+e+VCB77cS/TYXiJDuMDUk33pcpKdCgOH+YgaBS
         duaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015736; x=1795620536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vwg0PMEd8sJ4yJtQjtLbWSELD2pw9lJLZFEOJ73Wi1s=;
        b=CrCWJD8FPC0N1EEON67JjZgX9lrdKtpZLuMZqP742VL2NFYKzd+lVYXa0jPInWRk+0
         Utqc4N4WbnzHobUdZKxBi/xCtXD7MZXKVA5RDAyk2zyiG6bmP5CztjsywTmWgQovTr1y
         G0quLvMnRB9Ha+c75p551PfQ6abTo5YjkyqTrM/bs0/IQqKnG2n2558Z+oQxCDgApdbU
         3msmlCdrAVGNiC9in9olqi02hEE1HqSrDjVJ0YSual1qhoDPdEczYADHjFlmVh9ZURkn
         epTHZTITJk4PhsbFS/0Ec8qGZ2i604YAy6onrRStkhJ1S9qeNJmaSe3Y/W3HMBDmdgo+
         VATA==
X-Forwarded-Encrypted: i=1; AL+hErEoSqLcp7geudaoz8tm01x8iRHP6/nhMT7g5gpwhOo/FxfXGYSk6WF7IX3IgQ3cmIWFMDHNLlE/px+dfOyTKXI1@lists.infradead.org
X-Gm-Message-State: APuU4Z8NlTGL96H/6Gp0vpc9Qn52sw+tbOZ1jJFJwLp6Y1K+E/XOA07F
	u/n8VWmNfAHdRrgp8uK3LEUSqzmD9RpY+sIbbkaipRO2KGiJNZl+K7Fc
X-Gm-Gg: AYBFou0cS7J8i2qMZvbALKZWwwU3OVllWxJzL0C/rwRk8CP3xMKZjseqc/BamGGwoZ2
	Fy4Y3MaGvmUApmqRK2BpLcOZVW4PJXWlU9qC7KJZSSK2MLPn38AT+ZwOtqs087aJDUXY+jFZET2
	2xJwPsxBgfIa+bgsqKniF3i9E8Jbbq/QoTJilB4QJJHDqQ68NYPe1umwTcl4Hd0pZ+cHr+CG5Qw
	hV9JVXh8UKzre/S3gzKaHj+LlvlESvfeGCH8TyFjdAC0yo5khiMoGSigDHLy+vuKooEullzcL6a
	Azns0iTVixNOVoL72fW/FCa13z/aviGsnjZncPrS8+cvzvC1By5dhXjidk/3joHhv682u2436up
	nv1zEHivHQtctJxrb9ZlDBk4rXcJBCi769n5ceb6uI202V4tgCie/9+D9wI3me5cns3ZY60j2Bu
	0WwB+VQhZ5Gy2kR/2qg0O/xZP/25GYcAv0gKGaXVjXfSarNx6UgSgKjltynkpWsyqismhlUjdd+
	8+MtMqvzGy2oioHSO4li6dvz/nf1xVbD5rhXoCC3gB29fmZSS3RfhA1ZHYEhcV91bczc48JDX7f
	y4tfnX77oCdAMXPTooCk6eugBaTv5hOHQSxJJL1IapKyKrA+
X-Received: by 2002:a05:6a21:a10c:b0:3eb:b9e1:4341 with SMTP id adf61e73a8af0-3fe98af4d5amr2641588637.67.1795015736458;
        Wed, 18 Nov 2026 07:28:56 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca7aa2b3sm1419153b3a.9.2026.11.18.07.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:28:56 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2] dmaengine: stm32-dmamux: don't call runtime PM under a spinlock
Date: Thu, 19 Nov 2026 00:28:43 +0900
Message-ID: <20261118152843.1126665-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <90b4417d-f2fe-498a-8128-3229eb284d8c@foss.st.com>
References: <90b4417d-f2fe-498a-8128-3229eb284d8c@foss.st.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_072857_600557_FC9B8DBB 
X-CRM114-Status: GOOD (  14.87  )
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

stm32_dmamux_route_allocate() calls pm_runtime_resume_and_get() while
holding dmamux->lock with interrupts disabled, and stm32_dmamux_free()
calls pm_runtime_put_sync() in the same way.  The runtime callbacks
enable and disable the clock with clk_prepare_enable() /
clk_disable_unprepare(), which can sleep, and the device is not marked
pm_runtime_irq_safe(), so both sleep in atomic context.

The lock was in the wrong place: it did not protect the runtime PM call,
while the CCR write in stm32_dmamux_route_allocate() was left unlocked
even though stm32_dmamux_free() writes the same register under the lock.
Move the runtime PM calls outside the lock in both functions and take
the lock for the CCR write instead, matching stm32_dmamux_free().

Fixes: 4f3ceca254e0 ("dmaengine: stm32-dmamux: Add PM Runtime support")
Cc: stable@vger.kernel.org
Suggested-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
v2: Amelie Delaunay pointed out that v1 was correct but incomplete:
    - also take dmamux->lock for the CCR write in
      stm32_dmamux_route_allocate(), which stm32_dmamux_free() already
      does for the same register;
    - also move pm_runtime_put_sync() out of the lock in
      stm32_dmamux_free(), which has the same sleep-in-atomic problem.
    Link to v1: https://lore.kernel.org/all/20261118082853.926607-1-hj351016@gmail.com/

 drivers/dma/stm32/stm32-dmamux.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/stm32/stm32-dmamux.c b/drivers/dma/stm32/stm32-dmamux.c
index 5731871..8290122 100644
--- a/drivers/dma/stm32/stm32-dmamux.c
+++ b/drivers/dma/stm32/stm32-dmamux.c
@@ -73,10 +73,10 @@ static void stm32_dmamux_free(struct device *dev, void *route_data)
 	stm32_dmamux_write(dmamux->iomem, STM32_DMAMUX_CCR(mux->chan_id), 0);
 	clear_bit(mux->chan_id, dmamux->dma_inuse);
 
-	pm_runtime_put_sync(dev);
-
 	spin_unlock_irqrestore(&dmamux->lock, flags);
 
+	pm_runtime_put_sync(dev);
+
 	dev_dbg(dev, "Unmapping DMAMUX(%u) to DMA%u(%u)\n",
 		mux->request, mux->master, mux->chan_id);
 
@@ -139,13 +139,9 @@ static void *stm32_dmamux_route_allocate(struct of_phandle_args *dma_spec,
 	}
 
 	/* Set dma request */
-	spin_lock_irqsave(&dmamux->lock, flags);
 	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret < 0) {
-		spin_unlock_irqrestore(&dmamux->lock, flags);
+	if (ret < 0)
 		goto err_put_dma_spec_np;
-	}
-	spin_unlock_irqrestore(&dmamux->lock, flags);
 
 	mux->request = dma_spec->args[0];
 
@@ -156,8 +152,11 @@ static void *stm32_dmamux_route_allocate(struct of_phandle_args *dma_spec,
 	dma_spec->args[0] = mux->chan_id - min;
 	dma_spec->args_count = 4;
 
+	spin_lock_irqsave(&dmamux->lock, flags);
 	stm32_dmamux_write(dmamux->iomem, STM32_DMAMUX_CCR(mux->chan_id),
 			   mux->request);
+	spin_unlock_irqrestore(&dmamux->lock, flags);
+
 	dev_dbg(&pdev->dev, "Mapping DMAMUX(%u) to DMA%u(%u)\n",
 		mux->request, mux->master, mux->chan_id);
 
-- 
2.43.0


