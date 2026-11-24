Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8274606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 18:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eRz9hm0I;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4LEOWFw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=muXEpXsp4+0/5ZU311gJqIbUHfTI/heB2h0v87pFpis=; b=eRz9hm0I1RJKl+4+ApLfnAtg3r
	pVOvZviKqDyzCDpLdWWXR0V0QofJyPBcqNBPHX6NtVFMWzQa+ufmPVJjzDVpkMcEIo8Uz4pkGRRWF
	9teG6VYlB9WWIjf6pJlvhSx1chksiaM8xfUP+53iVhoPTIusEl5DkvQNgzlx/+FCp7HFMA8Oxi6LT
	lAQy/v6CR0DNYwWlthr1alAFq83Tw0Tkl/E936bZvzYLtLIerzaRHxDijyu9s07/4ym5DTPNv0uii
	VzBuJJwhZ0//xPQCWOmSBfBnm3PtDDpu0L+gG3vvqOqsqCcxBlq6zACLAHtkgvhM9jJbAGGOqXNaS
	H/LZZLBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVv02-00000007Sxh-0xtL;
	Tue, 24 Nov 2026 18:12:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVv00-00000007SxI-0wFP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 18:12:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6232F62877;
	Tue, 24 Nov 2026 18:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DEE1F000CA;
	Tue, 24 Nov 2026 18:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795543931;
	bh=muXEpXsp4+0/5ZU311gJqIbUHfTI/heB2h0v87pFpis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g4LEOWFwgOkrXKXBtr09ASaitr5vcomBZoZYTSIvgOMK7bUwbW7eo8ejkH1ZZjWqQ
	 efsI9Iet39G6cQlY6qS5yCiSC3mA6I/84gCYY0IVeWFtdS0zJwekLmLCK+j9zx2FBF
	 jMih0WhgTOPWBe2dXMMIGdUdfGJudwvB71KEYBX7e6QfKD08fPPn2hVlOfD+ykfnCb
	 7H0/f+cgOX0L8KV3A7XNyzIFpq+R/Ideo9DPOVyUov8m0KkZBypm6FRi4ETPB0teb2
	 ARLke+0/GBCne0F16Mt41UCPsinAnCav3B7qGYNEAXS6V6rqqqyuNj8OskVwmMQB1l
	 WeNz43A7YxzZg==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.ams.internal (Postfix) with ESMTP id 38074198004A;
	Tue, 24 Nov 2026 13:12:04 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 24 Nov 2026 13:12:08 -0500
X-ME-Sender: <xms:c9MFa3bXPFJ3lfsLvjJCW-RqWkHQ57YNcCTlcDaLqdvzyhV9CBmLuw>
    <xme:c9MFa3PlX5XrQOAd0pvbvMUcOdWFqMpEm95RjzHZY5ihfJKrLscKJYciLvp8BPklf
    deUf4p9dveQwFvjme45dkufHKBgLOBnv_s-8fBaKYjaxbr84ug6Uwk>
