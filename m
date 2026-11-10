Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0514606A339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WttaGCme;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HYyW2V2S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=33/y7FEbAJRMpWgPc6HOmiquLc0W6X+Eem8um5Z3JJ4=; b=WttaGCmeFkecJC
	TTCw0BpRCMTE00EI/kd3gVwpmh5eQZ8mx/xYiJQMDEjasWP60hvbfNVzY0zbEQuDZXQyKRzcqVVRe
	O3cOZLftIcqgkRGfTBMJZXPE9/HMLgIHVoXtHFp7wPveJ9ESf9dFw7G+52Y3q08ToknkFBY/5/bAT
	AklfgrKKXFqQqlnAkYV1jlnTjw1w1rR1Q1SuRoJBS+VCyaZCJkz+KWplt+xKT+b2nG83v4B26MapX
	M6kSFq9yb7FStMymgy98jqNe/ovRXmuXSnC0O14p4OzlKYElb3xX2XfZ7yn5SKABotM4wsWCwa0XZ
	542ibBDp8XEbbkJFOKEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdw2-00000002QpJ-2re6;
	Tue, 10 Nov 2026 04:58:18 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdvz-00000002QnX-3PBy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:58:16 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-93f269e335eso184831185a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 20:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794286695; x=1794891495; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=33/y7FEbAJRMpWgPc6HOmiquLc0W6X+Eem8um5Z3JJ4=;
        b=HYyW2V2SOCe+x+N67kwn6zCeX5oKyInSOOuY9i8mxQKAxvb3sTRli+Y1+tNx+zZFnx
         G35ufcX339O98VgenYT0lTnLL1tBxdAvSlpENx0X99SUE9IHlwa4ND8L16Flr6BStVJZ
         nTFlDD8wiSEcqVBqkd0fSfWEU8QrE9taZxwhMZq6xM/UMAsiwCPZ4SdVyvmbfKYLPgZq
         rEkavNPH38rGcfbgR+lEXp1H2WC4/ViGXmCz5SyL/G/vB/nmdnoPDDjPBL/FhLQTgQgX
         hH4JVTnGV2ovc20/MWxGw9gyKtUUfd2eEM2cv9kr4rA7jeTfoys0q5vYOcicLmQUqGc0
         R1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286695; x=1794891495;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=33/y7FEbAJRMpWgPc6HOmiquLc0W6X+Eem8um5Z3JJ4=;
        b=vSAWLvnAMVYpDfAjhwWCFQ6stNXOhYdTublT9CA04mrr2lUBR6swIhMf4xo8ru0NMG
         BiEMMzuasijQGHhHnWyCYvqS3NF2niFTW4YUWPMH9Wfpr71PFHINPxD2+j8IQQhwEB+f
         qZzARer3HHXteCR3HitQkojIv6TscIxO+Lkprumaz1k/5KkBEKq5sS9k8qEaY3Dmypx2
         58+M7RwEV7WTwynKoUP3vjNYqFrJ0uPT0KjIoKB94Bf+4JYvLBJiZOMzLOdr2EgUEM+r
         sf+9rPmryh94FaPiIyFWrsD2oQXFtm3Wk2VCTG33s6mUZXl76b6vobFAjAGFNQTKeWgC
         RgvQ==
X-Forwarded-Encrypted: i=1; AL+hErGl/pY9FbMBwNC4nxwdMbBljiB2hetHrBAnaIdNVEjSGLWkjYgtWAsAnSh0q4JNnpDEtL1jqy0n7Vo440wi89D8@lists.infradead.org
X-Gm-Message-State: APuU4Z+UF5bedAeAfMFBnZBrQa9DukrMsdXyG6dMusMjSpu7j6gsTlJe
	kbaEN1TQUQk0NRoqKQEJ2802eX9LOFnaBw/GgAYuPEFAmZtgh4juFmo=
