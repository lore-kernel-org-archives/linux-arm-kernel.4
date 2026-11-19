Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EE660A263D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 18:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=we8EkXOK;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E+vQKyOO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=I06+c10KQYGyPd16B/H1g1q5/WZ+PHIJV96gXM/5eoY=; b=we8EkXOKo9/geG
	B+Oy/Hb2T0wNUTJjKgaY/I7i1fnZXVV96x2RF499XYNfSDM6yfwyRXwF+rtXztMlOK0/LNz/gzIrQ
	RK4/ihCIlanxcNbY9fcRlMifyIYlZLvb1jLZCAx4FlMMkmjIZ1Vuay1ZAEWXsDFbNym7bM8UYpP7T
	3Ygpk5pS5A3Bd/Govqs5SqAk46B+8Xt5couOvRz0SyPRwcUof45KpgRB/sv6PTHOLp+McJOHEqzot
	POPUAqCCh9O15+DfwUs3Pk/E0ih0LngRk3E8eEp4dJ2M9Tj6OBMZaKcuWJaZFuMw+MCkOE7x3Qn0O
	rEJjxAJnJo1pKELTc+kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6TW-0000000Cw2i-43n6;
	Thu, 19 Nov 2026 18:03:10 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU6TU-0000000Cw1R-3Vo4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 18:03:09 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-71ab5e64742so1601539eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 10:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111388; x=1795716188; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I06+c10KQYGyPd16B/H1g1q5/WZ+PHIJV96gXM/5eoY=;
        b=E+vQKyOOOGdziq+gEVZUdWtoLt3Pya5rDykc0gLPNMDM/2Mic6Pqkm2YtUm1xXr3et
         Qv6yTLRhFvPui5VGBHIGGV2+yFMLt2sADfwPmjwSAmZ6lfOWasAXzxJNhhyB8y28RRWd
         FPoBA4VAypyG3LoKg9UJ6OVXNeSkZvmyQR2AOVpNatZDSmDJp2/HLROB1xmdN/IkFXyq
         K4IbM+wftBO2AkQgA0Bu3a4PgNSch90giXioXIqqTtX/APQIH2JM3DUv6F4LlMfkQ/Tv
         LMY4Rlw82DvWKWZhO0zq0efxS26GOpDbM7lxUWEwhQfgRqGGFGcUAdOv/X3A6SVcDL3A
         LmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111388; x=1795716188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I06+c10KQYGyPd16B/H1g1q5/WZ+PHIJV96gXM/5eoY=;
        b=O8OUFOnWNQSALUjDqB+T7dTMJr20NxtZ6QkdSE+K2ThS+orHh4WSIufiCaGrObr7ay
         uu9UL463yvqXRL+3UiRyHtVdSREU+8m33HxI3EXo/dSC7sAa46m9ADLCaKUg8cAoSuZS
         CKeJVviJ7EmvMCa0Kwbji4rqXyEp0f+3yb7StqfmMr46ysMS+RL6CHs03lWe0r2h8Wym
         ZdFpVAEhhvdtgh8FWaXQoYQUWPx04Qa68QlmrXFYBObe5H2HiaKEgGEzsLjwr1rMTd+E
         pZJp9W6fdXZkhZQJusV8WHyez1cpgIWeNXHTeJAlL2VOTcchWa6X0TwLuxj1DFYcabdv
         zvgg==
X-Forwarded-Encrypted: i=1; AL+hErFrd4x+XAkxWXuW43HAG1dqdwpLow+Cs5oZ3+WFIqubuv2+C1jlay63z3U0w97sQjXUhklrEH5kZqGTTUanKivw@lists.infradead.org
X-Gm-Message-State: APuU4Z/Rhb5l1ds2o2OEit/g5pIDEWQF56+38NuZ5QOeZrePKOB7P0I6
	FbJ1p2LjgZ/hdFCBbueKZncUryjgGtZsokFONBOmCR8XbayqvqBom3qYz0TnPt7o
