Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD130606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 10:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2OlJH4P3;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=IEXWQ+mB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PpQxkPSco3s1l1g6k6xE1/ySXul2oC8Rp3+HSn9NQlY=; b=2OlJH4P3KKswe5r76GXIo3V5/Q
	vYEGNwF1JTLBuAV/V5Da/esBKMu8By97naqMDPqi6nR4Mti57NShPbynVa4o9t85I2sWXSgXf0Uaa
	6e4qUeFtqnGjKMF1EEbRNLF7wVrZ68n1RhukcPwD4fwFt9MIqKoffCx4cGMcMQkLg1bexBv5DvD8G
	S5DZmfM6TzywNT5euTYqZsMjMzlSNLDUIePffQwWA55iFYwqH5LnJKx9uChRL61YIsJzA8YTaEHGO
	ffC/cUL9pl4hi8wYZgqUNGeMMiOetHm8+QxT53Ku9GHHe6d6Z6uVNX5eDzb9LAirYyFaNJPR7FcJr
	L+XKKekQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzzj-0000000FxQP-2VIJ;
	Sun, 08 Nov 2026 10:19:27 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzzg-0000000FxQ2-2Gh3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 10:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=PpQx
	kPSco3s1l1g6k6xE1/ySXul2oC8Rp3+HSn9NQlY=; b=IEXWQ+mBbOzgPIY6Y0BP
	ZC+Rj3HVGsEhuIT4uLC5vLLpint7+s+KyHTzqEwiM4s+dO57XeMkGHIkmD7zXwjv
	qDZXOEu/RwvoMIfW/ujClr1XI608mbUOYUy3oCwrysSWTO6pgSvy8FkW/AkpEiaz
	c7gcdTdqgI0ND/KF9EXbtHZ2b/5+ph5jJvFOuL0eyCIkskt18I+zAL49UDjfFPef
	gqGYYjdSyH9iyb78JFAzM31aLy8aUq0hI8CQA3z8opONaISgcwH7phqTwBITlJps
	IQY9rebsBJxdRGnOGU9gffEMQtZ7Gti5JX4Bd+qHEhpGzysZbB+BHtAOblUfH6a6
	QA==
Received: (qmail 2808556 invoked from network); 8 Nov 2026 11:19:22 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Nov 2026 11:19:22 +0100
X-UD-Smtp-Session: l3s3148p1@CH2rLcFfwo9e20rG
Date: Sun, 8 Nov 2026 11:19:17 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Dmitry Guzman <Dmitry.Guzman@mobileye.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	srinidhi kasagar <srinidhi.kasagar@stericsson.com>,
	Ben Dooks <ben-linux@fluff.org>,
	Andrea Gallo <andrea.gallo@stericsson.com>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] i2c: nomadik: reduce FIFO flush timeout to avoid
 long interrupt handling
Message-ID: <avBMpSKHPnsz4vMR@shikoro>
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
 <20261103-i2c-nomadik-fixes-v1-8-655c6af2cb70@mobileye.com>
 <CAD++jLnLz_Y_W3Yg13WNntN=iy8tzxAWN4Z0rr5YnO2QfYdrCg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD++jLnLz_Y_W3Yg13WNntN=iy8tzxAWN4Z0rr5YnO2QfYdrCg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_021924_896671_DDC16EF6 
X-CRM114-Status: GOOD (  21.11  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


> > In flush_i2c_fifo(), the driver sets FTX and FRX flags and waits until
> > they are reset (these bits are self-clearing). If after the first read
> > one or both of these bits is set, it waits until both are reset. The
> > timeout is 10 * I2C transfer timeout. I2C transfer timeout is by default
> > 200 milliseconds. 2 seconds are much more than needed: as stated in the
> > comment above, the flushing operation takes just several cycles before
> > completed.
> >
> > flush_i2c_fifo() is called from init_hw() that may be called from
> > interrupt handler. So, if the I2C controller is stuck and the FIFO does
> > not get flushed, the CPU may spend up to 2 seconds in the interrupt
> > handler and cause watchdog timeout or other unwanted consequences.
> > Moreover, if the interrupt is handled by the same CPU core that updates
> > jiffies, the loop may not finish at all.
> >
> > To avoid too long waiting, reduce the timeout to 100 microseconds and
> > use read_poll_timeout_atomic() instead of relying on jiffies.
> >
> > Fixes: 3f9900f17cdb ("i2c: Add support for Ux500/Nomadik I2C controller")
> 
> Is it really "fixing" that? I don't know if I agree that this is an error
> in the initial submission in 2010...

Removed it.

> > Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
> 
> Surplus newline above? Maintainer can remove it when applying.

Fixed this.

Thanks for the reviews, Linus.