X-Gm-Gg: AYBFou3uz/D3Z9xatoadwFt9zIrGFMqc4+Z0KPDt/RnEKS/5LIOiSeRQyseuXBD3Ytv
	bT7vBWcrbaIfi2oGHlNHbFZZ3GAnOGNMiNEfnimb9ltYEI0KoKi33/ZTsXfifMH4mmoinfGbB/7
	M/kyqjk2q6gS8NTOxldoMdHeu+c7XwVjzTsA5Ebox63uaweJ4FGQE77DEzSOvEL0kYqhNCDS1I1
	9M6x4PdYl31NSt7uAb48StqW4HmiwYLVtX+uRVbgE74xFaMYVzK5BtaiuLTPhfd8IL5eb5fukLr
	JoCEpByOongnfo9wTWuSxGQlFWLbqopB6b1nVANYD2yb07jmZl3pObydhBStLfZM6gNAzrnebau
	Y5LtikQ0z6gBS7PnZAqxKlL24QLL2JF6OMe0CuY5cnLonxHy0e3aJyKwQvjX8o5BoZrhPqghj5f
	bpwWzr9O1XbVnxLygKpXfpqCUL74ptp9KHyFDNjtSittJeSEoTgubswlt4GPNXGstnME3CqDMQJ
	CHKQe+TZHmTb6urs7QrVAHwGKvAIghzCvHPxw4GkSR6ak4spaoTsmQwNkEg/Ft6NS7CTrxQEyxj
	8QTKvdn/QCDir7hYLcIXZ/tS0YoIUtnZZZzYOG9Y48NG989kdwO90hWZt+EjMKzh4fQ73YpDvy4
	ysYAh9nknMd+ZgsM+S/ophANHXWLyUIMdSWQxGZfAwfnLwLdcJNl8LjDI3DyUajL1S5z32Q6VtY
	aGQ+E9Xgf2+w==
X-Received: by 2002:a05:620a:2614:b0:947:8018:978e with SMTP id af79cd13be357-9479f22d879mr260742685a.6.1794286694660;
        Mon, 09 Nov 2026 20:58:14 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04f89c1sm12462836d6.23.2026.11.09.20.58.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 20:58:13 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Jammy Huang <jammy_huang@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2 2/2] media: aspeed: drain IRQ work before stopping the engine
Date: Mon,  9 Nov 2026 23:58:09 -0500
Message-ID: <20261109235731-aspeed-v2-2-mhun512@gmail.com>
In-Reply-To: <20261109235731-aspeed-v2-0-mhun512@gmail.com>
References: <20261109235731-aspeed-v2-0-mhun512@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_205815_858437_FC27C509 
X-CRM114-Status: GOOD (  14.19  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Last close cancels resolution work while its IRQ producer is still live.
A handler can queue work after cancellation and buffer cleanup. The worker
can then turn clocks back on after stop has cleared VIDEO_STOPPED.

Release the VB2 queue before shutting down the engine, since streamoff
can need capture and mode-detect interrupts. Disable and join the IRQ,
drain work, stop the engine and free its buffers before re-enabling the
IRQ. Check VIDEO_STOPPED before enabling clocks in the worker.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware testing.

Changes in v2:
- Split normal last-close ordering into a separate patch.
- Balance IRQ disable/enable within stop; add no reopen state.

 drivers/media/platform/aspeed/aspeed-video.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -1423,6 +1423,7 @@
 static void aspeed_video_stop(struct aspeed_video *video)
 {
 	set_bit(VIDEO_STOPPED, &video->flags);
+	disable_irq(video->irq);
 	cancel_delayed_work_sync(&video->res_work);
 
 	aspeed_video_off(video);
@@ -1438,6 +1439,7 @@
 
 	video->v4l2_input_status = V4L2_IN_ST_NO_SIGNAL;
 	video->flags = 0;
+	enable_irq(video->irq);
 }
 
 static int aspeed_video_querycap(struct file *file, void *fh,
@@ -1847,11 +1849,11 @@
 	struct aspeed_video *video = container_of(dwork, struct aspeed_video,
 						  res_work);
 
-	aspeed_video_on(video);
-
 	/* Exit early in case no clients remain */
 	if (test_bit(VIDEO_STOPPED, &video->flags))
 		goto done;
+
+	aspeed_video_on(video);
 
 	aspeed_video_init_regs(video);
 
@@ -1901,15 +1903,17 @@
 
 static int aspeed_video_release(struct file *file)
 {
+	bool last;
 	int rc;
 	struct aspeed_video *video = video_drvdata(file);
 
 	mutex_lock(&video->video_lock);
 
-	if (v4l2_fh_is_singular_file(file))
+	last = v4l2_fh_is_singular_file(file);
+	rc = _vb2_fop_release(file, NULL);
+
+	if (last)
 		aspeed_video_stop(video);
-
-	rc = _vb2_fop_release(file, NULL);
 
 	mutex_unlock(&video->video_lock);
 

