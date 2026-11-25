Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531A2606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tbibHEHk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OuPxSU+b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XT0zzvytIO4H3CpKWXv+xGNfGei+5WGWs5aivBiZYBU=; b=tbibHEHkc/buAGlbLIi18ssNw3
	4RrahIPghVcAXt+keJ6Ef4NPSWD7YavlzZDyBc0TjXsL0WHVK7H9C6LDwuFhn0OUszg3rqmLp2+Yj
	g8ZNfpcNUisQDEdqUyUar3LKCGXBYQq1Q6WuDIyJG6enIUspxgxhTqV4jEqQh2tjF5SiVmjEu0bFv
	zjOdpZcFhGYoMz1sgwk2MS4ovfbk2lyk8h2qI/PylbqlKeQP4hVCTVGwMsuhXyCi9OMrS0ZMNQ1eI
	q63BYcxcDOAhvifA/Zvm9T+AebqSrPD+Bo6PNvu55UKWigRzbw998iOZaQghYcESU9t008+o57O2Q
	YCCLqQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8Rq-000000095mr-1paw;
	Wed, 25 Nov 2026 08:33:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8Ro-000000095mS-3HE5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:33:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 10A2D620F3;
	Wed, 25 Nov 2026 08:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B84E01F000C4;
	Wed, 25 Nov 2026 08:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795595627;
	bh=XT0zzvytIO4H3CpKWXv+xGNfGei+5WGWs5aivBiZYBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OuPxSU+bewCYDd1OYpqvTwQl/jJa5r1ydQzRYynSncPE0s+bR2wSev0EoFc21yYpm
	 lIZl/k1ZkGQpihIgjQysM6gcHyd086CIAqZH2GZ3v5TjVKMQvoWv5Gqm5uCjGsQ4k9
	 ARox0LDStLmf58VxXC5gEz27NNiIYbjDEN8EJDq+24Fbbx/h8/mkFmo2ZOt79ZhkEs
	 zbxMIFXZuFU3Blkr2sitY0xcYrGtj/ATyYdbsJOOq1hWj3/m7nrxxkLEOtKuVJNapk
	 ANITUoMWm2gBPaso8CoZMt1k5CTGixvg2TrqODKueLCKWUq2WGmRmsymdBj5qAXWt9
	 s2n1OMdDkOpYw==
Date: Wed, 25 Nov 2026 09:33:40 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Ninad Palsule <ninad@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Linus Walleij <linusw@kernel.org>, linux-fsi@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] fsi: aspeed: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
Message-ID: <2fy6bcld3qnquytnfjnft2q7fab4jcxpmpwjbsgxfam2wqndi4@gghtmnfdry5p>
References: <20261103-fsi-aspeed-gpio-nonexclusive-v1-1-1fb040c59386@oss.qualcomm.com>
 <84bb623a-151e-4f6d-ba6a-a303838f4aa7@linux.ibm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84bb623a-151e-4f6d-ba6a-a303838f4aa7@linux.ibm.com>
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
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 09:39:27AM -0600, Eddie James wrote:
> 
> On 11/3/26 7:20 AM, Bartosz Golaszewski wrote:
> > There are no users that share fsi-routing-gpios in any of the upstream
> > DT sources. Even if there were, the right thing to do would be enable
> > HAVE_SHARED_GPIOS for the aspeed platform as this is the preferred way
> > of sharing GPIO pins. Don't request the GPIO as non-exclusive as this
> > flag is now deprecated and will be removed.
> 
> 
> Thanks!
> 
> Reviewed-by: Eddie James <eajames@linux.ibm.com>
>

If there are no objections, I'll take it via the GPIO tree for v7.5.

Bartosz

