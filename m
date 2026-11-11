Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4F7606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 11:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uOVp3neY;
	dkim=pass (2048-bit key, unprotected) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.a=rsa-sha256 header.s=h01 header.b=cO9XoWLf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OYfWv7t3fNfV5mHgH3rQFUU5ZnGse0SEirQFnt+sNZA=; b=uOVp3neYvlWA0x1NVZcZZyYWBQ
	+GSfPi6pOXE1EJswr5UHGh7WiRYqTlCd/0uZVktXCpk0YuAQ0a0zEQnvNKNujxsBLy275Da8ZWQGe
	uLT8+ure+ooDdsWCeP/wNsKvjlxZgoX5z7qiLJ7imi4oTthBzghNFJ/lCBBBtkQCtYcRzEzB+WHW9
	hoE5xwlpOmcUmkAwJBN0E9R+CH/i36pmt7k9I+iwlxt5kwdS5iCb1aoQcBVnsnXaZ5Dcqw1KJRWPH
	euHZ0rPioqUvHBiUlWjnwhYPPHDx8kUwKqGv1jLv2wZJGGGLpwS6h2cm7YGDgUQF2owUlg0MBGJd+
	kjyofdsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR643-00000006P3g-2cO8;
	Wed, 11 Nov 2026 11:00:27 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR640-00000006P2y-1Q3x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 11:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=OYfWv7t3fNfV5mHgH3rQFUU5ZnGse0SEirQFnt+sNZA=; 
	b=cO9XoWLfjDEAo8WYLWNOoEiRtgAE4GB5whJjASVlg2jl9XmeIcKVqZ99wCK8SeuajrdKFGY4a7J
	l83YVFNtjopeZ2QhhCElQjui5HmK7/eCClUGF1gPmKhJKIJC1X1bAZVfcThNl6pKzSZkQukc1EV9o
	8WghVTs7Cz0q6uDE8dH4X8nowKLY/jGAa/79QC9okwhA3v2LoLY3OoCd1yO5wFPukyTfmBXifjFQ0
	y98Qrpd6yL2V7nAwtyOOaGtrXWX864+psHHS+KEFHDw+b3pJOAv183r+H151YNRbiE/jjviiT9yHh
	+KlpasAfqR++rkd81godh9nh0zIBozgEs/iw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.98.2 #2 (Debian))
	id 1xR63k-0000000DmCq-0pos;
	Wed, 11 Nov 2026 19:00:09 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 11 Nov 2026 19:00:08 +0800
Date: Wed, 11 Nov 2026 19:00:08 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Russell King <linux@armlinux.org.uk>,
	Eric Biggers <ebiggers@kernel.org>,
	Demi Marie Obenour <demiobenour@gmail.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Birk Skyum <birk.skyum@pm.me>, linux-crypto@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v11 0/2] crypto - qce: make algos optional and remove the
 BROKEN label
Message-ID: <avRKuPGD6QdRXrat@gondor.apana.org.au>
References: <20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com>
 <kh74or65txfcprntqqljabnszooj5ppuwizj35flv2r245zbvo@nfue4wdblicr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kh74or65txfcprntqqljabnszooj5ppuwizj35flv2r245zbvo@nfue4wdblicr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_030024_383285_2DAE9A25 
X-CRM114-Status: GOOD (  17.12  )
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

On Mon, Nov 02, 2026 at 10:58:12AM +0100, Bartosz Golaszewski wrote:
> On Thu, Oct 22, 2026 at 10:57:58AM +0200, Bartosz Golaszewski wrote:
> > This is the follow-up to the three smaller series fixing crypto
> > self-tests in the QCE driver. It makes the crypto algorithms opt-in via
> > a module parameter and removes the BROKEN label so that the driver is
> > built by default.
> > 
> > The dependencies are:
> > - https://lore.kernel.org/all/20261016-qce-fixes-sha-v1-1-3ee5a30d84f3@oss.qualcomm.com/
> > - https://lore.kernel.org/all/20261019-qce-fixes-skcipher-v12-0-046e6be9bd83@oss.qualcomm.com/
> > - https://lore.kernel.org/all/20261020-qce-fixes-aead-v12-0-77a2e09abd0c@oss.qualcomm.com/
> > 
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > ---
> 
> Hi Herbert!
> 
> Gentle ping, can these three series + this one now get queued for v7.4?
> The three dependencies have no more sashiko comments. The ones for this
> one are minor about missing module params docs so can probably be
> ignored or I can send a follow up.

Did you miss the Sashiko comments about missing documentation?
Please address them first.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

