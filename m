Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7CA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1tVxO/Bb;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=IwjcfgP9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=muKBTpgIwomUfoL+ebA1PuO9dc4a3sXML+kuNL0YxMc=; b=1tVxO/BbZw38GFrw7ukRfMpSIp
	58VoFR14rXFc4NCvwDSw4O9iQoY6w1LCEKBNtv9p2MhB3ewmtzuBnqpFLM70MeOLyupGoceWWVeYy
	IAR2NF2A08OEZYTeV/jZdxBNXt0DHwFR0qyKW4Pn3jZBsDotHnuJ8QLf6Wi+9GB6BmiZ7bhDlsItW
	Lgbpla/9xSv7FImomgq+CF9d4gS6CCTZXIP4bV69l/wyTkgbAbX2WYOZ8rRdQQ2q7+dV8xD2/Ww4a
	gBomDxjzp0JCfCr52CnJ8WFJmPyN2JrZnsqM9VZnRpeolncv1RjnN0BtUrOz61sG3paauoVmFmCT9
	hf6ey/5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ07F-0000000FyCQ-35eC;
	Sun, 08 Nov 2026 10:27:13 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ07B-0000000FyBg-2XJJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 10:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:content-transfer-encoding
	:in-reply-to; s=k1; bh=muKBTpgIwomUfoL+ebA1PuO9dc4a3sXML+kuNL0Yx
	Mc=; b=IwjcfgP9iE46P2DVCrb8sqNBMdYcjPCP+KPKR5KgJZIcdkl2QaXc87hQ6
	sp+ynLqDh6YI4nV3O/sH//uny4WjwTFNTxjflcWFA19CAYvu1xzgKBiV5rh7tQeU
	xYPW/YrgHJPaicHFEeSzlWD4Mp8B2M2d643TDPsSCQiIycpcrd3+E2DHKBTFzxgH
	ifisSvEKyK7l80w0ybuhVc9b/b79mY88dWUQPvalg0A6M87JZu0lvJ0rKJgTP3wh
	Ybo3SbY+Q8/7r9y4bzZ3danVSh1+z5qT7GKf7ezMEqvHg9hnpg4rYErjT1RZK/oU
	c1jdXwqloTmzQKHl7AGykEcnWZQGQ==
Received: (qmail 2810692 invoked from network); 8 Nov 2026 11:27:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Nov 2026 11:27:07 +0100
X-UD-Smtp-Session: l3s3148p1@tsR9ScFf1Ixe20rG
Date: Sun, 8 Nov 2026 11:27:06 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Dmitry Guzman <Dmitry.Guzman@mobileye.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	srinidhi kasagar <srinidhi.kasagar@stericsson.com>,
	Ben Dooks <ben-linux@fluff.org>,
	Andrea Gallo <andrea.gallo@stericsson.com>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] i2c: nomadik: handle pm_runtime errors
Message-ID: <avBOeuNEVo4xn3o6@shikoro>
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
 <20261103-i2c-nomadik-fixes-v1-6-655c6af2cb70@mobileye.com>
 <CAD++jLm+m+YNhTaUnTm=dwO4p8xYe8OjZ7qhQ9_u15dnxURiVQ@mail.gmail.com>
 <auxDe0lmVCDu_iXA@shikoro>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auxDe0lmVCDu_iXA@shikoro>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_022709_936193_D4590FB3 
X-CRM114-Status: GOOD (  21.29  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 10:51:07AM +0200, Wolfram Sang wrote:
> On Thu, Nov 05, 2026 at 09:42:02AM +0100, Linus Walleij wrote:
> > On Tue, Nov 3, 2026 at 9:30 AM Dmitry Guzman <Dmitry.Guzman@mobileye.com> wrote:
> > 
> > > In nmk_i2c_xfer(), pm_runtime_get_sync() is called on start and then
> > > the controller registers are accessed without checking the return value.
> > > If pm_runtime_get_sync() fails, access to the register of the device that
> > > was not correctly powered on may cause a bus fault or other unpredictable
> > > system behavior.
> > >
> > > Check the return value of pm_runtime_get_sync() and it if is not 0,
> > > return the error immediately.
> > >
> > > Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
> > (...)
> > > -       pm_runtime_get_sync(&priv->adev->dev);
> > > +       i = pm_runtime_get_sync(&priv->adev->dev);
> > > +       if (i)
> > > +               return i;
> > 
> > It's a bit odd to reuse the i (= iterator...) variable for this.
> > I would just add an int ret or int err for this.
> 
> Yes, please.

I changed this to:

@@ -730,11 +730,12 @@ static int nmk_i2c_xfer_one(struct nmk_i2c_dev *priv, u16 flags)
 static int nmk_i2c_xfer(struct i2c_adapter *i2c_adap,
 		struct i2c_msg msgs[], int num_msgs)
 {
-	int status = 0;
-	int i;
+	int status, i;
 	struct nmk_i2c_dev *priv = i2c_get_adapdata(i2c_adap);
 
-	pm_runtime_get_sync(&priv->adev->dev);
+	status = pm_runtime_get_sync(&priv->adev->dev);
+	if (status)
+		return status;
 
 	/* setup the i2c controller */
 	setup_i2c_controller(priv);

while applying.


