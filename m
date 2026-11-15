Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD0A606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 09:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t9WpxTaY;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jgi90Lvn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WVskqBN7adAe0blUmUVhbRXdugopDwsXLNQtgww94JA=; b=t9WpxTaYaHOgzi
	XBIWNhAQFxa1wgA7Hx9jJWlY4AEuYcouZglE4ug2UWybAjJtpyuNUfrnJnrtNKghsumjw45hR0QVW
	CJvgW4UAEUMRlhUp7PiwLkqdyxTjLItjXQVHiTsRTcXTm6ILWm5cJARQ/J541RGAl7lZggMarCfbx
	Kohs0C0UkdfUazB4oMu94UvFbGTCq9aS7AzoZLSqU0UMTOG2FDugOJ9pGmzDsoAKn0lt8iZAQYhob
	mSPD/o234hFui33Ld0yxMBU951AyH3XvyUTepbXDOi3AFXxfYUaca1mnbQEhwYbhfurZIo60co+Lh
	KDkoRufe5PLz6K4PIvag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWCN-0000000HIK0-0EOj;
	Sun, 15 Nov 2026 09:06:55 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSWCK-0000000HIIg-360I
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 09:06:53 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-71af0656bedso15923eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Nov 2026 01:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733611; x=1795338411; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVskqBN7adAe0blUmUVhbRXdugopDwsXLNQtgww94JA=;
        b=jgi90Lvnj6vSIFbM0raMCx1Ftyk/rAlpFyvJOWsO7UIkFT4YMGAucXb4JAQ+KV/iSB
         lOZ58xPCb3oaVS3EDX0u6HTjTGjq6OC12XeL9Y1Q/N137yiGYvmaPWRCFaTXc2nHAJMh
         1Sj7eD2dqZ5J/4VfMgrs1Y1w2ENaaqFbL18XJl2GvMXXBweUH+14gNctoKC6LRkWlpAp
         Om8Mj7IJhdy7sRMzvVBzRDLtKSMUQUpVkk0P3MBFzeyYEmKxz504Zg+iFdCiNuPSbBf0
         HtSiygNVGZsqyd7k1Ar1yGOL38DKh/cS521pPO9w/D3j/RQRXaSVToo6r+i3Y4yOVsDX
         b7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733611; x=1795338411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVskqBN7adAe0blUmUVhbRXdugopDwsXLNQtgww94JA=;
        b=d0NoABcaYhr38zf7t62b4oBhLHJRB9UcuCipeoWfXShKbpDK4EdpOVFaSZlFMGtQl6
         qBkwBzQzvihZoXGJbKUKU+Uqkwy4G64PPN8yq6sav/LrTR83rEs+qBG9k6l7U6b3BRWF
         DoSfys+2yjNZSYw4u5sOrI0dX7ly6nPMuk8fWFncKSi+QTs1YkK3XdrmfxPiu16frbwA
         KUFROqRbib5XsU52Lcr9IoRiPhNGuBQP/r6pQJoP0q9mlOKwI+L0tv6NXGKEnFEE5zlp
         MJVsCs0c+njm+3ORBhjvDOMwFehi0PQfKjrqQ0P4TV+o2iJioGRx18Be1Q1SbmnwGMuF
         rIAQ==
X-Forwarded-Encrypted: i=1; AL+hErEDxloFCaagDq2q3inf68J5187T/89gow9CFDk5LZ9maCC3m3ao9sbae+dirI3APBXOAgzhALqPWdy1iv/gc8DA@lists.infradead.org
X-Gm-Message-State: APuU4Z9jOxW2iprE7pJamtiXGaRaMVrCGsSTXvH1SHCZqjIEyWRgzrg0
	HzJR0gLXOTsyC4nxZcxMZTCss5sAdSUkDWjg1xAktIt6ri2YO6D/4OsOt48y0w==