X-ME-Received: <xmr:c9MFa4hERqhzd2NpktFPdCRsmzQAsN-ynRbj7QwnwqIbunpXaNOzATwbK_E>
X-ME-Proxy-Cause: dmFkZTEyEExkyyzfsHqUGry0fExPW1Jtpw47hOuK4Sgt4e32Tg9LBhxhuZTFmlGZzvoHLI
    ft0i5+sUAdxlFAmeDTZdeLPHhKHrQM4i8bv6qY+IHtbhUEl0JNpvDo/Xeta34r2bs4YDyp
    9Hl338CGNsKgKGvO/4rnRQgEnyYUgAttqm3SR9G5mF44b8PtEf0MEQjpB8Wp8TdbseAZ+a
    TZwF8ZNcWJ+uXDdfzZQBbkjKzMKqO+/uWAM7KPKZXIBkua0uzBKw0SrU0Cao0E2r8SZlEF
    ZvhwS+hyZGx6p3Uk6HyN1wct1IS8Zt1RiTmYxC2rG6rWqWKdD+IuUEbVN4v1oEurMCZnfo
    X/uQKffndMmhBtVBiMt8Fpza3T2I/3kPEyEADJpUMTo4E88rsPMyuATUIrKUGqghlLDs/h
    meSbcbcd3XfmjrZRuYT/9mGmEwoBXtUFM3G8vceUWoFNcfXkHrtK5qA80HOo/I0SuWiuWV
    uhWQWHO/gTLvWEAoNi9gOfserNsvIXU5Num5Hry8pvZ1/+kXzmkM4eMj+sJ9Ez2ClI6qv9
    lZfR02qK8vm03rQNjzvsjGDa4MlyH1hWzy0Uspd/Eyhci1vjwYsxd33B2zMolFOrlt0c73
    CXLENQ/Ck6OUqDoKMGMccfPQEzkU7S2UdKfkG/z9qqFWDZP97ZnAtKgduJ5w
X-ME-Proxy: <xmx:c9MFazeKZlZIxVPU74r1W8cehUXAUudom71-94Jq2YGjvpAEhTKE5g>
    <xmx:c9MFa9wkvxNFAInbwfCaTHKSeKTUV3NcdzINoDyCxkNiLh4DMimgzA>
    <xmx:c9MFa4ZKN13cFtpZGO26zex9eig0O4BQDa_oYdJVQpiLgj-OOOR5Ag>
    <xmx:c9MFaxpPexxjim9yYsc8Pxnm3k2tygWqWQjBx0LrTdR95eKn4CgB-A>
    <xmx:c9MFa8EBUwCi5suBDA0spCrkswB-ikT8tsixUIBrvh8YyTCYDZL4Opt0>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 13:12:02 -0500 (EST)
Date: Tue, 24 Nov 2026 18:12:01 +0000
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	james.morse@arm.com, rppt@kernel.org, arnd@arndb.de, kmehltretter@gmail.com, 
	dapeng1.mi@linux.intel.com, elver@google.com, enelsonmoore@gmail.com, bp@alien8.de, 
	jlayton@kernel.org, catalin.marinas@arm.com, sean@starlabs.systems, will@kernel.org, 
	jonathan.cameron@oss.qualcomm.com, tzungbi@kernel.org, steven.price@arm.com, chenhuacai@kernel.org, 
	tzimmermann@suse.de, wenst@chromium.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, vladimir.murzin@arm.com
Subject: Re: [PATCH] arm64: sdei: add sdei_nmi.disabled= to keep the GIC NMI
 path reachable
Message-ID: <awXQtcWmqf7c_49B@shutemov.name>
References: <20261123033222.1067923-1-ruanjinjie@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123033222.1067923-1-ruanjinjie@huawei.com>
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

On Mon, Nov 23, 2026 at 11:32:22AM +0800, Jinjie Ruan wrote:
> While the SDEI cross-CPU NMI is active it claims every cross-CPU
> backtrace, so on a platform whose firmware exposes SDEI event 0
> the irqchip NMI path can never be used.  There is no way to opt out.
> 
> Add a boot parameter "sdei_nmi.disabled".
> 
> With sdei_nmi.disabled=1, the SDEI NMI stays registered and simply
> declines every request, so arch_trigger_cpumask_backtrace() falls
> through to its IPI path and smp_send_stop() skips its SDEI rung.

Why keep event 0 registered and enabled when the switch is on?

If sdei_nmi_init() returns before sdei_event_register(),
sdei_nmi_available stays false and both hooks already decline.

Then the flag is read only at init and can be __initdata. None of the
other hunks are needed. The check in sdei_nmi_stop_cpus() is not
reachable anyway: smp_send_stop() calls it only after sdei_nmi_active().

--
  Kiryl Shutsemau / Kirill A. Shutemov

