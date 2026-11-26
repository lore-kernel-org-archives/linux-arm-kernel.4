Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38667606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 09:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IFLE/XTR;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=M8yvqmvc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CXzeV1Yk3iRKOSkEmTtvwOYw5cnOJdYBMgITKdROfpA=; b=IFLE/XTR/XIH1Jo1IhhM6A8ZJ+
	2SN811XahSsQhqRuXeM5kDHk4WmubCAfnyTBfyZekedN2gU+Mj1eeKhAZzYGUjXzpolCXvEEW2PIM
	Pcbv5Ko2aI+LZtJ/+pfF+v3Lm99bQUtdKDY99d0rc5WfjM6j+gjQTFJ7GjefKz9VYM4WOfL5mt9SO
	MsshEP2tsim8TVbR0zBCqZvorC7RFACFmegDSbvPLskNXhkHY/xWWzsxJlOVWHv/J7rtQVbp1tXTC
	rneSJf9Zln1GB40yhS4jc0EZL+9Tqf1SvnLFa34RckN3zMtygOza4YZQKZDJ73mMePrrq22uYyq/9
	YmgNQkmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVxX-0000000Cahy-0wOh;
	Thu, 26 Nov 2026 09:40:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWVxU-0000000CahX-2hh9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 09:40:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC8BD1BA8;
	Thu, 26 Nov 2026 01:39:58 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FECD3F632;
	Thu, 26 Nov 2026 01:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795686001; bh=BoUj1qpAANERvvO2aWz3vjf4dNomyHw4/oGPucOcpfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M8yvqmvcO61W65XjTA6Uwc0WrD+Zmc4PI/PDfDSNqTd+1oyEtq+upGrxhvCHRCCNP
	 Qa1kzXPE8RwpbciT90fSPwgXmkqbNAgpK5wsGumAnqJc5Z1JFOJzUc3xR28GclGLfK
	 yWHgaWtJZPKd4+VqtB4UCAqXtVzFW7eZLxr7MkJI=
Date: Thu, 26 Nov 2026 09:39:52 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
	sudeep.holla@kernel.org, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
	philip.radford@arm.com, david@kernel.org,
	souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
	puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v17 00/34] Introduce SCMI Telemetry support
Message-ID: <awf-aPLuU_RgU2wN@pluto>
References: <20261124194841.1147072-1-cristian.marussi@arm.com>
 <20261124145357.00003e9f@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124145357.00003e9f@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_014004_785206_5C4E8B65 
X-CRM114-Status: GOOD (  25.01  )
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

On Tue, Nov 24, 2026 at 02:53:57PM -0800, Jonathan Cameron wrote:
> On Tue, 24 Nov 2026 19:48:06 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Hi all,
> > 
> > [TLDR Summary]
> >  [V17 highlights]
> >  - addressed more Sashiko reports
> >  - added a few more SCMI Core fixes that ease per-protocol logic:
> >    + added more consistency in the SCMI Core Iterators machinery
> >    + added centralized check (SCMI Core) for truncated reply
> >      + Reworked some SCM Clock behaviour to allow for truncated checks
> >    + SCMI protocol core initialization refactor and fixes
> > 
> >  [V18 TODO]
> >   - address any remaining outstanding Sashiko/reviewers issues
> >   - address pending human reviews feedback
> I'm lost.
> 
> Does this mean humans should wait for v18?  I'll assume not and
> take a look anyway... 
> 
> Sashiko is moderately easy to run locally as long as your company
> isn't too restrictive with tokens (if they are say upstream folk are
> complaining and ask for more!). Might not be exactly the same
> as the version here but will reduce the noise and versions on list.

Hi,

What I failed to express is that there are still some reports to address
both from LLMs generated reviews and human reviewers.

We do run local LLM reviews (multiple versions of them really), that
together with the public Sashiko instance and the human reviewers generates
a LOT of mostly good and interesting things to look at, BUT such reports most
of the time point out different things (depending on the LLM backend or
frontend version) which is good but rapidly overwhelming: so in the interest
of timely progress I try to address a mix of both upon each posting, but given
the load, usually when I post a new series, there could be still be outstanding
issues from both sides of the review world, human and not, that I plan to
address next...or simply unknown new issue that will be spotted later by
human/LLM reviewes even on the same exact codebase.

...so in a nutshell what I was trying to express was simply that, even if
some comments are still not addressed/replied, I am NOT ignoring human
reviewers (i.e. You mainly) nor LLM generated ones BUT the amount of work
for read_reports/fix_it/testing/replies is overwhelming, so in the interest
of costant progress I DO sometimes post knowingly less-than-perfect series
(maybe focusing more on refining some part than other as an example)

...if NOT there would be probably longer than desired gaps between posting
without anyway the guarantee of perfection, given that when I did try to
address ALL the outstanding reports in a go a few weeks ago, I got anyway
a huge load of brand new issues flagged next...(in these regards LLM do
behave like humans...spotting new stuff from version to version :D)

So yes...I gave up on the mirage of complete perfection and instead aiming
at addressing issues the best I can to allow me to post week after week
a codebase which is increasingly better and improved but still functional
and tested...especially since it is apparent from our last discussion on
this list that this whol feature wont be merged in one go so what is the
point of trying to tidy up to perfection all in one go...

The TDLR summary at the start of the blob was meant to be a heads-up
to avoid people thinking I am happily ignoring them :P ...

...but it clearly failed miserably in its mission...so I will drop the
useless TLDR next time.

Thanks,
Cristian

