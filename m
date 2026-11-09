Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD00B606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 14:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=buiF/+sU;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nLXVC7XI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=31ISwiUcoP1nwNnlM+AcNE1UFEe5nZziDgYbUSqlYK0=; b=buiF/+sUSMSYnrgYtCJIghckTw
	1WMxZAd7znUK7+f/w5L9xtAGhNEn0gn5y5NmtKAHutDZXxc9/DvQrklNUM4B/wkmiMrMeuIUTyH+h
	wxLBjRgpmlr18AHbN+2Dpg/F5CpwWLvJK74cAyldqdmFXGM6/5tjRnAf5FC0lki15QBier0fmxOp4
	LFModlbxss0ZxfzZe4oJtaDbUG+sW1gta2a6bh/lB2paSMZRdddlMUV71hGCISnRAi/wFAHdZoHBX
	OUr3BpnkLjKZLswUB+g8Q+02AP8HZ42RhLQC5caxCer7drJnE884TNrsFPE+7VDtgjJxf51SRJWgx
	vF9mDM6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPwr-00000000uEU-3w3g;
	Mon, 09 Nov 2026 14:02:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQPwp-00000000uE1-2sd2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 14:02:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C5CE614BF;
	Mon,  9 Nov 2026 06:02:05 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76CC03F632;
	Mon,  9 Nov 2026 06:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794232928; bh=w9un5PJmooT1yfWMFaaQzUU8OhNkwnbnmZBSdQGnUt8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nLXVC7XIwT6vpEuK2LRZP1svw0GEjcPNFGmmqHhRpwzotbRQo+5ycs4hK07CKHxQL
	 6R9eRRQ1NlCugddQ2GCkXXcY1pHLJ/yiSdtqva4IrDvKeIIfCjaGoFInwNeNaK6nuU
	 b8g826oaOEWo8Lcm+sywiM3CD/XY1xmWpeLwIdz0=
Date: Mon, 9 Nov 2026 14:02:06 +0000
From: Leo Yan <leo.yan@arm.com>
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, catalin.marinas@arm.com,
	will@kernel.org, urezki@gmail.com, linux-mm@kvack.org,
	baohua@kernel.org, dev.jain@arm.com, ryan.roberts@arm.com,
	anshuman.khandual@arm.com, david@kernel.org, rppt@kernel.org,
	xueyuan.chen21@gmail.com, chleroy@kernel.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, ajd@linux.ibm.com,
	jiangwen6@xiaomi.com, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 00/10] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
Message-ID: <20261109140206.GY9176@e132581.arm.com>
References: <20261107134953.748622-1-jiangwenxiaomi@gmail.com>
 <20261108230842.3a77b9fe2d4bfc2a04b355a5@linux-foundation.org>
 <CAHKocdGWE9OVA5pJh33U-FYnNkUqRS0pzFt=rCwXWzY9w-QXyw@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHKocdGWE9OVA5pJh33U-FYnNkUqRS0pzFt=rCwXWzY9w-QXyw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_060211_766665_CC5BB557 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

On Mon, Nov 09, 2026 at 07:07:23PM +0800, Wen Jiang wrote:

[...]

> > Do we have sufficient ARM review?
> >
> 
> Thanks for picking this up.
> 
> On ARM review: Dev reviewed the earlier revision in detail and
> his suggestions are folded in. Leo Yan tested the large vmap() path
> on TRBE/SPE. We'd welcome more ARM review from Ryan, Catalin
> and others.

I confirmed that my Tested-by tag remains valid on the latest version.
The improvement is consistent with L2D TLB refill reduced from
~16000+ to ~500+ across multiple runs.

Thanks,
Leo

