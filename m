Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84E5606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 07:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=siFaKgkc;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=i2/ox5zl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NDe69qNLIYTdhsLYqYQaekRTxEOj0NjeZaREVZUZT1k=; b=siFaKgkc6XOQuaPVwOxHxUDStw
	4Crw3dC/pNtRoo3sUb4H20S/RWKS9JnvS6SF0FYJczeE6E5YzOeFQTrq8hqKedemAM6D0zViv87vQ
	nAtXNfJvXCt15TumG9v+RWKkOD2t/u5J5HGzH5bFMgARFV+e0QTrG20T6tIxmRordZhzRjsRaGjxo
	CLxzTmODfBPx3KdaJFrMXJR6yCKRTNFs9QmPcIA0o88hd4zUdkPBIeao2u0bJKlv5mFCx+vuB5WhX
	G/7UqyEmMMk0Tz07Y+l92p2Gw8sKyTTNWxOfmshWQlNEgZCqjuJgMwoU09iuAMkdmsLUT4MHqdpcs
	1zi3TZZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJbL-0000000HYNH-3SJg;
	Mon, 09 Nov 2026 07:15:36 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJbJ-0000000HYMh-0O3m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 07:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=NDe6
	9qNLIYTdhsLYqYQaekRTxEOj0NjeZaREVZUZT1k=; b=i2/ox5zlx48Yc9tPUkPZ
	myNyvSR8O6TjJ0DwTg3U28GlwBgpxYJQT+kHtERfTPsamq8A8xpaDcWtNVjEB4d9
	hEZFdzWg8JvsKhlQ3WLS4yCqkCcIk76cVNutKyM8R+OuOBYtL3ZHxpMSCrY2t50K
	jYTVnWANWRaTLUxUm7l+kekFNa9WZ3akqOPJEmlFyvZSV+NIddtHWfcS4Qx55x0b
	bqA6Ep/3pWiJvGbQIm08RvQb1+GCjzv2wP97vfcm4jccccuty//1AXN9ZZgyNLNo
	xjUBWivV7vLWE8TH+pzJ3FadM8rhFuzaVQmYLkKyM3Vi4HPRSgCBjtjmu9e2KD9N
	IQ==
Received: (qmail 3136135 invoked from network); 9 Nov 2026 08:15:29 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Nov 2026 08:15:29 +0100
X-UD-Smtp-Session: l3s3148p1@zC8QutJffLMujntg
Date: Mon, 9 Nov 2026 08:15:29 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Linus Walleij <linusw@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	srinidhi kasagar <srinidhi.kasagar@stericsson.com>,
	Ben Dooks <ben-linux@fluff.org>,
	Andrea Gallo <andrea.gallo@stericsson.com>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] i2c: nomadik: handle pm_runtime errors
Message-ID: <avFzEaxgam-UuZH0@ninjato>
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
 <20261103-i2c-nomadik-fixes-v1-6-655c6af2cb70@mobileye.com>
 <avFwLctRcnJHtINQ@ninjato>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avFwLctRcnJHtINQ@ninjato>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_231533_421500_348AB35C 
X-CRM114-Status: GOOD (  16.19  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 09, 2026 at 08:03:09AM +0100, Wolfram Sang wrote:
> 
> > -	pm_runtime_get_sync(&priv->adev->dev);
> > +	i = pm_runtime_get_sync(&priv->adev->dev);
> > +	if (i)
> > +		return i;
> 
> Testbots revealed a smatch warning:
> 
> drivers/i2c/busses/i2c-nomadik.c:737 nmk_i2c_xfer() warn: pm_runtime_get_sync() also returns 1 on success
> 
> I will fix it here.

Like this:

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 104da275ff91..8cf1d443a25c 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -734,13 +734,13 @@ static int nmk_i2c_xfer(struct i2c_adapter *i2c_adap,
 	struct nmk_i2c_dev *priv = i2c_get_adapdata(i2c_adap);
 
 	status = pm_runtime_get_sync(&priv->adev->dev);
-	if (status)
+	if (status < 0)
 		return status;
 
 	/* setup the i2c controller */
 	setup_i2c_controller(priv);
 
-	for (i = 0; i < num_msgs; i++) {
+	for (i = 0, status = 0; i < num_msgs; i++) {
 		priv->cli.slave_adr	= msgs[i].addr;
 		priv->cli.buffer		= msgs[i].buf;
 		priv->cli.count		= msgs[i].len;

Note that setting status = 0 is not really required as the I2C core will
ensure num_msgs to be > 0. But if people really hack around it, they
could circumvent that. And code checkers will recognize this path until
we fix the loophole.


