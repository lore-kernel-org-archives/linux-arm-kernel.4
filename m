Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5E0606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nFdLxQ+f;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bYIrvjOC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=G15HxNV2BInhmGFfz6B2/9xNKvQkUmZEvhfrnB2brVA=; b=nFdLxQ+fQWUyh9vzB6hZS5Z7/h
	rXsN+beEHICiF66yFO498fGxbf2wPgw0hLVrE6oNJZTJQgjXaXhcxxQWasLyWvWhElm/KYe5F2OiD
	+UIwPEqYSyvPUxFZIFECLekmtr7IJAdfBGZzcGJaK4SYOe5oeK0y448fXQ2iils0KIZ6SZOidkAXx
	3yEu7PNCQcGEiVy0vyv3QsiDGByfYUwiYqtJMo/LWDCzL8UlRUhppvWKJ7nUOEpXvPSuQf4iXmm0m
	zdsxEqWEL9LyDC7m3ZXmEPKK1D6fj1sSXgLRyRuE/towS6p5U6WegD38AHyAD+9jlbaDi6v+J6x/F
	IP/LgJgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQun-00000002t9j-2ABN;
	Mon, 23 Nov 2026 10:04:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQuk-00000002t7u-0riL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:04:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37A37143D;
	Mon, 23 Nov 2026 02:04:39 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A18E83F632;
	Mon, 23 Nov 2026 02:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795428282; bh=yQm4JEXfwJhgCAIOW0UPlZ/ox3rIB1ofbEWhNOZozx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bYIrvjOChM7XaDO+KaAGSjv8uxpYcYqRZ7E5cSY0ajl/nxwHdByNbBv46A7knLIHR
	 FavXqxFQu8/hQNfLQBS22d3xo2r8FOEfLnGmDuUj3HIsIgtfbB+JAE0QJCXTZSfah2
	 VqqNxSPoFWHIBwli+qfJmRQgcrhwU7pdaK/7jJE8=
Date: Mon, 23 Nov 2026 10:04:39 +0000
From: Leo Yan <leo.yan@arm.com>
To: Vlad Poenaru <vlad.wing@gmail.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Ingo Molnar <mingo@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 04/25] coresight: perf: End AUX output when an event is
 throttled
Message-ID: <20261123100439.GB9176@e132581.arm.com>
References: <b851c070-19d2-42b8-b19d-be4b02ad9715@linaro.org>
 <20261120172739.1843303-1-vlad.wing@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120172739.1843303-1-vlad.wing@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_020446_369125_2B45B06E 
X-CRM114-Status: GOOD (  11.67  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vlad,

On Fri, Nov 20, 2026 at 09:27:39AM -0800, Vlad Poenaru wrote:
> On 16/10/2026 14:46, James Clark wrote:
> > Reviewed-by: James Clark <james.clark@linaro.org>
> 
> Hi Suzuki, Mike, James, Leo,
> 
> Could this go in alone as a v7.4 fix, with Cc: stable@vger.kernel.org?
> It does not depend on the rest of the series and applies cleanly to
> v7.4-rc3.

I agree that this patch can be an independent fix. Since it has a stable
tag, it will be automatically backported to stable kernels once it is
merged into mainline.

@Suzuki, how about you think? I confirmed it can be applied clearly on
coresight-next branch.

Thanks,
Leo