X-Gm-Gg: AYBFou20R2B1dgXlBpxi2pnkT7tFDCJs/cUek5r0md0k+r/RpqByJi1QboCRar5/aNP
	VgzFsJHo6PkwI4GdYH8HxiNL07Lw3Jpz5d//C18R5Uqt7lPKCE6H/Re/hLS4MfsoF8+qvOFy60I
	G8sYiaGVQj6ezzNm5jwVzUW/V/hmJqYLJdL34SGrNhDZkgVFgD6y4etmcBT7DfzR25YhavMfnW+
	Me26Riq0fx9/xjlKim2aVa0G22UTsKY0GubN1w795aoYSoVr+OoJ5ueSxubPfYFb5TXLox/wyYt
	Iu/jGkZ841tZMccLA4DLbfsUByq2iO5LQEn/jvm//dp0k9kvfwwp10DML2Xv8PZcQbmC80RiUbt
	EWs+fR89ckg/pYrVczDH4zNeR9r5S2m2IhIzdVR2sWLZq8BgpQAQrFWWdHXsiXXgGzQoFRd4Fkk
	cGHHMCAibmSBPuiwKVIMr9LWP+qZontu+URswjbE4dn/VpatB/Vm77i1s4GOu2tIsB3y8xPFFz2
	ZiBtAp30MDfX0qulBWAQyc8SWZgCNS0KI24hTb411h+vj+jDG2+7pcRjWBvoGjLdybOlV0AqFFG
	4yGfT7DBEClNnYWHU0/s78yLnnazwrisSmQJFpY8GhPw/uQHBAxc0jry5RLytFlGS6uW/BGhZw4
	4B5EPlAT5bEMjZUMgGfcuHfXqKLC+5UvucFlKWyO1HhgNL/YF83q//RyawUxSIpLO0iNluPTgqR
	ToRVo8YZ2mxihU3A8tB2nDnm1rNhjYegj61koVA7NvVS59Nf+UopFi
X-Received: by 2002:a05:6820:418b:b0:716:c34d:c2aa with SMTP id 006d021491bc7-71ab509ed1amr5396398eaf.37.1794733611590;
        Sun, 15 Nov 2026 01:06:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab4338765sm6198902eaf.14.2026.11.15.01.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:06:51 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 02:06:34 -0700
Subject: [PATCH v2 1/3] dmaengine: virt-dma: share deferred descriptor
 retirement
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-1-fb7d258702f8@gmail.com>
References: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com>
In-Reply-To: <20261115-submit-sun4i-dma-callback-lifetime-v1-v2-0-fb7d258702f8@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_010652_785299_2A13F5CA 
X-CRM114-Status: GOOD (  13.42  )
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
move all channel-owned descriptors to desc_terminated. This also retains
a cyclic descriptor moved to the completed list by an error path, without
requiring provider-specific descriptor-type checks. Already detached
completed descriptors remain owned by the tasklet.

vchan_synchronize() drains callbacks before freeing or recycling the
retired descriptors. Repeated termination leaves them on the terminated
list until that synchronization occurs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/virt-dma.h | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/virt-dma.h b/drivers/dma/virt-dma.h
index abf2ae737c30..d3057fc85a9b 100644
--- a/drivers/dma/virt-dma.h
+++ b/drivers/dma/virt-dma.h
@@ -199,6 +199,24 @@ static inline void vchan_get_all_descriptors(struct virt_dma_chan *vc,
 	list_splice_tail_init(&vc->desc_terminated, head);
 }
 
+/**
+ * vchan_terminate_all - retire descriptors until callbacks have drained
+ * @vc: virtual channel to terminate
+ *
+ * The caller must hold vc.lock and prevent further callback publication.
+ * Descriptors detached by the completion tasklet remain owned by that tasklet.
+ * All other descriptors are retained until vchan_synchronize(), including any
+ * descriptor still referenced by an executing cyclic callback.
+ */
+static inline void vchan_terminate_all(struct virt_dma_chan *vc)
+{
+	LIST_HEAD(head);
+
+	vchan_get_all_descriptors(vc, &head);
+	vc->cyclic = NULL;
+	list_splice_tail_init(&head, &vc->desc_terminated);
+}
+
 static inline void vchan_free_chan_resources(struct virt_dma_chan *vc)
 {
 	struct virt_dma_desc *vd;
@@ -232,7 +250,7 @@ static inline const char *vchan_chan_name(struct virt_dma_chan *vc)
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


