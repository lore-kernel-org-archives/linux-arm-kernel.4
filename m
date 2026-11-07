Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5DE606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 23:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ukKdvSZa;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U/C9Hhd7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JU7cdEgcWrPZJ2PncHPRkLbpC7QORz3Ir1iu9UbvPsw=; b=ukKdvSZas/nUXA
	dWqTGCyv0J9C+aFxehkrnDnTh646yRqkdnZEu/b73U2lmnSkHEeB29Bv6i/gBn+iWxp/P+a63MYey
	oSzsSAPQg7UNUxLmA3mSvey41gnTSpYISfRHRvmYbrpgxW59pe7ioN/cjHOhAKGSFrXzjSQUGmIU+
	0PMRY5cQfTSSB84a8RTgIWS0vklWrmyYPErr6lQlZZZc4/ZFuL0F3j/3QQJojYGyYNyddW9vLRRrD
	m+PN7Q9U2Y9ELElhudLFUGjTMTlPwTUIfIU3dl7d8RXpZ3aYkWeuo6sK8gcHZ0fARWeJVOuI/Bltv
	BJP/7Fy/V1hVJn1iyFUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPprs-0000000FVXI-3OG5;
	Sat, 07 Nov 2026 23:30:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPprr-0000000FVXC-44Y0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 23:30:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E8F941FBE;
	Sat,  7 Nov 2026 23:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB761F0089F;
	Sat,  7 Nov 2026 23:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794094239;
	bh=JU7cdEgcWrPZJ2PncHPRkLbpC7QORz3Ir1iu9UbvPsw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=U/C9Hhd7y7+W1AZchIY/JvBx7Birq0AIs31BfvppbtLChvPEfk2mXoQZfC/tTUhG5
	 xEs8akouSn2mi/MN81i6yy2DHaE7o9rWQBTpzVmBbjtEg2I7ILU+owvTbvpPkk2Rsy
	 KvSwT7veLv57pP+Hm1USkGDC5mKNr9m9VFyRT9lTRoz8DQHznJHqZy1k+JurfsQv41
	 k1iPXckr8TjFOqIFrNKoLVPXFY5Om+xrJgxbYd21jyiykm+uyIU+jwaBSe5FqWf/sn
	 zvXe8kEgi3PgQ/XkdX74bmo8d+2dtYjiQf33C8hGoOeKTCONXJ85wFVwB44mUu+97V
	 c6HJ7l8NfCXFQ==
Date: Sat, 7 Nov 2026 23:30:31 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, Michal Simek
 <michal.simek@amd.com>, Sai Krishna Potthuri
 <sai.krishna.potthuri@amd.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, amitrkcian2002@gmail.com
Subject: Re: [PATCH 3/6] iio: adc: versal-sysmon: disable interrupts on
 shutdown
Message-ID: <20261107233031.7ea9a718@jic23-hlaptop>
In-Reply-To: <aumzIdkwp_jVcTTs@ashevche-desk.local>
References: <20261102122112.1723130-1-amit.kumar-mahapatra@amd.com>
	<20261102122112.1723130-4-amit.kumar-mahapatra@amd.com>
	<aumzIdkwp_jVcTTs@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 3 Nov 2026 12:10:41 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Mon, Nov 02, 2026 at 05:51:09PM +0530, Amit Kumar Mahapatra wrote:
> > Interrupt teardown is registered with devm_add_action_or_reset(), so
> > sysmon_disable_interrupts() runs when the driver is unbound but not when
> > the system shuts down: device_shutdown() invokes only the driver's
> > .shutdown callback, which this driver does not implement.
> > 
> > The device is therefore left with its alarm interrupts enabled in
> > hardware once Linux has stopped servicing them.
> > 
> > Add a .shutdown callback performing the same teardown, so the device is
> > quiesced before control is handed on. The helper lives in the core
> > module, so it is exported for the platform front-end. It skips a
> > device described without an interrupt, which never set up interrupt
> > handling.
> > 
> > Disabling the interrupts at shutdown is safe to have and not a must have
> > requirement for shutdown.  
> 
> ...
> 
> > +	struct iio_dev *indio_dev = dev_get_drvdata(dev);
> > +	struct sysmon *sysmon = iio_priv(indio_dev);  
> 
> Side Q to Jonathan: How do you see having a helper that unites these two?
> Something like void *iio_priv_from_drvdata(struct device *dev)
> 
There is no strong reason to assume that dev_get_drvdata() returns
an iio_dev (even though that's a common choice) so a helper would
have to express that somehow in the naming.





