Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D52F606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l/gZf0zM;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OEK+WUgT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8lUtvBf4yp1q4uRBQvvRAWZrQAMHjkc9iS4tTLTfDyA=; b=l/gZf0zM2CskvmkXrkfcjmL1Hm
	hXWg3wL7+CS4u8LIAChGvzaRusq9DS4LXkq3ZvgxmWzv3b57jbbcv7o2AWqCIFGwUMduzS/KjWyWG
	bgpXAKLCEVPm6xTytU6lLZC34udw22NBhH2PuWq/DumOr+k0T+vJ6PX7lOAqopVkl34fcN3ouW3NE
	t1qTSyUuYRCtyBFkbwUsndcMqxLTgf8YCEVh6HLN0JszBc0oJ8/MmyzNIpNjTTKa7Mm0QsTVfW5Fm
	/HIqZfvJKCL3wHKKfdcdUgJaC8B2RLJ2iTIh5oTSnCz13XNEmWQeAXS4x9OApyt3wCdI4Irp2dseC
	rfd0CeLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBIo-00000009eg8-2PXI;
	Wed, 25 Nov 2026 11:36:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBIo-00000009efl-0N55
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:36:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 67F0762945;
	Wed, 25 Nov 2026 11:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9D51F000CA;
	Wed, 25 Nov 2026 11:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795606600;
	bh=8lUtvBf4yp1q4uRBQvvRAWZrQAMHjkc9iS4tTLTfDyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OEK+WUgTJdEarfLjej1HEQDPg1tpmClXTWZKCTeuWPyTcUZTsgfsbeVmYw7beWYif
	 SCn5YZyW62ypU6+YGtN40Xm/UGIBnPPVp01hWmUc0KXSHwHxLNPKNiROGjNDjT9FNh
	 0dQjV2DwEIcwBrvnMZGycFinF0L9HNUThcW5z8UTA0s1/q+EBi/JGIr+Tbud0bnsWH
	 uRfUh4yStcTsT8j9CDvLcqoRY7Q8R0/ib7q91r0cBsW0SMgxSrIQK48n12s6b208Eq
	 nQXKyqVc15Y5aBdK3k2ARBhNywi6Ubv4RGlW34ti4WdcyOKEdzvxTdINKeYIZRf0ZM
	 7mpix3n+1kJvA==
Date: Wed, 25 Nov 2026 11:36:34 +0000
From: Simon Horman <horms@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: Meghana Malladi <m-malladi@ti.com>, kees+treewide@kernel.org,
	laixiangwu@cmss.chinamobile.com, philippe.schenker@impulsing.ch,
	haokexin@gmail.com, devnexen@gmail.com, jacob.e.keller@intel.com,
	sdf@fomichev.me, john.fastabend@gmail.com, hawk@kernel.org,
	daniel@iogearbox.net, ast@kernel.org, pabeni@redhat.com,
	kuba@kernel.org, edumazet@kernel.org, davem@davemloft.net,
	andrew+netdev@lunn.ch, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>, danishanwar@ti.com
Subject: Re: [PATCH net-next 2/2] net: ti: icssg-prueth: Add ethtool RX flow
 classification support
Message-ID: <20261125113634.GT31322@horms.kernel.org>
References: <20261118184729.2302130-1-m-malladi@ti.com>
 <20261118184729.2302130-3-m-malladi@ti.com>
 <CAAofZF4XYd5z8X56DRARMxbu3t7QX48T7V69MPBw9TW1BQAmKg@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAofZF4XYd5z8X56DRARMxbu3t7QX48T7V69MPBw9TW1BQAmKg@mail.gmail.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 10:19:48AM +0100, Marco Crivellari wrote:
> Hi,
> 
> On Wed, Nov 18, 2026 at 7:50 PM Meghana Malladi <m-malladi@ti.com> wrote:
> > [...]
> > +       mutex_lock(&emac->rxnfc.rxnfc_lock);
> > +
> > +       /* Check max rules */
> > +       if (emac->rxnfc.rxnfc_rule_count >= ICSSG_RXNFC_MAX_RULES) {
> > +               ret = -ENOSPC;
> > +               goto unlock;
> > +       }
> >  [...]
> > +
> > +unlock:
> > +       mutex_unlock(&emac->rxnfc.rxnfc_lock);
> > +       return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(icssg_rxnfc_rule_add);
> 
> nit: instead of mutex_lock() you can use guard() [1]:
> 
>     guard(mutex)(&emac->rxnfc.rxnfc_lock)
> 
> and remove all the "goto unlock", returning directly. This handles the
> automatic cleanup.
> 
> Same for other places where you're using mutex_lock() / mutex_unlock().
> 
> - [1] https://docs.kernel.org/core-api/cleanup.html

Thanks Marco,

That may be good general advice.
But for networking code the explicit approach taken by this patch
is still preferred.

  Using device-managed and cleanup.h constructs

  Netdev remains skeptical about promises of all “auto-cleanup” APIs,
  including even devm_ helpers, historically. They are not the preferred
  style of implementation, merely an acceptable one.

  Use of guard() is discouraged within any function longer than 20 lines,
  scoped_guard() is considered more readable. Using normal lock/unlock is
  still (weakly) preferred.

  Low level cleanup constructs (such as __free()) can be used when building
  APIs and helpers, especially scoped iterators. However, direct use of
  __free() within networking core and drivers is discouraged. Similar
  guidance applies to declaring variables mid-function.

  Link: https://docs.kernel.org/process/maintainer-netdev.html#using-device-managed-and-cleanup-h-constructs

