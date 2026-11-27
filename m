Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF97606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 17:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QeBFg5wJ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l3IBsSMB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vLxNRV4+8KirT8hG3/dbMIXNXZCEYDos/QAsx8X+XBQ=; b=QeBFg5wJ0N+D+ieBVSIm+tCSMN
	0NosPQCuiYOJlMiaFkcLUZTG4gHnzQGFOXCWa9CzK3fmdGDF7vJjtil/VfVbQ2zze8ZfCTdaZW77y
	Nqr8QuhQwd7x9+OAkbYx1neErv9q4sojVGGcIMu/mzQsHzPVilamskmoHXTlWG69qHBYM5GRYzvyn
	Yo4+Jkh1fs8cTkxrd3t3uN55GvFfeGu+8UrKuobWrLbDQXgOIHILe5ZLpWLpTSHIPV5h5XZn9ZPwL
	rwG/IQYGEJkekWpBq//JhJ9fYQ4//5FofqYgSzXez9mm1fvgJvkFIXWfvwKzbkFnsbw3IAsEhkN6P
	qWBO9peg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzqV-0000000HHxs-2Cop;
	Fri, 27 Nov 2026 17:34:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWzqU-0000000HHxf-1e42
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 17:34:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8332761928;
	Fri, 27 Nov 2026 17:34:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E7A1F000C1;
	Fri, 27 Nov 2026 17:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795800889;
	bh=vLxNRV4+8KirT8hG3/dbMIXNXZCEYDos/QAsx8X+XBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l3IBsSMBgmTJqBSDA34drZimoRf75iBfqQrZ8JWPABGJpTSp4G24M5pOxHQBh5fGk
	 oq70ETNndcFJgE4UJgak9p4D8FJ1NZS3EtlgEMoq+w+E05BNtFbs2ALnB09sg8cvcN
	 5PfMpqJGdg59auuri+Bi2YeHQ/qV+UKVkRef08P0nv5a9t5Y2WdGZOt+B3I2VUUv+H
	 yZeQt++4XDXvQwCbxHHP/YPA4jwefsX7zDfHXh9BZSiz2iP3oVUYvBlwpcDODkTCtd
	 SJdj+dBuTP9ZOYmfjVB342pjeayrYmuf+YkQhIOD3+qTUpDHLCPum9sJSFW9URtfHF
	 K+hWqA4Ja8bxA==
Date: Fri, 27 Nov 2026 17:34:42 +0000
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Tejun Heo <tj@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
	Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Lucas Wei <lucaswei@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Barry Song <baohua@kernel.org>, Oliver Upton <oupton@kernel.org>
Subject: Re: [PATCH 0/4] arm64: insn: fix sysreg encodings, simplify
 dependent code
Message-ID: <awm_Mrhdl33J2kyK@willie-the-truck>
References: <20261016164648.251258-1-ada.coupriediaz@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016164648.251258-1-ada.coupriediaz@arm.com>
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

Hi Ada,

On Fri, Oct 16, 2026 at 05:46:44PM +0100, Ada Couprie Diaz wrote:
> This is a follow-up to [0] which goes further than initially anticipated.
> Indeed, after Vladimir's comment I checked what was going on
> in more details and realized that the system register definitions had some
> mistakes, were quite inconsistent and duplicated the sysreg definitions
> in `arch/arm64/include/sysreg.h`.
> 
> Thus this series takes the approach of re-using the encodings we already
> define and depend on, and making easier to re-use if needed.
> That meant I could also clean up unecessary operations and distinctions.
> 
> This simplification _could_ be taken further by completely removing the
> insn enum in favour of using the sysreg.h definitions directly,
> but I figured it was useful to keep the enum for typing/argument hints.
> 
> I was unsure of how to split this series, so patch 2 and 3 could reasonably
> be squashed into patch 4 if that does not make the commit too unscrutable.

This doesn't apply on top of arm64's for-next/sysregs branch. Please can
you rebase it and post a new version, taking into account Vladimir's
minor comments?

Cheers,

Will