X-Gm-Gg: AYBFou0rvYcAANHdIjQox7kNL/9RH5WCRqw8FLIUnmvqXiB/RzOBxst13LUO4Nuof+M
	QnFawhATARCdrqv5SUWjF17mzKg8E2mdx9xvq8aIpv9bo3ZnWccpcbCdLjK8TgfwepeqeAmT9VN
	IkwXz80OcxArTvfVZHBDFkO8mCawkMZ5M5uHw951iaBzZEAQEWHfioM1yVzuJApSowl7IxJ8uy7
	404pCjdX+v7GZ2xTI8nZJuCqMQZx3IOtsZPAdqRkS6yDJjvGUPoNRYTloVgyHVyR3pvbqTDAxzz
	mTS1qRRB5o3XW8d7c8uAXpPOl4Hu/I2M5lJy/Y8RH8x2aPbA/7+C36JaPkBnas3yhZz/o/YrbbR
	Cn+gQGiOQaLcqJUn+1lTX/yMk2W/8vNswF/wxF6vyARE9fXsai87Lm3mOKN5SYwAzOT63RHyU6k
	3vWgVJROfLemdWXRvVl4Tmmb1d0UUInZ/Fj0BXrkpQuM+r0ky9zEYqpk7mTYmXRGCkgLZGUew57
	NzV3VhQj4j4eWbdjMVPvNqb/qCFAAWLNcWvHkRKlJ0lyV93A33IzebpEo1hqDyTKDoWtVlh7wK1
	zTx5xTYL3WItQUg3AqvAOhsQHjAKIZ0BfZdVlRPFvkcrZfNVK2DNNrc6RpuerQgyvpBrWa9XEmq
	C3PWUtvolZACcIvlodOnXVRtRZPkVh78aSqd8Px9gJ0n9qH6kLSQj9ZZSybdr86Spi0icvHTpRU
	wa4YkQVz2+cIWT4f79tq9st3GoTgC4f9pLTs6UbPZwLD3oCPmzdpvh
X-Received: by 2002:a05:6820:340a:10b0:716:db9f:682c with SMTP id 006d021491bc7-71b3960e47cmr234297eaf.69.1795111387559;
        Thu, 19 Nov 2026 10:03:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b3806ef20sm448478eaf.7.2026.11.19.10.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:03:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 11:02:21 -0700
Subject: [PATCH v3 1/3] dmaengine: virt-dma: share deferred descriptor
 retirement
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-1-3935aef58db9@gmail.com>
References: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-0-3935aef58db9@gmail.com>
In-Reply-To: <20261119-submit-sun4i-dma-callback-lifetime-v1-v3-0-3935aef58db9@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_100308_887906_496EA33E 
X-CRM114-Status: GOOD (  13.98  )
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

A cyclic callback can retain its descriptor after the tasklet drops the
virtual-channel lock. Collecting and freeing descriptors during atomic
termination does not wait for that callback, and clearing vc->cyclic alone
only cancels a callback which has not started.

Provide vchan_terminate_all() to clear the pending cyclic callback and
move submitted, issued and completed descriptors to desc_terminated. A
cyclic descriptor moved to the completed list by an error path is still
retained; completed descriptors already detached by the tasklet remain
its responsibility.

Leave prepared descriptors on desc_allocated: the client still owns them
and may submit them after terminating earlier work. Freeing channel
resources, unlike termination, still releases these descriptors.

vchan_synchronize() drains callbacks before freeing or recycling retired
descriptors. Repeated termination leaves them on the terminated list.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/virt-dma.h | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/virt-dma.h b/drivers/dma/virt-dma.h
index abf2ae737c30..f753c6b62d6b 100644
--- a/drivers/dma/virt-dma.h
+++ b/drivers/dma/virt-dma.h
@@ -199,6 +199,25 @@ static inline void vchan_get_all_descriptors(struct virt_dma_chan *vc,
 	list_splice_tail_init(&vc->desc_terminated, head);
 }
 
+/**
+ * vchan_terminate_all - retire descriptors until callbacks have drained
+ * @vc: virtual channel to terminate
+ *
+ * The caller must hold vc.lock and prevent further callback publication.
+ * Submitted, issued and completed descriptors stay on desc_terminated until
+ * vchan_synchronize() drains callbacks. Prepared descriptors remain available
+ * for submission. The completion tasklet owns descriptors it already detached.
+ */
+static inline void vchan_terminate_all(struct virt_dma_chan *vc)
+{
+	lockdep_assert_held(&vc->lock);
+
+	vc->cyclic = NULL;
+	list_splice_tail_init(&vc->desc_submitted, &vc->desc_terminated);
+	list_splice_tail_init(&vc->desc_issued, &vc->desc_terminated);
+	list_splice_tail_init(&vc->desc_completed, &vc->desc_terminated);
+}
+
 static inline void vchan_free_chan_resources(struct virt_dma_chan *vc)
 {
 	struct virt_dma_desc *vd;
@@ -232,7 +251,7 @@ static inline const char *vchan_chan_name(struct virt_dma_chan *vc)
  * Makes sure that all scheduled or active callbacks have finished running. For
  * proper operation the caller has to ensure that no new callbacks are scheduled
  * after the invocation of this function started.
- * Free up the terminated cyclic descriptor to prevent memory leakage.
+ * Free or recycle terminated descriptors after their callbacks have drained.
  */
 static inline void vchan_synchronize(struct virt_dma_chan *vc)
 {

-- 
2.53.0


