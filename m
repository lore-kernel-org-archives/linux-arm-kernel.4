Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FFB606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 19:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P6eL7noH;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=lSncp5uC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ULn49rq+foRUnRGBMXBuYjS8gpikS5WyQEKWls+yMRA=; b=P6eL7noHCHnp/+2QXq0ZmfG3zj
	hZD/D79f+1e6bfEwpiheOtD1x1BQ1xVc5Ot7vh/NDkKDhUp8euPlG47U5DDOcnLSNXM5JsF9BdIvR
	E9tBP9dp7u9vOwRhq2m60g6bejqwQfNzeo3uGxawoQkZWgPiUkZMluffyzo0aL1PKpuBbReCnDaSU
	qVS7SWfiNj11eJWxSyIxRBIqe+8W5Xkqo1oT4s4eCXJk2Q5n/ySi9ZTjhRmq+vmaAkeAW35QCgSj+
	2gzORMxr62S5BmGfoQwH5CILFVF2mif4yun/vII0lSUFklPszlXjAdHfKL9nnGC1IUd90EldXwDiF
	qcjiLFGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX1om-0000000HauM-1FTi;
	Fri, 27 Nov 2026 19:41:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX1oe-0000000HasP-43i2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 19:41:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DE1D1575;
	Fri, 27 Nov 2026 11:41:01 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 432D53F632;
	Fri, 27 Nov 2026 11:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795808464; bh=fioucID+8fbbj8tWzFHzFZGEV4eCYp3bOFGBcaxc55s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lSncp5uCSksq2jem0pQF5wGdzZG7o7CpSitT4QZGqkwrt6CNnmOzoN58im0X0EIRL
	 WpgDd/dGqrL5y414OIyTYa55gA9fzjEksDtUygbJJgVt46+2393rtwIcj9kfxjGrXv
	 PLiwn5Oj7+2c7mutFKeiwqwYxHDE9B/nNcZ8tZpU=
Date: Fri, 27 Nov 2026 19:40:58 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Pawel Chmielewski <pawel.chmielewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, Len Brown <lenb@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC v3 7/8] attestation: providers: introduce CCA Guest
 attestation provider
Message-ID: <awncytx4Nqd8HuNx@e129823.arm.com>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
 <20261127-arm_cca_mr-v3-7-df3230afce8f@arm.com>
 <20261127170722.GT246011@ziepe.ca>
 <awnK2c3kMq8p2a_7@e129823.arm.com>
 <20261127183550.GV246011@ziepe.ca>
 <awnV5S703Rgf5sh5@e129823.arm.com>
 <20261127191822.GA1856591@ziepe.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127191822.GA1856591@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_114106_481174_DB3286CE 
X-CRM114-Status: GOOD (  28.17  )
X-Spam-Score: -4.4 (----)
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

On Fri, Nov 27, 2026 at 03:18:22PM -0400, Jason Gunthorpe wrote:
> On Fri, Nov 27, 2026 at 07:11:33PM +0000, Yeoreum Yun wrote:
> > I think the problem is the *max-token-size* could be changed.
> > once the LFA updates the Realm definitely the contents of hash of
> > firmware binary can be changed. this means the token's content could be
> > change including the *max-token-size*.
> 
> I think that is broken, there is no good way to make that work in a
> sane manner.
> 
> LFA must stay under the hard wired max-token-size limit, not try to
> change it while a realm is running. Take this to your spec team.

Yeap. if max-token-size is hard wired. then will not be a problem.
And need to talk them.

Thanks!

> 
> > For this, the RSI host call interface has the way to get LFA eventlog.
> > IOW, after LFA, there will be LFA log is genreated and then for the
> > time of re-attestation, it should deliver the LFA logs together.
> 
> The detached event log is even more reason the token should not ever
> be changed by a LFA.
> 
> > > I saw in your FIRME series a solution to this problem, I think that
> > > would be good to get out on its own and apply it first to RSI as
> > > well. We will have the core RSI stuff, the realm attestation and TSM
> > > driver at a minimum..
> > 
> > Hm,, Does this mean do we need to create two device one for TSM and
> > one for attestation even the functionality same?
> 
> They won't have the same functionality. It will be the same as you had
> with FIRME where there is a driver doing CPU attestation and another
> one (the TSM driver actually) doing link IDE.

Right, I've missed the link IDE.
Yeap. in the next-spin let me make two device for it.

Thanks ;)

-- 
Sincerely,
Yeoreum Yun

